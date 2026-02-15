local turrets = {}

local turretsReceived = false

setTimer(
	function()
		if #turrets == 0 then
			return
		end
		for i, v in pairs(turrets) do
			local vx, vy, vz = getElementPosition(v["vehicle"])
			for i2, v2 in pairs(v["weapons"]) do
				setElementPosition(v2, vx, vy, vz)
			end
		end
	end
, 1000, 0)

function getTurretByValue(valueName, value)
	for i, v in pairs(turrets) do
		if value == v[valueName] then
			return i, v
		end
	end
	return false
end

function updateTurret(index, status)
	turrets[index]["status"] = status
	for i, v in pairs(turrets[index]["weapons"]) do
		setWeaponState(v, status)
	end
end

function createTurret(id, vehicle, status)
	local index = #turrets + 1
	local x, y, z = getElementPosition(vehicle)
	local minx, miny, minz, maxx, maxy, maxz = getElementBoundingBox(vehicle)
	turrets[index] = {
		["id"] = id,
		["vehicle"] = vehicle,
		["status"] = status,
		["weapons"] = {
			createWeapon("minigun", x, y, z),
			createWeapon("minigun", x, y, z)
		}
	}
	local offsMinX = minx
	local offsMaxX = maxx
	local offsMaxY = maxy
	if getVehicleType(vehicle) == "Plane" then
		offsMinX = -0.25
		offsMaxX = 0.25
	end
	attachElements(turrets[index]["weapons"][1], turrets[index]["vehicle"], offsMaxX - 0.5, offsMaxY - 0.5, 0, 0, 0, 90)
	attachElements(turrets[index]["weapons"][2], turrets[index]["vehicle"], offsMinX + 0.5, offsMaxY - 0.5, 0, 0, 0, 90)
	updateTurret(index, status)
end

function deleteTurret(index)
	for i, v in pairs(turrets[index]["weapons"]) do
		destroyElement(v)
	end
	table.remove(turrets, index)
end

addEvent("vehturret_client", true)
addEventHandler("vehturret_client", getLocalPlayer(),
	function(operation, value)
		if operation == "add" then
			createTurret(value["id"], value["vehicle"], value["status"])
			return
		end
		if operation == "delete" then
			deleteTurret(getTurretByValue("id", value))
			return
		end
		if operation == "update" then
			local index = getTurretByValue("id", value["id"])
			updateTurret(index, value["status"])
			return
		end
		if operation == "refresh" then
			while #turrets > 0 do
				deleteTurret(1)
			end
			for i, v in pairs(value) do
				createTurret(v["id"], v["vehicle"], v["status"])
			end
			turretsReceived = true
			return
		end
	end
)

function fireVehicleTurret(key, keyState)
	if #turrets == 0 then
		return
	end
	local player = getLocalPlayer()
	if not isElement(player) then
		return
	end
	local vehicle = getPedOccupiedVehicle(player)
	if not vehicle then
		return
	end
	if getPedOccupiedVehicleSeat(player) ~= 0 then
		return
	end
	local index = getTurretByValue("vehicle", vehicle)
	if not index then
		return
	end
	if keyState == "down" and turrets[index]["status"] == "ready" then
		updateTurret(index, "firing")
		triggerServerEvent("vehturret", getLocalPlayer(), "update", {["id"] = turrets[index]["id"], ["status"] = "firing"})
	elseif keyState == "up" and turrets[index]["status"] == "firing" then
		updateTurret(index, "ready")
		triggerServerEvent("vehturret", getLocalPlayer(), "update", {["id"] = turrets[index]["id"], ["status"] = "ready"})
	end
end

bindKey("vehicle_secondary_fire", "down", fireVehicleTurret)
bindKey("vehicle_secondary_fire", "up", fireVehicleTurret)

setTimer(
	function()
		if not isTimer(sourceTimer) then
			return
		end
		if not turretsReceived then
			triggerServerEvent("vehturret", getLocalPlayer(), "refresh")
		else
			if isTimer(sourceTimer) then
				killTimer(sourceTimer)
			end
		end
	end
, 1000, 0)

