---@diagnostic disable: undefined-global
-- PuB By @KhodeOxYGeM : )
local accSys = exports["Accounts-System"]--Acc System Connect 
local notf = exports["notf"]--Notf
local dbpTime = 500
--[[Convert Number
function convertNumber( number )  
 	local formatted = number  
 	while true do      
 		formatted, k = string.gsub( formatted, "^(-?%d+)(%d%d%d)", '%1,%2' )    
 		if ( k==0 ) then      
 			break   
 		end  
 	end  
 	return formatted
 end]]

-- Prizesh
function myprize(thePlayer,Comamnd)
	print("price")
	local prize = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pMyPrize"))
	local goldPlayer = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pGold"))
	if prize == tonumber(1) then
		local goldPlayer = getElementData(accSys:getPlayerAcc(thePlayer), "pGold")
		setElementData(accSys:getPlayerAcc(thePlayer), "pCarLic", 200)
		setElementData(accSys:getPlayerAcc(thePlayer), "pCarLicS", 200)
		setElementData(accSys:getPlayerAcc(thePlayer), "pFlyLic", 200)
		setElementData(accSys:getPlayerAcc(thePlayer), "pBoatLic", 200)
		setElementData(accSys:getPlayerAcc(thePlayer), "pMatsLic", 200)
		setElementData(accSys:getPlayerAcc(thePlayer), "pGunLic", 200)
		givePlayerMoney(thePlayer, 5000000)
		setElementData(accSys:getPlayerAcc(thePlayer), "pGold", tonumber(goldPlayer) + tonumber(2500))
		setElementData(accSys:getPlayerAcc(thePlayer), "pMyPrize", 2)
		exports["notf"]:addNotification(thePlayer, "Tabrik, Shoma Ba Movafagiat 5Mil Va 2500 Gold Va Tamamiye Mojavez Haye Server Ra Daryaft Kardid." , 'success')
		end
	if prize == tonumber(2) then
		exports["notf"]:addNotification(thePlayer, "Shoma Prize Khod Ra Yekbar Gerftid !" , 'error')
	end
end
addCommandHandler("jayeze",myprize)
print("start jz")