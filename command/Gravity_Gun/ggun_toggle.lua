local accSys = exports["Accounts-System"]
local adminSys = exports["command"]

function toggleGGun(player)
	if tonumber(getElementData(accSys:getPlayerAcc(player), "pAdmin")) < 10 then
		return false
	end
	local on = not adminSys:isGravityGunEnabled(player)
	adminSys:togglePlayerGravityGun(player,on)
	outputChatBox((on and "#12F20B[☑] #C1C1C1Gravity Gun #12F20BFaal #C1C1C1Shod !" or "#EE0A0A[✖] #C1C1C1Gravity Gun #EE0A0AQeyre Faal #C1C1C1Shod !"),player, 255, 255, 255, true)
end
addCommandHandler("ggun",toggleGGun)