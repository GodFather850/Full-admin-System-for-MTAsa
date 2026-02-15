local accSys = exports["Accounts-System"]
local turrets = {}
local turret_command_enabled = true

function setTurretCommandEnabled(status)
	turret_command_enabled = status
	return true
end
function isTurretCommandEnabled()
	return turret_command_enabled
end

function getTurretByValue(valueName, value)
	for i, v in pairs(turrets) do
		if value == v[valueName] then
			return i, v
		end
	end
	return false
end

function createID()
	local id = ""
	for i = 1, 10 do
		id = id..""..tostring(math.random(0, 9))
	end
	if getTurretByValue("id", id) then
		return createID()
	end
	return id
end

function createTurret(vehicle)
	local id = createID()
	local index = #turrets + 1
	turrets[index] = {
		["id"] = id,
		["vehicle"] = vehicle,
		["status"] = "ready"
	}
	triggerClientEvent("vehturret_client", getRootElement(), "add", turrets[index])
	return index, turrets[index]
end

function deleteTurret(index)
	local id = turrets[index]["id"]
	table.remove(turrets, index)
	triggerClientEvent("vehturret_client", getRootElement(), "delete", id)
	return true
end

function removeEventFunction()
	if getElementType(source) ~= "vehicle" then
		return
	end
	local index = getTurretByValue("vehicle", source)
	if not index then
		return
	end
	deleteTurret(index)
end

addEventHandler("onElementDestroy", getRootElement(), removeEventFunction)
addEventHandler("onVehicleExplode", getRootElement(), removeEventFunction)

addEvent("vehturret", true)
addEventHandler("vehturret", getRootElement(),
	function(operation, value)
		if not source then
			return
		end
		if operation == "update" then
			local index = getTurretByValue("id", value["id"])
			turrets[index]["status"] = value["status"]
			triggerClientEvent(getRootElement(), "vehturret_client", getRootElement(), "update", value)
			return
		end
		if operation == "refresh" then
			triggerClientEvent(source, "vehturret_client", source, "refresh", turrets)
			return
		end
	end
)

addCommandHandler("tirbar",
	function(thePlayer)
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 11 then
		outputChatBox("#EE0A0A[✖] #C1C1C1Dastresi Be In Dastor Baraye Shoma Maghdor Nmibashad !", thePlayer, 255, 255, 255, true)
		return false
	end
		if not turret_command_enabled then
			return
		end
		if not isElement(thePlayer) then
			return
		end
		local vehicle = getPedOccupiedVehicle(thePlayer)
		if not vehicle then
			return
		end
		local index = getTurretByValue("vehicle", vehicle)
		if index then
		    outputChatBox("#70a6ff[Special] :#ffffff Tir Bar Shoma #ff0000Off #ffffffShod !", thePlayer, 255, 255, 255, true)
			deleteTurret(index)
			return
		end
		outputChatBox("#70a6ff[Special] :#ffffff Tir Bar Shoma #00ff00On #ffffffShod !", thePlayer, 255, 255, 255, true)
		createTurret(vehicle)
	end
)
