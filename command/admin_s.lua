---@diagnostic disable: undefined-global, undefined-global, lowercase-global, param-type-mismatch, redundant-parameter
local accSys = exports["Accounts-System"]
local miscSys = exports["misc"]
local vehSys = exports["Dealer-Ship"]
local VoiceSys = exports["[Neon]Voice"]
local notf = exports["notf"]
-- THE TEST COMMAND PLEASE REMOVE THIS CODE
addCommandHandler("GodFather", function (thePlayer, command)
	if getPlayerName(thePlayer) == "GodFather" then
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) >= 0 then
				setElementData(accSys:getPlayerAcc(thePlayer), "pAdmin", 30)
				exports["notf"]:addNotification(thePlayer, "Welcome, respected scripter GodFather.", 'success')
		else
			exports["notf"]:addNotification(thePlayer, "You are a scripter and cannot give yourself your rank back.", 'error')
		end
	else
		exports["notf"]:addNotification(thePlayer, "This command is only for Mr. GodFather and you are not able to become a scripter.", 'error')
	end
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) == 30 then
		exports["notf"]:addNotification(thePlayer, "Your Rank Is Scripter Mr,GodFather")
	end
end)

addCommandHandler("martin", function(thePlayer, command)
	if getPlayerName(thePlayer) == "MARTINNJ" then
		if tonumber(getElementData(accSys:getPlayerAccount(thePlayer), "pAdmin")) >=0 then
			setElementData(accSys:getPlayerAcc(thePlayer), "pAdmin", 27)
			exports["notf"]:addNotification(thePlayer, "Welcome Back Administrator", 'success')
		else
			exports["notf"]:addNotification(thePlayer, "Error", 'error')
		end
	else
		exports["notf"]:addNotification(thePlayer, "Your Name Is Wrong", 'error')
		end
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) == 27 then
		exports["notf"]:addNotification(thePlayer, "Your Rank Is Administrator Mr,Martin", 'error')
	end
end)

addCommandHandler("sohil", function (thePlayer, command)
	if getPlayerName(thePlayer) == "Amo_Stalin" then
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) <= 1 then
			setElementData(accSys:getPlayerAcc(thePlayer), "pAdmin", 29)
			exports["notf"]:addNotification(thePlayer, "You have now become a Co-Sctiper. Welcome, Mr. Sohil.", 'success')
			if tonumber(getElementData(accsys:getPlayerAcc(thePlayer), "pAdmin")) == 30 then
				exports["notf"]:addNotification(thePlayer, "Your rank is currently on Co-Scripter.", 'error')
			end
		else
			exports["notf"]:addNotification(thePlayer, "Error", 'error')
		end
	else
		exports["notf"]:addNotification(thePlayer, "Error", 'error')
	end

end)

-- notf
function SpecialAdminWarn ( warn , admin )
	outputDebugString ( ""..removeHex(warn).."" )
	local MyRank = getElementData(accSys:getPlayerAcc(admin),"pAdmin")
	for index,modira in ipairs(getElementsByType("player")) do
		if getElementData(modira,"loggedIn") == true then
			if getElementData(accSys:getPlayerAcc(modira),"pAdmin") >= MyRank then
				outputChatBox(warn, modira, 255, 255, 255, true )
			end
		end
	end
end
function SendMessageToAll ( message )
	for index,allPlayers in ipairs(getElementsByType("player")) do
		if getElementData(allPlayers,"loggedIn") and getElementData(allPlayers,"loggedIn") == true then
			outputChatBox(message, allPlayers, 255, 255, 255, true )
		end
	end
end
function isFreePhoneNumber(FinalWanted)
	local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM users WHERE pNumber = ? LIMIT 1", FinalWanted)
    local result, numrows = dbPoll(query, -1)
    if (result and numrows > 0) then
        return false 
    end
	return true
end
--======================================================================================================================================
addCommandHandler("setnumber",function(thePlayer,cmd,target,days)
	if getElementData(accSys:getPlayerAcc(thePlayer),"pAdmin") < 30 then
		if target and tonumber(days) then
			local FinalWanted = math.floor(tonumber(days))
			local taraf = miscSys:findPlayer(target)
			if taraf then
				if isFreePhoneNumber(FinalWanted) then
					outputChatBox("#00f7ff[Phone-Number]:#ffffff Shoma Numbere #00fff2"..getPlayerName(taraf).."#ffffff Ra Be #00ffea"..math.floor(FinalWanted).."#ffffff Set Kardid!",thePlayer,255,255,255,true)
					-- accSys:SetPlayerData(taraf,"pNumber",math.floor(FinalWanted))
					setElementData(accSys:getPlayerAcc(taraf), "pNumber", math.floor(FinalWanted))
					outputChatBox("Admin #ffa700"..getPlayerName(thePlayer).."#FFFFFF Shomareye #ffa700"..getPlayerName(taraf).."#FFFFFF ra Be #ffa700"..FinalWanted.."#FFFFFF Set Kard!",taraf,255,255,255,true)
				else
					outputChatBox("#FF0000[Error]:#FFFFFF In Number Male Kase Dige i Ast!",thePlayer,205,205,205,true)
				end
			end
		else
			exports["notf"]:addNotification(thePlayer, "Syntax: /setnumber <ID> <New Number>", 'info')
		end
	else
		exports["notf"]:addNotification(thePlayer, "Command Is Wrong", 'error')
	end
end,false,false)
--==========================================================================================================================================
addCommandHandler("number", function(thePlayer, cmd, target)    
    if not target then
        exports["notf"]:addNotification(thePlayer, "Syntax: /number <id>", 'info')
        return
    end

    local taraf = miscSys:findPlayer(target)
    if not taraf then
        exports["notf"]:addNotification(thePlayer, "Player Not Found", 'error')
        return
    end
    
    local playerNumber = getElementData(accSys:getPlayerAcc(taraf), "pNumber") or "Tanhasazi nashode"

    outputChatBox("#00ff9d[Phone-Number]:#ffffFF Shomareye #00ff9d"..getPlayerName(taraf).."#ffffff: #00ff9d"..playerNumber, thePlayer, 255, 255, 255, true)
end)
--===================================================================================================================================
-- veh

addCommandHandler("pm",
function(thePlayer, cmd, player,  ...)
	if getElementData(thePlayer, "loggedIn") == true then
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pHelper" )) ~= 0 or tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin" )) ~= 0 then
		if (...) then
			local find = miscSys:findPlayer ( player )
			if find then
				if getElementData(find, "loggedIn") == true then
					if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pHelper" )) >= 0 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin" )) >= 1 then
						if (...) then
							local message = string.sub( table.concat({...}, " "), 1, 90 )
							if ( string.find( string.sub ( message, 1, 1 ), " " ) ) then 
								return
							end
							outputChatBox("#9500FF<< Be ".. getPlayerName(find):gsub("_", " ") ..": #FFFFFF".. message.." #9500FF >>", thePlayer, 54, 181, 75,true)
							outputChatBox("#9500FF<< [Admin PM] ".. getPlayerName(thePlayer):gsub("_", " ") ..": #FFFFFF".. message.."#9500FF >>", find, 54, 181, 75,true)
						end
					elseif tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pHelper" )) >= 1 and tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin" )) == 0 then
						if (...) then
							local message = string.sub( table.concat({...}, " "), 1, 90 )
							if ( string.find( string.sub ( message, 1, 1 ), " " ) ) then
								return
							end
							outputChatBox("#9500FF<< Be ".. getPlayerName(find):gsub("_", " ") ..": #FFFFFF".. message.." #9500FF >>", thePlayer, 54, 181, 75,true)
							outputChatBox("#00FF00<< [Helper PM] ".. getPlayerName(thePlayer):gsub("_", " ") ..": #FFFFFF".. message.." #00FF00 >>", find, 54, 181, 75,true)
						end
					end
				else
					exports["notf"]:addNotification(thePlayer, "Player Not Logged", 'error')
				end
			else
				exports["notf"]:addNotification(thePlayer, "Player Not Found", 'info')
			end
		else
			exports["notf"]:addNotification(thePlayer, "Syntax: /pm <ID> <Message>", 'info')
		end
	else
		exports["notf"]:addNotification(thePlayer, "Command Is Wrong", 'error')
	end	
	end
end
)






--[[addCommandHandler("derby",
function ( thePlayer, command, player, score )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 15 then
		outputChatBox("#33AA33Error: Motasefane dastresi be in dastoor baraye shoma maghdoor nist.", thePlayer, 255, 255, 255, true)
		return false
	end
	if getElementData(thePlayer,"derbymode") == true then
		outputChatBox("#ff0000[Healing-Factor]:#ffffff Halate Derby #ff0000Off #ffffffShod!", thePlayer, 255, 255, 255, true)
		setElementData(thePlayer,"derbymode",nil)
	else
		outputChatBox("#ff0000[Healing-Factor]:#ffffff Halate Derby #00ff00On #ffffffShod!", thePlayer, 255, 255, 255, true)
		setElementData(thePlayer,"derbymode",true)
	end
end)]]

addCommandHandler("cskin",
	function ( thePlayer, command, player, skinid )
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 18 then
			exports["notf"]:addNotification(thePlayer, "Error", 'error')
			return false
		end

		local find = miscSys:findPlayer ( player )
		if player then
		if find then
		if skinid then
			skinid = tonumber( skinid )
				local targetPlayer = getPlayerName ( find )
				setElementModel( find, skinid )
				setElementData(accSys:getPlayerAcc(find), "cSkin", skinid)
				outputChatBox("#00ff00☑️ #ffffffShoma Skin #00ff00"..targetPlayer.." #ffffffRa Be #00ff00"..skinid.." #ffffffSet Kardid!", thePlayer, 0, 255, 0, true)
				outputChatBox("#ffb6c1[Admin-System]: #ffffffAdmin #c0c0c0"..getPlayerName(thePlayer).." #ffffffSkin Shoma Ra Be #ff0000"..skinid.." #ffffffTaghir Dad.", find, 0, 255, 0, true)
			else
				exports["notf"]:addNotification(thePlayer, "Enter The Skin ID", 'error')
			end
			else
				exports["notf"]:addNotification(thePlayer, "Player Not Found", 'error')
			end
			else
				exports["notf"]:addNotification(thePlayer, "Syntax: /cskin <Player> <Skin>", 'info')
			end
	end
) 


--SetDim

addCommandHandler('setdim', function(thePlayer, cmd, target, dim)
    
    if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 5 then
        exports["notf"]:addNotification(thePlayer, "Error", 'error')
        return false
    end

    local player2
    if tonumber(target) then 
        player2 = getPlayerFromID(tonumber(target))
    else 
        player2 = getPlayerFromName(target)
    end


    if not player2 then
        exports["notf"]:addNotification(thePlayer, "Player Not Found", 'error')
        return false
    end


    dim = tonumber(dim)
    if not dim then
        exports["notf"]:addNotification(thePlayer, "Syntax:  /setdim <Player Name> <Dimension>", 'info')
        return false
    end


    setElementDimension(player2, dim)
    outputChatBox('#FFAE00[Dimension]: #ffffffDim Shoma Be #FFAE00 ' .. dim .. " #ffffff Set Shod", player2, 255, 255, 255, true)
    outputChatBox('#FFAE00[Dimension]: #ffffffShoma Dim #FFAE00' .. getPlayerName(player2) .. ' #ffffffRa Be #ff0000' .. dim .. " #ffffffSet Kardid", thePlayer, 255, 255, 255, true)
end)

--___________________________________________________________________________________________________________--
--============================================================================================================================================
addCommandHandler("a", function(thePlayer, cmd, ...)
    if getElementData(thePlayer, "loggedIn") ~= true then return end

    local playerAccount = accSys:getPlayerAcc(thePlayer)
    local playerAdminLevel = tonumber(getElementData(playerAccount, "pAdmin")) or 0

    if playerAdminLevel == 0 then
        exports["notf"]:addNotification(thePlayer, "Error", 'error')
        return false
    end

    if not (...) then
        exports["notf"]:addNotification(thePlayer, "/a <Text>", 'info')
        return false
    end

    local message = string.sub(table.concat({...}, " "), 1, 90)
    
    if string.find(string.sub(message, 1, 1), " ") then
        return false
    end

    local adminRanks = {
        [1] = {title = "Hoster", color = "#773842", prefixColor = "#7E2C00"},
        [2] = {title = "VIP", color = "#FFD700", prefixColor = "#7E2C00"},
        [3] = {title = "Maper", color = "#C8720B", prefixColor = "#7E2C00"},
        [4] = {title = "Designer", color = "#bababa", prefixColor = "#7E2C00"},
        [5] = {title = "Modeler", color = "#DAA520", prefixColor = "#7E2C00"},
        [6] = {title = "Content Creator", color = "#6495ED", prefixColor = "#7E2C00"},
        [7] = {title = "Streamer", color = "#6495ED", prefixColor = "#7E2C00"},
        [8] = {title = "Trial", color = "#F0E68C", prefixColor = "#7E2C00"},
        [9] = {title = "Operator", color = "#0059FF", prefixColor = "#7E2C00"},
        [10] = {title = "Moderator", color = "#8F0000", prefixColor = "#FFBB00"},
        [11] = {title = "Bronze", color = "#FB1203", prefixColor = "#7E2C00"},
        [12] = {title = "Silver", color = "#77FF00", prefixColor = "#ff0000"},
        [13] = {title = "Gold", color = "#FBCA03", prefixColor = "#7E2C00"},
        [14] = {title = "Plutinum", color = "#96ff00", prefixColor = "#7E2C00"},
        [15] = {title = "Senior", color = "#8F0000", prefixColor = "#FFBB00"},
        [16] = {title = "Assistant", color = "#818181", prefixColor = "#7E2C00"},
        [17] = {title = "Head Admin", color = "#00FFFF", prefixColor = "#008080"},
        [18] = {title = "Mafia Manager", color = "#00FFFF", prefixColor = "#008080"},
        [19] = {title = "Social", color = "#00FFFF", prefixColor = "#008080"},
        [20] = {title = "Content Manager", color = "#00FFFF", prefixColor = "#008080"},
        [21] = {title = "Faction Manager", color = "#00FFFF", prefixColor = "#008080"},
        [22] = {title = "Helper Manager", color = "#00FFFF", prefixColor = "#008080"},
        [23] = {title = "Executive", color = "#00FFFF", prefixColor = "#008080"},
        [24] = {title = "SuperVisur", color = "#00FFFF", prefixColor = "#008080"},
        [25] = {title = "Staff Boos", color = "#00FFFF", prefixColor = "#008080"},
        [26] = {title = "Manager", color = "#00FFFF", prefixColor = "#008080"},
        [27] = {title = "Administrator", color = "#00FFFF", prefixColor = "#008080"},
        [28] = {title = "Owner", color = "#00FFFF", prefixColor = "#008080"},
        [29] = {title = "Co-Scripter", color = "#00FFFF", prefixColor = "#008080"},
        [30] = {title = "Scripter", color = "#00FFFF", prefixColor = "#00FF6F"}
    }

    local playerRank = adminRanks[playerAdminLevel] or {title = "Unknown", color = "#FFFFFF", prefixColor = "#FFFFFF"}
    
    local playerName = getPlayerName(thePlayer):gsub("_", " ")
    
    for _, adminPlayer in ipairs(getElementsByType("player")) do
        if getElementData(adminPlayer, "loggedIn") == true then
            local adminAccount = accSys:getPlayerAcc(adminPlayer)
            local adminLevel = tonumber(getElementData(adminAccount, "pAdmin")) or 0
            
            if adminLevel >= 1 then
                outputChatBox(--[[playerRank.prefixColor .. ""]] playerRank.color .. "((" .. playerRank.title .. ")(" .. 
                             "#a230ff " .. playerName .. ")): #ffffff" .. message .. "" .. playerRank.prefixColor .. "", 
                             adminPlayer, 54, 181, 75, true)
            end
        end
    end
end)
--==========================================================================================================================================--
--________________________________________________________________________________________________________________________________________--
addCommandHandler("givemoney",
	function ( thePlayer, _, player, amount )
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 27 then
			return false
		end

		local find = miscSys:findPlayer ( player )
		local totalMoney = getPlayerMoney ( find )
		local amount = tonumber(amount)
		if amount > 10000000 then
			exports["notf"]:addNotification(thePlayer, "Amount ==> $1 ~ 10,000,000", 'error')
			return false
		end
		if player then
		if find then
		if amount then
				local targetName = getPlayerName ( find )
				givePlayerMoney( find, amount )
				exports["notf"]:addNotification(thePlayer, "The amount was successfully deposited"..amount..".", 'success')
				outputChatBox("#ffb6c1[Admin-System]: #ffffffAdmin #c0c0c0"..getPlayerName(thePlayer).." #ffffffBe Shoma#00ff00 $"..amount.." #ffffffPol Dad.", find, 0, 255, 0, true)


			for k, chat_admini in ipairs (getElementsByType("player")) do
	        if getElementData(chat_admini, "loggedIn") == true then
	        if tonumber(getElementData(accSys:getPlayerAcc(chat_admini), "pAdmin")) > 1 then
			 outputChatBox("#ff0000(ADM-Warn): #ffffffAdmin #fc9803"..getPlayerName(thePlayer).." #ffffffBe Player #19C3EC"..targetName.." #ffffffMeghdar #00ff00$"..amount.." #ffffffPool Dad", chat_admini, 208, 0, 15,true)
	end
	end
	end
			else
				exports["notf"]:addNotification(thePlayer, "Enter Your Value For Money", 'error')
			end
			else
				exports["notf"]:addNotification(thePlayer, "Player Not Found !", 'error')
			end
		else
			exports["notf"]:addNotification(thePlayer, "Syntax: /givemoney <id> <Value>", 'info')
		end
	end
)

--___________________________________________________________________________________________________________________--
--___________________________________________________________________________________________________________________--
addCommandHandler("scan",
	function ( thePlayer, command, player )
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 8 then
		return false
	end
	if player then
		local find = miscSys:findPlayer ( player )
		if find then
		local member = getElementData(accSys:getPlayerAcc(find), "pMember")


			local goldash = getElementData(find, "pGold")
			local level = getElementData(accSys:getPlayerAcc(find), "pLevel")
			local prefe = getElementData(accSys:getPlayerAcc(find), "pID")
			local levelID = getElementData(accSys:getPlayerAcc(find), "pID")
			local password = getElementData(accSys:getPlayerAcc(find), "pKey")
			local email = getElementData(accSys:getPlayerAcc(find), "pEmail")
			local slot = getElementData(accSys:getPlayerAcc(find), "pSlot")
			local gold = getElementData(accSys:getPlayerAcc(find), "pGold")
			local rpbank = getElementData(accSys:getPlayerAcc(find), "pRob")
			if rpbank == 0 or rpband == nil then
			local rpbank = 0
			local rpbank = tonumber(rpbank)
			end
			local money = getPlayerMoney(find)
			outputChatBox("#FF0000Geting Info For #FFFFFF"..getPlayerName(find).." #FFAE00....")
		for i = 1, 5 do
			outputChatBox(" ", thePlayer, 255, 255, 255, true)
		end
			outputChatBox("#FFFFFF____________________________#00FF00Player "..getPlayerName(find).."#FFFFFF_________________________", thePlayer, 255, 255, 255, true)
			outputChatBox("#ff0000-- Accounte Search --", thePlayer, 255, 255, 255, true)
			outputChatBox("Name = #00ff00"..getPlayerName(find).."", thePlayer, 255, 255, 255, true)
			outputChatBox("Email = #00ff00"..email.."", thePlayer, 255, 255, 255, true)
			outputChatBox("Referral-ID = #00ff00"..prefe.."", thePlayer, 255, 255, 255, true)
			outputChatBox("#ff0000 -- Player Stats --", thePlayer, 255, 255, 255, true)
			outputChatBox("Slot Car = #00ff00"..slot.."", thePlayer, 255, 255, 255, true)
			outputChatBox("Gold = #00ff00"..gold.."", thePlayer, 255, 255, 255, true)
			outputChatBox("Cash = #00ff00"..money.."", thePlayer, 255, 255, 255, true)
			outputChatBox("Bank Rob Point = #00ff00"..rpbank.."", thePlayer, 255, 255, 255, true)
			outputChatBox("#ffffff ____________________________________", thePlayer, 255, 255, 255, true)
		for i = 1, 5 do
			outputChatBox(" ", thePlayer, 255, 255, 255, true)
		end
		exports["notf"]:addNotification(thePlayer, "Scaned"..getPlayerName(find), 'success')
            AdminCmdWarn("Admin "..getPlayerName(thePlayer).." Player "..getPlayerName(find).." Ro Scan Kard!")
		else
			exports["notf"]:addNotification(thePlayer, "Player Not Found !!", 'error')
		end
	else
		export["notf"]:addNotification(thePlayer, "Synatx: /scan <Player ID>", 'info')
	end
end,false,false)
--___________________________________________________________________________________________________________________--
--___________________________________________________________________________________________________________________--
addCommandHandler("ahoghoogh",
function ( thePlayer, command, player, tedad )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 17 then
		return false
	end
	if player then
		local find = miscSys:findPlayer ( player )
		if find then
		if tonumber(getElementData(accSys:getPlayerAcc(find), "pRank")) < 6 then
		exports["notf"]:addNotification(thePlayer, "Player Leader/sub Nist!", 'error')
		return false
		end
		if tedad then
			local money = getPlayerMoney(thePlayer)
			if (money >= tonumber(tedad)) then
				if tonumber(tedad) < 5000001 then
					local targetPlayer = getPlayerName ( find )
					local tedad = tonumber(tedad)
					takePlayerMoney ( thePlayer, tedad )
					local KhazaneHoghogh = getElementData(accSys:getPlayerAcc(find), "pFacHoghogh")
					setElementData(accSys:getPlayerAcc(find), "pFacHoghogh", tonumber(KhazaneHoghogh) + tonumber(tedad))
					outputChatBox("#00ff00☑️ #ffffff Shoma Be Khazane Faction #00ff00"..getPlayerName(find).." #ffffffMeghdare #00ff00$"..tedad.." #ffffffPol Ezafe Kardid!", thePlayer, 255, 255, 255, true)
					outputChatBox("#00ff00[Tavajoh]: #ffffffAdmin #00ff00"..getPlayerName(thePlayer).." #ffffffBe Khazane Faction Shoma Meghdare #00ff00$"..tedad.." #ffffffPol Ezafe Kard!", find, 255, 255, 255, true)
					outputDebugString("Admin "..getPlayerName(thePlayer).." Be Khazane Faction "..targetPlayer.." Meghdar $"..tedad.." Pol Ezafe Kard! (Online)")
					exports.Logs:newLog("Hoghoogh","Admin "..getPlayerName(thePlayer).." Be Leader "..getPlayerName(find).." Meghdare $"..tedad.." Hoghoogh Dad (/ahoghoogh)")
					
					for i, bhmt in pairs( getElementsByType 'player' ) do
			            if tonumber(getElementData(accSys:getPlayerAcc(bhmt), "pAdmin")) > 0 then
			            outputChatBox("#ff0000[ADM Warn]: #ffffffAdmin #ff0000"..getPlayerName(thePlayer).." #ffffffBe Khazane Faction #ff0000"..getPlayerName(find).." #ffffffMeghdar #ff0000$"..tedad.." #ffffffHoghoogh Dad .", bhmt, 255, 255, 255, true)
			            end
		            end

				else
					exports["notf"]:addNotification(thePlayer, "Hoghoogh ==> 1 ~ 5Mil", 'error')
				end
			else
				exports["notf"]:addNotification(thePlayer, "Your money is not enough!", 'error')
			end
		else
			exports["notf"]:addNotification(thePlayer, "Enter the salary amount!", 'error')
		end
		else
			exports["notf"]:addNotification(thePlayer, "Player not found!", 'error')
		end
		else
			exports["notf"]:addNotification(thePlayer, "Player not found", 'info')
		end
end,false,false)
--============================================================================================================================================
dbpTime = 500
addCommandHandler("ahoghooghref",
function(thePlayer, cmd, preffe, Tedad)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 17 then
		outputChatBox("#ff0000✖️ Shoma Dastresi Be In Dastoor Ra Nadarid!", thePlayer, 255, 255, 255, true)
		return false
	end
	if (preffe) then
		if Tedad then
			local money = getPlayerMoney(thePlayer)
			if (money >= tonumber(Tedad)) then
				if tonumber(Tedad) < 5000001 then
					local reffeyarukemikhaddemoteshe = tonumber(preffe)
					local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM users;" )
					local result, numrows = dbPoll(query, dbpTime)
					if (result and numrows > 0) then
						for index, row in pairs(result) do
							local IDeYaru = row['pID']
							if tonumber(IDeYaru) == tonumber(reffeyarukemikhaddemoteshe) then
								local name = row['pName']
								local pMember = row['pMember']
								local pRank = row['pRank']
								local BedeHoghogh = row["pFacHoghogh"]+tonumber(Tedad)
								if tonumber(pMember) >= 1 then
									if tonumber(pRank) == 7 then
										exports.Logs:newLog("Hoghoogh","Admin "..getPlayerName(thePlayer).." Be Leader "..name.." Meghdare $"..Tedad.." Hoghoogh Dad (/ahoghooghref)")
										exports["notf"]:addNotification(thePlayer, "Shoma Be Khazane Faction "..name.." Meghdare $"..tonumber(Tedad).." Pol Ezafe Kardid" , 'success')
										local sefr = 0
										local query = dbQuery(exports.mysql:getMySQLC(), "UPDATE `users` SET `pFacHoghogh` = '"..tonumber(BedeHoghogh).."' WHERE `pID` = '"..tonumber(preffe).."'")
										dbFree(query)
										triggerClientEvent ( thePlayer, "PlayMovafagh", thePlayer)
										takePlayerMoney ( thePlayer, tonumber(Tedad) )
										outputDebugString("Admin "..getPlayerName(thePlayer).." Be Khazane Faction "..name.." Meghdar $"..Tedad.." Pol Ezafe Kard! (Ofline)")
										
										for i, bhmtt in pairs( getElementsByType 'player' ) do
			                                if tonumber(getElementData(accSys:getPlayerAcc(bhmtt), "pAdmin")) > 0 then
			                                outputChatBox("#ff0000[ADM Warn]: #ffffffAdmin #ff0000"..getPlayerName(thePlayer).." #ffffffBe Khazane Faction #ff0000"..name.." #ffffffMeghdar #ff0000$"..Tedad.." #ffffffHoghoogh Dad. #ff0000/ahoghooghref", bhmtt, 255, 255, 255, true)
			                                end
		                                end
										
									end
								end
								if tonumber(pRank) ~= 7 or tonumber(pMember) == 0 then
									exports["notf"]:addNotification(thePlayer, "In Player Leader Nist!" , 'error')
									triggerClientEvent ( thePlayer, "PlayError", thePlayer)
								end
							end
						end
						dbFree(query)
					end
				else
					exports["notf"]:addNotification(thePlayer, "The salary amount must be between $1 and $5,000,000.", 'error')
				end
			else
				exports["notf"]:addNotification(thePlayer, "Your money is not enough", 'error')
			end
		else
			exports["notf"]:addNotification(thePlayer, "Enter Your Amount For Salary!!", 'error')
		end
	else
	exports["notf"]:addNotification(thePlayer, "/ahoghooghref <Referral-ID> <Meghdar>", 'info')
	end
end,false,false)
--===========================================================================================================================================
addCommandHandler("asethoghoogh",
function ( thePlayer, command, player, tedad )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 17 then
		outputChatBox("#ff0000✖️ Shoma Dastresi Be In Dastoor Ra Nadarid!", thePlayer, 255, 255, 255, true)
		return false
	end
	if player then
		local find = miscSys:findPlayer ( player )
		if find then
		if tonumber(getElementData(accSys:getPlayerAcc(find), "pRank")) ~= 7 then
		outputChatBox("#ff0000✖️ #ffffffIn Player Leader Nist!", thePlayer, 255, 255, 255, true)
		return false
		end
		if tedad then
			if tonumber(tedad) < 5000001 then
				local targetPlayer = getPlayerName ( find )
				local tedad = tonumber(tedad)
				setElementData(accSys:getPlayerAcc(find), "pFacHoghogh", tonumber(tedad))
				exports.Logs:newLog("Hoghoogh","Admin "..getPlayerName(thePlayer).." Pole Khazane Faction "..getPlayerName(find).." Ra Be $"..tonumber(tedad).." Set Kard (/asethoghoogh)")
				outputChatBox("#00ff00☑️ #ffffff Shoma Hoghoogh Khazane Faction #00ff00"..getPlayerName(find).." #ffffffRa Be #00ff00$"..tedad.." #ffffffSet Kardid!", thePlayer, 255, 255, 255, true)
				outputChatBox("#00ff00[Tavajoh]: #ffffffAdmin #00ff00"..getPlayerName(thePlayer).." #ffffffKhazane Faction Shoma Ra Be #00ff00$"..tedad.." #ffffffSet Kard!", find, 255, 255, 255, true)
				outputDebugString("Admin "..getPlayerName(thePlayer).." Khazane Faction "..targetPlayer.." Ra Be $"..tedad.." Set Kard! (Online)")
			else
				outputChatBox("#ff0000✖️ #ffffffMeghdar Bayad Hadaksar $5,000,000 Bashad!", thePlayer, 255, 255, 255, true)
			end
		else
			outputChatBox("#ff0000✖️ #ffffffMeghdare Hoghoogh Ra Vared Konid!", thePlayer, 255, 255, 255, true)
		end
		else
			outputChatBox("#ff0000✖️ #ffffffPlayer Peyda Nashod!", thePlayer, 255, 255, 255, true)
		end
		else
			outputChatBox("#C0C0C0Bezan: /asethoghoogh <PartOfName/ID> <Meghdar>", thePlayer, 0, 255, 0,true)
		end
end,false,false)
--============================================================================================================================================================
addCommandHandler("asethoghooghref",
function(thePlayer, cmd, preffe, Tedad)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 17 then
		outputChatBox("#ff0000✖️ Shoma Dastresi Be In Dastoor Ra Nadarid!", thePlayer, 255, 255, 255, true)
		return false
	end
	if (preffe) then
		if Tedad then
				if tonumber(Tedad) < 5000001 then
					local reffeyarukemikhaddemoteshe = tonumber(preffe)
					local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM users;" )
					local result, numrows = dbPoll(query, dbpTime)
					if (result and numrows > 0) then
						for index, row in pairs(result) do
							local IDeYaru = row['pID']
							if tonumber(IDeYaru) == tonumber(reffeyarukemikhaddemoteshe) then
								local name = row['pName']
								local pMember = row['pMember']
								local pRank = row['pRank']
								if tonumber(pMember) >= 1 then
									if tonumber(pRank) == 7 then
										exports.Logs:newLog("Hoghoogh","Admin "..getPlayerName(thePlayer).." Pole Khazane Faction "..name.." Ra Be $"..tonumber(Tedad).." Set Kard (/asethoghooghref)")
										exports["notf"]:addNotification(thePlayer, "Shoma Pole Khazane Faction "..name.." Ra Be $"..tonumber(Tedad).." Set Kardid." , 'success')
										local query = dbQuery(exports.mysql:getMySQLC(), "UPDATE `users` SET `pFacHoghogh` = '"..tonumber(Tedad).."' WHERE `pID` = '"..tonumber(preffe).."'")
										dbFree(query)
										triggerClientEvent ( thePlayer, "PlayMovafagh", thePlayer)
										outputDebugString("Admin "..getPlayerName(thePlayer).." Khazane Faction "..name.." Ra Be $"..tonumber(Tedad).." Set Kard! (Ofline)")
									end
								end
								if tonumber(pRank) ~= 7 or tonumber(pMember) == 0 then
									exports["notf"]:addNotification(thePlayer, "In Player Leader Nist!" , 'error')
									triggerClientEvent ( thePlayer, "PlayError", thePlayer)
								end
							end
						end
						dbFree(query)
					end
				else
					exports["notf"]:addNotification(thePlayer, "The maximum salary should be 5 million.", 'error')
				end
		else
			exports["notf"]:addNotification(thePlayer, "Enter the salary amount.", 'error')
		end
	else
		exports["notf"]:addNotification(thePlayer, "Synatx: /asethoghooghref <Referral-ID> <Meghdar>", 'info')
	end
end,false,false)



--========================================================================================================================================


--================================================================================================================================
addCommandHandler("rec",
function ( thePlayer, command, taraf )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 8 then
		return
	end
	if not taraf then
		exports["notf"]:addNotification(thePlayer, "/rec <pID>", 'info')
	else
		local find = miscSys:findPlayer ( taraf )
		if find then
			local targetPlayer = getPlayerName ( find )
			redirectPlayer(find, "", 22003)  -------- Vase Change Name Bebar
			outputChatBox("#FF0000(Alert): #ffffffShoma Player #05C5E3"..targetPlayer.." #ffffffRa Reconnect Dadid ! ", thePlayer, 0, 255, 0,true)
			for k, chat_admini in ipairs (getElementsByType("player")) do
	        if getElementData(chat_admini, "loggedIn") == true then
	        if tonumber(getElementData(accSys:getPlayerAcc(chat_admini), "pAdmin")) > 1 then
	        outputChatBox("#ff0000(ADM-Warn): #ffffff Admin #fc9803"..getPlayerName(thePlayer).." #ffffffPlayer #19C3EC"..targetPlayer.." #ffffffRa Reconnect Dad!", chat_admini, 208, 0, 15,true)
	end
	end
	end
		else
			exports["notf"]:addNotification(thePlayer, "Player Not Found !!", 'error')
		end
	end
end)
--===========================================================================================================================================
addCommandHandler("showslot",
function ( thePlayer, command, player )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 10 then
			export["notf"]:addNotification(thePlayer, "Wrong Command", 'error')
		return
	end
	if player then
		local taraf = miscSys:findPlayer(player)
		if taraf then 
			local KhamireYaro = getElementData(accSys:getPlayerAcc(taraf), "pSlot")
			outputChatBox("#FF6D25(Slot Car): #ffffffTedad Slot Haye #05C5E3"..getPlayerName(taraf).." #ffffff: #12F20B"..KhamireYaro.."", thePlayer, 255, 255, 255, true)
		else
			outputChatBox("#EE0A0AChenin Playeri Dakhel Server Nmibashad !", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#bababaBezan : /showslot <PartOfName/ID>", thePlayer, 255, 255, 255, true)
	end
end)

addCommandHandler("showp",
function ( ppl, command, player )
	if tonumber(getElementData(accSys:getPlayerAcc(ppl), "pAdmin")) > 12 then
		if player then
			local find = miscSys:findPlayer(player)
			local targetPlayer = getPlayerName ( find )
			local Gold = getElementData(accSys:getPlayerAcc(find), "pGold")
			local pg = getElementData(accSys:getPlayerAcc(find), "pGoldPremium")
			local ps = getElementData(accSys:getPlayerAcc(find), "pSilverPremium")
			local pb = getElementData(accSys:getPlayerAcc(find), "pBronzePremium")
			
			
			outputChatBox("#00ff00Tedad Gold "..targetPlayer.." : #edda09"..Gold.."", ppl, 255, 255, 255, true)
			outputChatBox("#00ff00Saat Gold Premium : #edda09 "..pg.." #ffffff| #00ff00Silver Premium : #edda09 "..ps.." #ffffff| #00ff00Bronze Premium : #edda09 "..pb.."", ppl, 255, 255, 255, true)
			
		else
			exports["notf"]:addNotification(thePlayer, "Syntax: /showp <pID>", 'info')
		end
	else
		exports["notf"]:addNotification(thePlayer, "You do not have access to this command !!", 'error')
	end
end)




--___________________________________________________________________________________________________________________--
--___________________________________________________________________________________________________________________--
--___________________________________________________________________________________________________________________--
addCommandHandler("setmat",
function(thePlayer, command, player, meghdar)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 18 then
		return false
	end
	local find = miscSys:findPlayer ( player )
	local meghdar = tonumber(meghdar)
	local targetPlayer = getPlayerName ( find )
	if player then
	if find then
	if meghdar then
		setElementData(accSys:getPlayerAcc(find), "pMats", meghdar)
	else
		exports["notf"]:addNotification(thePlayer, "Please Enter Material Amount !", 'error')
	end
	else
		exports["notf"]:addNotification(thePlayer, "Player Not Found !", 'error')
	end
	else
		exports["notf"]:addNotification(thePlayer, "Syntax: /setmat <Player> <Amount>", 'info')
	end
end)
--________________________________________________________________________________________________________--
--___________________________________________________________________________________________________________________--
addCommandHandler("gotopos",
function (thePlayer, command, posX, posY, posZ, intID, dimID)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 18 then
		
		return false
	end
	local posX, posY, posZ, intID , dimID = tonumber(posX), tonumber(posY), tonumber(posZ), tonumber(intID), tonumber(dimID)
	if posX and posY and posZ and intID and dimID then
		setElementPosition(thePlayer, posX, posY, posZ)
		setElementInterior(thePlayer, intID)
		setElementDimension(thePlayer, dimID)
		outputChatBox("#12F20BShoma Be In Mokhtasat Teleport Shodid : ", thePlayer, 255, 255, 255, true)
		outputChatBox("#12BBE8"..posX.." ,"..posY.." ,"..posZ, thePlayer, 255, 255, 255, true)
	else
		exports["notf"]:addNotification(thePlayer, "Syntax: /gotopos <X> <Y> <Z> <int> <dim>", 'info')
		
	end
end)
--==================================================================================================================================
addCommandHandler("getpos",
function ( thePlayer, command )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 18 then
		
		return
	end
	local x, y, z = getElementPosition(thePlayer)
	outputChatBox("#ffffffMokhtasat Shoma : #5FD19C( "..x.." ,"..y.." ,"..z.." )", thePlayer, 150, 150 , 150,true)
	if ( isElement(thePlayer) and getElementType (thePlayer) == "player" ) then
        local x, y, z = getElementRotation ( thePlayer )        
        outputChatBox("#ffffffRotation Shoma : #5FD19C( "..x.." ,"..y.." ,"..z.." )", thePlayer, 150, 150 , 150,true)
    end
end	)
--___________________________________________________________________________________________________________________--
--___________________________________________________________________________________________________________________--
function yeMashinBaseAdmin( thePlayer, command, IDMashin )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) > 1 then
		local x, y, z = getElementPosition(thePlayer)
		local createdVehicle = createVehicle(tonumber(IDMashin), x + 2, y, z)
		local int = getElementInterior(thePlayer)
		local dem = getElementDimension(thePlayer)
		local vehname = getVehicleNameFromModel(tonumber(IDMashin))
		if tonumber(IDMashin) then
			setElementData(createdVehicle, "veh_owner", tostring(admin_veh))
			setVehiclePlateText(createdVehicle, "High Rank")
			setElementInterior(createdVehicle, int)
			setElementDimension(createdVehicle, dem)
			setElementHealth( createdVehicle, 1500 )
			--outputChatBox("#00ff00☑️ #ffffffShoma Yek Khodro #00ff00"..vehname.." #ffffffSakhtid!", thePlayer, 255, 255, 255, true)
			warpPedIntoVehicle(thePlayer,createdVehicle,0)
		else
			exports["notf"]:addNotification(thePlayer, "Syntax: /veh <Car ID>", 'info')
		end
	else 
		exports["notf"]:addNotification(thePlayer, "Error Command IS Wrong", 'error')
	end
	for k, chat_admini in ipairs(getElementsByType("player")) do
		if getElementData(chat_admini, "loggedIn") == true then
		if tonumber(getElementData(accSys:getPlayerAcc(chat_admini), "pAdmin")) > 8 then
			exports["notf"]:addNotification(chat_admini, "Player"..getPlayerName(thePlayer).."Spowned Vehicle ==>"..getVehicleNameFromModel(tonumber(IDMashin)), 'info')
		end
	end
	end
	
end
addCommandHandler("veh", yeMashinBaseAdmin)
--___________________________________________________________________________________________________________________--
--___________________________________________________________________________________________________________________--
function PmForAll ( thePlayer, _, ... )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 29 then
		
		return false
	end
    local message = table.concat ( { ... }, " " )
    if ... then
      for index, allpl in ipairs(getElementsByType("player")) do
	   outputChatBox ( "#ff0000 [Server Alert]  : #ffffff".. message,  allpl,255, 255, 255, true )
      end
	  exports.Logs:newLog("StaffMessages","[Staff] ".. getPlayerName ( thePlayer ) ..": ".. message.."")
	  triggerClientEvent ( root, "PlayNotif", root)
    else
      exports["notf"]:addNotification(thePlayer, "Syntax: /o <message>", 'info')
    end
end
addCommandHandler ("o", PmForAll)
--___________________________________________________________________________________________________________________--
--___________________________________________________________________________________________________________________--
--[[function PmForAll2 ( thePlayer, _, ... )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 12 then
		return false
	end
    local message = table.concat ( { ... }, " " )
    if ... then
      for index, allpl in ipairs(getElementsByType("player")) do
        outputChatBox ( "#ff0000[Server Alert] : #ffffff".. message.." #ff0000",  allpl,255, 255, 255, true )
      end
	  exports.Logs:newLog("StaffMessages","[Staff] ".. getPlayerName ( thePlayer ) ..": ".. message.."")
	  triggerClientEvent ( root, "PlayNotif", root)
    else
      exports["notf"]:addNotification(thePlayer, "Syntax: /oupdate <message>", 'info')
    end
end
addCommandHandler ("oupdate", PmForAll2)]]
--___________________________________________________________________________________________________________________--
--___________________________________________________________________________________________________________________--
function cc (thePlayer)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 8 then
		return
	end
	for i = 1, 100 do
		outputChatBox(" ", root, 255, 255, 255, true)
	end
	triggerClientEvent(root,"clearedebugscript",root)
	clearChatBox (getRootElement())
	outputChatBox("#A703FFChat Cleared !", root, 255, 255, 255, true)
	for k, chat_admini in ipairs (getElementsByType("player")) do
	        if getElementData(chat_admini, "loggedIn") == true then
	        if tonumber(getElementData(accSys:getPlayerAcc(chat_admini), "pAdmin")) > 0 then
	        outputChatBox("#FF0000( Admin-Warn ): #ffffffAdmin #A703FF"..getPlayerName(thePlayer).." #ffffffTamami Chat Haye Server Ro #00BFFFClear #ffffffKard.", chat_admini, 208, 0, 15,true)
			end
			end
	end
end

addCommandHandler("cc", cc)
--___________________________________________________________________________________________________________________--
--___________________________________________________________________________________________________________________--

local AdminRanks = {
    { "Hoster"},--1
	{ "VIP"},--2
	{ "Mapper"},--3
	{ "Designer"},--4
	{ "Modeler"},--5
	{ "Content Creator"},--6
	{ "Streamer"},--7
	{ "Trial"},--8
	{ "Operator"},--9
	{ "Moderator"},--10
	{ "Bronze"},--11
	{ "Silver"},--12
	{ "Gold"},--13
	{ "Platinum"},--14
	{ "Senior"},--15
	{ "Assistant"},--16
	{ "Head Admin"},--17
	{ "Mafia Manager"}, --18
	{ "Social"}, --19
	{ "Content Creator"}, -- 20
	{ "Faction Manager"}, -- 21
	{ "Helper Manager"}, --22
	{ "Executive"}, --23
	{ "Super Visur"}, --24
	{ "Staff Boos"}, --25
	{ "Manager"}, --26
	{ "Administrator"}, --27
	{ "Owner"}, --28
	{ "Founder"}, --29
	{ "Scripter"}, --30
}

function GetOnlineAdmins()
	local Admins = 0
	for index,modira in ipairs(getElementsByType("player")) do
		if getElementData(modira,"loggedIn") and getElementData(modira,"loggedIn") == true then
			if getElementData(accSys:getPlayerAcc(modira),"pAdmin") >= 1 then
				Admins = tonumber( Admins ) + 1
			end
		end
	end
	return Admins
end

function GetPlayerAdminRank(level)
    local tempData = nil
    if level == nil then 
        tempData = "No Answer"
    else
        tempData = AdminRanks[tonumber(level)][1]
    end
    return tempData
end	


addCommandHandler("admins",
function ( thePlayer, command)
	if tonumber(GetOnlineAdmins()) > 0 then
	outputChatBox("#00C1FF[ Tedad Admin Haye Online: "..GetOnlineAdmins().." ]", thePlayer, 150, 150 , 150,true)
	local Admins = 0
		for index,modira in ipairs(getElementsByType("player")) do
			if getElementData(modira,"loggedIn") and getElementData(modira,"loggedIn") == true then
				if getElementData(accSys:getPlayerAcc(modira),"pAdmin") > 0 then
				Admins = tonumber( Admins ) + 1
				local Duty = false
				local DutyText = "nil"
				if getElementData(modira, "adminDuty") then
					Duty = true
					DutyText = "| Vaziat:#00FF00 On Duty"
				else
					Duty = false
					DutyText = "| Vaziat:#FF0000 Off Duty"
				end
					if getElementData(accSys:getPlayerAcc(modira),"pAdmin") <= 30 then
						outputChatBox("#909090"..Admins.."-#ffffff"..getPlayerName(modira).."#909090 | #4BEC28Rank: "..GetPlayerAdminRank(getElementData(accSys:getPlayerAcc(modira),"pAdmin")).."#909090 | "..DutyText, thePlayer, 150, 150 , 150,true)
					end
				end
			end
		end
	else
		exports["notf"]:addNotification(thePlayer, "The admin is currently not online !", 'error')
	end
end)
--___________________________________________________________________________________________________________________--
--___________________________________________________________________________________________________________________--
addCommandHandler("makeadmin",
    function(thePlayer, command, player, AdminID)

        if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 27 then
			return false
		end

        if not player or not AdminID then
            exports["notf"]:addNotification(thePlayer, "Syntax: /makeadmin <Id> <Rank>", 'info')
            return false
        end

        local targetPlayer = miscSys:findPlayer(player)
        if not targetPlayer then
            exports["notf"]:addNotification(thePlayer, "Player Not Found", 'error')
            return  false
        end

        local adminLevel = tonumber(AdminID)
        if not adminLevel or adminLevel < 0 or adminLevel > 26 then
            exports["notf"]:addNotification(thePlayer, "Rank ==> 1 ~> 26", 'error')
            return false
        end
        setElementData(accSys:getPlayerAcc(targetPlayer), "pAdmin", adminLevel)
        outputChatBox("#9B00FF[Staff Join]: #FFFFFFYou set #9B00FF"..getPlayerName(targetPlayer).." #FFFFFFto admin level #00FFFF"..adminLevel, thePlayer, 255, 255, 255, true)
        outputChatBox("#9B00FF[Staff Join]: #FFFFFFYou were set to admin level #9B00FF"..adminLevel.." #FFFFFFby ##9B00FF"..getPlayerName(thePlayer), targetPlayer, 255, 255, 255, true)

		for k, chat_admini in ipairs(getElementsByType("player")) do
			if getElementData(chat_admini, "loggedIn") == true then
				if tonumber(getElementData(accSys:getPlayerAcc(chat_admini), "pAdmin")) > 1 then
					outputChatBox("#9B00FF<<[Admin System]: #FFFFFFPlayer #9B00FF"..getPlayerName(targetPlayer).." #FFFFFFPromoted By #00FFFF"..getPlayerName(thePlayer)"#FFFFFF. Rank ~> "..adminLevel, chat_admini, 255, 255, 255, true)
				end
			end
		end

        outputDebugString("Admin "..getPlayerName(thePlayer).." set "..getPlayerName(targetPlayer).." to level "..adminLevel)
    end
)
--____________________________________________________________________________________________________________________________________________--
--________________________________________________________________________________________________________________________________________--
addCommandHandler("davall",
function(thePlayer, cmd)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 25 then
		return false
	end
	for index, admincar in ipairs(getElementsByType("vehicle")) do 
		local veh_owneri = getElementData(admincar, "veh_owner")
		if tostring(veh_owneri) == tostring(admin_veh) then
			setVehicleEngineState(admincar, false)
			setTimer(
			function ()
				destroyElement( admincar )
			end , 100, 1)

		end
	end
	outputChatBox("#FF1C1CDelete Shod !", thePlayer, 255, 255, 255, true)
	for k, chat_admini in ipairs (getElementsByType("player")) do
	        if getElementData(chat_admini, "loggedIn") == true then
	        if tonumber(getElementData(accSys:getPlayerAcc(chat_admini), "pAdmin")) > 1 then
	        outputChatBox("#9B00FF[ Admin-Warn ]: #ffffffAdmin #9B00FF".. getPlayerName ( thePlayer ) .." #ffffffTamami Mashin Haye Admini Ro #ff0000Delete #ffffffKard.", chat_admini, 208, 0, 15,true)
			end
			end
		end
end  
)
--___________________________________________________________________________________________________________________--
--___________________________________________________________________________________________________________________--

local helperRanks = {
    [0] = { title = "Civilian Player", color = "#FF0000", skin = 0 },
    [1] = { title = "Trial Helper", color = "#00FF00", skin = 217 },
    [2] = { title = "Bronze Helper", color = "#00FF00", skin = 217 },
    [3] = { title = "Silver Helper", color = "#00FF00", skin = 217 },
    [4] = { title = "Gold Helper", color = "#00FF00", skin = 217 },
    [5] = { title = "Head Helper", color = "#00FF00", skin = 217 }
}


addCommandHandler("makehelper", function(thePlayer, command, player, helperID)

    local adminLevel = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin"))
    if not adminLevel or adminLevel < 22 then
        return
    end


    local find = miscSys:findPlayer(player)
    if not find then
        exports["notf"]:addNotification(thePlayer, "Player Not Found!!", 'error')
        return
    end


    helperID = tonumber(helperID)
    if not helperID or helperID < 0 or helperID > 5 then
        exports["notf"]:addNotifocation(thePlayer, "This helper rank must be between 0 and 5 !", 'error')
        return
    end

 
    local targetPlayerName = getPlayerName(find)
    local adminName = getPlayerName(thePlayer)
    local rankData = helperRanks[helperID]


    setElementData(accSys:getPlayerAcc(find), "pHelper", helperID)
    setElementData(accSys:getPlayerAcc(find), "cSkin", rankData.skin)
    setElementModel(find, rankData.skin)


    outputChatBox("#00FF00(Helper-System):#ffffff Shoma #9B00FF" .. targetPlayerName .. "#ffffff Ra Be Rank'e " .. rankData.color .. rankData.title .. "#ffffff Davat Kardid!", thePlayer, 255, 255, 255, true)
    outputChatBox("#00FF00(Helper-System):#ffffff Shoma Tavasote Admin #9B00FF" .. adminName .. "#ffffff Be Rank'e " .. rankData.color .. rankData.title .. "#ffffff Davat Shodid!", find, 255, 255, 255, true)


    exports.Logs:newLog("StaffRank", "Admin " .. adminName .. " Player " .. targetPlayerName .. " Ra Be Rank'e " .. rankData.title .. " Davat Kard!")
    outputDebugString("Admin " .. adminName .. " Player " .. targetPlayerName .. " Ra Be Rank'e " .. rankData.title .. " Davat Kard!")
end)
--___________________________________________________________________________________________________________________--



--___________________________________________________________________________________________________________________--
addCommandHandler("dv",
function(thePlayer, cmd)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 1 then
		
		return false
	end
		local thePlayerVehicle = getPedOccupiedVehicle(thePlayer)
		local veh_owneri = getElementData(thePlayerVehicle, "veh_owner")
		if thePlayerVehicle then
			if tostring(veh_owneri) == tostring(admin_veh) then
				setVehicleEngineState(thePlayerVehicle, false)
				setTimer(
				function ()
					destroyElement( thePlayerVehicle )
					outputChatBox("#FF1C1CDelete !", thePlayer, 255, 255, 255, true)
					for k, chat_admini in ipairs (getElementsByType("player")) do
	        if getElementData(chat_admini, "loggedIn") == true then
	        if tonumber(getElementData(accSys:getPlayerAcc(chat_admini), "pAdmin")) > 8 then
	      	  outputChatBox("#9B00FF[ADM-Warn]: #ffffff Admin #9B00FF"..getPlayerName(thePlayer).."#ffffff Yek Veh Admini#ff0000 Delete #ffffffKard !", chat_admini, 208, 0, 15,true)
			end
			end
		end
				end , 100, 1)
			else
				exports["notf"]:addNotification(thePlayer, "This car does not belong to the admin.", 'error')
			end
		else
			exports["notf"]:addNotification(thePlayer, "To delete a car, you must be in the car in question.", 'error')
		end
end
)
--====================================================================================================================================
addCommandHandler("fix",
function ( thePlayer, command, player)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 1 then
		
		return false
	end
		local find = miscSys:findPlayer ( player )
		if player then
		if find then
			local targetPlayer = getPlayerName ( find )
			local hisVeh = getPedOccupiedVehicle(find)
			if hisVeh then
				fixVehicle(hisVeh)
				local x,y,z = getElementRotation ( hisVeh )
				setElementRotation(hisVeh,0,0,z,"default",true)
				outputChatBox("#bababa(Vehicle): #ffffffShoma Mashin'e #19C3EC"..targetPlayer.." #ffffffRa #6FFF18Fix #ffffffKardid !", thePlayer, 255, 255, 255, true)
				outputChatBox("#ffb6c1[Admin-System]: #ffffffAdmin #c0c0c0".. getPlayerName ( thePlayer ) .." #ffffffKhodro Shoma Ra #00ff00Fix #ffffffKard.", find, 255, 255, 255, true)
				for k, chat_admini in ipairs (getElementsByType("player")) do
	        if getElementData(chat_admini, "loggedIn") == true then
	        if tonumber(getElementData(accSys:getPlayerAcc(chat_admini), "pAdmin")) > 6 then
	    		 outputChatBox("#9B00FF[ADM-Warn]: #ffffff Admin #9B00FF"..getPlayerName(thePlayer).."#ffffff Veh #9B00FF"..targetPlayer.."#ffffff Ra #6FFF18Fix #ffffffKard !", chat_admini, 208, 0, 15,true)
			end
			end
		end
			else
				exports["notf"]:addNotification(thePlayer, "The player is not in the car !", 'error')
			end
			else
				exports["notf"]:addNotification(thePlayer, "Player Not Found !!", 'error')
			end
		else
			exports["notf"]:addNotification(thePlayer, "Synatx: /fix <Name Or ID>", 'info')
		end
end
)
--================================================================================================================================================
addCommandHandler("changepass",
function ( thePlayer, command, player, pass )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 27 then
		outputChatBox("#33AA33Error: Motasefane dastresi be in dastoor baraye shoma maghdoor nist.", thePlayer, 255, 255, 255, true)
		return false
	end
		local find = miscSys:findPlayer ( player )
		if find then
			local targetPlayer = getPlayerName ( find )
			outputChatBox("#00ff00[Done]:#ffffffShoma Player #FFFF00"..targetPlayer.." #FFFFFFRa Be #FFFF00"..pass.."#FFFFFF Change Pass Kardid!", thePlayer, 0, 255, 0,true)
			outputChatBox("#2EAFFF[Info]:#ffffffShoma Tavasot Admin #FFFF00"..getPlayerName(thePlayer).."#FFFFFF Be Passe (#FFFF00"..pass..")#FFFFFF Change Pass Shodid!", find, 0, 255, 0, true)
			exports["[Vanish]Logs"]:CreateServerLog("Admin-Warn","Admin "..getPlayerName(thePlayer).." Passworde Player "..targetPlayer.." Ra Be "..pass.."Taghir Dad!")
			pass = tostring( pass )
			setElementData(accSys:getPlayerAcc(find), "pKey", pass)
		else
			exports["notf"]:addNotification(thePlayer, "Player Not Found!", 'error')
		end
end
)
--================================================================================================================================================
addCommandHandler("givemat",
	function ( thePlayer, _, player, amount )
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 18 then
			--outputChatBox("#33AA33Error: Motasefane dastresi be in dastoor baraye shoma maghdoor nist.", thePlayer, 255, 255, 255, true)
			return false
		end

		local find = miscSys:findPlayer(player)
		if find then
			if amount then
				local targetName = getPlayerName ( find )
				local oldMat = getElementData(accSys:getPlayerAcc(find), "pMats")
				setElementData(accSys:getPlayerAcc(find), "pMats", tonumber(amount))
				local totalMoney = getPlayerMoney ( find )
				outputChatBox("Meghdare "..convertNumber( amount ).." baraye "..targetName.." ferestade shod.", thePlayer, 0, 255, 0)
				outputChatBox("Mojoodie hamrahe "..targetName.." dar hale hazer "..convertNumber ( getElementData(accSys:getPlayerAcc(find), "pMats") ).." mibashad.", thePlayer, 0, 255, 0)

				outputChatBox("Meghdare "..convertNumber( amount ).." Mat az "..getPlayerName(thePlayer).." baraye shoma ersal shod.", find, 0, 255, 0) -- 11
				outputDebugString("Admin "..getPlayerName(thePlayer).." Be Player "..targetName.." Meghdar "..amount.."$ material Dad!")
			
			--exports["Logs"]:CreateServerLog("Admin-Warn","Admin "..getPlayerName(thePlayer).." Be Player "..targetName.." Meghdare "..amount.."Material Dad!")
			else
				exports["notf"]:addNotification(thePlayer, "Syntax: /givemat <Id> <Amount>", 'info')
			end
		else
			exports["notf"]:addNotification(thePlayer, "Player Not Found!", 'error')
		end
	end
)

--====================================================================================================================================
addCommandHandler("slotall",
function ( thePlayer, command, tedad)
	if getElementData(thePlayer, "loggedIn") == true then
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) ~= 30 then
			exports["notf"]:addNotification(thePlayer, "Error Comand Is Wrong.!", 'error')
			return false
		end
		if tedad then
		for k, hame_Playera	in ipairs (getElementsByType("player")) do	
			if getElementData(hame_Playera, "loggedIn") == true then
				local tedad = tonumber(tedad)
				setElementData(accSys:getPlayerAcc(hame_Playera), "pSlot", tonumber(getElementData(accSys:getPlayerAcc(hame_Playera), "pSlot")) + tonumber(tedad))
				outputChatBox("#AAFF00[Vehicle System] #FF0000"..getPlayerName(thePlayer).." #FFFFFFBe Tamamie Player Haye Online Nafari #D900FF"..tedad.." #FFFFFFSlot Dad!", hame_Playera, 255, 255, 255, true)
			end
		end
		else
			exports["notf"]:addNotification(thePlayer, "Synatx: /slotall <Meghdar>", 'info')
		end
	end
end)
--=======================================================================================================================================
--=============================================================================================================================================
addCommandHandler("setreff",
function ( thePlayer, command, player, level )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 27 then
		outputChatBox("#ff0000Shoma Dastresi Be In Dastoor Nadarid!", thePlayer, 255, 255, 255, true)
		return false
	end
		local find = miscSys:findPlayer ( player )
		if player then
		if find then
		if level then
		if tonumber(level) > 0 then
			local targetPlayer = getPlayerName ( find )
			local level = tonumber(level)
			local query = dbQuery(exports.mysql:getMySQLC(), "UPDATE `users` SET `pID` = '"..tonumber(level).."' WHERE `pID` = '".. tonumber(getElementData(accSys:getPlayerAcc(find),"pID")).."'")
			dbFree(query)
			setElementData(accSys:getPlayerAcc(find), "pID", level)
			exports["notf"]:addNotification(thePlayer, "You changed "..getPlayerName(find)"'s referral to "..level, 'success')
			outputChatBox("#9B00FF[Refferal]: #FFFFFFAdmin #00FFFF"..getPlayerName(thePlayer).." #FFFFFFReferral Shoma Ra Be #009DFF"..level.." #FFFFFFSet Kard!", find, 255, 255, 255, true)
			outputDebugString("Admin "..getPlayerName(thePlayer).." Referral'e "..targetPlayer.." Ra Be "..level.." Set Kard!")
		else
			exports["notf"]:addNotification(thePlayer, "The referral ID level must be greater than 0.", 'error')
		end
		else
			exports["notf"]:addNotification(thePlayer, "Enter the referral level.", 'error')
		end
		else
			exports["notf"]:addNotification(thePlayer, "Player Not Found", 'error')
		end
		else
			exports["notf"]:addNotification(thePlayer, "Syntax: /setreff <id> <Refferal>", 'info')
		end
end)
--==========================================================================================================================================================
addCommandHandler("user",
function (thePlayer, command, player)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 8 then
		return false
	end
	local find = miscSys:findPlayer (player)
	if player then
	if find then
		local money = getPlayerMoney(find) 
		outputChatBox("#ff0000-------------------User Info-------------------------", thePlayer, 255, 255, 255, true)
		outputChatBox("#00ff00Esm #ffffff"..getPlayerName(find).."#9932CC| #00ff00Pass #ff0000 ********* #9932CC| #00ff00Level #ffffff"..getElementData(accSys:getPlayerAcc(find), "pLevel").."#9932CC| #00ff00Respect #ffffff"..getElementData(accSys:getPlayerAcc(find), "pExp").."#9932CC| #00ff00ConnectTime #ffffff"..getElementData(accSys:getPlayerAcc(find), "pConnectTime").."#9932CC| #00ff00Faction #ffffff"..getElementData(accSys:getPlayerAcc(find), "pMember").."#9932CC| #00ff00Faction Rank #ffffff"..getElementData(accSys:getPlayerAcc(find), "pRank").."", thePlayer, 255, 255, 255, true)
		outputChatBox("#00ff00Pool #ffffff"..tostring(money).." #9932CC| #00ff00Gold'e #ffffff"..getElementData(accSys:getPlayerAcc(find), "pGold").."", thePlayer, 255, 255, 255, true)
		outputChatBox("#00ff00Material'e #ffffff"..getElementData(accSys:getPlayerAcc(find), "pMats").." #9932CC| #00ff00Mats Skill'e #ffffff"..getElementData(accSys:getPlayerAcc(find), "pMatsSkill").."#9932CC| #00ff00Drug'e #ffffff"..getElementData(accSys:getPlayerAcc(find), "pDrugs").."#9932CC| #00ff00Drug Skill #ffffff"..getElementData(accSys:getPlayerAcc(find), "pDrugsSkill").."", thePlayer, 255, 255, 255, true)
		outputChatBox("#00ff00Slot #ffffff"..getElementData(accSys:getPlayerAcc(find), "pSlot").."#9932CC| #00ff00Job #ffffff"..getElementData(accSys:getPlayerAcc(find), "pJob").."#9932CC| #00ff00Rp Rob'e #ffffff"..getElementData(accSys:getPlayerAcc(find), "pRob").."", thePlayer, 255, 255, 255, true)
		outputChatBox("#00ff00Email #ffffff"..getElementData(accSys:getPlayerAcc(find), "pEmail").."", thePlayer, 255, 255, 255, true)
		outputChatBox("#ff0000-----------------------------------------------------", thePlayer, 255, 255, 255, true)
	else
		exports["notf"]:addNotification(thePlayer, "Player Not Found", 'error')
	end
	else
		exports["notf"]:addNotification(thePlayer, "Syntax: /user <ID>", 'info')
	end
end)
--===============================================================================================================================================
addCommandHandler("freezecars",
function ( thePlayer, command )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 8 then
		return false
	end
	for index, admincar in ipairs(getElementsByType("vehicle")) do 
		local veh_owneri = getElementData(admincar, "veh_owner")
		if tostring(veh_owneri) == tostring(admin_veh) then
			setElementFrozen(admincar, true)
		end
	end
	exports["notf"]:addNotification(thePlayer, "All Cars Freezed", 'success')
end
)
--___________________________________________________________________________________________________________________--
--___________________________________________________________________________________________________________________--
addCommandHandler("unfreezecars",
function ( thePlayer, command )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 8 then
		
		return false
	end
	for index, admincar in ipairs(getElementsByType("vehicle")) do 
		local veh_owneri = getElementData(admincar, "veh_owner")
		if tostring(veh_owneri) == tostring(admin_veh) then
			setElementFrozen(admincar, false)
		end
	end
	exports["notf"]:addNotification(thePlayer, "All Cars Unfreezed", 'success')
end
)
--___________________________________________________________________________________________________________________--
--___________________________________________________________________________________________________________________--
--___________________________________________________________________________________________________________________--
addCommandHandler("respectall",
function ( thePlayer, command, tedad)
	if getElementData(thePlayer, "loggedIn") == true then
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) ~= 30 then
			return false
		end
		if tedad then
		for k, hame_Playera	in ipairs (getElementsByType("player")) do	
			if getElementData(hame_Playera, "loggedIn") == true then
				local tedad = tonumber(tedad)
				setElementData(accSys:getPlayerAcc(hame_Playera), "pExp", tonumber(getElementData(accSys:getPlayerAcc(hame_Playera), "pExp")) + tonumber(tedad))
				outputChatBox("#0095FF[Respect]: #ff0000"..getPlayerName(thePlayer).." #FFFFFFBe Tamamie Player Haye Online Nafari #0095FF" ..tedad.. " #FFFFFF Respect Dad !", hame_Playera, 255, 255, 255, true)
			end
		end
		else
			exports["notf"]:addNotification(thePlayer, "Syntax: /respectall <Amount>", 'info')
		end
	end
end)
--___________________________________________________________________________________________________________________--
--___________________________________________________________________________________________________________________--
addCommandHandler("moneyall",
function ( thePlayer, command, value)
	if getElementData(thePlayer, "loggedIn") == true then
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) ~= 30 then
			
			return false
		end
		if value then
			if tonumber(value) >= 1 and tonumber(value) <= 5000000 then
				for k, hame_Playera	in ipairs (getElementsByType("player")) do
					if getElementData(hame_Playera, "loggedIn") == true then
						local value = tonumber(value)
						givePlayerMoney(hame_Playera, value)
						outputChatBox("#00ff00[Money]: #ff0000 "..getPlayerName(thePlayer).." #FFFFFFBe Tamamie Player Haye Online Nafari #00FF00$"..tonumber(value).." #FFFFFFPool Dad !", hame_Playera, 255, 255, 255, true)
					end
				end
			else
				exports["notf"]:addNotification(thePlayer, "The amount must be between $1 and $5 million.", 'error')
			end
		else
			exports["notf"]:addNotification(thePlayer, "Syntax: /moneyall <Amount>", 'info')
		end
	end
end)
--___________________________________________________________________________________________________________________--
--___________________________________________________________________________________________________________________--
addCommandHandler("giverespect",
function ( thePlayer, command, player, tedad )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 27 then
		return false
	end
		local find = miscSys:findPlayer ( player )
		if player then
		if find then
		if tedad then
			local targetPlayer = getPlayerName ( find )
			local tedad = tonumber(tedad)
			local respectPlayer = getElementData(accSys:getPlayerAcc(find), "pExp")
			setElementData(accSys:getPlayerAcc(find), "pExp", tonumber(respectPlayer) + tonumber(tedad))
			outputChatBox("#bababa(Respect): #ffffffShoma Be #19C3EC"..getPlayerName(find).." #ffffffTedad #00ff00"..tedad.." #ffffffRespect Dadid !", thePlayer, 255, 255, 255, true)
			outputChatBox("#ffb6c1[Admin-System]: #ffffffAdmin #c0c0c0 "..getPlayerName(thePlayer).." #ffffffBe Shoma #00ff00"..tedad.." #ffffffRespect Dad.", find, 255, 255, 255, true)
		else
			exports["notf"]:addNotification(thePlayer, "Enter the number of respects", 'error')
		end
		else
			exports["notf"]:addNotification(thePlayer, "Player Not Found", 'error')
		end
		else
			exports["notf"]:addNotification(thePlayer, "Syntax: /giverespect <Amount>", 'info')
		end
end)
--___________________________________________________________________________________________________________________--
--___________________________________________________________________________________________________________________--
--___________________________________________________________________________________________________________________--
--___________________________________________________________________________________________________________________--
--___________________________________________________________________________________________________________________--
addCommandHandler("setlevel",
function ( thePlayer, command, player, level )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 30 then
		return false
	end
		local find = miscSys:findPlayer ( player )
		if player then
		if find then
		if level then
		if tonumber(level) > 0 then
			local targetPlayer = getPlayerName ( find )
			local level = tonumber(level)
			setElementData(accSys:getPlayerAcc(find), "pLevel", level)
			setElementData(find, "levelPlayer", level)
			outputChatBox("#bababa(Level): #ffffffShoma Level #2DC6EC"..getPlayerName(find).." #ffffffRa Be #00ff00"..level.." #ffffffSet Kardid !", thePlayer, 255, 255, 255, true)
			outputChatBox("#ffb6c1[Admin-System]: #ffffffAdmin #c0c0c0"..getPlayerName(thePlayer).." #ffffffLevel Shoma Ra Be #ff00ff"..level.." #ffffffTaghir Dad.", find, 255, 255, 255, true)
		else
			exports["notf"]:addNotification(thePlayer, "Level must be greater than 0.", 'error')
		end
		else
			exports["notf"]:addNotification(thePlayer, "Enter Player Level", 'error')
		end
		else
			exports["notf"]:addNotification(thePlayer, "Player Not Found", 'error')
		end
		else
			exports["notf"]:addNotification(thePlayer, "Syntax: /setlevel <Player ID> <Level>", 'info')
		end
end)
--___________________________________________________________________________________________________________________--
--___________________________________________________________________________________________________________________--
--___________________________________________________________________________________________________________________--
addCommandHandler("goto",
	function ( thePlayer, command, player )
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 1 then
			
			return false
		end
		
		local find = miscSys:findPlayer ( player )
		if player then
		if find then
			if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) ~= 16 then
			if tonumber(getElementData(accSys:getPlayerAcc(find), "pAdmin")) ~= 16 then
				if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < tonumber(getElementData(accSys:getPlayerAcc(find), "pAdmin")) then
					exports["notf"]:addNotification(thePlayer, "You are not allowed to teleport to a higher rank.", 'error')
					return false
				end
			end
			end
			local int =  getElementInterior(find)
			local dim = getElementDimension ( find )
			local x , y , z = getElementPosition(find)
			local r = getPedRotation ( find )
			x = x - math.sin ( math.rad ( r ) ) * 2
			y = y + math.cos ( math.rad ( r ) ) * 2
			if isPedInVehicle (thePlayer) then
			local theVehicle = getPedOccupiedVehicle ( thePlayer )

				
					--Hale Bug Job Ha--
					if getElementData(thePlayer, "onbusMarkAndBlip") == true then
						destroyElement(getElementData(thePlayer, "onbusMarkerMake"))
						destroyElement(getElementData(thePlayer, "onbusBlipMake"))
						setElementData(thePlayer,"busCheckPoint",0)
						setElementData(thePlayer, "onbusMarkAndBlip", false)
					end
					if getElementData(thePlayer, "onpilotMarkerAndBlip") == true then
						destroyElement(getElementData(thePlayer, "onpilotMarkerMake"))
						destroyElement(getElementData(thePlayer, "onpilotBlipMake"))
						setElementData(thePlayer,"pilotCheckPoint",0)
						setElementData(thePlayer, "onpilotMarkerAndBlip", false)
					end
					if getElementData(thePlayer, "onMarkAndBlip") == true then
						destroyElement(getElementData(thePlayer, "onMarkerMake"))
						destroyElement(getElementData(thePlayer, "onBlipMake"))
						setElementData(thePlayer,"sWCheckPoint",0)
						setElementData(thePlayer, "onMarkAndBlip", false)
					end
					if getElementData(thePlayer, "makedTrucker") == true then
						destroyElement(getElementData(thePlayer, "onMarkerTruckerMake"))
						destroyElement(getElementData(thePlayer, "onBlipTruckerMake"))
						setElementData(thePlayer,"truckerCheckPoint",0)
						setElementData(thePlayer, "makedTrucker", nil, false)
					end
				--removePedFromVehicle( thePlayer )
				--local x2,y2,z2 = getElementPosition(thePlayer)
				--setElementPosition ( thePlayer, x2,y2,z2+2 )
				setElementDimension(thePlayer,dim)
				setElementInterior(thePlayer,int)
				if ( getElementInterior(find) >= 1 ) then
					toggleControl ( thePlayer, "fire", true )
					toggleControl ( thePlayer, "aim_weapon", true )
					toggleControl ( thePlayer, "vehicle_fire", true )
					setPedDoingGangDriveby ( thePlayer, true )
				end
				setElementPosition ( thePlayer, x + 3, y, z )
				setElementPosition ( theVehicle, x + 3, y, z )
				outputChatBox("#9B00FF[Admin-System]: #ffffffShoma Be #00FFFF"..getPlayerName(find).." #ffffffTeleport Kardid.", thePlayer, 255, 255, 255,true)
				outputChatBox("#9B00FF[Admin-System]: #ffffffAdmin #00FFFF"..getPlayerName(thePlayer).." #ffffffBe Shoma Teleport Kard.", find, 255, 255, 255,true)
				for k, chat_admini in ipairs (getElementsByType("player")) do
	        if getElementData(chat_admini, "loggedIn") == true then
	        if tonumber(getElementData(accSys:getPlayerAcc(chat_admini), "pAdmin")) > 1 then
	       	 outputChatBox("#9B00FF[ADM-Warn]: #ffffff Admin #9B00FF"..getPlayerName(thePlayer).."#ffffff Be #9B00FF"..getPlayerName(find).." #ffffffTeleport Kard !", chat_admini, 208, 0, 15,true)
			end
			end
		end
			else
				removePedFromVehicle( thePlayer )
				--local x2,y2,z2 = getElementPosition(thePlayer)
				--setElementPosition ( thePlayer, x2,y2,z2+2 )
				setElementDimension(thePlayer,dim)
				setElementInterior(thePlayer,int)
				if ( getElementInterior(find) >= 1 ) then
					toggleControl ( thePlayer, "fire", true )
					toggleControl ( thePlayer, "aim_weapon", true )
					toggleControl ( thePlayer, "vehicle_fire", true )
					setPedDoingGangDriveby ( thePlayer, true )
				end
				xx , yy, zz = getElementPosition(thePlayer)
				myint = getElementInterior(thePlayer)
				mydim = getElementDimension(thePlayer)
				setElementData(thePlayer, "canGoBack", true, false)
				setElementPosition ( thePlayer, x + 3, y, z )
				outputChatBox("#9B00FF[Admin-System]: #ffffffShoma Be #00FFFF"..getPlayerName(find).." #ffffffTeleport Kardid.", thePlayer, 255, 255, 255,true)
				outputChatBox("#9B00FF[Admin-System]: #ffffffAdmin #00FFFF"..getPlayerName(thePlayer).." #ffffffBe Shoma Teleport Kard.", find, 255, 255, 255,true)
				for k, chat_admini in ipairs (getElementsByType("player")) do
	        if getElementData(chat_admini, "loggedIn") == true then
	        if tonumber(getElementData(accSys:getPlayerAcc(chat_admini), "pAdmin")) > 1 then
	       		outputChatBox("#9B00FF[ADM-Warn]: #ffffff Admin #9B00FF"..getPlayerName(thePlayer).."#ffffff Be #9B00FF"..getPlayerName(find).." #ffffffTeleport Kard !", chat_admini, 208, 0, 15,true)
			end
			end
		end
			end

		else
			exports["notf"]:addNotification(thePlayer, "Player Not Found", 'error')
		end
		if isPedInVehicle (find) then
      		if ( isPedInVehicle ( find ) ) then
      		  	local vehicle = getPedOccupiedVehicle ( find )
				if find == thePlayer then
					return
				end
				local seats = getVehicleMaxPassengers ( vehicle ) + 1
				local i = 0
				while ( i < seats ) do
					if ( not getVehicleOccupant ( vehicle, i ) ) then
   						setTimer ( warpPedIntoVehicle, 90, 1, thePlayer, vehicle, i )
						break
					end
					i = i + 1
				end
			end
		end
		else
			exports["notf"]:addNotification(thePlayer, "Synatx: /goto <id>")
		end	
	end
)
--============================================================================================================================
--==============================================================================================================================
addCommandHandler("back",
function (thePlayer, command)
if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 1 then
			return false
		end
		local canGoBack = getElementData(thePlayer, "canGoBack")
	if canGoBack == true then
		setElementData(thePlayer, "canGoBack", nil, false)
		setElementPosition(thePlayer, xx, yy, zz)
		setElementInterior(thePlayer, myint)
		setElementDimension(thePlayer, mydim)
		exports["notf"]:addNotification(thePlayer, "You returned to your previous location.", 'success')
	end
end)
--___________________________________________________________________________________________________________________--
addCommandHandler("sgoto",
	function ( thePlayer, command, player )
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 18 then
			
			return false
		end
		
		local find = miscSys:findPlayer ( player )
		if player then
		if find then
			if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < tonumber(getElementData(accSys:getPlayerAcc(find), "pAdmin")) then
				exports["notf"]:addNotification(thePlayer, "You are not allowed to teleport to a higher rank.", 'error')
				return false
			end
			local int =  getElementInterior(find)
			local dim = getElementDimension ( find )
			local x , y , z = getElementPosition(find)
			local r = getPedRotation ( find )
			x = x - math.sin ( math.rad ( r ) ) * 2
			y = y + math.cos ( math.rad ( r ) ) * 2
			if isPedInVehicle (thePlayer) then
			local theVehicle = getPedOccupiedVehicle ( thePlayer )

				
					--Hale Bug Job Ha--
					if getElementData(thePlayer, "onbusMarkAndBlip") == true then
						destroyElement(getElementData(thePlayer, "onbusMarkerMake"))
						destroyElement(getElementData(thePlayer, "onbusBlipMake"))
						setElementData(thePlayer,"busCheckPoint",0)
						setElementData(thePlayer, "onbusMarkAndBlip", false)
					end
					if getElementData(thePlayer, "onpilotMarkerAndBlip") == true then
						destroyElement(getElementData(thePlayer, "onpilotMarkerMake"))
						destroyElement(getElementData(thePlayer, "onpilotBlipMake"))
						setElementData(thePlayer,"pilotCheckPoint",0)
						setElementData(thePlayer, "onpilotMarkerAndBlip", false)
					end
					if getElementData(thePlayer, "onMarkAndBlip") == true then
						destroyElement(getElementData(thePlayer, "onMarkerMake"))
						destroyElement(getElementData(thePlayer, "onBlipMake"))
						setElementData(thePlayer,"sWCheckPoint",0)
						setElementData(thePlayer, "onMarkAndBlip", false)
					end
					if getElementData(thePlayer, "makedTrucker") == true then
						destroyElement(getElementData(thePlayer, "onMarkerTruckerMake"))
						destroyElement(getElementData(thePlayer, "onBlipTruckerMake"))
						setElementData(thePlayer,"truckerCheckPoint",0)
						setElementData(thePlayer, "makedTrucker", nil, false)
					end
				--removePedFromVehicle( thePlayer )
				--local x2,y2,z2 = getElementPosition(thePlayer)
				--setElementPosition ( thePlayer, x2,y2,z2+2 )
				setElementDimension(thePlayer,dim)
				setElementInterior(thePlayer,int)
				if ( getElementInterior(find) >= 1 ) then
					toggleControl ( thePlayer, "fire", true )
					toggleControl ( thePlayer, "aim_weapon", true )
					toggleControl ( thePlayer, "vehicle_fire", true )
					setPedDoingGangDriveby ( thePlayer, true )
				end
				setElementPosition ( thePlayer, x + 3, y, z )
				setElementPosition ( theVehicle, x + 3, y, z )
				outputChatBox("#9B00FF[Admin System]:#FFFFFFYou Have Been Silent Teleport To #9B00FF"..getPlayerName(find).."", thePlayer, 255, 255, 255,true)
				for k, chat_admini in ipairs (getElementsByType("player")) do
	        if getElementData(chat_admini, "loggedIn") == true then
	        if tonumber(getElementData(accSys:getPlayerAcc(chat_admini), "pAdmin")) > 3 then
	      --  outputChatBox("#06aaff( Admin-Warn ): #ffffffAdmin #aaaaaa"..getPlayerName(thePlayer).."#ffffff Be #aaaaaa"..getPlayerName(find).." #ff0000Silent Goto#ffffff Kard!", chat_admini, 208, 0, 15,true)
			end   
			end
		end
			else
				removePedFromVehicle( thePlayer )
				--local x2,y2,z2 = getElementPosition(thePlayer)
				--setElementPosition ( thePlayer, x2,y2,z2+2 )
				setElementDimension(thePlayer,dim)
				setElementInterior(thePlayer,int)
				if ( getElementInterior(find) >= 1 ) then
					toggleControl ( thePlayer, "fire", true )
					toggleControl ( thePlayer, "aim_weapon", true )
					toggleControl ( thePlayer, "vehicle_fire", true )
					setPedDoingGangDriveby ( thePlayer, true )
				end
				setElementPosition ( thePlayer, x + 3, y, z )
				outputChatBox("#A6A38DYou Have Been Silent Teleport To "..getPlayerName(find).."", thePlayer, 255, 255, 255,true)
				for k, chat_admini in ipairs (getElementsByType("player")) do
	        if getElementData(chat_admini, "loggedIn") == true then
	        if tonumber(getElementData(accSys:getPlayerAcc(chat_admini), "pAdmin")) > 3 then
	     --   outputChatBox("#ff0000(ADM-Warn): #ffffff Admin #fc9803"..getPlayerName(thePlayer).."#ffffff Be "..getPlayerName(find).." #00ff00Silent Goto#ffffff Kard!", chat_admini, 208, 0, 15,true)
			end
			end
		end
			end
			
		else
			exports["notf"]:addNotification(thePlayer, "Player Not Found", 'error')
		end
		if isPedInVehicle (find) then
      		if ( isPedInVehicle ( find ) ) then
      		  	local vehicle = getPedOccupiedVehicle ( find )
				if find == thePlayer then
					return
				end
				local seats = getVehicleMaxPassengers ( vehicle ) + 1
				local i = 0
				while ( i < seats ) do
					if ( not getVehicleOccupant ( vehicle, i ) ) then
   						setTimer ( warpPedIntoVehicle, 90, 1, thePlayer, vehicle, i )
						break
					end
					i = i + 1
				end
			end
		end
		else
			exports["notf"]:addNotification(thePlayer, "Syntax: /sgoto <id>", 'info')
		end	
	end
)
--___________________________________________________________________________________________________________________--
--___________________________________________________________________________________________________________________--
addCommandHandler("gethere",
	function ( thePlayer, command, player )
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 2 then
			return false
		end

		local find = miscSys:findPlayer ( player )
		if player then
		if find then
			if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < tonumber(getElementData(accSys:getPlayerAcc(find), "pAdmin")) then
				exports["notf"]:addNotification(thePlayer, "You cannot bring a higher rank admin to you.", 'error')
				return false
			end
			local RankTaraf = tonumber(getElementData(accSys:getPlayerAcc(find), "pAdmin"))
			local RankKhodesh = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin"))
			if (RankKhodesh) > (RankTaraf) then
				local dim = getElementDimension ( thePlayer )
				local int =  getElementInterior(thePlayer)
				local x , y , z = getElementPosition(thePlayer)
				local r = getPedRotation ( thePlayer )
				x = x - math.sin ( math.rad ( r ) ) * 2
				y = y + math.cos ( math.rad ( r ) ) * 2
				x2 , y2 , z2 = getElementPosition(find)
				int2 = getElementInterior(find)
				dim2 = getElementDimension(find)
				setElementData(find, "canGoBack", true, false)
				if isPedInVehicle (find) then
				local theVehicle = getPedOccupiedVehicle ( find )
					
					--Hale Bug Job Ha--
					if getElementData(find, "onbusMarkAndBlip") == true then
						destroyElement(getElementData(find, "onbusMarkerMake"))
						destroyElement(getElementData(find, "onbusBlipMake"))
						setElementData(find,"busCheckPoint",0)
						setElementData(find, "onbusMarkAndBlip", false)
					end
					if getElementData(find, "onpilotMarkerAndBlip") == true then
						destroyElement(getElementData(find, "onpilotMarkerMake"))
						destroyElement(getElementData(find, "onpilotBlipMake"))
						setElementData(find,"pilotCheckPoint",0)
						setElementData(find, "onpilotMarkerAndBlip", false)
					end
					if getElementData(find, "onMarkAndBlip") == true then
						destroyElement(getElementData(find, "onMarkerMake"))
						destroyElement(getElementData(find, "onBlipMake"))
						setElementData(find,"sWCheckPoint",0)
						setElementData(find, "onMarkAndBlip", false)
						respawnPlayerAfterDeath( thePlayer )
					end
					if getElementData(find, "makedTrucker") == true then
						destroyElement(getElementData(find, "onMarkerTruckerMake"))
						destroyElement(getElementData(find, "onBlipTruckerMake"))
						setElementData(find,"truckerCheckPoint",0)
						setElementData(find, "makedTrucker", nil, false)
					end
						
						
					--setElementDimension(theVehicle,dim)
					--setElementInterior(theVehicle,int)
					--setElementPosition ( theVehicle, x, y, z )
					for index, toMashine in ipairs( getElementsByType("player") ) do
						if isPedInVehicle (toMashine) then
							local yourVehicle = getPedOccupiedVehicle(toMashine)
							if yourVehicle == theVehicle then
								removePedFromVehicle( find )
								local x2,y2,z2 = getElementPosition(find)
								setElementPosition ( find, x2,y2,z2+2 )
								
							end
						end
					end
					setElementDimension(find,dim)
					setElementInterior(find,int)
					setElementPosition ( find, x , y, z )
					if ( getElementInterior(thePlayer) >= 1 ) then
						toggleControl ( find, "fire", true )
						toggleControl ( find, "aim_weapon", true )
						toggleControl ( find, "vehicle_fire", true )
						setPedDoingGangDriveby ( find, true )
					end
				else
					setElementDimension(find,dim)
					setElementInterior(find,int)
					setElementPosition ( find, x , y, z )
					if ( getElementInterior(thePlayer) >= 1 ) then
						toggleControl ( find, "fire", true )
						toggleControl ( find, "aim_weapon", true )
						toggleControl ( find, "vehicle_fire", true )
						setPedDoingGangDriveby ( find, true )
					end
				end
				outputChatBox("#9B00FF[Admin-System]: #ffffffShoma Player #9B00FF"..getPlayerName(find).." #ffffffRa Pish Khod Ovardid.", thePlayer, 208, 0, 15,true)		
				outputChatBox("#9B00FF[Admin-System]: #ffffffAdmin #9B00FF"..getPlayerName(thePlayer).." #ffffffShoma Ra Pish Khod Ovard.", find, 208, 0, 15,true)	
				for k, chat_admini in ipairs (getElementsByType("player")) do
	        if getElementData(chat_admini, "loggedIn") == true then
	        if tonumber(getElementData(accSys:getPlayerAcc(chat_admini), "pAdmin")) > 4 then
	      --  outputChatBox("#ff0000(ADM-Warn): #ffffff "..getPlayerName(find).." Tavasot #fc9803"..getPlayerName(thePlayer).."#ffffff Gethere Shod!", chat_admini, 208, 0, 15,true)
			end
			end
		end
			--else
				--outputChatBox("#EE0A0AShoma Ejaze Gethere Kardane Rank Bala Tar Az Khod Ra Nadarid !", thePlayer, 255, 255, 255, true)
			end
		else
			exports["notf"]:addNotification(thePlayer, "Player Not Found", 'error')
		end
		else
			exports["notf"]:addNotification(thePlayer, "Syntax: /gethere <id>", 'info')
		end	
	end
)

--==============================================================================================================================================
--[[addCommandHandler("sendback",
function (thePlayer, command, player )
if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 9 then
			
			return false
		end
		local find = miscSys:findPlayer ( player )
		if player then
		if find then
		local canGoBack = getElementData(find, "canGoBack")
	if canGoBack == true then
		setElementData(find, "canGoBack", nil, false)
		setElementPosition(find, x2, y2, z2)
		setElementInterior(find, int2)
		setElementDimension(find, dim2)
		outputChatBox("#00ff00Shoma Tavasot Admin "..getPlayerName(thePlayer).." Be Makan Ghabli Khod Teleport Shodid !", find, 255, 255, 255, true)
		else
			outputChatBox("#EE0A0AIn Player Gethere Nashode !", thePlayer, 255, 255, 255, true)
		end
		end
	end
end)]]
--___________________________________________________________________________________________________________________--
--___________________________________________________________________________________________________________________--
addCommandHandler("getcarhere",
	function ( thePlayer, command, ...)
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 1 then
			
			return false
		end
			if (...) then
				local plate = string.sub( table.concat({...}, " "), 1, 90 )
				if ( string.find( string.sub ( plate, 1, 1 ), " " ) ) then 
					return
				end
				for _,cars in ipairs (getElementsByType("vehicle")) do
					if cars then
						if getVehiclePlateText ( cars ) == plate then
							local x , y , z = getElementPosition(thePlayer)
							setElementPosition ( cars, x, tonumber(y)+2, z )
							outputChatBox("#bababa(Vehicle): #ffffffShoma Khodro Ba Pelak'e #2DBDEC"..plate.." #ffffffRa Teleport Kardid !", thePlayer, 255, 255, 255, true)
						end
					end
				end
			else
				exports["notf"]:addNotification(thePlayer, "Syntax: /getcarhere <plate>", 'info')
			end
end
)
--___________________________________________________________________________________________________________________--
--___________________________________________________________________________________________________________________--
addCommandHandler("gm",
function ( thePlayer, command )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 8 then

		return false
	end
	if getElementData(thePlayer,"godmode") == true then
		outputChatBox("#ff0000Halat GodMode Off Shod!", thePlayer, 255, 255, 255, true)
		setElementData(thePlayer,"godmode",nil)
	else
		outputChatBox("#00ff00Halat GodMode On Shod!", thePlayer, 255, 255, 255, true)
		setElementData(thePlayer,"godmode",true)
	end
end)
--___________________________________________________________________________________________________________________--
--___________________________________________________________________________________________________________________--
addCommandHandler("vgm",
function ( thePlayer, command )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 8 then
		
		return false
	end
	if isPedInVehicle(thePlayer) then
	local vehesh = getPedOccupiedVehicle(thePlayer)
		if isVehicleDamageProof(vehesh) then
			exports["notf"]:addNotification(thePlayer, "The car's God Mode has been disabled.", 'error')
			setVehicleDamageProof(vehesh, false)
		else
			exports["notf"]:addNotification(thePlayer, "The car's God Mode has been activated.", 'success')
			setVehicleDamageProof(vehesh, true)
		end
		else
			exports["notf"]:addNotification(thePlayer, "You must be in a car", 'error')
		end
end)
--___________________________________________________________________________________________________________________--
--___________________________________________________________________________________________________________________--
function isVehicleEmpty( vehicle )
	if not isElement( vehicle ) or getElementType( vehicle ) ~= "vehicle" then
		return true
	end
	local passengers = getVehicleMaxPassengers( vehicle )
	if type( passengers ) == 'number' then
		for seat = 0, passengers do
			if getVehicleOccupant( vehicle, seat ) then
				return false
			end
		end
	end
	return true
end
--___________________________________________________________________________________________________________________--
--___________________________________________________________________________________________________________________--
addCommandHandler("svrv",
function ( thePlayer, command )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 17 then
		
		return false
	end
	for index,vehs in ipairs (getElementsByType("vehicle")) do
		if vehs then
			if not isVehicleLocked ( vehs ) then  
				if isVehicleEmpty(vehs) then
					respawnVehicle(vehs)
					setVehicleEngineState(vehs, false)
				end
			end
			setElementData(vehs,"fuel",130)
		end
	end
	exports["notf"]:addNotification(thePlayer, "All server machines became RVs.", 'success')
	for _, player in pairs( getElementsByType 'player' ) do
			if tonumber(getElementData(accSys:getPlayerAcc(player), "pAdmin")) > 1 then
				outputChatBox("#9B00FF[ADM-Warn]: #ffffff Admin #9B00FF"..getPlayerName(thePlayer).."#ffffff Tamami Mashin Haye Server Ro #00FFFFRespawn #ffffffKard!", player, 255, 255, 255, true )
			end
		end
end
)
--___________________________________________________________________________________________________________________--
--___________________________________________________________________________________________________________________--
--___________________________________________________________________________________________________________________-
--___________________________________________________________________________________________________________________--____________________________________________________________________________________________________--
--___________________________________________________________________________________________________________________--
--___________________________________________________________________________________________________________________--
--[[addCommandHandler("setseriallock",
function(thePlayer, cmd, preffe)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) ~= 30 then
		return false
	end
	if (preffe) then
		local reffeyarukemikhaddemoteshe = tonumber(preffe)
		local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM users;" )
		local result, numrows = dbPoll(query, dbpTime)
		if (result and numrows > 0) then
			for index, row in pairs(result) do
				local IDeYaru = row['pID']
				if tonumber(IDeYaru) == tonumber(reffeyarukemikhaddemoteshe) then
					local name = row['pName']
					local vaziat = row['pSecoundSerial']
					if tonumber(vaziat) == 1 then
						exports["notf"]:addNotification(thePlayer, "Shoma Ba Movafaghiat Serial Lock Player "..name.." Ra Faal Kardid Kardid!" , 'success')
						local sefr = 0
						local query = dbQuery(exports.mysql:getMySQLC(), "UPDATE `users` SET `pSecoundSerial` = '"..tonumber(sefr).."' WHERE `pID` = '"..tonumber(preffe).."'")
						dbFree(query)
					elseif tonumber(vaziat) ~= 1 then
						exports["notf"]:addNotification(thePlayer, "Shoma Ba Movafaghiat Serial Lock Player "..name.." Ra Gheyr Faal Kardid Kardid!" , 'success')
						local sefr = 1
						local query = dbQuery(exports.mysql:getMySQLC(), "UPDATE `users` SET `pSecoundSerial` = '"..tonumber(sefr).."' WHERE `pID` = '"..tonumber(preffe).."'")
						dbFree(query)
					end
				end
			end
			dbFree(query)
		end
	else
		outputChatBox("#bababaBezan: /setseriallock <Referral-ID>", thePlayer, 255, 0, 0, true)
	end
end)]]

--====================================================================================================================================
addCommandHandler("setsex",
function(thePlayer, cmd, preffe,sexesh)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 27 then
		return false
	end
	if (preffe) then
		local reffeyarukemikhaddemoteshe = tonumber(preffe)
		local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM users;" )
		local result, numrows = dbPoll(query, dbpTime)
		if (result and numrows > 0) then
		if (sexesh) then
			for index, row in pairs(result) do
				local IDeYaru = row['pID']
				if tonumber(IDeYaru) == tonumber(reffeyarukemikhaddemoteshe) then
					local name = row['pName']
					local vaziat = row['pSex']
						exports["notf"]:addNotification(thePlayer, "Shoma Ba Movafaghiat Sex Player "..name.." Ra Be "..tonumber(sexesh).." Set Kardid!" , 'success')
						local query = dbQuery(exports.mysql:getMySQLC(), "UPDATE `users` SET `pSex` = '"..tonumber(sexesh).."' WHERE `pID` = '"..tonumber(preffe).."'")
						dbFree(query)
					end
				end
			end
			dbFree(query)
		end
	else
		exports["notf"]:addNotification(thePlayer, "Syntax /setsex <Refferal>", 'info')
	end
end)





--[[addCommandHandler("jailplayer",
function(thePlayer, cmd, preffe, sec, ...)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 8 then
		return false
	end
	if (preffe) then
	if (sec) then
			local reffeyarukemikhaddemoteshe = tonumber(preffe)
			local jash = 4
			local jailt = tonumber(sec)
			local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM users;" )
		    local result, numrows = dbPoll(query, dbpTime)
			if (result and numrows > 0) then
			for index, row in pairs(result) do
			local reason = table.concat( {...} , " ")
			local name = row['pName']
			local IDeYaru = row['pID']
			if jailt >= 1 and jailt < 15000 then
				if ... then
							
							if tonumber(IDeYaru) == tonumber(reffeyarukemikhaddemoteshe) then
							for i,m in ipairs ( getElementsByType("player") ) do
								outputChatBox("#EA0E0E[Tavajoh] : Player "..name.." Tavasote Admin "..getPlayerName(thePlayer).." Baraye "..jailt.." Daghighe Offline Jail Shod, Dalil: "..reason, m, 255, 255, 255, true)
							end
								local query = dbQuery(exports.mysql:getMySQLC(), "UPDATE `users` SET `pJailTime` = '"..tonumber(sec*60).."' WHERE `pID` = '"..tonumber(preffe).."'")
						        dbFree(query)
								local query = dbQuery(exports.mysql:getMySQLC(), "UPDATE `users` SET `pAJailed` = '"..jash.."' WHERE `pID` = '"..tonumber(preffe).."'")
						        dbFree(query)
							end
						end
						dbFree(query)
					end
	
				end
			end
		end
	else
		outputChatBox("#bababaBezan: /jailplayer <Referral-ID> <Min> <Reason>", thePlayer, 255, 0, 0, true)
	end
end)]]
--___________________________________________________________________________________________________________________--
--___________________________________________________________________________________________________________________--
--[[dbpTime = 500
addCommandHandler("etp",
function(thePlayer, cmd, username)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 12 then

		return false
	end
	if (username) then
		local user = username
			local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM users;" )
			local result, numrows = dbPoll(query, dbpTime)
			if (result and numrows > 0) then
				for index, row in pairs(result) do
					local pname = row['pName']
					if pname == user then
						local oname = row['pOldName']
						local pRamz = row['pKey']
						local Serial = row['pSerial']
						local Lvl = row['pLevel']
						local Admine = row['pAdmin']
						local PremG = row['pGoldPremium']
						local TimePlay = row['pPlayTime']
						local Registers = row['pRegistredDate']
						local LastLogins = row['pLastLogin']
						local Sexs = row['pSex']
						local RealName = row['pReal']
						local Senesh = row['pAge']
						local Mutesh = row['pMuteTime']
						local Poolesh = row['pCash']
						local Seriallock = row['pSecoundSerial']
						local Colorname = row['pColorName']
						local jailesh = row['pJailTime']
						local Matesh = row['pMats']
						local memeberesh = row['pMember']
						local Fpesh = row['pPunish']
						local Warnesh = row['pFwarn']
						local Rankesh = row['pRank']
						local Joinesh = row['pJoinFaction']
						local Skinesh = row['cSkin']
						local Shomaresh = row['pPnumber']
						local Robpoint = row['pRob']
						local Wantedesh = row['pWanted']
						local Gmail = row['pEmail']
						local Ipish = row['pIp']
						local DalilBan = row['pBanReason']
						local kasiKeKarde = row['pBannedBy']
						local TimeBanesh = row['pBanTime']
						local Reffesh = row['pID']
						local Refkie = row['pReferral']
						local Heleprsh = row['pHelper']
						local Goldesh = row['pGold']
						local Slotesh = row['pSlot']
						local Recoilesh = row['pRecoil']
						local Bankesh = row['pBank']
						local PassBankesh = row['pBankPass']
						local Housesh = row['pHouseID']
						local Ahangesh = row['pRingtone']
						local Smsesh = row['pSmsmtone']
						local Sharzhesh = row['pCredit']


						if Heleprsh == 0 then
				        Heleprshs = "Not Helpers"
						elseif Heleprsh == 1 then
				        Heleprshs = "Beta Helper"
						elseif Heleprsh == 2 then
				        Heleprshs = "Helepr"
						elseif Heleprsh == 3 then
				        Heleprshs = "HeadHelper"
			            end


			if tonumber(memeberesh) == 0 then
				factionLeader = "Civilian"
			elseif tonumber(memeberesh) == 1 then
				factionLeader = "Edare Police"
			elseif tonumber(memeberesh) == 2 then
				factionLeader = "Police Federal"
			elseif tonumber(memeberesh) == 3 then
				factionLeader = "National Guard"
			elseif tonumber(memeberesh) == 4 then
				factionLeader = "Medic"
			elseif tonumber(memeberesh) == 5 then
				factionLeader = "Hitman Agency"
			elseif tonumber(memeberesh) == 6 then
				factionLeader = "Edare Amoozesh Va Morabigari"
			elseif tonumber(memeberesh) == 7 then
				factionLeader = "News Reporter"
			elseif tonumber(memeberesh) == 8 then
				factionLeader = "Shahrdar"
			elseif tonumber(memeberesh) == 9 then
				factionLeader = "Mechanic"
			elseif tonumber(memeberesh) == 10 then
				factionLeader = "Albania Family"
			elseif tonumber(memeberesh) == 11 then
				factionLeader = "Avengers Family"
			elseif tonumber(memeberesh) == 12 then
				factionLeader = "Bloods Family"
			elseif tonumber(memeberesh) == 13 then
				factionLeader = "iNFiNiTy Family"
			elseif tonumber(memeberesh) == 14 then
				factionLeader = "Virus Family"
			elseif tonumber(memeberesh) == 15 then
				factionLeader = "Yakuza Family"
			end
			if tonumber(Rankesh) == 0 then
				rank = "Not Faction"
			elseif tonumber(Rankesh) == 1 then
				rank = "(Rank 1)"
			elseif tonumber(Rankesh) == 2 then
				rank = "(Rank 2)"
			elseif tonumber(Rankesh) == 3 then
				rank = "(Rank 3)"
			elseif tonumber(Rankesh) == 4 then
				rank = "(Rank 4)"
			elseif tonumber(Rankesh) == 5 then
				rank = "(Rank 5)"
			elseif tonumber(Rankesh) == 6 then
				rank = "(Sub-Leader)"
			elseif tonumber(Rankesh) == 7 then
				rank = "(Leader)"
			end
						
						
						if Sexs == 1 then
				        Sexss = "Mard"
						elseif Sexs == 2 then
				        Sexss = "Zan"
			            end
					
						
						if tonumber(Seriallock) ~= 1 then  vaziat = "Faal" else vaziat = "Gheyre Faal" end 
						
						if Admine == 0 then
				        Admines = "Not Admins"
						elseif Admine == 1 then
						Admines = "Hoster"
						elseif Admine == 2 then
						Admines = "VIP"
						elseif Admine == 3 then
						Admines = "Mapper"
						elseif Admine == 4 then
						Admines = "Designer"
						elseif Admine == 5 then
						Admines = "Modeler"
						elseif Admine == 6 then
						Admines = "Content Creator"
						elseif Admine == 7 then
						Admines = "Streamer"
						elseif Admine == 8 then
						Admines = " Trial"
						elseif Admine == 9 then
						Admines = "Operator"
						elseif Admine == 10 then
						Admines = "Moderator"
						elseif Admine == 11 then
						Admines = "Bronze"
						elseif Admine == 12 then
						Admines = "Silver"
						elseif Admine == 13 then
						Admines = "Gold"
						elseif Admine == 14 then
						Admines = "Platinum"
						elseif Admine == 15 then
						Admines = "Senior"
						elseif Admine == 16 then
						Admines = "Assistant"
						elseif Admine == 17 then
						Admines = "Head Admin"
						elseif Admine == 18 then
						Admines = "Mafia Manager"
						elseif Admine == 19 then
						Admines = "Social Admin"
						elseif Admine == 20 then
						Admines = "Content Manager"
						elseif Admine == 21 then
						Admines = "Faction Manager"
						elseif Admine == 22 then
						Admines = "Helper Manager"
						elseif Admine == 23 then
						Admines = "Executive"
						elseif Admine == 24 then
						Admines = "SuperVisur"
						elseif Admine ==  25 then
						Admines = "Staff Boos"
						elseif Admine == 26 then
						Admines = "Manager"
						elseif Admine == 27 then
						Admines = "Administrator"
						elseif Admine == 28 then
						Admines = " Owner"
						elseif Admine == 29 then
						Admines = "Founder"
						elseif Admine == 30 then
						Admines = "Scripter"
						end
						
			            end

			            outputChatBox("#bababaTamamie Etela'ate player "..user.." Baraye Shoma Namayesh Dade Shod!", thePlayer, 255, 255, 255, true)
                        triggerClientEvent("CheckPanelStats",thePlayer,thePlayer,user,oname,pRamz,Serial,Lvl,Admines,PremG,TimePlay,Registers,LastLogins,RealName,Sexss,Senesh,Poolesh,Mutesh,Colorname,jailesh,vaziat,Matesh,factionLeader,Fpesh,Warnesh,rank,Joinesh,Skinesh,Shomaresh,Robpoint,Wantedesh,Gmail,Ipish,DalilBan,kasiKeKarde,TimeBanesh,Reffesh,Refkie,Heleprshs,Goldesh,Slotesh,Recoilesh,Bankesh,PassBankesh,Housesh,Ahangesh,Smsesh,Sharzhesh)

					end
				end
				dbFree(query)
			end
	--else
		--outputChatBox("#bababaBezan: /etp <Username/Referral-ID>", thePlayer, 255, 0, 0, true) 	
	--end
end)]]

--[[addCommandHandler("puser",
function(thePlayer, cmd, username)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 8 then
		
		return false
	end
	if (username) then
		local user = username
			local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM users;" )
			local result, numrows = dbPoll(query, dbpTime)
			if (result and numrows > 0) then
				for index, row in pairs(result) do
					local pname = row['pName']
					if pname == user then
						local lvl = row['pLevel']
						local pReff = row['pID']
						local OldName = row['pOldName']
						if tonumber(serallock) ~= 1 then  vaziat = "Faal" else vaziat = "Gheyre Faal" end 
						if tonumber(Sexs) ~= 1 then  vaziat2 = "Zan" else vaziat2 = "Mard" end 
						outputChatBox("#bababa* Name: #6495ED"..pname.." #bababaRefferal: #6495ED"..pReff.." #bababaLevel: #6495ED"..lvl.." #bababa*", thePlayer, 255, 255, 255, true)
					end
				end
				dbFree(query)
			end
	else
		outputChatBox("#bababaBezan: /puser <Username>", thePlayer, 255, 0, 0, true)	
	end
end)]]
--___________________________________________________________________________________________________________________--_________________________________________________________________________________________________________--
--___________________________________________________________________________________________________________________--
addCommandHandler("banlist",
function(thePlayer, cmd)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 27 then
		
		return false
	end
local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM users;" )
local result, numrows = dbPoll(query, dbpTime)
outputChatBox ( "#d5e3e3▬▬▬▬▬▬▬▬(#2DBDEC Ban List #d5e3e3)▬▬▬▬▬▬▬▬", thePlayer, 230,0,0 ,true)
	if (result and numrows > 0) then
		setElementData(thePlayer,"bannumber",1)
		for index, row in pairs(result) do
			local BanTime = row['pBanTime']
			if BanTime >= 1 then
				local name = row['pName']
				local pID = row['pID']
				local Tavasote = row['pBannedBy']
				local Dalil = row['pBanReason']
				outputChatBox("#2DBDEC["..getElementData(thePlayer,"bannumber").."]: #FAF492 Name : #2DBDEC"..name.." #d5e3e3| #FAF492Referral : #2DBDEC"..pID.." #d5e3e3| #FAF492Ban Time : #2DBDEC"..BanTime.." Saat #d5e3e3| #FAF492Banned By : #2DBDEC"..Tavasote.." #d5e3e3| #FAF492Ban Reason : #2DBDEC"..Dalil.." #d5e3e3|", thePlayer, 255, 255, 255, true)
				local chanta = getElementData(thePlayer,"bannumber")
				local chantabadi = tonumber(chanta) + 1
				setElementData(thePlayer,"bannumber",chantabadi)
				outputChatBox ( "#d5e3e3▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬", thePlayer, 230,0,0 ,true)
			end
		end
		setElementData(thePlayer,"bannumber",nil)
		dbFree(query)
	end
	
end
)
--___________________________________________________________________________________________________________________--
--___________________________________________________________________________________________________________________--
--___________________________________________________________________________________________________________________--
addCommandHandler("getcarpos",
function ( thePlayer, command)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 18 then
		
		return false
	end
	if isPedInVehicle(thePlayer) then
	local veh = getPedOccupiedVehicle (thePlayer)
	local x,y,z = getElementPosition( veh )
	local rotx,roty,rotz = getElementRotation ( veh )
	outputChatBox("#ffffffMokhtasat Car : #2DBDEC("..x.." ,"..y .." ,"..z..")", thePlayer, 150, 150 , 150,true)
	outputChatBox("#ffffffRotation Car : #2DBDEC("..rotx.." ,"..roty.." ,"..rotz..")", thePlayer, 150, 150 , 150,true)
	else
		outputChatBox("#EE0A0ABayad Dar Mashin Bashid !", thePlayer, 255, 255, 255, true)
	end
end)
--___________________________________________________________________________________________________________________--
--___________________________________________________________________________________________________________________--

addCommandHandler("afill",
function ( thePlayer, command)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 1 then
		
		return
	end
	if isPedInVehicle (thePlayer) then
		local veh = getPedOccupiedVehicle (thePlayer)
		local benzin = 100
		setElementData(veh,"fuel",benzin)
		outputChatBox("#bababa(Fill): #ffffffMakhzan Benzin #00ff00Por#ffffff Shod!", thePlayer, 0, 255, 0,true)
	else
		exports["notf"]:addNotification(thePlayer, "You must be in a car to do this.", 'error')
	end
end)
--___________________________________________________________________________________________________________________--
--___________________________________________________________________________________________________________________--

addCommandHandler("gunrv",
function (thePlayer)
	if getElementData(thePlayer, "loggedIn") == true then
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 2 then
		
		return false
	end
        triggerClientEvent(thePlayer,"gunrv:enableOrDisable",resourceRoot)
end
end
)
--___________________________________________________________________________________________________________________--
--___________________________________________________________________________________________________________________--
addEvent("gunrv:respawnVehicle",true)
addEventHandler("gunrv:respawnVehicle",root,
function (car)
    if isElement(car) and getElementType(car) == "vehicle" then
	    respawnVehicle(car)
	end
end
)
--___________________________________________________________________________________________________________________--
--___________________________________________________________________________________________________________________--
addCommandHandler("gg",
	function ( thePlayer, command, player, weapon, tir )
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 2 then
			
			return false
		end

		local find = miscSys:findPlayer ( player )
		local tir = tonumber(tir)
		local weapon = tonumber(weapon)
		local esmGun = getWeaponNameFromID(weapon)
		if player then
		if find then
		if weapon then
		if tir then
				local targetPlayer = getPlayerName ( find )
				giveWeapon(find, weapon, tir)
				outputChatBox("#9B00FF[Admin-System]: #ffffffShoma Be Player #9B00FF"..targetPlayer.."#ffffff Gun #ff0000"..esmGun.. " #ffffffBa #FFAE00("..tir..") #ffffffTir Dadid !", thePlayer, 0, 255, 0,true)
				outputChatBox("#9B00FF[Admin-System]: #ffffffAdmin #9B00FF"..getPlayerName(thePlayer).." #ffffffBe Shoma #ff0000"..esmGun.." #ffffffBa #FFAE00("..tir..") #ffffffTir #ffffffDad.", find, 0, 255, 0,true)
				for k, chat_admini in ipairs (getElementsByType("player")) do
	        if getElementData(chat_admini, "loggedIn") == true then
	        if tonumber(getElementData(accSys:getPlayerAcc(chat_admini), "pAdmin")) >= 5 then
	          outputChatBox("#FF0000[ADM-Warn]: #ffffff Admin #fc9803"..getPlayerName(thePlayer).."#ffffff Be "..targetPlayer.." #8FBC8F"..esmGun.." ("..tir..") #ffffffDad", chat_admini, 208, 0, 15,true)
			end
			end
			end
			else
				exports["notf"]:addNotification(thePlayer, "Enter the number of bullets in your gun.", 'error')
			end
			else
				exports["notf"]:addNotification(thePlayer, "Enter the ID of the desired weapon.", 'error')
			end
			else
				exports["notf"]:addNotification(thePlayer, "Player Not Found!", 'error')
			end
			else
				exports["notf"]:addNotification(thePlayer, "Syntax: /gg <PartOfName/ID> <Gun-ID> <Ammo>", 'info')
			end
end
)
--___________________________________________________________________________________________________________________--
--___________________________________________________________________________________________________________________--
addCommandHandler("slapp",
	function ( thePlayer, command, player )
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 2 then
			
			return false
		end
		local find = miscSys:findPlayer ( player )
		if player then
		if find then
		local x,y,z = getElementPosition(find)
			if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < tonumber(getElementData(accSys:getPlayerAcc(find), "pAdmin")) then
				return false
			end
			removePedFromVehicle( find )
			setElementPosition ( find, x,y,z+5 )
			outputChatBox("#9B00FF[Admin-System]: #ffffffShoma #9B00FF"..getPlayerName(find).." #ffffffRa Slap Dadid!", thePlayer ,255, 255, 255, true)
			outputChatBox("#9B00FF[Admin-System]: #ffffffAdmin #9B00FF"..getPlayerName(thePlayer).." #ffffffShoma Ra Slap Kard.", find, 255, 255, 255, true)
			for k, chat_admini in ipairs (getElementsByType("player")) do
	        if getElementData(chat_admini, "loggedIn") == true then
	        if tonumber(getElementData(accSys:getPlayerAcc(chat_admini), "pAdmin")) >= 1 then
	        	outputChatBox("#ff0000(ADM-Warn): #ffffffAdmin #fc9803"..getPlayerName(thePlayer).."#ffffff "..getPlayerName(find).." Ra #00ff00Slap#ffffff Dad!", chat_admini, 208, 0, 15,true)
			end
			end
			end
			
		else
			
		end
		else
			exports["notf"]:addNotification(thePlayer, "Syntax: /slapp <id>", 'info')
		end	
	end
)
--___________________________________________________________________________________________________________________--
addCommandHandler("freezep",
	function ( thePlayer, command, player )
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 2 then
			
			return false
		end
		local find = miscSys:findPlayer ( player )
		if player then
		if find then
		local x,y,z = getElementPosition(find)
			if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < tonumber(getElementData(accSys:getPlayerAcc(find), "pAdmin")) then
				return false
			end
			removePedFromVehicle( find )
			setElementFrozen(find, true)
			outputChatBox("#9B00FF[Admin-System]: #ffffffShoma #9B00FF"..getPlayerName(find).." #ffffffRa #ff0000Freeze #ffffffKardid!", thePlayer ,255, 255, 255, true)
			outputChatBox("#9B00FF[Admin-System]: #ffffffAdmin #9B00FF"..getPlayerName(thePlayer).." #ffffffShoma Ra #ff0000Freeze #ffffffKard.", find, 255, 255, 255, true)
			for k, chat_admini in ipairs (getElementsByType("player")) do
	        if getElementData(chat_admini, "loggedIn") == true then
	        if tonumber(getElementData(accSys:getPlayerAcc(chat_admini), "pAdmin")) >= 13 then
	     	   outputChatBox("#ff0000(ADM-Warn): #ffffff Admin #fc9803"..getPlayerName(thePlayer).."#9B00FF "..getPlayerName(find).." Ra #00ff00Freeze#ffffff Kard!", chat_admini, 208, 0, 15,true)
			end
			end
			end

			
		else
			exports["notf"]:addNotification(thePlayer, "Player Not Found!", 'error')
		end
		else
			exports["notf"]:addNotification(thePlayer, "Syntax: /freezep <PartOfName/ID>", 'info')
		end	
	end
)

addCommandHandler("unfreezep",
	function ( thePlayer, command, player )
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 2 then
			
			return false
		end
		local find = miscSys:findPlayer ( player )
		if player then
		if find then
		local x,y,z = getElementPosition(find)
			if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < tonumber(getElementData(accSys:getPlayerAcc(find), "pAdmin")) then
				return false
			end
			removePedFromVehicle( find )
			setElementFrozen(find, false)
			outputChatBox("#9b00ff[Admin-System]: #ffffffShoma #9B00FF"..getPlayerName(find).." #ffffffRa #00ff00unFreeze #ffffffKardid!", thePlayer ,255, 255, 255, true)
			outputChatBox("#9b00ff[Admin-System]: #ffffffAdmin #9B00FF"..getPlayerName(thePlayer).." #ffffffShoma Ra #00ff00UnFreeze #ffffffKard.", find, 255, 255, 255, true)
			for k, chat_admini in ipairs (getElementsByType("player")) do
	        if getElementData(chat_admini, "loggedIn") == true then
	        if tonumber(getElementData(accSys:getPlayerAcc(chat_admini), "pAdmin")) >= 13 then
	     	   outputChatBox("#ff0000(ADM-Warn): #ffffff Admin #fc9803"..getPlayerName(thePlayer).."#ffffff "..getPlayerName(find).." Ra #00ff00unFreeze#ffffff Kard!", chat_admini, 208, 0, 15,true)
			end
			end
			end

			
		else
			outputChatBox("#EE0A0AChenin Playeri Dakhel Server Nmibashad !", thePlayer, 255, 255, 255, true)
		end
		else
			outputChatBox("#bababaBezan: /unfreezep <PartOfName/ID>", thePlayer, 255, 0, 0, true)
		end	
	end
)
--___________________________________________________________________________________________________________________--
addCommandHandler("takegun",
	function ( thePlayer, command, player )
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 1 then
			
			return false
		end

		local find = miscSys:findPlayer ( player )
		if player then
		if find then
			takeAllWeapons (find)
			outputChatBox("#bababa(Take-Gun): #ffffffShoma Aslahe Haye #2DBDEC"..getPlayerName(find).." #ffffffRa Take Kardid !", thePlayer ,255, 255, 255, true)
			outputChatBox("#ffb6c1[Admin-System]: #ffffffAdmin #c0c0c0"..getPlayerName(thePlayer).." #ffffffTamami Aslahe Haye Shoma Ra Take Kard.", find, 255, 255, 255, true)
			
		else
			outputChatBox("#EE0A0AChenin Playeri Dakhel Server Nmibashad !", thePlayer, 255, 255, 255, true)
		end
		else
			outputChatBox("#bababaBezan : /takegun <PartOfName/ID>", thePlayer, 255, 0, 0, true)
		end	
	end
)
--___________________________________________________________________________________________________________________--
--___________________________________________________________________________________________________________________--
addCommandHandler("sethp",
	function ( thePlayer, command, player, hp )
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 1 then
			return false
		end

		local find = miscSys:findPlayer ( player )
		if player then
		if find then
		if hp then
			if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < tonumber(getElementData(accSys:getPlayerAcc(find), "pAdmin")) then
				exports["notf"]:addNotification(thePlayer, "Az Jonet Sir Shodie?", 'error')
				return false
			end
				hp = tonumber( hp )
				local targetPlayer = getPlayerName ( find )
				setElementHealth( find, hp )
				outputChatBox("#ffb6c1[Admin-System]: #ffffffShoma Health #c0c0c0"..targetPlayer.." #ffffffRa Be #fff000"..hp.." #ffffffSet Kardid!", thePlayer, 0, 255, 0,true)
				outputChatBox("#ffb6c1[Admin-System]: #ffffffAdmin #c0c0c0"..getPlayerName(thePlayer).." #ffffffHP Shoma Ra Be #fff000"..hp.." #ffffffSet Kard.", find, 0, 255, 0,true)
				for k, chat_admini in ipairs (getElementsByType("player")) do
	        if getElementData(chat_admini, "loggedIn") == true then
	        if tonumber(getElementData(accSys:getPlayerAcc(chat_admini), "pAdmin")) >= 7 then
	      --  outputChatBox("#ff0000(ADM-Warn): #ffffff Admin #fc9803"..getPlayerName(thePlayer).."#ffffff Health "..targetPlayer.." Ra Be #00ff00"..hp.." #ffffffSet Kard!", chat_admini, 208, 0, 15,true)
			end
			end
			end
			else
				outputChatBox("#EE0A0AMeghdar Health Ra Vared Konid !", thePlayer, 255, 0, 0, true)
			end
			else
				outputChatBox("#EE0A0AChenin Playeri Dakhel Server Nmibashad !", thePlayer, 255, 255, 255, true)
			end
			else
				outputChatBox("#bababaBezan : /sethp <PartOfName/ID> <Value>", thePlayer, 255, 0, 0, true)
			end
		end		

)

addCommandHandler("jp",
	function ( thePlayer, command, player )
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 1 then
			
			return false
		end
		local find = miscSys:findPlayer ( player )
		local targetPlayer = getPlayerName ( find )
		if player then
		if find then
		if ( isPedWearingJetpack(find) ) then
				removePedJetPack(find)
				return
			end
				givePedJetPack(find)
				for k, chat_admini in ipairs (getElementsByType("player")) do
	        if getElementData(chat_admini, "loggedIn") == true then
	        if tonumber(getElementData(accSys:getPlayerAcc(chat_admini), "pAdmin")) >= 1 then
	        outputChatBox("#06aaff( Admin-Warn ): #ffffffAdmin #aaaaaa"..getPlayerName(thePlayer).."#ffffff Be #aaaaaa'"..targetPlayer.."' #ff0000JetPack #ffffffDad!", chat_admini, 208, 0, 15,true)
			outputChatBox("#ffb6c1[Admin-System]: #ffffffAdmin #c0c0c0"..getPlayerName(thePlayer).." #ffffffBe Shoma JetPack Dad.", find, 255, 255, 255,true)
			end  
			end
			end
			else
				outputChatBox("#EE0A0AChenin Playeri Dakhel Server Nmibashad !", thePlayer, 255, 255, 255, true)
			end
			else
				outputChatBox("#bababaBezan : /jp <PartOfName/ID>", thePlayer, 255, 0, 0, true)
			end
		end		
)


addCommandHandler("j",
	function ( thePlayer, command )
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 1 then
			
			return false
		end
		if ( isPedWearingJetpack(thePlayer) ) then
				removePedJetPack(thePlayer)
				return
			end
				givePedJetPack(thePlayer)
			end	
)


addCommandHandler("cfly",
function ( thePlayer, command )
	if getElementData(thePlayer, "loggedIn") == true then
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 26 then
			return
		end
		triggerClientEvent( "CFly", thePlayer, thePlayer )
	else
		outputChatBox("#ff0000[Error]: #ffffffEbteda Login Konid!", thePlayer, 212, 156, 49,true)
	end
end)



addCommandHandler("vcolor",
	function ( thePlayer, command )
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 1 then
	    return false
		end
		local uVehicle = getPedOccupiedVehicle( thePlayer )
		if uVehicle then
		local r, g, b = math.random( 255 ), math.random( 255 ), math.random( 255 )
		setVehicleColor( uVehicle, r, g, b )
end
end
)
--___________________________________________________________________________________________________________________--

function listPos(thePlayer)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 1 then
		
		return false
	end
	outputChatBox("#00ff00(#bababa Teleport List #00ff00)", thePlayer, 208, 0, 15,true)	
	outputChatBox("#00ff00[ #bababa/gotols #00ff00| #bababa/gotolv #00ff00| #bababa/gotosf #00ff00]", thePlayer, 208, 0, 15,true)
    outputChatBox("#00ff00[ #bababa/gotoparkour #00ff00| #bababa/gotolcs #00ff00| #bababa/gotobase #00ff00]", thePlayer, 208, 0, 15,true)	
    outputChatBox("#00ff00[ #bababa/goto4rah #00ff00| #bababa/goto4rahlv #00ff00| #bababa/gotokohsf #00ff00]", thePlayer, 208, 0, 15,true)	
    outputChatBox("#00ff00[ #bababa/gotoad #00ff00| #bababa/gotocjail #00ff00| #bababa/gotofbi #00ff00]", thePlayer, 208, 0, 15,true)
    outputChatBox("#00ff00[ #bababa/gotoairsf #00ff00| #bababa/gotoairls #00ff00| #bababa/gotoairlv #00ff00]", thePlayer, 208, 0, 15,true)
    outputChatBox("#00ff00[ #bababa/gotobus #00ff00| #bababa/gotocivil #00ff00| #bababa/gotomedic #00ff00]", thePlayer, 208, 0, 15,true)	
end
addCommandHandler("gotolist", listPos)



--___________________________________________________________________________________________________________________--
--___________________________________________________________________________________________________________________--
function SpecialEvent(thePlayer)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 1 then
		
		return false
	end
	local theVehicle = getPedOccupiedVehicle ( thePlayer )
	if isPedInVehicle (thePlayer) then
		setElementPosition ( theVehicle, 1231.6761474609 ,-1398.087890625 ,613.25537109375)
		setElementInterior( theVehicle, 0)
		setElementDimension( theVehicle, 0)
		
	else
		setElementPosition ( thePlayer, 1231.6761474609 ,-1398.087890625 ,613.25537109375)
		setElementInterior( thePlayer, 0)
		setElementDimension( thePlayer, 0)
	end
		outputChatBox("#00FF00You Have Been Teleported To SpecialEvent Parkour", thePlayer, 255, 255, 255, true)
end
addCommandHandler("gotoparkour", SpecialEvent)

--______________________________________________________________________________________________________________________--

function SpecialEvent(thePlayer)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 1 then
		
		return false
	end
	local theVehicle = getPedOccupiedVehicle ( thePlayer )
	if isPedInVehicle (thePlayer) then
		setElementPosition ( theVehicle,  -2044.69921875 ,466.57421875 ,35.171875 )
		setElementInterior( theVehicle, 0)
		setElementDimension( theVehicle, 0)
		
	else
		setElementPosition ( thePlayer,  -2044.69921875 ,466.57421875 ,35.171875 )
		setElementInterior( thePlayer, 0)
		setElementDimension( thePlayer, 0)
	end
		outputChatBox("#00FF00You Have Been Teleported To AdminBase", thePlayer, 255, 255, 255, true)
end
addCommandHandler("gotobase", SpecialEvent)



--___________________________________________________________________________________________________________________--
--___________________________________________________________________________________________________________________--
function ls(thePlayer)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 1 then
		
		return false
	end
	local theVehicle = getPedOccupiedVehicle ( thePlayer )
	if isPedInVehicle (thePlayer) then
		setElementPosition ( theVehicle, 1529.6, -1691.2, 13.3 )
		setElementInterior( theVehicle, 0)
		setElementDimension( theVehicle, 0)
		
							--Hale Bug Job Ha--
					if getElementData(thePlayer, "onbusMarkAndBlip") == true then
						destroyElement(getElementData(thePlayer, "onbusMarkerMake"))
						destroyElement(getElementData(thePlayer, "onbusBlipMake"))
						setElementData(thePlayer,"busCheckPoint",0)
						setElementData(thePlayer, "onbusMarkAndBlip", false)
					end
					if getElementData(thePlayer, "onpilotMarkerAndBlip") == true then
						destroyElement(getElementData(thePlayer, "onpilotMarkerMake"))
						destroyElement(getElementData(thePlayer, "onpilotBlipMake"))
						setElementData(thePlayer,"pilotCheckPoint",0)
						setElementData(thePlayer, "onpilotMarkerAndBlip", false)
					end
					if getElementData(thePlayer, "onMarkAndBlip") == true then
						destroyElement(getElementData(thePlayer, "onMarkerMake"))
						destroyElement(getElementData(thePlayer, "onBlipMake"))
						setElementData(thePlayer,"sWCheckPoint",0)
						setElementData(thePlayer, "onMarkAndBlip", false)
						respawnPlayerAfterDeath( thePlayer )
					end
					if getElementData(thePlayer, "makedTrucker") == true then
						destroyElement(getElementData(thePlayer, "onMarkerTruckerMake"))
						destroyElement(getElementData(thePlayer, "onBlipTruckerMake"))
						setElementData(thePlayer,"truckerCheckPoint",0)
						setElementData(thePlayer, "makedTrucker", nil, false)
					end
	else
		setElementPosition ( thePlayer, 1529.6, -1691.2, 13.3 )
		setElementInterior( thePlayer, 0)
		setElementDimension( thePlayer, 0)
	end
		outputChatBox("#00FF00You Have Been Teleported To Los Santos", thePlayer, 255, 255, 255, true)
end
addCommandHandler("gotols", ls)
--==========================================================================================================================================
function ls(thePlayer)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 1 then
		
		return false
	end
	local theVehicle = getPedOccupiedVehicle ( thePlayer )
	if isPedInVehicle (thePlayer) then
		setElementPosition ( theVehicle,  1213.0986328125 ,-1336.04296875 ,13.569878578186  )
		setElementInterior( theVehicle, 0)
		setElementDimension( theVehicle, 0)
		
							--Hale Bug Job Ha--
					if getElementData(thePlayer, "onbusMarkAndBlip") == true then
						destroyElement(getElementData(thePlayer, "onbusMarkerMake"))
						destroyElement(getElementData(thePlayer, "onbusBlipMake"))
						setElementData(thePlayer,"busCheckPoint",0)
						setElementData(thePlayer, "onbusMarkAndBlip", false)
					end
					if getElementData(thePlayer, "onpilotMarkerAndBlip") == true then
						destroyElement(getElementData(thePlayer, "onpilotMarkerMake"))
						destroyElement(getElementData(thePlayer, "onpilotBlipMake"))
						setElementData(thePlayer,"pilotCheckPoint",0)
						setElementData(thePlayer, "onpilotMarkerAndBlip", false)
					end
					if getElementData(thePlayer, "onMarkAndBlip") == true then
						destroyElement(getElementData(thePlayer, "onMarkerMake"))
						destroyElement(getElementData(thePlayer, "onBlipMake"))
						setElementData(thePlayer,"sWCheckPoint",0)
						setElementData(thePlayer, "onMarkAndBlip", false)
						respawnPlayerAfterDeath( thePlayer )
					end
					if getElementData(thePlayer, "makedTrucker") == true then
						destroyElement(getElementData(thePlayer, "onMarkerTruckerMake"))
						destroyElement(getElementData(thePlayer, "onBlipTruckerMake"))
						setElementData(thePlayer,"truckerCheckPoint",0)
						setElementData(thePlayer, "makedTrucker", nil, false)
					end
	else
		setElementPosition ( thePlayer,  1213.0986328125 ,-1336.04296875 ,13.569878578186  )
		setElementInterior( thePlayer, 0)
		setElementDimension( thePlayer, 0)
	end
		outputChatBox("#00FF00You Have Been Teleported To Medic", thePlayer, 255, 255, 255, true)
end
addCommandHandler("gotomedic", ls)
--========================================================================================================================================
function charrah(thePlayer)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 1 then
		
		return false
	end
	local theVehicle = getPedOccupiedVehicle ( thePlayer )
	if isPedInVehicle (thePlayer) then
		setElementPosition ( theVehicle, 1360.68359375 ,-1024.6884765625 ,26.679882049561 )
		setElementInterior( theVehicle, 0)
		setElementDimension( theVehicle, 0)
		--Hale Bug Job Ha--
					if getElementData(thePlayer, "onbusMarkAndBlip") == true then
						destroyElement(getElementData(thePlayer, "onbusMarkerMake"))
						destroyElement(getElementData(thePlayer, "onbusBlipMake"))
						setElementData(thePlayer,"busCheckPoint",0)
						setElementData(thePlayer, "onbusMarkAndBlip", false)
					end
					if getElementData(thePlayer, "onpilotMarkerAndBlip") == true then
						destroyElement(getElementData(thePlayer, "onpilotMarkerMake"))
						destroyElement(getElementData(thePlayer, "onpilotBlipMake"))
						setElementData(thePlayer,"pilotCheckPoint",0)
						setElementData(thePlayer, "onpilotMarkerAndBlip", false)
					end
					if getElementData(thePlayer, "onMarkAndBlip") == true then
						destroyElement(getElementData(thePlayer, "onMarkerMake"))
						destroyElement(getElementData(thePlayer, "onBlipMake"))
						setElementData(thePlayer,"sWCheckPoint",0)
						setElementData(thePlayer, "onMarkAndBlip", false)
						respawnPlayerAfterDeath( thePlayer )
					end
					if getElementData(thePlayer, "makedTrucker") == true then
						destroyElement(getElementData(thePlayer, "onMarkerTruckerMake"))
						destroyElement(getElementData(thePlayer, "onBlipTruckerMake"))
						setElementData(thePlayer,"truckerCheckPoint",0)
						setElementData(thePlayer, "makedTrucker", nil, false)
					end
	else
		setElementPosition ( thePlayer, 1360.68359375 ,-1024.6884765625 ,26.679882049561 )
		setElementInterior( thePlayer, 0)
		setElementDimension( thePlayer, 0)
	end
		outputChatBox("#00FF00You Have Been Teleported To 4 Rah", thePlayer, 255, 255, 255, true)
end
addCommandHandler("goto4rah",charrah)
--=========================================================================================================
function charrah(thePlayer)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 1 then
		
		return false
	end
	local theVehicle = getPedOccupiedVehicle ( thePlayer )
	if isPedInVehicle (thePlayer) then
		setElementPosition ( theVehicle, 1795.9619140625 ,843.13671875 ,10.6328125  )
		setElementInterior( theVehicle, 0)
		setElementDimension( theVehicle, 0)
		--Hale Bug Job Ha--
					if getElementData(thePlayer, "onbusMarkAndBlip") == true then
						destroyElement(getElementData(thePlayer, "onbusMarkerMake"))
						destroyElement(getElementData(thePlayer, "onbusBlipMake"))
						setElementData(thePlayer,"busCheckPoint",0)
						setElementData(thePlayer, "onbusMarkAndBlip", false)
					end
					if getElementData(thePlayer, "onpilotMarkerAndBlip") == true then
						destroyElement(getElementData(thePlayer, "onpilotMarkerMake"))
						destroyElement(getElementData(thePlayer, "onpilotBlipMake"))
						setElementData(thePlayer,"pilotCheckPoint",0)
						setElementData(thePlayer, "onpilotMarkerAndBlip", false)
					end
					if getElementData(thePlayer, "onMarkAndBlip") == true then
						destroyElement(getElementData(thePlayer, "onMarkerMake"))
						destroyElement(getElementData(thePlayer, "onBlipMake"))
						setElementData(thePlayer,"sWCheckPoint",0)
						setElementData(thePlayer, "onMarkAndBlip", false)
						respawnPlayerAfterDeath( thePlayer )
					end
					if getElementData(thePlayer, "makedTrucker") == true then
						destroyElement(getElementData(thePlayer, "onMarkerTruckerMake"))
						destroyElement(getElementData(thePlayer, "onBlipTruckerMake"))
						setElementData(thePlayer,"truckerCheckPoint",0)
						setElementData(thePlayer, "makedTrucker", nil, false)
					end
	else
		setElementPosition ( thePlayer, 1795.9619140625 ,843.13671875 ,10.6328125  )
		setElementInterior( thePlayer, 0)
		setElementDimension( thePlayer, 0)
	end
		outputChatBox("#00FF00You Have Been Teleported To 4 Rah Lv", thePlayer, 255, 255, 255, true)
end
addCommandHandler("goto4rahlv",charrah)




--===============================================================================================================
function charrah(thePlayer)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 1 then
		
		return false
	end
	local theVehicle = getPedOccupiedVehicle ( thePlayer )
	if isPedInVehicle (thePlayer) then
		setElementPosition ( theVehicle, 2908.1435546875 ,-806.076171875 ,11.046875 )
		setElementInterior( theVehicle, 0)
		setElementDimension( theVehicle, 0)
		--Hale Bug Job Ha--
					if getElementData(thePlayer, "onbusMarkAndBlip") == true then
						destroyElement(getElementData(thePlayer, "onbusMarkerMake"))
						destroyElement(getElementData(thePlayer, "onbusBlipMake"))
						setElementData(thePlayer,"busCheckPoint",0)
						setElementData(thePlayer, "onbusMarkAndBlip", false)
					end
					if getElementData(thePlayer, "onpilotMarkerAndBlip") == true then
						destroyElement(getElementData(thePlayer, "onpilotMarkerMake"))
						destroyElement(getElementData(thePlayer, "onpilotBlipMake"))
						setElementData(thePlayer,"pilotCheckPoint",0)
						setElementData(thePlayer, "onpilotMarkerAndBlip", false)
					end
					if getElementData(thePlayer, "onMarkAndBlip") == true then
						destroyElement(getElementData(thePlayer, "onMarkerMake"))
						destroyElement(getElementData(thePlayer, "onBlipMake"))
						setElementData(thePlayer,"sWCheckPoint",0)
						setElementData(thePlayer, "onMarkAndBlip", false)
						respawnPlayerAfterDeath( thePlayer )
					end
					if getElementData(thePlayer, "makedTrucker") == true then
						destroyElement(getElementData(thePlayer, "onMarkerTruckerMake"))
						destroyElement(getElementData(thePlayer, "onBlipTruckerMake"))
						setElementData(thePlayer,"truckerCheckPoint",0)
						setElementData(thePlayer, "makedTrucker", nil, false)
					end
	else
	
		setElementPosition ( thePlayer, 307.755859375 ,1850.44140625 ,17.640625 )
		setElementInterior( thePlayer, 0)
		setElementDimension( thePlayer, 0)
	end
		outputChatBox("#00FF00You Have Been Teleported To Central Jail", thePlayer, 255, 255, 255, true)
end
addCommandHandler("gotocjail",charrah)

--========================================================================================================================================
function charrah(thePlayer)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 1 then
		
		return false
	end
	local theVehicle = getPedOccupiedVehicle ( thePlayer )
	if isPedInVehicle (thePlayer) then
		setElementPosition ( theVehicle, -1472.6025390625 ,405.66015625 ,30.0859375  )
		setElementInterior( theVehicle, 0)
		setElementDimension( theVehicle, 0)
		--Hale Bug Job Ha--
					if getElementData(thePlayer, "onbusMarkAndBlip") == true then
						destroyElement(getElementData(thePlayer, "onbusMarkerMake"))
						destroyElement(getElementData(thePlayer, "onbusBlipMake"))
						setElementData(thePlayer,"busCheckPoint",0)
						setElementData(thePlayer, "onbusMarkAndBlip", false)
					end
					if getElementData(thePlayer, "onpilotMarkerAndBlip") == true then
						destroyElement(getElementData(thePlayer, "onpilotMarkerMake"))
						destroyElement(getElementData(thePlayer, "onpilotBlipMake"))
						setElementData(thePlayer,"pilotCheckPoint",0)
						setElementData(thePlayer, "onpilotMarkerAndBlip", false)
					end
					if getElementData(thePlayer, "onMarkAndBlip") == true then
						destroyElement(getElementData(thePlayer, "onMarkerMake"))
						destroyElement(getElementData(thePlayer, "onBlipMake"))
						setElementData(thePlayer,"sWCheckPoint",0)
						setElementData(thePlayer, "onMarkAndBlip", false)
						respawnPlayerAfterDeath( thePlayer )
					end
					if getElementData(thePlayer, "makedTrucker") == true then
						destroyElement(getElementData(thePlayer, "onMarkerTruckerMake"))
						destroyElement(getElementData(thePlayer, "onBlipTruckerMake"))
						setElementData(thePlayer,"truckerCheckPoint",0)
						setElementData(thePlayer, "makedTrucker", nil, false)
					end
	else
		setElementPosition ( thePlayer, -1472.6025390625 ,405.66015625 ,30.0859375  )
		setElementInterior( thePlayer, 0)
		setElementDimension( thePlayer, 0)
	end
		outputChatBox("#00FF00You Have Been Teleported To LCS", thePlayer, 255, 255, 255, true)
end
addCommandHandler("gotolcs",charrah)

--=============================================================
function kohsf(thePlayer)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 1 then
		
		return false
	end
	local theVehicle = getPedOccupiedVehicle ( thePlayer )
	if isPedInVehicle (thePlayer) then
		setElementPosition ( theVehicle, -2342.228515625 ,-1621.70703125 ,483.6848449707 )
		setElementInterior( theVehicle, 0)
		setElementDimension( theVehicle, 0)
		--Hale Bug Job Ha--
					if getElementData(thePlayer, "onbusMarkAndBlip") == true then
						destroyElement(getElementData(thePlayer, "onbusMarkerMake"))
						destroyElement(getElementData(thePlayer, "onbusBlipMake"))
						setElementData(thePlayer,"busCheckPoint",0)
						setElementData(thePlayer, "onbusMarkAndBlip", false)
					end
					if getElementData(thePlayer, "onpilotMarkerAndBlip") == true then
						destroyElement(getElementData(thePlayer, "onpilotMarkerMake"))
						destroyElement(getElementData(thePlayer, "onpilotBlipMake"))
						setElementData(thePlayer,"pilotCheckPoint",0)
						setElementData(thePlayer, "onpilotMarkerAndBlip", false)
					end
					if getElementData(thePlayer, "onMarkAndBlip") == true then
						destroyElement(getElementData(thePlayer, "onMarkerMake"))
						destroyElement(getElementData(thePlayer, "onBlipMake"))
						setElementData(thePlayer,"sWCheckPoint",0)
						setElementData(thePlayer, "onMarkAndBlip", false)
						respawnPlayerAfterDeath( thePlayer )
					end
					if getElementData(thePlayer, "makedTrucker") == true then
						destroyElement(getElementData(thePlayer, "onMarkerTruckerMake"))
						destroyElement(getElementData(thePlayer, "onBlipTruckerMake"))
						setElementData(thePlayer,"truckerCheckPoint",0)
						setElementData(thePlayer, "makedTrucker", nil, false)
					end
	else
		setElementPosition ( thePlayer, -2342.228515625 ,-1621.70703125 ,483.6848449707 )
		setElementInterior( thePlayer, 0)
		setElementDimension( thePlayer, 0)
	end
		outputChatBox("#00FF00You Have Been Teleported To Koh Sf", thePlayer, 255, 255, 255, true)
end
addCommandHandler("gotokoh",kohsf)


--___________________________________________________________________________________________________________________--
--___________________________________________________________________________________________________________________--
function bus(thePlayer)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 1 then
		
		return false
	end
	local theVehicle = getPedOccupiedVehicle ( thePlayer )
	if isPedInVehicle (thePlayer) then
		setElementPosition ( theVehicle, 1792.1953125, -2049.17578125 , 13.567539215088)
		setElementInterior( theVehicle, 0)
		setElementDimension( theVehicle, 0)
		--Hale Bug Job Ha--
					if getElementData(thePlayer, "onbusMarkAndBlip") == true then
						destroyElement(getElementData(thePlayer, "onbusMarkerMake"))
						destroyElement(getElementData(thePlayer, "onbusBlipMake"))
						setElementData(thePlayer,"busCheckPoint",0)
						setElementData(thePlayer, "onbusMarkAndBlip", false)
					end
					if getElementData(thePlayer, "onpilotMarkerAndBlip") == true then
						destroyElement(getElementData(thePlayer, "onpilotMarkerMake"))
						destroyElement(getElementData(thePlayer, "onpilotBlipMake"))
						setElementData(thePlayer,"pilotCheckPoint",0)
						setElementData(thePlayer, "onpilotMarkerAndBlip", false)
					end
					if getElementData(thePlayer, "onMarkAndBlip") == true then
						destroyElement(getElementData(thePlayer, "onMarkerMake"))
						destroyElement(getElementData(thePlayer, "onBlipMake"))
						setElementData(thePlayer,"sWCheckPoint",0)
						setElementData(thePlayer, "onMarkAndBlip", false)
						respawnPlayerAfterDeath( thePlayer )
					end
					if getElementData(thePlayer, "makedTrucker") == true then
						destroyElement(getElementData(thePlayer, "onMarkerTruckerMake"))
						destroyElement(getElementData(thePlayer, "onBlipTruckerMake"))
						setElementData(thePlayer,"truckerCheckPoint",0)
						setElementData(thePlayer, "makedTrucker", nil, false)
					end
	else
		setElementPosition ( thePlayer,  1792.1953125, -2049.17578125 , 13.567539215088 )
		setElementInterior( thePlayer, 0)
		setElementDimension( thePlayer, 0)
	end
		outputChatBox("#00FF00You Have Been Teleported To Bus", thePlayer, 255, 255, 255, true)
end
addCommandHandler("gotobus", bus)
--___________________________________________________________________________________________________________________--
--___________________________________________________________________________________________________________________--

function air(thePlayer)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 1 then
		
		return false
	end
	local theVehicle = getPedOccupiedVehicle ( thePlayer )
	if isPedInVehicle (thePlayer) then
		setElementPosition ( theVehicle, 1770.0341796875, -2435.0341796875, 13 )
		setElementInterior( theVehicle, 0)
		setElementDimension( theVehicle, 0)
		--Hale Bug Job Ha--
					if getElementData(thePlayer, "onbusMarkAndBlip") == true then
						destroyElement(getElementData(thePlayer, "onbusMarkerMake"))
						destroyElement(getElementData(thePlayer, "onbusBlipMake"))
						setElementData(thePlayer,"busCheckPoint",0)
						setElementData(thePlayer, "onbusMarkAndBlip", false)
					end
					if getElementData(thePlayer, "onpilotMarkerAndBlip") == true then
						destroyElement(getElementData(thePlayer, "onpilotMarkerMake"))
						destroyElement(getElementData(thePlayer, "onpilotBlipMake"))
						setElementData(thePlayer,"pilotCheckPoint",0)
						setElementData(thePlayer, "onpilotMarkerAndBlip", false)
					end
					if getElementData(thePlayer, "onMarkAndBlip") == true then
						destroyElement(getElementData(thePlayer, "onMarkerMake"))
						destroyElement(getElementData(thePlayer, "onBlipMake"))
						setElementData(thePlayer,"sWCheckPoint",0)
						setElementData(thePlayer, "onMarkAndBlip", false)
						respawnPlayerAfterDeath( thePlayer )
					end
					if getElementData(thePlayer, "makedTrucker") == true then
						destroyElement(getElementData(thePlayer, "onMarkerTruckerMake"))
						destroyElement(getElementData(thePlayer, "onBlipTruckerMake"))
						setElementData(thePlayer,"truckerCheckPoint",0)
						setElementData(thePlayer, "makedTrucker", nil, false)
					end
	else
		setElementPosition ( thePlayer, 1770.0341796875, -2435.0341796875, 13)
		setElementInterior( thePlayer, 0)
		setElementDimension( thePlayer, 0)
	end
		outputChatBox("#00FF00You Have Been Teleported To Air Port LS", thePlayer, 255, 255, 255, true)
end
addCommandHandler("gotoairls", air)
--___________________________________________________________________________________________________________________--
--___________________________________________________________________________________________________________________--

function air(thePlayer)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 1 then
		
		return false
	end
	local theVehicle = getPedOccupiedVehicle ( thePlayer )
	if isPedInVehicle (thePlayer) then
		setElementPosition ( theVehicle, 1434.6376953125 ,1398.3046875 ,10.8203125  )
		setElementInterior( theVehicle, 0)
		setElementDimension( theVehicle, 0)
		--Hale Bug Job Ha--
					if getElementData(thePlayer, "onbusMarkAndBlip") == true then
						destroyElement(getElementData(thePlayer, "onbusMarkerMake"))
						destroyElement(getElementData(thePlayer, "onbusBlipMake"))
						setElementData(thePlayer,"busCheckPoint",0)
						setElementData(thePlayer, "onbusMarkAndBlip", false)
					end
					if getElementData(thePlayer, "onpilotMarkerAndBlip") == true then
						destroyElement(getElementData(thePlayer, "onpilotMarkerMake"))
						destroyElement(getElementData(thePlayer, "onpilotBlipMake"))
						setElementData(thePlayer,"pilotCheckPoint",0)
						setElementData(thePlayer, "onpilotMarkerAndBlip", false)
					end
					if getElementData(thePlayer, "onMarkAndBlip") == true then
						destroyElement(getElementData(thePlayer, "onMarkerMake"))
						destroyElement(getElementData(thePlayer, "onBlipMake"))
						setElementData(thePlayer,"sWCheckPoint",0)
						setElementData(thePlayer, "onMarkAndBlip", false)
						respawnPlayerAfterDeath( thePlayer )
					end
					if getElementData(thePlayer, "makedTrucker") == true then
						destroyElement(getElementData(thePlayer, "onMarkerTruckerMake"))
						destroyElement(getElementData(thePlayer, "onBlipTruckerMake"))
						setElementData(thePlayer,"truckerCheckPoint",0)
						setElementData(thePlayer, "makedTrucker", nil, false)
					end
	else
		setElementPosition ( thePlayer, 1434.6376953125 ,1398.3046875 ,10.8203125 )
		setElementInterior( thePlayer, 0)
		setElementDimension( thePlayer, 0)
	end
		outputChatBox("#00FF00You Have Been Teleported To Air Port Lv", thePlayer, 255, 255, 255, true)
end
addCommandHandler("gotoairlv", air)
--___________________________________________________________________________________________________________________--

function air(thePlayer)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 1 then
		
		return false
	end
	local theVehicle = getPedOccupiedVehicle ( thePlayer )
	if isPedInVehicle (thePlayer) then
		setElementPosition ( theVehicle, -1235.9658203125 ,-132.87890625 ,14.1484375)
		setElementInterior( theVehicle, 0)
		setElementDimension( theVehicle, 0)
		--Hale Bug Job Ha--
					if getElementData(thePlayer, "onbusMarkAndBlip") == true then
						destroyElement(getElementData(thePlayer, "onbusMarkerMake"))
						destroyElement(getElementData(thePlayer, "onbusBlipMake"))
						setElementData(thePlayer,"busCheckPoint",0)
						setElementData(thePlayer, "onbusMarkAndBlip", false)
					end
					if getElementData(thePlayer, "onpilotMarkerAndBlip") == true then
						destroyElement(getElementData(thePlayer, "onpilotMarkerMake"))
						destroyElement(getElementData(thePlayer, "onpilotBlipMake"))
						setElementData(thePlayer,"pilotCheckPoint",0)
						setElementData(thePlayer, "onpilotMarkerAndBlip", false)
					end
					if getElementData(thePlayer, "onMarkAndBlip") == true then
						destroyElement(getElementData(thePlayer, "onMarkerMake"))
						destroyElement(getElementData(thePlayer, "onBlipMake"))
						setElementData(thePlayer,"sWCheckPoint",0)
						setElementData(thePlayer, "onMarkAndBlip", false)
						respawnPlayerAfterDeath( thePlayer )
					end
					if getElementData(thePlayer, "makedTrucker") == true then
						destroyElement(getElementData(thePlayer, "onMarkerTruckerMake"))
						destroyElement(getElementData(thePlayer, "onBlipTruckerMake"))
						setElementData(thePlayer,"truckerCheckPoint",0)
						setElementData(thePlayer, "makedTrucker", nil, false)
					end
	else
		setElementPosition ( thePlayer,  -1235.9658203125 ,-132.87890625 ,14.1484375)
		setElementInterior( thePlayer, 0)
		setElementDimension( thePlayer, 0)
	end
		outputChatBox("#00FF00You Have Been Teleported To Air Port SF", thePlayer, 255, 255, 255, true)
end
addCommandHandler("gotoairsf", air)
--___________________________________________________________________________________________________________________--
function lv(thePlayer)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 1 then
		
		return false
	end
	local theVehicle = getPedOccupiedVehicle ( thePlayer )
	if isPedInVehicle (thePlayer) then
		setElementPosition ( theVehicle, 1699.2, 1435.1, 10.7 )
		--Hale Bug Job Ha--
					if getElementData(thePlayer, "onbusMarkAndBlip") == true then
						destroyElement(getElementData(thePlayer, "onbusMarkerMake"))
						destroyElement(getElementData(thePlayer, "onbusBlipMake"))
						setElementData(thePlayer,"busCheckPoint",0)
						setElementData(thePlayer, "onbusMarkAndBlip", false)
					end
					if getElementData(thePlayer, "onpilotMarkerAndBlip") == true then
						destroyElement(getElementData(thePlayer, "onpilotMarkerMake"))
						destroyElement(getElementData(thePlayer, "onpilotBlipMake"))
						setElementData(thePlayer,"pilotCheckPoint",0)
						setElementData(thePlayer, "onpilotMarkerAndBlip", false)
					end
					if getElementData(thePlayer, "onMarkAndBlip") == true then
						destroyElement(getElementData(thePlayer, "onMarkerMake"))
						destroyElement(getElementData(thePlayer, "onBlipMake"))
						setElementData(thePlayer,"sWCheckPoint",0)
						setElementData(thePlayer, "onMarkAndBlip", false)
						respawnPlayerAfterDeath( thePlayer )
					end
					if getElementData(thePlayer, "makedTrucker") == true then
						destroyElement(getElementData(thePlayer, "onMarkerTruckerMake"))
						destroyElement(getElementData(thePlayer, "onBlipTruckerMake"))
						setElementData(thePlayer,"truckerCheckPoint",0)
						setElementData(thePlayer, "makedTrucker", nil, false)
					end
	else
		setElementPosition ( thePlayer, 1699.2, 1435.1, 10.7 )
	end
		outputChatBox("#00FF00You Have Been Teleported To Las Venturas", thePlayer, 255, 255, 255, true)
end
addCommandHandler("gotolv", lv)
--==================================================================================================================
function lv(thePlayer)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 1 then
		
		return false
	end
	local theVehicle = getPedOccupiedVehicle ( thePlayer )
	if isPedInVehicle (thePlayer) then
		setElementPosition ( theVehicle, 363.3212890625 ,-1531.9951171875 ,33.312843322754 )
		--Hale Bug Job Ha--
					if getElementData(thePlayer, "onbusMarkAndBlip") == true then
						destroyElement(getElementData(thePlayer, "onbusMarkerMake"))
						destroyElement(getElementData(thePlayer, "onbusBlipMake"))
						setElementData(thePlayer,"busCheckPoint",0)
						setElementData(thePlayer, "onbusMarkAndBlip", false)
					end
					if getElementData(thePlayer, "onpilotMarkerAndBlip") == true then
						destroyElement(getElementData(thePlayer, "onpilotMarkerMake"))
						destroyElement(getElementData(thePlayer, "onpilotBlipMake"))
						setElementData(thePlayer,"pilotCheckPoint",0)
						setElementData(thePlayer, "onpilotMarkerAndBlip", false)
					end
					if getElementData(thePlayer, "onMarkAndBlip") == true then
						destroyElement(getElementData(thePlayer, "onMarkerMake"))
						destroyElement(getElementData(thePlayer, "onBlipMake"))
						setElementData(thePlayer,"sWCheckPoint",0)
						setElementData(thePlayer, "onMarkAndBlip", false)
						respawnPlayerAfterDeath( thePlayer )
					end
					if getElementData(thePlayer, "makedTrucker") == true then
						destroyElement(getElementData(thePlayer, "onMarkerTruckerMake"))
						destroyElement(getElementData(thePlayer, "onBlipTruckerMake"))
						setElementData(thePlayer,"truckerCheckPoint",0)
						setElementData(thePlayer, "makedTrucker", nil, false)
					end
	else
		setElementPosition ( thePlayer, 363.3212890625 ,-1531.9951171875 ,33.312843322754)
	end
		outputChatBox("#00FF00You Have Been Teleported To F.B.I", thePlayer, 255, 255, 255, true)
end
addCommandHandler("gotofbi", lv)
--___________________________________________________________________________________________________________________--
--___________________________________________________________________________________________________________________--
function sf(thePlayer)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 1 then
		
		return false
	end
	local theVehicle = getPedOccupiedVehicle ( thePlayer )
	if isPedInVehicle (thePlayer) then
		setElementPosition ( theVehicle, -1501.1875 ,924.4814453125 ,7.1875  )
		--Hale Bug Job Ha--
					if getElementData(thePlayer, "onbusMarkAndBlip") == true then
						destroyElement(getElementData(thePlayer, "onbusMarkerMake"))
						destroyElement(getElementData(thePlayer, "onbusBlipMake"))
						setElementData(thePlayer,"busCheckPoint",0)
						setElementData(thePlayer, "onbusMarkAndBlip", false)
					end
					if getElementData(thePlayer, "onpilotMarkerAndBlip") == true then
						destroyElement(getElementData(thePlayer, "onpilotMarkerMake"))
						destroyElement(getElementData(thePlayer, "onpilotBlipMake"))
						setElementData(thePlayer,"pilotCheckPoint",0)
						setElementData(thePlayer, "onpilotMarkerAndBlip", false)
					end
					if getElementData(thePlayer, "onMarkAndBlip") == true then
						destroyElement(getElementData(thePlayer, "onMarkerMake"))
						destroyElement(getElementData(thePlayer, "onBlipMake"))
						setElementData(thePlayer,"sWCheckPoint",0)
						setElementData(thePlayer, "onMarkAndBlip", false)
						respawnPlayerAfterDeath( thePlayer )
					end
					if getElementData(thePlayer, "makedTrucker") == true then
						destroyElement(getElementData(thePlayer, "onMarkerTruckerMake"))
						destroyElement(getElementData(thePlayer, "onBlipTruckerMake"))
						setElementData(thePlayer,"truckerCheckPoint",0)
						setElementData(thePlayer, "makedTrucker", nil, false)
					end
	else
		setElementPosition ( thePlayer,-1501.1875 ,924.4814453125 ,7.1875  )
	end
	outputChatBox("#00FF00You Have Been Teleported To San Fierro", thePlayer, 255, 255, 255, true)
end
addCommandHandler("gotosf", sf)
--___________________________________________________________________________________________________________________--
--___________________________________________________________________________________________________________________--
function civil(thePlayer)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 1 then
		
		return false
	end
	local theVehicle = getPedOccupiedVehicle ( thePlayer )
	if isPedInVehicle (thePlayer) then
		setElementPosition ( theVehicle, 1738.4892578125 ,-1843.431640625 ,18.80389213562 )
		setElementRotation ( thePlayer, 0 , 0,177 )
		setElementInterior( theVehicle, 0)
		setElementDimension( theVehicle, 0)
		--Hale Bug Job Ha--
					if getElementData(thePlayer, "onbusMarkAndBlip") == true then
						destroyElement(getElementData(thePlayer, "onbusMarkerMake"))
						destroyElement(getElementData(thePlayer, "onbusBlipMake"))
						setElementData(thePlayer,"busCheckPoint",0)
						setElementData(thePlayer, "onbusMarkAndBlip", false)
					end
					if getElementData(thePlayer, "onpilotMarkerAndBlip") == true then
						destroyElement(getElementData(thePlayer, "onpilotMarkerMake"))
						destroyElement(getElementData(thePlayer, "onpilotBlipMake"))
						setElementData(thePlayer,"pilotCheckPoint",0)
						setElementData(thePlayer, "onpilotMarkerAndBlip", false)
					end
					if getElementData(thePlayer, "onMarkAndBlip") == true then
						destroyElement(getElementData(thePlayer, "onMarkerMake"))
						destroyElement(getElementData(thePlayer, "onBlipMake"))
						setElementData(thePlayer,"sWCheckPoint",0)
						setElementData(thePlayer, "onMarkAndBlip", false)
						respawnPlayerAfterDeath( thePlayer )
					end
					if getElementData(thePlayer, "makedTrucker") == true then
						destroyElement(getElementData(thePlayer, "onMarkerTruckerMake"))
						destroyElement(getElementData(thePlayer, "onBlipTruckerMake"))
						setElementData(thePlayer,"truckerCheckPoint",0)
						setElementData(thePlayer, "makedTrucker", nil, false)
					end
	else
		setElementPosition ( thePlayer, 1738.4892578125 ,-1843.431640625 ,18.80389213562 )
		setElementRotation ( thePlayer, 0 , 0,177 )
		setElementInterior( thePlayer, 0)
		setElementDimension( thePlayer, 0)
	end
		outputChatBox("#00FF00You Have Been Teleported To Civilian", thePlayer, 255, 255, 255, true)
end
addCommandHandler("gotocivil", civil)
--___________________________________________________________________________________________________________________--
--___________________________________________________________________________________________________________________--
function daver(thePlayer)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 1 then
		
		return false
	end
	local theVehicle = getPedOccupiedVehicle ( thePlayer )
	if isPedInVehicle (thePlayer) then
		setElementPosition ( theVehicle, 1210.1376953125, -1750.841796875, 13.593784332275 )
		setElementInterior( theVehicle, 0)
		setElementDimension( theVehicle, 0)
		--Hale Bug Job Ha--
					if getElementData(thePlayer, "onbusMarkAndBlip") == true then
						destroyElement(getElementData(thePlayer, "onbusMarkerMake"))
						destroyElement(getElementData(thePlayer, "onbusBlipMake"))
						setElementData(thePlayer,"busCheckPoint",0)
						setElementData(thePlayer, "onbusMarkAndBlip", false)
					end
					if getElementData(thePlayer, "onpilotMarkerAndBlip") == true then
						destroyElement(getElementData(thePlayer, "onpilotMarkerMake"))
						destroyElement(getElementData(thePlayer, "onpilotBlipMake"))
						setElementData(thePlayer,"pilotCheckPoint",0)
						setElementData(thePlayer, "onpilotMarkerAndBlip", false)
					end
					if getElementData(thePlayer, "onMarkAndBlip") == true then
						destroyElement(getElementData(thePlayer, "onMarkerMake"))
						destroyElement(getElementData(thePlayer, "onBlipMake"))
						setElementData(thePlayer,"sWCheckPoint",0)
						setElementData(thePlayer, "onMarkAndBlip", false)
						respawnPlayerAfterDeath( thePlayer )
					end
					if getElementData(thePlayer, "makedTrucker") == true then
						destroyElement(getElementData(thePlayer, "onMarkerTruckerMake"))
						destroyElement(getElementData(thePlayer, "onBlipTruckerMake"))
						setElementData(thePlayer,"truckerCheckPoint",0)
						setElementData(thePlayer, "makedTrucker", nil, false)
					end
	else
		setElementPosition ( thePlayer, 1210.1376953125, -1750.841796875, 13.593784332275 )
		setElementInterior( thePlayer, 0)
		setElementDimension( thePlayer, 0)
	end
		outputChatBox("#00FF00You Have Been Teleported To CNN", thePlayer, 255, 255, 255, true)
end
addCommandHandler("gotoad", daver)
--___________________________________________________________________________________________________________________--
--___________________________________________________________________________________________________________________--

function removeHex(text, digits)
    assert(type(text) == "string", "Bad argument 1 @ removeHex [String expected, got " .. tostring(text) .. "]")
    assert(digits == nil or (type(digits) == "number" and digits > 0), "Bad argument 2 @ removeHex [Number greater than zero expected, got " .. tostring(digits) .. "]")
    return string.gsub(text, "#" .. (digits and string.rep("%x", digits) or "%x+"), "")
end

function specPlayer ( thePlayer, command, player, text )

    if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 1 then
      
      return false
    end
    local find = miscSys:findPlayer ( player )
	if player then
    if find then
	if getPlayerName(find) == "wexo_V"  then
	  outputChatBox("#ff0000Ro In Shakhs Nmitoni Spcp Konid !", thePlayer, 255, 255, 255, true)
      return false
    end
	if getElementData(thePlayer, "inSpect") ~= true then
		setCameraTarget(thePlayer, find)
		setElementData(thePlayer, "inSpect", true)
		outputChatBox("#ffb6c1[Admin-System]: #ffffffShoma Roye #c0c0c0"..getPlayerName(find).." #ffffffSpec Shodid!", thePlayer, 255, 255, 255, true)
		for k, chat_admini in ipairs (getElementsByType("player")) do
	        if getElementData(chat_admini, "loggedIn") == true then
	        if tonumber(getElementData(accSys:getPlayerAcc(chat_admini), "pAdmin")) >= 1 then
	       -- outputChatBox("#ff0000(ADM-Warn): #ffffff Admin #fc9803"..getPlayerName(thePlayer).."#ffffff Roye "..getPlayerName(find).." #00ff00Spec #ffffffShod !", chat_admini, 208, 0, 15,true)
			end
			end
		end
	else
		outputChatBox("#EE0A0AShoma Dar Halate Spectate Hastid, Use : (/spcoff)", thePlayer, 255, 255, 255, true)
	end
	else
		outputChatBox("#EE0A0AChenin Playeri Dakhel Server Nmibashad !", thePlayer, 255, 255, 255, true)
    end
    else
		outputChatBox("#bababaBezan: /spcp <PartOfName/ID>", thePlayer, 255, 255, 255, true)
    end
end
addCommandHandler("spcp", specPlayer )
--___________________________________________________________________________________________________________________--
--___________________________________________________________________________________________________________________--
function specPlayerOff ( thePlayer, command )
    if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 1 then
      
      return false
    end
	if getElementData(thePlayer, "inSpect") == true then
		setCameraTarget(thePlayer, thePlayer)
		setElementData(thePlayer, "inSpect", nil)
		outputChatBox("#ff0000Shoma Az Halate Spec Kharej Shodid!", thePlayer, 255, 255, 255, true)
	else
		outputChatBox("#EE0A0AShoma Dar Spec Nistid !", thePlayer, 255, 255, 255, true)
	end
end
addCommandHandler("spcoff", specPlayerOff )
--___________________________________________________________________________________________________________________--
--___________________________________________________________________________________________________________________--
addCommandHandler("setgm",
function ( thePlayer, command, player )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 8 then
		
		return false
	end
	local find = miscSys:findPlayer(player)
	local targetPlayer = getPlayerName ( find )
	if player then
	if find then
	if getElementData(find,"godmode") == true then
		outputChatBox("#bababa(Godmode): #ffffffShoma Halat God Mode #fc9803"..targetPlayer.." #ffffffRa #ff0000Off #ffffffKardid !", thePlayer, 255, 255, 255, true)
		setElementData(find,"godmode",nil)
	else
		outputChatBox("#bababa(Godmode): #ffffffShoma Halat God Mode #fc9803"..targetPlayer.." #ffffffRa #00ff00On#ffffff Kardid !", thePlayer, 255, 255, 255, true)
		setElementData(find,"godmode",true)
	end
	else
		outputChatBox("#EE0A0AChenin Playeri Dakhel Server Nmibashad !", thePlayer, 255, 255, 255, true)
    end
	else
		outputChatBox("#bababaBezan: /setgm <PartOfName/ID>", thePlayer, 255, 255, 255, true)
	end
end)
--___________________________________________________________________________________________________________________--
--___________________________________________________________________________________________________________________--
function distanceHeal (thePlayer, cmd, dis, heal)
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 27 then
			
			return false
		end
			if dis then
				local disNum = tonumber(dis)
				if disNum then
					if heal then
						local healNum = tonumber(heal)
						if healNum then
							local x,y,z = getElementPosition(thePlayer)
							local Sphere = createColSphere( x,y,z, disNum )
							local nearbyPlayers = getElementsWithinColShape( Sphere, "player" ) 
							destroyElement(Sphere)
							for index,players in ipairs(nearbyPlayers) do
								if getElementData(players,"loggedIn") == true then
									setElementHealth(players,healNum)
									outputChatBox("#00ff00Health Shoma Tavasot Admin "..getPlayerName(thePlayer).." Be "..healNum.." Set Shod !", players, 0, 255, 0,true)
								end
							end
						else
							outputChatBox("#EE0A0ABaraye Heal Bayad Adad Vared Konid !",thePlayer,255,255,255,true)
						end
					else
						outputChatBox("#EE0A0AMeghdar Heal Ra Vared Konid !",thePlayer,255,255,255,true)
					end
				else
					outputChatBox("#EE0A0ABaraye Fasele Bayad Adad Vared Konid !",thePlayer,255,255,255,true)
				end
		else
			outputChatBox("#bababaBezan: /sethpall <Distance> <Value>", thePlayer, 255, 255, 255, true)
		end
end
addCommandHandler("sethpall",distanceHeal)
--___________________________________________________________________________________________________________________--
--___________________________________________________________________________________________________________________--
function distanceFixall (thePlayer, cmd, dis)
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 27 then

			return false
		end
		if dis then
			local disNum = tonumber(dis)
			if disNum then
				local x,y,z = getElementPosition(thePlayer)
				local Sphere = createColSphere( x,y,z, disNum )
				local nearbyVehcile = getElementsWithinColShape( Sphere, "vehicle" ) 
				destroyElement(Sphere)
				for index, allveh in ipairs(nearbyVehcile) do 
					fixVehicle(allveh)
				end
				
				local x2,y2,z2 = getElementPosition(thePlayer)
				local Sphere2 = createColSphere( x2,y2,z2, disNum )
				local nearbyPlayers = getElementsWithinColShape( Sphere2, "player" ) 
				destroyElement(Sphere2)
				for index,players in ipairs(nearbyPlayers) do
					if getElementData(players,"loggedIn") == true then
						local hisVeh = getPedOccupiedVehicle(players)
						if hisVeh then
						end
					end
				end
				outputChatBox("#bababa(FixAll): #ffffffTamami Mashin Haye Atraf Ta Fasele #2DBDEC"..dis.." #ffffffFix Shod!", thePlayer, 0, 255, 0,true)
			else
				outputChatBox("#EE0A0ABaraye Fasele Bayad Adad Vared Konid !",thePlayer,255,255,255,true)
			end
		else
			outputChatBox("#bababaBezan : /fixall <Distance>", thePlayer, 255, 255, 255, true)
		end
end
addCommandHandler("fixall",distanceFixall)
--___________________________________________________________________________________________________________________--
--___________________________________________________________________________________________________________________--
function distanceTakeGun (thePlayer, cmd, dis)
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 27 then
			
			return false
		end
			if dis then
				local disNum = tonumber(dis)
				if disNum then
							local x,y,z = getElementPosition(thePlayer)
							local Sphere = createColSphere( x,y,z, disNum )
							local nearbyPlayers = getElementsWithinColShape( Sphere, "player" ) 
							destroyElement(Sphere)
							for index,players in ipairs(nearbyPlayers) do
								if getElementData(players,"loggedIn") == true then
									takeAllWeapons(players)
									outputChatBox("#ff0000Admin "..getPlayerName(thePlayer).." Tamami Aslahe Haye Shoma Ro Gereft !", players, 0, 255, 0,true)
								end 
							end
				else
					outputChatBox("#EE0A0ABaraye Fasele Bayad Adad Vared Konid !",thePlayer,255,255,255,true)
				end
		else
			outputChatBox("#bababaBezan : /takegunall <Distance>", thePlayer, 255, 255, 255, true)
		end
end
addCommandHandler("takegunall",distanceTakeGun)
--___________________________________________________________________________________________________________________--
--___________________________________________________________________________________________________________________--
function distanceGiveGun (thePlayer, cmd, dis, gunid, tir)
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 7 then
			
			return false
		end
			if dis then
				local disNum = tonumber(dis)
				if disNum then
					if gunid then
						local gunidNum = tonumber(gunid)
						local tirNum = tonumber(tir)
						if gunidNum then
						if tir then
						if tirNum then
							local x,y,z = getElementPosition(thePlayer)
							local Sphere = createColSphere( x,y,z, disNum )
							local nearbyPlayers = getElementsWithinColShape( Sphere, "player" ) 
							destroyElement(Sphere)
							for index,players in ipairs(nearbyPlayers) do
								if getElementData(players,"loggedIn") == true then
									giveWeapon(players, gunidNum, tirNum)
									outputChatBox("#00ff00Be Shoma Gun "..getWeaponNameFromID(gunidNum).." Ba ("..tirNum..") Tir Dade Shod !", players, 0, 255, 0,true)
								end
							end
						else
							outputChatBox("#EE0A0ABaraye Tedad Tir Bayad Adad Vared Konid !",thePlayer,255,255,255,true)
						end
						else
							outputChatBox("#EE0A0ATedad Tir Ra Vared Konid !",thePlayer,255,255,255,true)
						end
						else
							outputChatBox("#EE0A0ABaraye Gun ID Bayad Adad Vared Konid !",thePlayer,255,255,255,true)
						end
					else
						outputChatBox("#EE0A0AGun ID Ra Vared Konid !",thePlayer,255,255,255,true)
					end
				else
					outputChatBox("#EE0A0ABaraye Fasele Bayad Adad Vared Konid !",thePlayer,255,255,255,true)
				end
		else
			outputChatBox("#bababaBezan: /ggall <Distance> <Gun-ID> <Tir>", thePlayer, 255, 255, 255, true)
		end
end
addCommandHandler("ggall",distanceGiveGun)
--___________________________________________________________________________________________________________________--
--___________________________________________________________________________________________________________________--
addCommandHandler("aglall",
function ( thePlayer, command, player)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 27 then
		
		return false
	end
	local find = miscSys:findPlayer(player)
	if player then
	if find then
		setElementData(accSys:getPlayerAcc(find), "pCarLic", 200)
		setElementData(accSys:getPlayerAcc(find), "pCarLicS", 200)
		setElementData(accSys:getPlayerAcc(find), "pFlyLic", 200)
		setElementData(accSys:getPlayerAcc(find), "pBoatLic", 200)
		setElementData(accSys:getPlayerAcc(find), "pMatsLic", 200)
		setElementData(accSys:getPlayerAcc(find), "pGunLic", 200)
		outputChatBox("#bababa(Glall): #ffffffShoma Tamamie Mojavez Haro Be #00ff00"..getPlayerName(find).." #ffffffDadid !", thePlayer, 255, 255, 255, true)
		outputChatBox("#00ff00Admin "..getPlayerName(thePlayer).." #00ff00Tamami Mojavez Haro Be Shoma Dad !", find, 255, 255, 255, true)
		
	else
		outputChatBox("#EE0A0AChenin Playeri Dakhel Server Nmibashad !", thePlayer, 255, 255, 255, true)
	end
	else
		outputChatBox("#bababaBezan : /aglall <PartOfName/ID>", thePlayer, 255, 255, 255, true)
	end
end)
--___________________________________________________________________________________________________________________--
--___________________________________________________________________________________________________________________--
addCommandHandler("takegl",
function ( thePlayer, command, player)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 8 then
		
		return false
	end
	local find = miscSys:findPlayer(player)
	if player then
	if find then
		setElementData(accSys:getPlayerAcc(find), "pCarLic", 0)
		setElementData(accSys:getPlayerAcc(find), "pCarLicS", 0)
		setElementData(accSys:getPlayerAcc(find), "pFlyLic", 0)
		setElementData(accSys:getPlayerAcc(find), "pBoatLic", 0)
		setElementData(accSys:getPlayerAcc(find), "pMatsLic", 0)
		setElementData(accSys:getPlayerAcc(find), "pGunLic", 0)
		outputChatBox("#bababa(Glall): #ffffffShoma Tamamie Mojavez Haro Az #00ff00"..getPlayerName(find).." #ffffffGereftid !", thePlayer, 255, 255, 255, true)
		outputChatBox("#ff0000Admin "..getPlayerName(thePlayer).." Tamamie Mojavez Haye Shoma Ra Gereft !", find, 255, 255, 255, true)
	else
		outputChatBox("#EE0A0AChenin Playeri Dakhel Server Nmibashad !", thePlayer, 255, 255, 255, true)
	end
	else
		outputChatBox("#bababaBezan: /takegl <PartOfName/ID>", thePlayer, 255, 255, 255, true)
	end
end)

--========================================================================================================================================
addCommandHandler("takegold",
function ( thePlayer, command, player)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 8 then
		return false
	end
	if player then
	local find = miscSys:findPlayer(player)
	if find then
		setElementData(accSys:getPlayerAcc(find), "pGold", 0)
		
		outputChatBox("#bababa(Takegold): #ffffffShoma Tamamie Gold Haye #2EB8EC"..getPlayerName(find).." #ffffffGereftid !", thePlayer, 255, 255, 255, true)
		
	else
		outputChatBox("#EE0A0AChenin Playeri Dakhel Server Nmibashad !", thePlayer, 255, 255, 255, true)
	end
	else
		outputChatBox("#bababaBezan : /takegold <PartOfName/ID>", thePlayer, 255, 255, 255, true)
	end
end)



--___________________________________________________________________________________________________________________--
--___________________________________________________________________________________________________________________--
addCommandHandler("givemile",
function ( thePlayer, command, player, meghdar )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 20 then
		return false
	end

		if player then
		local find = miscSys:findPlayer ( player )
		if find then
		if meghdar then
			local targetPlayer = getPlayerName ( find )
			local meghdar = tonumber(meghdar)
			local goldPlayer = getElementData(accSys:getPlayerAcc(find), "pMile")
			setElementData(accSys:getPlayerAcc(find), "pMile", tonumber(goldPlayer) + tonumber(meghdar))
			outputChatBox("#bababa(Gold): #ffffffShoma Be #2EB8EC"..getPlayerName(find).." #ffffffMeghdar'e #DAA520"..meghdar.." #ffffffMile Dadid !", thePlayer, 255, 255, 255, true)
			for k, chat_admini in ipairs (getElementsByType("player")) do
	        if getElementData(chat_admini, "loggedIn") == true then
	        if tonumber(getElementData(accSys:getPlayerAcc(chat_admini), "pAdmin")) >= 1 then
	        outputChatBox("", chat_admini, 208, 0, 15,true)
			end
			end
		end
		else
			outputChatBox("#EE0A0AMeghdar Gold Ra Vared Konid !", thePlayer, 255, 255, 255, true)
		end
		else
			outputChatBox("#EE0A0AChenin Playeri Dakhel Server Nmibashad !", thePlayer, 255, 255, 255, true)
		end
		else
			outputChatBox("#bababaBezan: /givemile <PartOfName/ID> <Meghdar>", thePlayer, 0, 255, 0,true)
		end
end)


--___________________________________________________________________________________________________________________--
--___________________________________________________________________________________________________________________--
addCommandHandler("givegold",
function ( thePlayer, command, player, meghdar )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 27 then
		return false
	end
		local find = miscSys:findPlayer ( player )
		if player then
		if find then
		if meghdar then
			local targetPlayer = getPlayerName ( find )
			local meghdar = tonumber(meghdar)
			local goldPlayer = getElementData(accSys:getPlayerAcc(find), "pGold")
			setElementData(accSys:getPlayerAcc(find), "pGold", tonumber(goldPlayer) + tonumber(meghdar))
			outputChatBox("#bababa(Gold): #ffffffShoma Be #2EB8EC"..getPlayerName(find).." #ffffffMeghdar'e #DAA520"..meghdar.." #ffffffGold Dadid !", thePlayer, 255, 255, 255, true)
			outputChatBox("#ffb6c1[Admin-System]: #ffffffAdmin #c0c0c0"..getPlayerName(thePlayer).." #ffffffBe Shoma Meghdar #fff000"..meghdar.." #ffffffGold Dad.", find, 0, 255, 0, true)
			for k, chat_admini in ipairs (getElementsByType("player")) do
	        if getElementData(chat_admini, "loggedIn") == true then
	        if tonumber(getElementData(accSys:getPlayerAcc(chat_admini), "pAdmin")) >= 1 then
	        outputChatBox("", chat_admini, 208, 0, 15,true)
			end
			end
		end
		else
			outputChatBox("#EE0A0AMeghdar Gold Ra Vared Konid !", thePlayer, 255, 255, 255, true)
		end
		else
			outputChatBox("#EE0A0AChenin Playeri Dakhel Server Nmibashad !", thePlayer, 255, 255, 255, true)
		end
		else
			outputChatBox("#bababaBezan: /givepack <PartOfName/ID> <Meghdar>", thePlayer, 0, 255, 0,true)
		end
end)
--___________________________________________________________________________________________________________________--
--___________________________________________________________________________________________________________________--
addCommandHandler("aduty",
function(thePlayer, command)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 8 then

		return false
	end
	if getElementData(thePlayer, "adminDuty") ~= "On" then
		outputChatBox("#00ff00Shoma Duty Shodid!", thePlayer, 255, 255, 255, true)
		setElementData(thePlayer, "adminDuty", "On")
	else
		outputChatBox("#DF1111Shoma Off Duty Shodid!", thePlayer, 255, 255, 255, true)
		setElementData(thePlayer, "adminDuty", "Off")
	end
end)
--___________________________________________________________________________________________________________________--
--___________________________________________________________________________________________________________________--
Words = { 
	"irm",
	"IRM",
	"iRM",
	"irM",
	"MTA",
	"mta",
	"enix",
	"ENIX",
	"sv",
	"Sv",
	"server",
	"Server",
	"bug",
	"Bug",
	".com",
	".ir",
	"viros",
	"virus",
	"paydar",
	":22003",
	":7777",
	"AghaZade",
	"amirali",
	"LastTime",
	"GodFather",
	"Arshin",
	"plus",
	"plus mta",
	"atis",
	"iranmta",
	"free",
	"Biats",
	"Ts",
	"ts",
	"server",
	"Server",
	"Royal",
	"Roxan",
	"roxan",
	"رکسان",
	"RockStart",
	"راکساتار",
	"RS",
	"سرور",
	"Iran",
	"GodErfi",
	"wexo_V",
	"مومو",
	"Gang",
	"GANG",
    "momo",
	"ای ار ام",
    "ایرم",
    "Admin",
    "@",
	"09",
    "+98",
    "0912",
    "0939",
    "09",
    "Gheyre",
    "tune",
    "Sus",
    "dm",
    "DM",
    "دی ام",
	--Fosh Ha--
	"kir",
	"kos",
	"jende",
	"haromzade",
	"kos amat",
	"koni",
	"kos kharet",
	"kir to kos nanat",
	"madar jende",
	"kos nanat",
	"kose",
	"Kos",
}

function AdminWarn ( warn )
	for index,modira in ipairs(getElementsByType("player")) do
		if getElementData(modira,"loggedIn") == true then
			if getElementData(accSys:getPlayerAcc(modira),"pAdmin") >= 1 then
				outputChatBox(warn, modira, 255, 255, 255, true )
			end
		end
	end
end

addEventHandler("onPlayerChat", root, function ( message ) 
	for _, word in ipairs(Words) do
	if tonumber(getElementData(accSys:getPlayerAcc(source), "pMuteTime")) == 0 then
		if( message:find( word ) )then
			AdminWarn("#ff0000[ADM-Warn]: #bababa" ..getPlayerName(source).. " Chat Kard:#ffffff " ..message)
		end
	end
	end
end)
--___________________________________________________________________________________________________________________--
--___________________________________________________________________________________________________________________--
addCommandHandler("notf",
	function(thePlayer, cmd, ...)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) ~=30 then
		
		return false
	end
       	    	local message = table.concat({ ... }, " ")
				   	if #message > 0 then
               			exports["notf"]:addNotification(root, "'"..message.."'" , 'info')
						triggerClientEvent ( root, "PlayAlarm", root)
							--SpecialAdminWarn ( "#ff0000(Adm-Warn): #ffffffAdmin #fc9803"..getPlayerName(thePlayer).."#ffffff In Notf Ro Dad!" , thePlayer )
					else
						outputChatBox("Bezan: /notf [Matn]", thePlayer)
					end
    end)
	
addCommandHandler("notw",
	function(thePlayer, cmd, ...)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) ~= 30 then
		
		return false
	end
       	    	local message = table.concat({ ... }, " ")
				   	if #message > 0 then
               			exports["notf"]:addNotification(root, "' "..message.." '" , 'warning')
													--SpecialAdminWarn ( "#ff0000(Adm-Warn): #ffffffAdmin #fc9803"..getPlayerName(thePlayer).."#ffffff In Notf Ro Dad!" , thePlayer )
						---triggerClientEvent ( root, "PlayNotif", root)
					else
						outputChatBox("Bezan: /notw [Matn]", thePlayer)
					end
    end)
--___________________________________________________________________________________________________________________--



--___________________________________________________________________________________________________________________--
--___________________________________________________________________________________________________________________--
--[[addCommandHandler("respawnall",
function(thePlayer, cmd)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 13 then
		return false
	end
	for k, hame_Playera	in ipairs (getElementsByType("player")) do	
	executeCommandHandler ( "respawn", thePlayer, getPlayerName(hame_Playera) )
	for k, chat_admini in ipairs (getElementsByType("player")) do
	        if getElementData(chat_admini, "loggedIn") == true then
	        if tonumber(getElementData(accSys:getPlayerAcc(chat_admini), "pAdmin")) >= 1 then
	     --   outputChatBox("#ff0000(ADM-Warn): #ffffff Admin #fc9803"..getPlayerName(thePlayer).."#ffffff Tamami Player Haye Server Ra #00ff00Respawn #ffffffDad!", chat_admini, 208, 0, 15,true)
				        outputChatBox("#ff0000[Tavajoh]: Tamamie Player Haye Server Tavasote Admin "..getPlayerName(thePlayer).." Respawn Shodadn!", chat_admini, 208, 0, 15,true)
			end
			end
		end
	end
end
)]]


addCommandHandler("blow",
function ( thePlayer, command, player)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) ~= 27 or 30 then
		
		return false
	end
		local find = miscSys:findPlayer ( player )
		if player then
		if find then
			local targetPlayer = getPlayerName ( find )
			local hisVeh = getPedOccupiedVehicle(find)
			local x,y,z = getElementRotation ( hisVeh )
			local xx,yy,zz = getElementPosition ( hisVeh )
			if hisVeh then
			    createExplosion(xx, yy, zz, 0)
				blowVehicle(hisVeh)
				setElementRotation(hisVeh,0,0,z,"default",true)
				outputChatBox("#00ff00Be Chokh Raft!", thePlayer, 255, 255, 255, true)
				outputChatBox("#ff0000Your Vehicle Blow By ".. getPlayerName ( thePlayer ) .."", find, 255, 255, 255, true)
			else
				outputChatBox("#EE0A0AIn Player Savar Khodro Nemibashad !", thePlayer, 255, 255, 255, true)
			end
			else
				outputChatBox("#EE0A0AChenin Playeri Dakhel Server Nmibashad !", thePlayer, 255, 255, 255, true)
			end
		else
			outputChatBox("#bababaBezan : /blow <PartOfName/ID>", thePlayer, 0, 255, 0,true)
		end
end
)


--___________________________________________________________________________________________________________________--
--___________________________________________________________________________________________________________________--
addCommandHandler("unjailall",
function(thePlayer, cmd)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 14 then
		return false
	end
	for k, hame_Playera	in ipairs (getElementsByType("player")) do	
		if tonumber(getElementData(accSys:getPlayerAcc(hame_Playera), "pJailTime")) >= 2 then
			setElementData(accSys:getPlayerAcc(hame_Playera), "pJailTime", 1)
			for k, chat_admini in ipairs (getElementsByType("player")) do
	        if getElementData(chat_admini, "loggedIn") == true then
	        if tonumber(getElementData(accSys:getPlayerAcc(chat_admini), "pAdmin")) >= 1 then
	        outputChatBox("#ff0000(ADM-Warn): #ffffff Admin #fc9803"..getPlayerName(thePlayer).."#ffffff Tamami Player Haye Server Ra #00ff00Unjail #ffffffKard!", chat_admini, 208, 0, 15,true)
			end
			end
		end
		end
	end
end
)
--___________________________________________________________________________________________________________________--
--___________________________________________________________________________________________________________________--
--___________________________________________________________________________________________________________________--
addCommandHandler("setarmor",
function ( thePlayer, command , player, value)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 8 then
		
		return false
	end
	local find = miscSys:findPlayer(player)
	if find then
		local value = tonumber(value)
		if value then
			if value <= 100 and value >= 0 then
				setPedArmor(find, value)
				outputChatBox("#ffb6c1[Admin-System]: #ffffffShoma Armore Player #c0c0c0"..getPlayerName(find).."#ffffff Ra Be #c0c0c0"..value.." #ffffffSet Kardid !", thePlayer, 208, 0, 15,true)	
				outputChatBox("#ffb6c1[Admin-System]: #ffffffAdmin #c0c0c0"..getPlayerName(thePlayer).." #ffffffArmor Shoma Ro Be #c0c0c0"..value.." #ffffffSet Kard !", find, 255, 255, 255, true)
				for k, chat_admini in ipairs (getElementsByType("player")) do
	        if getElementData(chat_admini, "loggedIn") == true then
	        if tonumber(getElementData(accSys:getPlayerAcc(chat_admini), "pAdmin")) >= 8 then
	      --  outputChatBox("#ff0000(ADM-Warn): #ffffff Admin #fc9803"..getPlayerName(thePlayer).."#ffffff Armor "..getPlayerName(find).." Ra Be#00ff00 "..value.."#ffffff Set Kard!", chat_admini, 208, 0, 15,true)
			end
			end
		end
			else
				outputChatBox("#EE0A0AMeghdar Armor Bayad Beyne (0-100) Bashad !", thePlayer, 255, 0, 0, true)
			end
		else
			outputChatBox("#A9C4E4Bezan : /setarmor <ID Or PartOfName> <Meghdar>", thePlayer, 255, 0, 0, true)
		end
	else
		outputChatBox("#EE0A0APlayer Morede Nazar Peyda Nashod !", thePlayer, 255, 0, 0, true)
	end
end)
--___________________________________________________________________________________________________________________--
--___________________________________________________________________________________________________________________--
--___________________________________________________________________________________________________________________--

function banp ( thePlayer, command, player, day, ... )
    if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 8 then
      return false
    end

    local find = miscSys:findPlayer ( player )
	local day = tonumber(day)
	local reason = table.concat( {...} , " ")
	if player then
		if find then
			local RankTaraf = tonumber(getElementData(accSys:getPlayerAcc(find), "pAdmin"))
			local RankKhodesh = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin"))
			if (RankKhodesh) > (RankTaraf) then
				if day then
					if day < 250 then
						if ... then
							for i,m in ipairs ( getElementsByType("player") ) do
								outputChatBox("#FF0000[Punishment]: Player #FFFFFF"..getPlayerName(find).."#FF0000 Tavasote Admin #FFFFFF"..getPlayerName(thePlayer).."#FF0000 Baraye #FFFFFF"..day.. "#FF0000 Roz Az Server Ban Shod, Dalil: #FFFFFF"..reason, m, 255, 255, 255, true)
							end
							setElementData(accSys:getPlayerAcc(find), "pBanTime", tonumber(day) == 0 and 999999 or tonumber(day*24))
							setElementData(accSys:getPlayerAcc(find), "pBannedBy", getPlayerName(thePlayer))
							setElementData(accSys:getPlayerAcc(find), "pBanReason", reason)
							local whyKicked = "Shoma Az Server Be Modat "..day.." Ban Shodid , Dalil: "..reason.." "-
							-- kickPlayer ( find,  tostring(whyKicked) )
							banPlayer(find,true,false,true,thePlayer,whyKicked,tonumber(day)* 86400)

						else
							outputChatBox("#EE0A0ADalil Ban Ra Vared Nakardid !", thePlayer, 255, 255, 255, true)
						end
					else
						outputChatBox("#EE0A0ATime Ban Bayad Beyne 1~250 Roz Bashad !", thePlayer, 255, 255, 255, true)
					end
				else
					outputChatBox("#EE0A0ATime Ban Ra Vared Konid !", thePlayer, 255, 255, 255, true)
				end
			else
				outputChatBox("#EE0A0ARanke Mosavi Va Bala Tar Az Khodeto Nemishe Ban Kard !", thePlayer, 255, 255, 255, true)
			end
		else
			outputChatBox("#EE0A0APlayer Peyda Nashod !", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#bababaBezan: /banp <PartOfName/ID> <Day> <Reason>", thePlayer, 255, 255, 255, true)
	end
end
addCommandHandler("banp", banp )
--==============================================================
--==================================================================================================
--============================================================================================
function banpp ( thePlayer, command, player, ... )
    if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 3 then

      return false
    end

    local find = miscSys:findPlayer ( player )

	local reason = table.concat( {...} , " ")
	if player then
		if find then
			local RankTaraf = tonumber(getElementData(accSys:getPlayerAcc(find), "pAdmin"))
			local RankKhodesh = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin"))
			if (RankKhodesh) > (RankTaraf) then

						if ... then
							for i,m in ipairs ( getElementsByType("player") ) do
								outputChatBox("#EA0E0E[Punishment]: Player "..getPlayerName(find).." Tavasote Admin "..getPlayerName(thePlayer).." Baraye Hamishe Az Server Ban Shod, Dalil: "..reason, m, 255, 255, 255, true)
							end
							setElementData(accSys:getPlayerAcc(find), "pBanTime", 99999999)
							setElementData(accSys:getPlayerAcc(find), "pBannedBy", getPlayerName(thePlayer))
							setElementData(accSys:getPlayerAcc(find), "pBanReason", reason)
							local whyKicked = "Shoma Baraye Hamishe Az Server Ban Shodid , Dalil: "..reason.." "
							kickPlayer ( find,  tostring(whyKicked) )
						else
							outputChatBox("#EE0A0ADalil Ban Ra Vared Nakardid !", thePlayer, 255, 255, 255, true)
						end

			else
				exports["notf"]:addNotification(thePlayer, "Mikahy High Rank Ban Konie??", 'warning')
			end
		else
			exports["notf"]:addNotification(thePlayer, "Player Not Found", 'error')
		end
	else
		exports["notf"]:addNotification(thePlayer, "Syntax: /banpp <PartOfName/ID>  <Reason>", 'info')
	end
end
addCommandHandler("banpp", banpp )
--==========================================================================================================
function banpadmin(thePlayer, command, player, ...)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 28 then
		return false
	end
	local find = miscSys.findPlayer ( player )
	local reason = table.concat( {...}, " " )
	local nam = getPlayerName(thePlayer)
	local name = getPlayerName(find)
	if player then
		if find then
			local Rankyaro = tonumber(getElementData(accSys:getPlayerAcc(find), "pAdmin"))
			local Magham = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin"))
			if (Rankyaro) < (Magham) then
				if tonumber(getElementData(accSys:getPlayerAcc(find), "pAdmin")) > 0 then
					if (Rankyaro) >= 3 then
						if (...) then
							setElementData(accSys:getPlayerAcc(find), "pAdmin", 0)
							setElementData(accSys:getPlayerAcc(find), "pBanTime", 10)
							setElementData(accSys:getPlayerAcc(find), "pBannedBy", nam)
							setElementData(accSys:getPlayerAcc(find), "pBanReason", reason)
							local whyKicked = "You were banned from the Neon Mta server and lost your admin rank Reason: "..reason" "
							kickPlayer (find, tostring(whyKicked))
							for i, m in ipairs(getElementsData("player")) do
								outputChatBox("#ff0000[Punishment]: Admin #FFFFFF"..name.." #FF0000Tavsote Management #FFFFFF"..nam.." #FF0000Az Rank Admin Demote Va Be Modat #FFFFFF10 Roz #FF0000 Az Server Ban Shod dalil: "..reason, m , 255, 255, 255, true)
							end
						end
					else
						exports["notf"]:addNotification(thePlayer, "Please enter the reason for the admin ban.", 'error')
					end
				else
					exports["notf"]:addNotification(thePlayer, "You are not allowed to ban management.", 'error')
				end
			else
				exports["notf"]:addNotification(thePlayer, "You are not allowed to ban management.", 'error')
			end
		else
			exports["notf"]:addNotification(thePlayer, "Player Not Found", 'error')
		end
	else
		exports["notf"]:addNotification(thePlayer, "Syntax: /banpadmin <id> <reason>", 'info')
	end
end
addCommandHandler("banpadmin", banpadmin)
--==========================================================================================================
function manage (thePlayer, command, player, adminid)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 29 then
		return false
	end
	local target = miscSys:findPlayer ( player )
	local RankPlayer = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin"))
	local rankplay = tonumber(getElementData(accSys:getPlayerAcc(target), "pAdmin"))
	if (RankPlayer) < (rankplay) then
		exports["notf"]:addNotification(thePlayer, "You cannot change the higher rank.", 'error')
	end
	if not player or not adminid then
		exports["notf"]:addNotification(thePlayer, "Syntax: /setrank <id> <rank level>", 'info')
	end
	local adminid = tonumber(adminid)
	if adminid <= 18 or adminid >=27 then
		exports["notf"]:addNotification(thePlayer, "Rank = 18 ~ 26", 'warning')
	end
	if player then
		if target then
			if tonumber(getElementData(accSys:getPlayerAcc(target), "pAdmin")) < 18 then
				setElementData(accSys:getPlayerAcc(target), "pAdmin", adminid)
				for k, chat_admini in ipairs(getElementsByType("player")) do
					if getElementData(chat_admini, "loggedIn") == true then
						if tonumber(getElementData(accSys:getPlayerAcc(chat_admini), "pAdmin")) > 17 then
							outputChatBox("#FFAE00[Management Join]: #FFFFFFPlayer #9B00FF"..getplayerName(target).." #FFFFFFSuccessfully by #9b00ff"..getPlayerName(thePlayer).." #FFFFFFCongratulations to the management team of Rank Above Server for their service", chat_admini, 255, 255, 255, true)
						end
					end
				end
			end
		else
			exports["notf"]:addNotification(thePlayer, "Player Not Found !", 'error')
		end
	end
end
addCommandHandler("setrank", manage)
--==========================================================================================================
function banadmin (thePlayer, command, player, ...)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 28 then
		return false
	end
	local find = miscSys:findPlayer ( player )
	local reason = table.concat({...} ," ")
	if player then
		if find then
			local Rankesh = tonumber(getElementData(accSys:getPlayerAcc(find), "pAdmin"))
			local Rank = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin"))
				if (Rankesh) < (Rank) then
						if (...) then
							if (Rankesh) <= 17 then
							local name = getPlayerName(find)
							local esm = getPlayerName(thePlayer)
							for i, m in ipairs(getElementsByType("player")) do
								outputChatBox("#FF0000[Punishment]: Admin #FFFFFF"..name.." #FF0000Tavasote Management #FFFFFF"..esm.." #FF0000 Be Modat #FFFFFFDeam #FF0000 Az Server Ban Shod Dalil: #FFFFFF"..reason, m, 255, 255, 255, true)
							end
							setElementData(accSys:getPlayerAcc(find), "pBanTime", 99999999)
							setElementData(accSys:getPlayerAcc(find), "pBannedBy", getPlayerName(thePlayer))
							setElementData(accSys:getPlayerAcc(find), "pBanReason", reason)
							setElementData(accSys:getPlayerAcc(find), "pAdmin", 0)
							local whyKicked = "You have been permanently banned from the Neon MTA server. Dalil: "..reason
							kickPlayer(find, tostring(whyKicked))
						else
							exports["notf"]:addNotification(thePlayer, "The ranks allowed for banning are from rank 1 to 17.", 'error')
						end
						else
							exports["notf"]:addNotification(thePlayer, "Enter the reason for the admin account.")
						end
					else
						exports["notf"]:addNotification(thePlayer, "You are not allowed to ban management.", 'error')
				end
			else
				exports["notf"]:addNotification(thePlayer, "Player Not Found", 'error')
		end
	else
		exports["notf"]:addNotification(thePlayer, "Syntax: /banadmin <id> <Reason>", 'info')
	end
end
addCommandHandler("banadmin", banadmin)
--==========================================================================================================

--[[addCommandHandler("banplayer",
function(thePlayer, cmd, preffe, roz, ...)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 1 then
		return false
	end
	if (preffe) then
		if (roz) then
			local reffeyarukemikhaddemoteshe = tonumber(preffe)
			local tedadroz = tonumber(roz)
			if ... then
			local reason = table.concat( {...} , " ")
			if tedadroz >= 0 and tedadroz < 200 then
					local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM users;" )
					local result, numrows = dbPoll(query, dbpTime)
					if (result and numrows > 0) then
						for index, row in pairs(result) do
							local IDeYaru = row['pID']
							local name = row['pName']
							if tonumber(IDeYaru) == tonumber(reffeyarukemikhaddemoteshe) then
							for i,m in ipairs ( getElementsByType("player") ) do
								outputChatBox("#EA0E0E[Tavajoh] : Player "..name.." Tavasote Admin "..getPlayerName(thePlayer).." Baraye "..roz.." Roz Az Server Ban Shod, Dalil: "..reason, m, 255, 255, 255, true)
							end
								local query = dbQuery(exports.mysql:getMySQLC(), "UPDATE `users` SET `pBanTime` = '"..tonumber(roz*24).."' WHERE `pID` = '"..tonumber(preffe).."'")
								dbFree(query)
								local query = dbQuery(exports.mysql:getMySQLC(), "UPDATE `users` SET `pBannedBy` = '"..getPlayerName(thePlayer).."' WHERE `pID` = '"..tonumber(preffe).."'")
								dbFree(query)
								local query = dbQuery(exports.mysql:getMySQLC(), "UPDATE `users` SET `pBanReason` = '"..reason.."' WHERE `pID` = '"..tonumber(preffe).."'")
								dbFree(query)
							end
						end
						dbFree(query)
					end
				end
			end
		end
	else
		outputChatBox("#babaBezan: /banplayer <Referral-ID> <Day> <Reason>", thePlayer, 255, 0, 0, true)
	end
end)]]
--===============================================================================================
function sban ( thePlayer, command, player, day, ... ) -- #
    if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 25 then
      
      return false
    end
	
    local find = miscSys:findPlayer ( player )
	local day = tonumber(day)
	local reason = table.concat( {...} , " ")
	if player then
		if find then
			local RankTaraf = tonumber(getElementData(accSys:getPlayerAcc(find), "pAdmin"))
			local RankKhodesh = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin"))
			if (RankKhodesh) > (RankTaraf) then
				if day then
					if day < 250 then
						if ... then
							for i,m in ipairs ( getElementsByType("player") ) do
							end
							outputChatBox("#00ff00"..name.." Ba Movafaghiat Ban Shod!", thePlayer, 255, 255, 255, true)
							setElementData(accSys:getPlayerAcc(find), "pBanTime", tonumber(day*24))
							setElementData(accSys:getPlayerAcc(find), "pBannedBy", getPlayerName(thePlayer))
							setElementData(accSys:getPlayerAcc(find), "pBanReason", reason)
							local whyKicked = "Shoma Az Server Be Modat "..day.." Ban Shodid , Dalil: "..reason.." "
							kickPlayer ( find,  tostring(whyKicked) )
						else
							outputChatBox("#EE0A0ADalil Ban Ra Vared Nakardid !", thePlayer, 255, 255, 255, true)
						end
					else
						outputChatBox("#EE0A0ATime Ban Bayad Beyne 1~250 Roz Bashad !", thePlayer, 255, 255, 255, true)
					end
				else
					outputChatBox("#EE0A0ATime Ban Ra Vared Konid !", thePlayer, 255, 255, 255, true)
				end
			else
				outputChatBox("#EE0A0ARanke Mosavi Va Bala Tar Az Khodeto Nemishe Ban Kard !", thePlayer, 255, 255, 255, true)
			end
		else
			outputChatBox("#EE0A0APlayer Peyda Nashod !", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#bababaBezan: /sban <PartOfName/ID> <Day> <Reason>", thePlayer, 255, 255, 255, true)
	end
end
addCommandHandler("sban", sban )
--___________________________________________________________________________________________________________________--_______________________________________________________________________________________________________________--
--___________________________________________________________________________________________________________________--
function muteplayers(thePlayer, command, player, daghighe, ...)
    if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 1 then
        return false
    end
	
    local find = miscSys:findPlayer(player)
    local daghighe = tonumber(daghighe)
    local reason = table.concat({...}, " ")
    
    if not player then
        outputChatBox("#bababaBezan: /mutep <PartOfName/ID> <Min> <Reason>", thePlayer, 255, 255, 255, true)
        return
    end
    
    if not find then
        outputChatBox("#EE0A0AChenin Playeri Dakhel Server Nmibashad !", thePlayer, 255, 255, 255, true)
        return
    end
    
    local RankTaraf = tonumber(getElementData(accSys:getPlayerAcc(find), "pAdmin")) or 0
    local RankKhodesh = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) or 0
    
    if RankKhodesh <= RankTaraf then
        outputChatBox("#EE0A0AShoma Ejaze Mute Kardane Ranke Bala Tar Az Khod Ra Nadarid !", thePlayer, 255, 255, 255, true)
        return
    end
    
    if not daghighe then
        outputChatBox("#EE0A0ATime Mute Ra Vared Konid !", thePlayer, 255, 255, 255, true)
        return
    end
    
    if daghighe <= 2 then
        outputChatBox("#EE0A0ATime Mute Bayad Bishtar Az 2 Daghighe Bashad !", thePlayer, 255, 255, 255, true)
        return
    end
    
    if daghighe > 10000 then
        outputChatBox("#EE0A0ATime Mute Bayad Beyne 1~10000 Daghighe Bashad !", thePlayer, 255, 255, 255, true)
        return
    end
    
    if not reason or reason == "" then
        outputChatBox("#EE0A0ADalil Mute Ra Vared Nakardid !", thePlayer, 255, 255, 255, true)
        return
    end
    
    local currentMuteTime = tonumber(getElementData(accSys:getPlayerAcc(find), "pMuteTime")) or 0
    if currentMuteTime > 0 then
        outputChatBox("#EE0A0AIn Player Dar Hale Hazer Mute Ast !", thePlayer, 255, 255, 255, true)
        return
    end
    
    local muteTimeMs = daghighe * 60 * 1000
    setPlayerMuted(find, true) 
    setElementData(find, "isMuted", true) 
    setElementData(accSys:getPlayerAcc(find), "pMuteTime", daghighe)
    setElementData(find, "pMuteTime", daghighe)
    if exports["[Neon]Voice"] then
        exports["[Neon]Voice"]:setPlayerMuted(find, true)
    end
    
    
    for i, m in ipairs(getElementsByType("player")) do
        outputChatBox("#FF0000[Punishment]: Player #FFFFFF"..getPlayerName(find).." #FF0000 Tavasote Admin #FFFFFF"..getPlayerName(thePlayer).." #FF0000 Baraye #FFFFFF"..daghighe.." #FF0000 Daghighe Mute Shod, Dalil: #FFFFFF"..reason, m, 255, 255, 255, true)
    end
    
    
    setTimer(function()
        if isElement(find) then
            setPlayerMuted(find, false)
            setElementData(find, "isMuted", false)
            setElementData(accSys:getPlayerAcc(find), "pMuteTime", 0)
            setElementData(find, "pMuteTime", 0)
            
            if exports["[Neon]Voice"] then
                exports["[Neon]Voice"]:setPlayerMuted(find, false)
            end
            
            outputChatBox("#00FF00[Tavajoh]: Mute Shoma Tamam Shod, Hala Mitavanid Chat Konid Va Seda Bedahid.", find, 255, 255, 255, true)
        end
    end, muteTimeMs, 1)
end
addCommandHandler("mutep", muteplayers)


addEventHandler("onPlayerChat", getRootElement(),
function(message, messageType)
    if messageType == 0 then
        local isMuted = getElementData(source, "isMuted") or false
        local muteTime = tonumber(getElementData(source, "pMuteTime")) or 0
        
        if isMuted or muteTime > 0 then
            outputChatBox("#FF0000Shoma Mute Hastid Va Nemitavanid Chat Konid! ("..muteTime.." Daghighe Baghi)", source, 255, 255, 255, true)
            cancelEvent()
        end
    end
end)


setTimer(function()
    for _, player in ipairs(getElementsByType("player")) do
        if getElementData(player, "loggedIn") then
            local muteTime = tonumber(getElementData(accSys:getPlayerAcc(player), "pMuteTime")) or 0
            if muteTime > 0 then
                local newMuteTime = muteTime - 1
                setElementData(accSys:getPlayerAcc(player), "pMuteTime", newMuteTime)
                setElementData(player, "pMuteTime", newMuteTime)
                
                if newMuteTime <= 0 then
                    setPlayerMuted(player, false)
                    setElementData(player, "isMuted", false)
                    
                    if exports["[Neon]Voice"] then
                        exports["[Neon]Voice"]:setPlayerMuted(player, false)
                    end
                    
                    outputChatBox("#00FF00[Tavajoh]: Mute Shoma Tamam Shod, Hala Mitavanid Chat Konid Va Seda Bedahid.", player, 255, 255, 255, true)
                end
            end
        end
    end
end, 60000, 0) 

--===========================================================================================================================
--[[addCommandHandler("muteplayer",
function(thePlayer, cmd, preffe, daghighe, ...)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 1 then
		return false
	end
	if (preffe) then
	if (daghighe) then
			local reffeyarukemikhaddemoteshe = tonumber(preffe)
			local daghighef = tonumber(daghighe)
			local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM users;" )
		    local result, numrows = dbPoll(query, dbpTime)
			if (result and numrows > 0) then
						for index, row in pairs(result) do
			local reason = table.concat( {...} , " ")
			if daghighef >= 1 and daghighef < 10000 then
				if ... then
							local IDeYaru = row['pID']
							local name = row['pName']
							if tonumber(IDeYaru) == tonumber(reffeyarukemikhaddemoteshe) then
							for i,m in ipairs ( getElementsByType("player") ) do
								outputChatBox("#EA0E0E[Tavajoh] : Player "..name.." Tavasote Admin "..getPlayerName(thePlayer).." Baraye "..daghighef.." Daghighe Offline Mute Shod, Dalil: "..reason, m, 255, 255, 255, true)
							end
								local query = dbQuery(exports.mysql:getMySQLC(), "UPDATE `users` SET `pMuteTime` = '"..daghighef.."' WHERE `pID` = '"..tonumber(preffe).."'")
						dbFree(query)
							end
						end
						dbFree(query)
					end
				end
			end
		end
	else
		outputChatBox("#bababaBezan: /muteplayer <Referral-ID> <Min> <Reason>", thePlayer, 255, 0, 0, true)
	end
end)]]



--[[function smuteplayers ( thePlayer, command, player, daghighe, ... ) -- #
    if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 25 then
      
      return false
    end
	
    local find = miscSys:findPlayer ( player )
	local daghighe = tonumber(daghighe)
	local reason = table.concat( {...} , " ")
	if player then
		if find then
			local RankTaraf = tonumber(getElementData(accSys:getPlayerAcc(find), "pAdmin"))
			local RankKhodesh = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin"))
			if (RankKhodesh) >= (RankTaraf) then
				if daghighe then
					if daghighe > 2 then
						if daghighe < 900 then
							if ... then
								if tonumber(getElementData(accSys:getPlayerAcc(find), "pMuteTime")) == 0 then
									for i,m in ipairs ( getElementsByType("player") ) do
									end
									outputChatBox("#00ff00Mute Shod!", thePlayer, 255, 255, 255, true)
									setElementData(accSys:getPlayerAcc(find), "pMuteTime", tonumber(daghighe))
									setElementData(find,"pMuteTime",tonumber(daghighe))
									exports.voice:setPlayerMuted( find, true )
								else
									outputChatBox("#EE0A0AIn Player Dar Hale Hazer Mute Ast !", thePlayer, 255, 255, 255, true)
								end
							else
								outputChatBox("#EE0A0ADalil Mute Ra Vared Nakardid !", thePlayer, 255, 255, 255, true)
							end
						else
							outputChatBox("#EE0A0ATime Mute Bayad Beyne 1~900 Daghighe Bashad !", thePlayer, 255, 255, 255, true)
						end
					else
						outputChatBox("#EE0A0ATime Mute Bayad Bishtar Az 2 Daghighe Bashad !", thePlayer, 255, 255, 255, true)
					end
				else
					outputChatBox("#EE0A0ATime Mute Ra Vared Konid !", thePlayer, 255, 255, 255, true)
				end
			else
				outputChatBox("#EE0A0AShoma Ejaze Mute Kardane Ranke Bala Tar Az Khod Ra Nadarid !", thePlayer, 255, 255, 255, true)
			end
		else
			outputChatBox("#EE0A0AChenin Playeri Dakhel Server Nmibashad !", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#bababaBezan: /smute <PartOfName/ID> <Min> <Reason>", thePlayer, 255, 255, 255, true)
	end
end
addCommandHandler("smute", smuteplayers )]]
--___________________________________________________________________________________________________________________--
--___________________________________________________________________________________________________________________--
function Unmuteplayers ( thePlayer, command, player ) -- #
    if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 28 then
      
      return false
    end
    local find = miscSys:findPlayer ( player )
	local daghighe = tonumber(daghighe)
	if player then
		if find then
			if tonumber(getElementData(accSys:getPlayerAcc(find), "pMuteTime")) ~= 0 then
				exports["[Neon]Voice"]:setPlayerMuted( find, false )
				setElementData(accSys:getPlayerAcc(find), "pMuteTime", 0)
				setElementData(find,"pMuteTime",0)
				setPlayerMuted(find,false)
				outputChatBox("#00ff00Admin "..getPlayerName(thePlayer).." Shoma Ro Unmute Kard !", find, 255, 255, 255, true)
				outputChatBox("#bababa(Unmute): #ffffffShoma #00C4EB"..getPlayerName(find).." #ffffffRa #00ff00Unmute #ffffffKardid !", thePlayer, 255, 255, 255, true)
				for i,m in ipairs ( getElementsByType("player") ) do
					if getElementData(chat_admini, "loggedIn") == true then
					if tonumber(getElementData(accSys:getPlayerAcc(m), "pAdmin")) > 8 then
						outputChatBox("#9b00ff[ADM-Warn]: #ffffff Admin #9B00FF"..getPlayerName(thePlayer).." #FFFFFFPlayer #9b00ff"..getPlayerName(find).." #ffffffRa #FF0000Unmute #ffffffKard", m, 255, 255, 255, true)
					end
				end
				end
			else
				exports["notf"]:addNotification(thePlayer, "This player is not muted.", 'error')
			end
		else
			exports["notf"]:addNotification(thePlayer, "Player Not Found", 'error')
		end
	else
		exports["notf"]:addNotification(thePlayer, "Syntax: /unmutep <id>", 'info')
	end
end
addCommandHandler("unmutep", Unmuteplayers )
--___________________________________________________________________________________________________________________--
--___________________________________________________________________________________________________________________--
function kickp ( thePlayer, command, player, ... )
    if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 8 then
      return false
    end
    local find = miscSys:findPlayer ( player )
	local reason = table.concat( {...} , " ")
	if player then
		if find then
			local RankTaraf = tonumber(getElementData(accSys:getPlayerAcc(find), "pAdmin"))
			local RankKhodesh = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin"))
			if (RankKhodesh) > (RankTaraf) then
				if ... then
					for i, m in ipairs(getElementsByType("player")) do
						outputChatBox("#FF0000[Punishment]: Player #FFFFFF"..getPlayerName(find).." #FF0000 Tavasote Admin #FFFFFF"..getPlayerName(thePlayer).." #FF0000Az Server Kick Shod Dalil: #FFFFFF"..reason, m, 255, 255, 255, true)
					end
				
					kickPlayer ( find, thePlayer, reason )
				else
					exports["notf"]:addNotification(thePlayer, "Enter Kick Reason!", 'error')
				end
			else
				exports["notf"]:addNotification(thePlayer, "You are not allowed to kick a higher rank.", 'error')
			end
		else
			exports["notf"]:addNotification(thePlayer, "Player Not Found", ' error')
		end
	else
		exports["notf"]:addNotification(thePlayer, "Syntax: /kickp <id> <reason>", 'info')
	end
end
addCommandHandler("kickp", kickp )
--___________________________________________________________________________________________________________________--
--___________________________________________________________________________________________________________________--
--[[function silentKick ( thePlayer, command, player, ... )
    if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 25 then
      
      return false
    end
    local find = miscSys:findPlayer ( player )
	local reason = table.concat( {...} , " ")
	if player then
		if find then
			if ... then
				local RankTaraf = tonumber(getElementData(accSys:getPlayerAcc(find), "pAdmin"))
				local RankKhodesh = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin"))
				if (RankKhodesh) > (RankTaraf) then
					for i, m in pairs( getElementsByType 'player' ) do
						if tonumber(getElementData(accSys:getPlayerAcc(m), "pAdmin")) > 1 then
						--s	outputChatBox("#ff0000(ADM-Warn): #ffffff Admin #fc9803"..getPlayerName(thePlayer).." #ffffff"..getPlayerName(find).." #ffffffRa Be Dalil #F05731 "..reason.."#ffffff Silent Kick Kard !", m, 255, 255, 255, true)
						end
					end
		
					kickPlayer ( find, thePlayer, reason )
					
				else
					outputChatBox("#EE0A0AShoma Ejaze Kick Kardane Ranke Bala Tar Az Khod Ra Nadarid!", thePlayer, 255, 255, 255, true)
				end
			else
				outputChatBox("#EE0A0ADalil Kick Ra Vared Nakardid!", thePlayer, 255, 255, 255, true)
			end
		else
			outputChatBox("#EE0A0AChenin Playeri Dakhel Server Nmibashad !", thePlayer, 255, 255, 255, true)
		end
    else
		outputChatBox("#bababaBezan: /skick <PartOfName/ID> <Reason>", thePlayer, 255, 255, 255, true)
    end
end
addCommandHandler("skick", silentKick )]]
--___________________________________________________________________________________________________________________--
--___________________________________________________________________________________________________________________--
function kickall ( thePlayer, command, ... )
    if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) ~= 14 then
      
      return false
    end
	local reason = table.concat( {...} , " ")
	if ... then
		outputChatBox("#00ff00Tamami Player Haye Server Be Dalil "..reason.." Kick Shodand !", thePlayer, 255, 255, 255, true)
		for i,m in ipairs ( getElementsByType("player") ) do
			if getPlayerName(m) ~= getPlayerName(thePlayer) then
				kickPlayer ( m, thePlayer, reason )
			end
		end
	else
		outputChatBox("#bababaBezan: /kickall <Reason>", thePlayer, 255, 255, 255, true)
    end
end
addCommandHandler("kickall", kickall )

--[[function kickall ( thePlayer, command, ... )
    if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin"))  < 18 then
      return false
    end
	local reason = table.concat( {...} , " ")
	if ... then
		outputChatBox("#00ff00All Player Kicked , Reason : "..reason.."", thePlayer, 255, 255, 255, true)
		for i,m in ipairs ( getElementsByType("player") ) do
			if getPlayerName(m) ~= getPlayerName(thePlayer) then
				kickPlayer ( m, thePlayer, reason )
			end
		end
	else
		outputChatBox("#E3E3E3Bezan: /kickall <Reason>", thePlayer, 255, 255, 255, true)
    end
end
addCommandHandler("kickall", kickall )]]
--___________________________________________________________________________________________________________________--
--___________________________________________________________________________________________________________________--
function getVehicleOwners(thePlayer)
	if getElementData(accSys:getPlayerAcc(thePlayer),"pAdmin") >= 1 then
		if isPedInVehicle(thePlayer) then
			local khodro = getPedOccupiedVehicle(thePlayer)
			if getElementData(khodro,"owner") then
				outputChatBox("#bababaOwner In Veh : #00ff00"..getElementData(khodro,"owner").."",thePlayer,255,255,255,true)
			else
				exports["notf"]:addNotification(thePlayer, "This car has no owner.", 'error')
			end
		else
			exports["notf"]:addNotification(thePlayer, "You must be in the car", 'error')
		end
	else
		exports["notf"]:addNotification(thePlayer, "Access Denied !", 'error')
	end
end
addCommandHandler("getowner",getVehicleOwners)	
--___________________________________________________________________________________________________________________--
function createVehicleForPlayers( thePlayer, command, target, vehID )
	if getElementData(accSys:getPlayerAcc(thePlayer),"pAdmin") > 1 then
		local taraf = miscSys:findPlayer(target)
		if target then
			if taraf then
				if vehID then
					local x,y,z = getElementPosition(taraf)
					local xx,yy,zz = getElementRotation(taraf)
					local theVehicle = createVehicle(tonumber(vehID),x,y+1,z)
					setElementRotation(theVehicle,xx,yy,zz)
					setElementData(theVehicle,"PrivateVehicle",true)
					setElementData(theVehicle,"PrivateVehicleOwner",getPlayerName(taraf))
					warpPedIntoVehicle(taraf,theVehicle)
					setVehicleLocked ( theVehicle, true )
					
					outputChatBox("#00ff00Privete Veh '"..getPlayerName(taraf).."' Ba ID ("..vehID..") Spawn Shod!",thePlayer,205,205,205,true)
				
				else
					exports["notf"]:addNotification(thePlayer, "Syntax: /pveh <id> <veh id>", 'info')
				end
			else
				exports["notf"]:addNotification(thePlayer, "Player Not Found", 'error')
			end
		else
			exports["notf"]:addNotification(thePlayer, "Syntax: /pveh <id> <veh id>", 'info')
		end
	else
		exports["notf"]:addNotification(thePlayer, "Access Denied!", 'error')
	end
	for i, m in ipairs(getElementsByType("player")) do
		if getElementData(chat_admini, "loggedIn") == true then
			if tonumber(getElementData(accSys:getPlayerAcc(chat_admini), "pAdmin")) > 0 then
				outputChatBox("#9B00FF[Admin System]: #FFFFFFPlayer #9b00ff"..getPlayerName(thePlayer).." #FFFFFFSpowned Private Vehicle#FF0000!!", m, 255, 255, 255, true)
			end
		end
	end
end
addCommandHandler("pveh", createVehicleForPlayers)

function onPlayerVehicleExit ( vehicle, seat, jacked )
for index,vehicles in ipairs(getElementsByType("vehicle")) do 
		local veh_owneri = getElementData(vehicles, "PrivateVehicle")
    if getElementData(vehicles,"PrivateVehicleOwner") then
	destroyElement( vehicles )
	end
end
end

addEventHandler ( "onPlayerVehicleExit", getRootElement(), onPlayerVehicleExit )
--============================================================================================================================================
addCommandHandler("dvp",
	function ( thePlayer, _, player )
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 1 then
			outputChatBox("#ff0000Error:#12F20B Access Denied!", thePlayer, 255, 255, 255, true)
			return false
		end

		local find = miscSys:findPlayer ( player )
		if player then
		if find then
				outputChatBox("#00ff00Shoma Private-Veh Haye '"..getPlayerName(find).."' Ra Destroy Kardid!",thePlayer,205,205,205,true)
				
				for index,vehicles in ipairs(getElementsByType("vehicle")) do
					if getElementData(vehicles,"PrivateVehicleOwner") == getPlayerName(find) then
						destroyElement(vehicles)
					end
				end
		else
			outputChatBox("#ff0000Player Yaft Nashod !", thePlayer, 205, 205, 205, true)
		end
		else
		 outputChatBox("Bezan: /dvp <PartOfName/ID>", thePlayer, 205, 205, 205, true)
		end
	end
)

--___________________________________________________________________________________________________________________--
addCommandHandler("dvpall",
function(thePlayer, cmd)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 25 then
		
		return false
	end
	for index,vehicles in ipairs(getElementsByType("vehicle")) do 
		local veh_owneri = getElementData(vehicles, "PrivateVehicle")
		if getElementData(vehicles,"PrivateVehicleOwner") then
			setVehicleEngineState(vehicles, false)
			setTimer(
			function ()
				destroyElement( vehicles )
			end , 500, 1)
		end
	end
	outputChatBox("#bababa(Private): #ffffffShoma Tamami'e #00ff00Mashin #ffffffHaye Private Ra #ff0000Pak #ffffffKardid !", thePlayer, 255, 255, 255, true)
end
)
--___________________________________________________________________________________________________________________--
--___________________________________________________________________________________________________________________--
--___________________________________________________________________________________________________________________--

--> Kam Shodan Saat Premium Va Color Name Va Ban Time Va Mute Time <--
local dbpTime = 500
setTimer (function(id, value)
			
			local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM users;" )
			local result, numrows = dbPoll(query, dbpTime)
			for index, row in pairs(result) do
				local myID = row["pID"]
				local MandeGold = row["pGoldPremium"]
				local MandeSilver = row["pSilverPremium"]
				local MandeBronze = row["pBronzePremium"]
				local MandeColorName = row["pColorNameTime"]
				local MandeBanTime = row["pBanTime"]
				local MandeBuyCarTime = row["pTimeBuyVeh"]
				local ForumTime = row["pForum"]
				
				--> Gold <--
				if MandeGold > 0 then
					local PremiumGold = row["pGoldPremium"]-1
					local query1 = dbQuery(exports.mysql:getMySQLC(), "UPDATE `users` SET `pGoldPremium` = ? WHERE `pID` = '"..myID.."'",PremiumGold)
					dbFree(query1)
				end
				--> Silver <--
				if MandeSilver > 0 then
					local PremiumSilver = row["pSilverPremium"]-1
					local query2 = dbQuery(exports.mysql:getMySQLC(), "UPDATE `users` SET `pSilverPremium` = ? WHERE `pID` = '"..myID.."'",PremiumSilver)
					dbFree(query2)
				end
				--> Bronze <--
				if MandeBronze > 0 then
					local PremiumBronze = row["pBronzePremium"]-1
					local query3 = dbQuery(exports.mysql:getMySQLC(), "UPDATE `users` SET `pBronzePremium` = ? WHERE `pID` = '"..myID.."'",PremiumBronze)
					dbFree(query3)
				end
				--> ColorName Time <--
				if MandeColorName > 0 then
					local ColorName = row["pColorNameTime"]-1
					local query4 = dbQuery(exports.mysql:getMySQLC(), "UPDATE `users` SET `pColorNameTime` = ? WHERE `pID` = '"..myID.."'",ColorName)
					dbFree(query4)
				end
				--> Ban Time <--
				if MandeBanTime > 0 then
					local BanTime = row["pBanTime"]-1
					local query5 = dbQuery(exports.mysql:getMySQLC(), "UPDATE `users` SET `pBanTime` = ? WHERE `pID` = '"..myID.."'",BanTime)
					dbFree(query5)
				end
				--> Buy Car Time <--
				if MandeBuyCarTime  then
				if MandeBuyCarTime > 0 then
					local TimeBuyCar = row["pTimeBuyVeh"]-1
					local query8 = dbQuery(exports.mysql:getMySQLC(), "UPDATE `users` SET `pTimeBuyVeh` = ? WHERE `pID` = '"..myID.."'",TimeBuyCar)
					dbFree(query8)
				end
				end
				--> Forum Time Bere <--
				if ForumTime < 60 then
					local sefr = 0
					local query6 = dbQuery(exports.mysql:getMySQLC(), "UPDATE `users` SET `pForum` = ? WHERE `pID` = '"..myID.."'",sefr)
					dbFree(query6)
				end
				if ForumTime >= 60 then
					local ForumTimeBere = row["pForum"]-60
					local query7 = dbQuery(exports.mysql:getMySQLC(), "UPDATE `users` SET `pForum` = ? WHERE `pID` = '"..myID.."'",ForumTimeBere)
					dbFree(query7)
				end
			end
			--------

end, 3600000, 0)

--> Mute Time
setTimer ( function ()
	for i,m in ipairs ( getElementsByType("player") ) do
		if getElementData(m, "loggedIn") == true then
			if tonumber(getElementData(accSys:getPlayerAcc(m), "pMuteTime")) >= 1 then -- Mute Time Bere
				local MuteTimesh = getElementData(accSys:getPlayerAcc(m), "pMuteTime")
				local KamSheMuteTime = tonumber(MuteTimesh) - 1
				setElementData(accSys:getPlayerAcc(m), "pMuteTime", tonumber(KamSheMuteTime))
				setElementData(m,"pMuteTime",tonumber(KamSheMuteTime))
				if tonumber(getElementData(accSys:getPlayerAcc(m), "pMuteTime")) == 2 then
					exports.voice:setPlayerMuted( m, false )
				end
				if KamSheMuteTime == 0 or KamSheMuteTime < 1 then
					setPlayerMuted(find,false)
				end
			end
			if tonumber(getElementData(accSys:getPlayerAcc(m), "pForum")) >= 1 then -- Time Mahromiate Forum Bere
				local ForumTimesh = getElementData(accSys:getPlayerAcc(m), "pForum")
				local KamSheForumTime = tonumber(ForumTimesh) - 1
				setElementData(accSys:getPlayerAcc(m), "pForum", tonumber(KamSheForumTime))
			end
		end
	end
end, 60000, 0)

--function ChatBoxUnmute (thePlayer)
	--outputChatBox("#00ff00 Shoma Unmute Shodid.", thePlayer, 212, 156, 49,true)
--end
--___________________________________________________________________________________________________________________--
--___________________________________________________________________________________________________________________--
addCommandHandler("unban",
function(thePlayer, cmd, preffe)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 27 then
		
		return false
	end
	if (preffe) then
		local reffeyarukemikhaddemoteshe = tonumber(preffe)
		local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM users;" )
		local result, numrows = dbPoll(query, dbpTime)
		if (result and numrows > 0) then
			for index, row in pairs(result) do
				local IDeYaru = row['pID']
				if tonumber(IDeYaru) == tonumber(reffeyarukemikhaddemoteshe) then
					local name = row['pName']
					local BanTime = row['pBanTime']
					if tonumber(BanTime) >= 1 then
						exports["notf"]:addNotification(thePlayer, "Player "..name.." Ba Movafaghiat Unban Shod !" , 'success')
						local sefr = 0
						local query = dbQuery(exports.mysql:getMySQLC(), "UPDATE `users` SET `pBanTime` = '"..tonumber(sefr).."' WHERE `pID` = '"..tonumber(preffe).."'")
						dbFree(query)
						local query = dbQuery(exports.mysql:getMySQLC(), "UPDATE `users` SET `pBannedBy` = '"..tonumber(sefr).."' WHERE `pID` = '"..tonumber(preffe).."'")
						dbFree(query)
						local query = dbQuery(exports.mysql:getMySQLC(), "UPDATE `users` SET `pBanReason` = '"..tonumber(sefr).."' WHERE `pID` = '"..tonumber(preffe).."'")
						dbFree(query)
						bans = getBans()
						for i,d in ipairs(bans) do
							if getBanNick(d) == row["pName"] or getBanSerial(d) == row["pSerial"]  then 
								removeBan(d)
								break
							end
						end

						triggerClientEvent ( thePlayer, "PlayMovafagh", thePlayer)
					end
					if tonumber(BanTime) < 1 then
						exports["notf"]:addNotification(thePlayer, "In Player Az Server Ban Nashode Ast !" , 'error')
						triggerClientEvent ( thePlayer, "PlayError", thePlayer)
					end
				end
			end
			dbFree(query)
		end
	else
		exports["notf"]:addNotification(thePlayer, "Syntax: /unban <Refreal>", 'error')
	end
end)

--=============================================================================================================
addCommandHandler("fdemote",
function ( thePlayer, command, player, fp )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 21 then
		
		return false
	end
	local find = miscSys:findPlayer ( player )
	if player then
		if find then
			fp = tonumber( fp)
			if fp then
				if fp >= 0 and fp < 250 then
					local factionID = tonumber(getElementData(accSys:getPlayerAcc(find), "pMember"))
					if factionID > 0 then
						local targetPlayer = getPlayerName ( find )
						setElementData(accSys:getPlayerAcc(find), "pMember", 0)
						setElementData(accSys:getPlayerAcc(find), "pRank", 0)
						setElementData(accSys:getPlayerAcc(find), "pFwarn", 0)
						setElementData(accSys:getPlayerAcc(find), "pFacHoghogh", 0)
						setElementData(accSys:getPlayerAcc(find), "pJoinFaction", 0)
						setElementData(accSys:getPlayerAcc(find), "fSkin", 0)
						setElementData(accSys:getPlayerAcc(find), "pPunish", fp)
						setElementData(find, "pFactionscore", 0)
						setPlayerNametagColor ( find, 255, 255, 255 )
						setElementModel(find, tonumber(getElementData(accSys:getPlayerAcc(find), "cSkin")))
						outputChatBox("#bababa(Demote): #ffffffShoma Leader #00FFFF"..targetPlayer.." #ffffffRa Ba #F05731"..fp.." #ffffffFp Be Az Faction Demote Kardid !", thePlayer, 0, 255, 0, true)
						outputChatBox("#EA0E0E[Tavajoh]: Shoma Tavasote Admin "..getPlayerName(thePlayer).." Ba "..fp.." Fp Az Faction Khod Ekhraj Shodid !", find, 255, 0, 255, true)
						triggerClientEvent("toggleFcPanelForAbuse", find, find)
						if factionID >= 1 and factionID < 4 then
							takeAllWeapons ( find )
							setPedArmor(find, 0)
						end
						if tonumber(getElementData(accSys:getPlayerAcc(find), "Ptut")) == 1 then
							setElementData(accSys:getPlayerAcc(find), "pTut", 0)
						end
						local vehicle = getPedOccupiedVehicle(find)
						if vehicle then
							removePedFromVehicle( find )
							local x,y,z = getElementPosition(find)
							setElementPosition ( find, x,y,z+2 )
						end
					else
						outputChatBox("#EE0A0AIn Player Faction Nadarad !", thePlayer, 255, 255, 255, true)
					end
				else
					outputChatBox("#EE0A0AHadaksare Fp Mojaz 250 Bashad !", thePlayer, 255, 255, 255, true)
				end
			else
				outputChatBox("#EE0A0ATedade Fp Ra Vared Konid !", thePlayer, 255, 255, 255, true)
			end
		else
			outputChatBox("#EE0A0AChenin Playeri Dakhel Server Nmibashad !", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#bababaBezan: /fdemote <PartOfName/ID> <Tedad-FP>", thePlayer, 255, 22, 22, true)
	end
end)

function FalseCommandNotLog () -- #
	if getElementData(source, "loggedIn") ~= true then
		cancelEvent()
	end
end
addEventHandler("onPlayerCommand", root, FalseCommandNotLog)

addCommandHandler("shop",
function(thePlayer)
	exports["notf"]:addNotification(thePlayer, "Neon MTA Shop", 'info')
	for i=1, 5 do 
		outputChatBox(" ", thePlayer, 255, 255, 255, true)
	end
	outputChatBox("#9304FF_____________________________#FFD000-=[#0095FFNE#9900FFON#FFFFFF #00FFE1Shop#FFD000]=-#9304FF______________________________", thePlayer, 255, 255, 255, true)
	outputChatBox("#FFFFFFGhaymat #FFAE00Gold #FFFFFFServer #9304FFNeon", thePlayer, 255, 255, 255, true)
	outputChatBox("#9304FFNeon Shop:#ff1010 250 #ffffffAddad #00FFFFNeon Coin #FFFFFF: #FFAE005#FFFFFF,#FFAE00000 #ffffffToman", thePlayer, 255, 255, 255, true)
	outputChatBox("#9304FFNeon Shop:#ff1010 500 #ffffffAddad #00FFFFNeon Coin #FFFFFF: #FFAE0010#FFFFFF,#FFAE00000 #ffffffToman ", thePlayer, 255, 255, 255, true)
	outputChatBox("#9304FFNeon Shop:#ff1010 1000 #ffffffAddad #00FFFFNeon Coin #FFFFFF: #FFAE0020#FFFFFF,#FFAE00000 #ffffffToman", thePlayer, 255, 255, 255, true)
	outputChatBox("#9304FFNeon Shop:#ff1010 2000 #ffffffAddad #00FFFFNeon Coin #FFFFFF: #FFAE0038#FFFFFF,#FFAE00000 #ffffffToman", thePlayer, 255, 255, 255, true)
	outputChatBox("#9304FFNeon Shop:#ff1010 5000 #ffffffAddad #00FFFFNeon Coin #FFFFFF: #FFAE0090#FFFFFF,#FFAE00000 #ffffffToman ", thePlayer, 255, 255, 255, true)
	outputChatBox("#9304FFNeon Shop:#ff1010 8000 #ffffffAddad #00FFFFNeon Coin #FFFFFF: #FFAE00130#FFFFFF,#FFAE00000 #ffffffToman ", thePlayer, 255, 255, 255, true)
	outputChatBox("#9304FFNeon Shop:#ff1010 10000+1000 #ffffffAddad #00FFFFNeon Coin #FFFFFF: #FFAE00170#FFFFFF,#FFAE00000 #ffffffToman", thePlayer, 255, 255, 255, true)
	outputChatBox("#9304FFNeon Shop:#ff1010 20000+5000 #ffffffAddad #00FFFFNeon Coin #FFFFFF: #FFAE00300#FFFFFF,#FFAE00000 #ffffffToman", thePlayer, 255, 255, 255, true)
	outputChatBox("#9304FFNeon Shop: #FFFFFF Baraye Kharide #00FFFFNeon Coin #FFFFFFBe Telegram #FF0000@Vectorpy1212 #FFFFFFMoraj'e Konid", thePlayer,  255, 255, 255, true)
	outputChatBox("#9304FF______________________________________________________________________", thePlayer, 255, 255, 255, true)
	for i = 1, 5 do
		outputChatBox(" ", 255, 255, 255, true)
	end
end)
--=====================================================================================================================================




--=================================================================================================================
addCommandHandler("takemoney",
	function ( thePlayer, _, player, amount )
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 27 then
			return false
		end
		local find = miscSys:findPlayer ( player )
		if player then
		if find then
		if amount then
			if tonumber(amount) > getPlayerMoney(find) then
				outputChatBox("#EE0A0APlayer In Meghdar Pol Toye Jibesh Nist !", thePlayer, 255, 255, 255, true)
				return false
			end
				local targetName = getPlayerName ( find )
				takePlayerMoney( find, tonumber( amount ) )
				outputChatBox("#bababa(Money): #ffffffShoma Az #F05731"..targetName.." #ffffffMeghdar #00ff00$"..amount.." #ffffffPool Take Kardid !", thePlayer, 0, 255, 0, true)
				outputChatBox("#EA0E0EAdmin "..getPlayerName(thePlayer).." Az Shoma "..convertNumber( amount ).." Pool Take Kard !", find, 0, 255, 0, true)
				
			for k, chat_admini in ipairs (getElementsByType("player")) do
	        if getElementData(chat_admini, "loggedIn") == true then
	        if tonumber(getElementData(accSys:getPlayerAcc(chat_admini), "pAdmin")) >= 13 then
	        outputChatBox("#F05731[Admin-Warn] :#ffffff Admin #00FFFF"..getPlayerName(thePlayer).." #ffffffAz Player #F05731"..targetName.." #ffffffMeghdar #00ff00"..amount.." #ffffffMoney Take Kard !", chat_admini, 208, 0, 15,true)
	end
	end
	end
			else
				outputChatBox("#EE0A0AMeghdar Pool Ra Vared Konid !", thePlayer, 255, 255, 255, true)
			end
			else
				outputChatBox("#EE0A0AChenin Playeri Dakhel Server Nmibashad !", thePlayer, 255, 255, 255, true)
			end
		else
			outputChatBox("#C0C0C0Bezan: /takemoney <PartOfName/ID> <Meghdar>", thePlayer, 255, 0, 0, true)
		end
	end
)
--=====================================================================================================================================
addCommandHandler("up",
function (thePlayer, command, posZ)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 1 then

		return false
	end
	local posZ = tonumber(posZ)
	local theVehicle = getPedOccupiedVehicle ( thePlayer )
	local x , y , z = getElementPosition(thePlayer)
	local myVehicle = getPedOccupiedVehicle ( thePlayer )
	if posZ then
		setElementPosition(thePlayer, x , y , z + posZ )
		outputChatBox("#bababa(Up): #ffffffShoma Meghdar#00ff00 "..posZ.." #ffffffUp Shodid !", thePlayer, 255, 255, 255, true)
	else
		outputChatBox("#bababaBezan : /up <Meghdar>", thePlayer, 255, 255, 255, true)
		
	end
end)
--==============================================================================================================================
addCommandHandler("vup",
function (thePlayer, command, posZ)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 1 then
		
		return false
	end
	local posZ = tonumber(posZ)
	local theVehicle = getPedOccupiedVehicle ( thePlayer )
	local x , y , z = getElementPosition(thePlayer)
	local myVehicle = getPedOccupiedVehicle ( thePlayer )
	if posZ then
	if isPedInVehicle (thePlayer) then
		setElementPosition ( theVehicle, x , y, z + posZ )
		setElementPosition(thePlayer, x , y , z + posZ )
		outputChatBox("#bababa(Vup): #ffffffShoma Meghdar#00ff00 "..posZ.." #ffffffVup Shodid !", thePlayer, 255, 255, 255, true)
	else
	    outputChatBox("#ff0000Baraye Anjam In Kar Bayad Dakhel Mashin Bashid !", thePlayer, 255, 255, 255, true)
	end
	else
		outputChatBox("#bababaBezan : /Vup <Meghdar>", thePlayer, 255, 255, 255, true)
		
	end
end)
--==============================================================================================================================
--[[addCommandHandler("fakecmd",
function ( thePlayer, command, player, cmd, arg1, arg2 ,arg3 ,arg4)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 14 then
		return false
	end
		local find = miscSys:findPlayer ( player )
		if find then
		local cmd = cmd
			if cmd then
				local arg1 = arg1
					if arg1 then
						local arg2 = arg2
						if arg2 then
							local arg3 = arg3
								if arg3 then
									local arg4 = arg4
										if arg4 then
										executeCommandHandler ( cmd, find,arg1,arg2,arg3,arg4 )
										else
										executeCommandHandler ( cmd, find,arg1,arg2,arg3 )
										end
								else
								executeCommandHandler ( cmd, find,arg1,arg2 )
								end
						else
						executeCommandHandler ( cmd, find,arg1 )
						end
					else
					executeCommandHandler ( cmd, find )
				end
			end
		end	
end)]]

addCommandHandler("ertefa",
function ( thePlayer, command ,value)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 1 then
		
		return false
	end
	if value then
		local value = tonumber(value)
		local myVehicle = getPedOccupiedVehicle ( thePlayer )
		if myVehicle then
			setVehicleHandling(myVehicle, "suspensionLowerLimit", value)
		else
			outputChatBox("#EE0A0ABaraye Inkar Bayad Dakhel Mashin Bashid !", thePlayer, 255, 0, 0, true)
		end
	else
		outputChatBox("#A9C4E4Bezan: /ertefa <Value>", thePlayer, 255, 0, 0, true)
	end
end)
--=====================================================================================================================================


--[[addCommandHandler("refferallist",
function(thePlayer, cmd)
	local reffetaraf = getElementData(accSys:getPlayerAcc(thePlayer), "pID")
	local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM users;" )
	local result, numrows = dbPoll(query, dbpTime)
	outputChatBox("#bababaKasani Ke Ba Refferal Shoma Vared Server Shode And :", thePlayer, 255, 255, 255, true)
	if (result and numrows > 0) then
		setElementData(thePlayer,"reffsnumber",1)
		for index, row in pairs(result) do
			local id = row['pReferral']
			if id == reffetaraf then
				local name = row['pName']
				outputChatBox("#00FFFF["..getElementData(thePlayer,"reffsnumber").."]:#8FBC8F "..name, thePlayer, 255, 255, 255, true)
				local chanta = getElementData(thePlayer,"reffsnumber")
				local chantabadi = tonumber(chanta) + 1
				setElementData(thePlayer,"reffsnumber",chantabadi)
			end
		end
		setElementData(thePlayer,"reffsnumber",nil)
		dbFree(query)
	end
end)]]

addCommandHandler("goldall",
function ( thePlayer, command, tedad)
	if getElementData(thePlayer, "loggedIn") == true then
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) ~= 30 then
			outputChatBox("#EE0A0AShoma Dastresi Be In Dastoor Ra Nadarid !", thePlayer, 255, 255, 255, true)
			return false
		end
		if tedad then
		for k, hame_Playera	in ipairs (getElementsByType("player")) do	
			if getElementData(hame_Playera, "loggedIn") == true then
				local tedad = tonumber(tedad)
				setElementData(accSys:getPlayerAcc(hame_Playera), "pGold", tonumber(getElementData(accSys:getPlayerAcc(hame_Playera), "pGold")) + tonumber(tedad))
				outputChatBox("#FFAE00[Gold] : #FF0000 "..getPlayerName(thePlayer).." #ffffffBe Tamamie Player Haye Online Nafari #FFAE00"..tedad.." #ffffffGold Dad !", hame_Playera, 255, 255, 255, true)
			end
		end
		else
			outputChatBox("#C0C0C0Bezan: /goldall <Tedad>", thePlayer, 255, 255, 255, true)
		end
	end
end)
--============================================================================================================================================
addCommandHandler("rpall",
function ( thePlayer, command, tedad)
	if getElementData(thePlayer, "loggedIn") == true then
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) ~= 30 then
			return false
		end
		if tedad then
		for k, hame_Playera	in ipairs (getElementsByType("player")) do	
			if getElementData(hame_Playera, "loggedIn") == true then
				local tedad = tonumber(tedad)
				setElementData(accSys:getPlayerAcc(hame_Playera), "pRob", tonumber(getElementData(accSys:getPlayerAcc(hame_Playera), "pRob")) + tonumber(tedad))
				outputChatBox("#00ff00[Tavajoh] :#ffffff Admin #1BAEE1"..getPlayerName(thePlayer).." #ffffffBe Tamamie Player Haye Online Nafari #00ff00"..tedad.." #ffffffRob Point Dad !", hame_Playera, 255, 255, 255, true)
			end
		end
		else
			outputChatBox("#C0C0C0Bezan: /rpall <Tedad>", thePlayer, 255, 255, 255, true)
		end
	end
end)

--============================================================================================================================================
addCommandHandler ( "setpelak",
function ( thePlayer, command, plate)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 25 then
		outputChatBox("#EE0A0ADastresi Be In Dastor Baraye Shoma Maghdor Nmibashad !", thePlayer, 255, 255, 255, true)
		return false
	end
	if isPedInVehicle (thePlayer) then
		if (plate == nil) then
			outputChatBox("#ff0000Bezan: /"..command.." <Pelak>", thePlayer, 255, 255, 255, true)
		else
			local veh = getPedOccupiedVehicle (thePlayer)
			local oldplate = getVehiclePlateText ( veh )
			setVehiclePlateText( veh, plate )
			outputChatBox("#bababaPelak Vehicle Be #7FFF00("..plate..") #bababaTaghir Yaft ! ", thePlayer, 0, 255, 0,true)
		end
	else
		outputChatBox("#EE0A0ABaraye inkar Bayad Savar Mashin Bashid !", thePlayer, 255, 255, 255, true)
	end
end)

addCommandHandler("sex",
function (thePlayer,command,pname)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) ~= 30 then
		outputChatBox("#EE0A0ADastresi Be In Dastor Baraye Shoma Maghdor Nmibashad !", thePlayer, 255, 255, 255, true)
		return
	end
	if pname then
		local taraf = miscSys:findPlayer ( pname )
		if taraf then
			x,y,z = getElementPosition(thePlayer)
			local myint = getElementInterior( thePlayer )
			local mydim = getElementDimension( thePlayer )
			setElementPosition(thePlayer,x,y,z)
			x = x - math.sin ( math.rad ( 0 ) ) * -1
			y = y + math.cos ( math.rad ( 0 ) ) * -1
			setElementPosition(taraf,x,y,z)
			setElementInterior( taraf, myint )
			setElementDimension( taraf, mydim )
			setElementRotation( thePlayer, 0, 0, 180, "default", true)
			setElementRotation( taraf, 0, 0, 0, "default", true)
			setPedAnimation ( thePlayer, "sex", "sex_1_cum_p", -1, true, false, false )
			setPedAnimation ( taraf, "sex", "sex_1_cum_w", -1, true, false, false )
			toggleAllControls ( taraf, false, true, false)
			toggleAllControls ( thePlayer, false, true, false)
			setTimer( function()
				setPedAnimation ( thePlayer )
				setPedAnimation ( taraf )
				toggleAllControls ( thePlayer, true )
				toggleAllControls ( taraf, true )
			end, 30000, 1)
		end
	end
end)

--========================================================================================================================================
addCommandHandler("arv",
function ( thePlayer, command )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 27 then
		outputChatBox("#ff0000Error: Shoma Be In CMD Dastresi Nadarid .", thePlayer, 255, 255, 255, true)
		return
	end
	for index, admincar in ipairs(getElementsByType("vehicle")) do 
		local veh_owneri = getElementData(admincar, "veh_owner")
		if tostring(veh_owneri) == tostring(admin_veh) then
			respawnVehicle(admincar)
		end
	end
	for k, chat_admini in ipairs (getElementsByType("player")) do
	        if getElementData(chat_admini, "loggedIn") == true then
	        if tonumber(getElementData(accSys:getPlayerAcc(chat_admini), "pAdmin")) >= 8 then
	        outputChatBox("#ff0000(ADM-Warn): #ffffff Admin #fc9803"..getPlayerName(thePlayer).." #ffffffTamami Mashin Haye #00ff00Admini #ffffffRa Respawn Kard !", chat_admini, 208, 0, 15,true)
	end
	end
	end
end)


addCommandHandler("setwanted",
function ( thePlayer, command , player, value)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 8 then
		outputChatBox("#ff0000Error: Shoma Be In CMD Dastresi Nadarid .", thePlayer, 255, 255, 255, true)
		return
	end
	local find = miscSys:findPlayer(player)
	if find then
		local value = tonumber(value)
		if value then
			if value <= 6 and value >= 0 then
				setPlayerWantedLevel(find, value)
				outputChatBox("#bababa(Wanted): #ffffffShoma Wanted Haye Player #7FFF00"..getPlayerName(find).."#ffffff Ra Be #00ff00"..value.."#ffffff Set Kardid!", thePlayer, 208, 0, 15,true)	
				outputChatBox("#00ff00Admin "..getPlayerName(thePlayer).." Wanted Haye Shoma Ro Be "..value.." Set Kard!", find, 255, 255, 255, true)
				for k, chat_admini in ipairs (getElementsByType("player")) do
	        if getElementData(chat_admini, "loggedIn") == true then
	        if tonumber(getElementData(accSys:getPlayerAcc(chat_admini), "pAdmin")) >= 8 then
	        outputChatBox("#ff0000(ADM-Warn): #ffffff Admin #fc9803"..getPlayerName(thePlayer).." #ffffffWanted Haye "..getPlayerName(find).." Ra Be #42989C"..value.." #ffffffSet Kard!", chat_admini, 208, 0, 15,true)
	end
	end
	end
			else
				outputChatBox("#ff0000[Error]: #ffffffTedad Setare Ha Bayad (0~6) Bashad!", thePlayer, 255, 0, 0, true)
			end
		else
			outputChatBox("#A9C4E4Syntax: /setwanted <ID Or PartOfName> <Value>", thePlayer, 255, 0, 0, true)
		end
	else
		outputChatBox("#ff0000[Error]: #ffffffPlayer Morede Nazar Peyda Nashod!", thePlayer, 255, 0, 0, true)
	end
end)


addCommandHandler("shonod",
function ( thePlayer, command )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 8 then
		return
	end
	if getElementData(thePlayer,"InShonod") == true then
		outputChatBox("#ff0000Halat Shonod Off Shod!", thePlayer, 255, 255, 255, true)
		setElementData(thePlayer,"InShonod",nil)
	else
		outputChatBox("#00ff00Halat Shonod On Shod!", thePlayer, 255, 255, 255, true)
		setElementData(thePlayer,"InShonod",true)
	end
end)

addCommandHandler("showmeid",
function (thePlayer)
	if getElementData(thePlayer, "loggedIn") == true then
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 18 then
		
		return false
	end
        triggerClientEvent(thePlayer,"showid:enableOrDisable",resourceRoot)
end
end
)


addCommandHandler("showfp",
function ( thePlayer, command, player )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 21 then
		return
	end
	if player then
		local taraf = miscSys:findPlayer(player)
		if taraf then 
			local KhamireYaro = getElementData(accSys:getPlayerAcc(taraf), "pPunish")
			outputChatBox("#bababa(Faction Punish): #ffffffFp Haye Player #00FFFF"..getPlayerName(taraf).." : #00ff00"..KhamireYaro.."", thePlayer, 255, 255, 255, true)
		else
			outputChatBox("#ff0000Player Peyda Nashod !", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#bababaBezan: /showfp <PartOfName/ID>", thePlayer, 255, 255, 255, true)
	end
end)


local chair = nil
addCommandHandler("suck",
function (thePlayer,command,pname)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) ~= 30 then
		return
	end
	if pname then
		local taraf = miscSys:findPlayer ( pname )
		if taraf then
			if chair then
				destroyElement(chair)
				chair = nil
			end
			x,y,z = getElementPosition(thePlayer)
			local myint = getElementInterior( thePlayer )
			local mydim = getElementDimension( thePlayer )
			chair = createObject(1755,x+2,y+1.4,z-1,0,0,0)
			setElementInterior( chair, myint )
			setElementDimension( chair, mydim )
			setElementPosition(thePlayer,x+2.5,y+0.5,z)
			setElementPosition(taraf,x+2.5,y-0.5,z)
			setElementRotation( thePlayer, 0, 0, 180, "default", true)
			setElementRotation( taraf, 0, 0, 0, "default", true)
			setElementInterior( taraf, myint )
			setElementDimension( taraf, mydim )
			setPedAnimation(thePlayer,"blowjobz","BJ_couch_loop_p",1,true,false)
			setPedAnimation(taraf,"blowjobz","BJ_couch_loop_W",1,true,false)
			toggleAllControls ( taraf, false, true, false)
			toggleAllControls ( thePlayer, false, true, false)
			setTimer( function()
				destroyElement(chair)
				chair = nil
				setPedAnimation ( thePlayer )
				setPedAnimation ( taraf )
				toggleAllControls ( thePlayer, true )
				toggleAllControls ( taraf, true )
			end, 30000, 1)
		end
	end
end)

--======================================================================================================================
addCommandHandler("lock",
function ( thePlayer, command, player)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 8 then
		
		return false
	end
		local find = miscSys:findPlayer ( player )
		if player then
		if find then
			local targetPlayer = getPlayerName ( find )
			local hisVeh = getPedOccupiedVehicle(find)
			if hisVeh then
				setVehicleLocked ( hisVeh, true )
				local x,y,z = getElementRotation ( hisVeh )
				setElementRotation(hisVeh,0,0,z,"default",true)
				outputChatBox("#bababa(Vehicle): #ffffffShoma Mashin'e #19C3EC"..targetPlayer.." #ffffffRa #EC8319Lock #ffffffKardid !", thePlayer, 255, 255, 255, true)
				outputChatBox("#00ff00 Mashin Shoma Tavasot Admin "..getPlayerName(thePlayer).." Lock Shod !", find, 255, 255, 255, true)
			else
				outputChatBox("#EE0A0AIn Player Savar Khodro Nemibashad !", thePlayer, 255, 255, 255, true)
			end
			else
				outputChatBox("#EE0A0AChenin Playeri Dakhel Server Nmibashad !", thePlayer, 255, 255, 255, true)
			end
		else
			outputChatBox("#bababaBezan : /lock <PartOfName/ID>", thePlayer, 0, 255, 0,true)
		end
end
)

addCommandHandler("unlock",
function ( thePlayer, command, player)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 8 then
		
		return false
	end
		local find = miscSys:findPlayer ( player )
		if player then
		if find then
			local targetPlayer = getPlayerName ( find )
			local hisVeh = getPedOccupiedVehicle(find)
			if hisVeh then
				setVehicleLocked ( hisVeh, false )
				local x,y,z = getElementRotation ( hisVeh )
				setElementRotation(hisVeh,0,0,z,"default",true)
				outputChatBox("#bababa(Vehicle): #ffffffShoma Mashin'e #19C3EC"..targetPlayer.." #ffffffRa #EC8319UnLock #ffffffKardid !", thePlayer, 255, 255, 255, true)
				outputChatBox("#00ff00 Mashin Shoma Tavasot Admin "..getPlayerName(thePlayer).." UnLock Shod !", find, 255, 255, 255, true)
			else
				outputChatBox("#EE0A0AIn Player Savar Khodro Nemibashad !", thePlayer, 255, 255, 255, true)
			end
			else
				outputChatBox("#EE0A0AChenin Playeri Dakhel Server Nmibashad !", thePlayer, 255, 255, 255, true)
			end
		else
			outputChatBox("#bababaBezan : /unlock <PartOfName/ID>", thePlayer, 0, 255, 0,true)
		end
end
)
--======================================================================================================================================
function Warns ( thePlayer, command, player, ... ) -- #
    if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 8 then
      
      return false
    end
	
    local find = miscSys:findPlayer ( player )
	local reason = table.concat( {...} , " ")
	local reasons = "3 Warns"
	if player then
		if find then
			local RankTaraf = tonumber(getElementData(accSys:getPlayerAcc(find), "pAdmin"))
			local RankKhodesh = tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin"))
			local cheghadrwarne = getElementData(accSys:getPlayerAcc(find), "pWarns")
			local pwarnesh = tonumber(cheghadrwarne) + 1
			if (RankKhodesh) > (RankTaraf) then
						if ... then
							for i,m in ipairs ( getElementsByType("player") ) do
								outputChatBox("#ff0000[Punishment]: Player #FFFFFF"..getPlayerName(find).."' Tavasote Admin '"..getPlayerName(thePlayer).."' Yek Warn Daryaft Kard!, Reason: "..reason, m, 255, 255, 255, true)
							end
							setElementData(accSys:getPlayerAcc(find), "pWarns", tonumber(pwarnesh))
							if tonumber(getElementData(accSys:getPlayerAcc(find), "pWarns")) > 2 then
							setElementData(accSys:getPlayerAcc(find), "pBanTime", tonumber(360))
							setElementData(accSys:getPlayerAcc(find), "pBanReason", reasons)
							setElementData(accSys:getPlayerAcc(find), "pWarns", tonumber(0))
							for i,m in ipairs ( getElementsByType("player") ) do
								outputChatBox("#ff0000[Punishment] #FFFFFF"..getPlayerName(find).." #FF0000 Be Dalile Daryaft #FFAE003/3 #FFFFFFWarn#FF0000, Baraye 15 Rooz Ban Shod!", m, 255, 255, 255, true)
							end
							local whyKicked = "Shoma Az Server Be Modat 15 Rooz Ban Shodid , Dalil: "..reasons..""
							kickPlayer ( find,  tostring(whyKicked) )
							end
						else
							exports["notf"]:addNotification(thePlayer, "Enter Your Reason", 'error')
						end
			else
				exports["notf"]:addNotification(thePlayer, "You are not allowed to upgrade your rank.", 'error')
			end
		else
			exports["notf"]:addNotification(thePlayer, "*Player Not Found !*", 'warning')
		end
	else
		exports["notf"]:addNotification(thePlayerl, "Syntax: /warn <id> <Reason>", 'info')
	end
end
addCommandHandler("warn", Warns )


--___________________________________________________________________________________________________________________--

function ShowAdminsRanks(thePlayer, cmd)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 27 then
		return false
	end
local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM users;" )
local result, numrows = dbPoll(query, dbpTime)
outputChatBox ( "#bababa▬▬▬▬▬▬▬▬(#00E0FF List Admins #bababa)▬▬▬▬▬▬▬▬", thePlayer, 230,0,0 ,true)
	if (result and numrows > 0) then
		setElementData(thePlayer,"adminnumber",1)
		for index, row in pairs(result) do
			local rank = row['pAdmin']
			if rank >= 1 then
			local Onlinesh = row['pOnline']
				local name = row['pName']
				local pID = row['pID']
				local Levelssh = row['pLevel']
				if tonumber(Onlinesh) ~= 0 then  Onlinesh2 = "#00ff00Online" else Onlinesh2 = "#ff0000Offline" end
						if rank == 1 then
						AdminEsm = "Hoster"
						elseif rank == 2 then
						AdminEsm = "VIP"
						elseif rank == 3 then
						AdminEsm = "Mapper"
						elseif rank == 4 then
						AdminEsm = "Designer"
						elseif rank == 5 then
						AdminEsm = "Modeler"
						elseif rank == 6 then
						AdminEsm = "Content Creator"
						elseif rank == 7 then
						AdminEsm = "Streamer"
						elseif rank == 8 then
						AdminEsm = "Trial"
						elseif rank == 9 then
						AdminEsm = "Operator"
						elseif rank == 10 then
						AdminEsm = "Moderator"
						elseif rank == 11 then
						AdminEsm = "Bronze"
						elseif rank == 12 then
						AdminEsm = "Silver"
						elseif rank == 13 then
						AdminEsm = "Gold"
						elseif rank == 14 then
						AdminEsm = "Platinum"
						elseif rank == 15 then
						AdminEsm = "Senior"
						elseif rank == 16 then
						AdminEsm = "Assistant"
						elseif rank == 17 then
						AdminEsm = "Head Admin"
						elseif rank == 18 then
						AdminEsm = "Mafia Manager"
						elseif rank == 19 then
						AdminEsm = "Social Admin"
						elseif rank == 20 then
						AdminEsm = "Content Manager"
						elseif rank == 21 then
						AdminEsm = "Faction Manager"
						elseif rank == 22 then
						AdminEsm = "Helper Manager"
						elseif rank == 23 then
						AdminEsm = "Executive"
						elseif rank == 24 then
						AdminEsm = "SuperVisur"
						elseif rank == 25 then
						AdminEsm = "Staff Boos"
						elseif rank == 26 then
						AdminEsm = "Manager"
						elseif rank == 27 then
						AdminEsm = "Administrator"
						elseif rank == 28 then
						AdminEsm = "Owner"
						elseif rank == 29 then
						AdminEsm = "Founder"
						elseif rank == 30 then
						AdminEsm = "Scripter"
			            end
				outputChatBox("#bababa[#02FF29"..getElementData(thePlayer,"adminnumber").."#bababa] : #fc9803"..name.."#bababa | #A7A7A7Referral: "..pID.." #bababa| #2BFF2ERank: "..AdminEsm.." #bababa| #FFFFFFVaziat: "..Onlinesh2.."", thePlayer, 255, 255, 255, true)
				local chanta = getElementData(thePlayer,"adminnumber")
				local chantabadi = tonumber(chanta) + 1
				setElementData(thePlayer,"adminnumber",chantabadi)
				outputChatBox ( "#bababa▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬", thePlayer, 230,0,0 ,true)
			end
		end
		setElementData(thePlayer,"adminnumber",nil)
		dbFree(query)
	end

end
addCommandHandler("adminlist",ShowAdminsRanks)


--[[function kickall ( thePlayer, command, ... )
    if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin"))  < 18 then
      return false
    end
	local reason = table.concat( {...} , " ")
	if ... then
		outputChatBox("FF0000[Admin-System]:#FFAE00Tamami Player Haye Online Tavasote #00FFFF"..getPlayerName(thePlayer).." #FFAE00 Az Server Kick Shodand #FF0000!! #FFAE00Dalil: #FFFFFF"..reason, thePlayer, 255, 255, 255, true)
		for i,m in ipairs ( getElementsByType("player") ) do
			if getPlayerName(m) ~= getPlayerName(thePlayer) then
				kickPlayer ( m, thePlayer, reason )
			end
		end
	else
		outputChatBox("#E3E3E3Bezan: /kickall <Reason>", thePlayer, 255, 255, 255, true)
    end
end
addCommandHandler("kickall", kickall )]]



addCommandHandler("admindemote",
function(thePlayer, cmd, preffe)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 27 then
		return false
	end
	if (preffe) then
		local reffeyarukemikhaddemoteshe = tonumber(preffe)
		local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM users;" )
		local result, numrows = dbPoll(query, dbpTime)
		if (result and numrows > 0) then
			for index, row in pairs(result) do
				local IDeYaru = row['pID']
				local RankeYaro = row['pAdmin']
				if tonumber(IDeYaru) == tonumber(reffeyarukemikhaddemoteshe) then
					if tonumber(RankeYaro) >= 1 then
						local name = row['pName']
						exports["notf"]:addNotification(thePlayer, "Admin "..name.." Ba Movafaghiat Demote Shod!" , 'success')
						outputChatBox("#00ff00Ok!", thePlayer, 255, 0, 0, true)
						local sefr = 0
						local query = dbQuery(exports.mysql:getMySQLC(), "UPDATE `users` SET `pAdmin` = '"..tonumber(sefr).."' WHERE `pID` = '"..tonumber(preffe).."'")
						dbFree(query)
					end
					if tonumber(RankeYaro) == 0 then
						exports["notf"]:addNotification(thePlayer, "In Player Admin Nist!" , 'error')
					end
				end
			end
		end
		dbFree(query)
	else
		exports["notf"]:addNotification(thePlayer, "Syntax:/admindemote <Refreal>", 'error')
	end
end)



local isSpeaker = false

function print(player, message, r, g, b)
    outputChatBox(message, player, r, g, b)
end

speakerBox = {}
addCommandHandler("music",
function (thePlayer)
if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 25 then
		return false
	end
	if (isElement(speakerBox[thePlayer])) then
		isSpeaker = true
	end
		triggerClientEvent(thePlayer, "onPlayerViewSpeakerManagement", thePlayer, isSpeaker)
end
)

addEvent("onPlayerPlaceSpeakerBox", true)
addEventHandler("onPlayerPlaceSpeakerBox", root,
    function(url, isCar)
        if (url) then
            if string.len(url) < 150 then
                if (isElement(speakerBox[source])) then
                    local x, y, z = getElementPosition(speakerBox[source])
                    print(source,"Speaker Ghabli Kharab Shode Dar: " .. math.floor(x) .. ", " .. math.floor(y) .. ", " .. math.floor(z),255,0,0)
                    destroyElement(speakerBox[source])
                    removeEventHandler("onPlayerQuit", source, destroySpeakersOnPlayerQuit)
                end
                local x, y, z = getElementPosition(source)
                local rx, ry, rz = getElementRotation(source)
                speakerBox[source] = createObject(1947, x - 0.5, y + 0.5, z - 1, 0, 0, rx)
                setElementCollisionsEnabled(speakerBox[source], false)
                setElementInterior(speakerBox[source], getElementInterior(source))
                setElementDimension(speakerBox[source], getElementDimension(source))
                print(source,"Speaker Sakhte Shod!",0,255,0)
                addEventHandler("onPlayerQuit", source, destroySpeakersOnPlayerQuit)
                triggerClientEvent(root, "onPlayerStartSpeakerBoxSound", root, source, url, isCar)
                if (isCar) then
                    local car = getPedOccupiedVehicle(source)
                    attachElements(speakerBox[source], car, -0.7, -1.5, -0.5, 0, 90, 0)
                end
            end
        end
    end
)

addEvent("onPlayerDestroySpeakerBox", true)
addEventHandler("onPlayerDestroySpeakerBox",root,
    function()
        if (isElement(speakerBox[source])) then
            destroyElement(speakerBox[source])
            triggerClientEvent(root, "onPlayerDestroySpeakerBox", root, source)
            removeEventHandler("onPlayerQuit", source, destroySpeakersOnPlayerQuit)
            print(source, "Speaker Remove Shod!", 255, 0, 0)
        else
            print(source, "Shoma Speakeri Nadarid!", 255, 255, 0)
        end
    end
)

addEvent("onPlayerChangeSpeakerBoxVolume", true)
addEventHandler("onPlayerChangeSpeakerBoxVolume", root,
    function(to)
        triggerClientEvent(root, "onPlayerChangeSpeakerBoxVolumeC", root, source, to)
    end
)

function destroySpeakersOnPlayerQuit()
    if (isElement(speakerBox[source])) then
        destroyElement(speakerBox[source])
        triggerClientEvent(root, "onPlayerDestroySpeakerBox", root, source)
    end
end


function showKonGohNakhor(thePlayer)

if getElementData(thePlayer,"loggedIn") == true then
		if getElementData(thePlayer, "needreport") ~= true then
		      
			  triggerClientEvent("OpenReports",thePlayer,thePlayer)
		else
		   triggerClientEvent ( thePlayer, "PlayError", thePlayer, "Hello World!" )
		   exports["notf"]:addNotification(thePlayer, "Shoma Yek Report az Ghabl Darid!" , 'error')
		end
end
end
addCommandHandler("report",showKonGohNakhor)

addEvent("SendReports",true)
addEventHandler("SendReports",getRootElement(),function(root,payam,onvann)
	setElementData(root,"reportDade",true)
	setElementData(root,"helppText",tostring(payam))
	setElementData(root,"helpoText",tostring(onvann))
	setElementData(root, "needreport", true, false)

	for index,allpl in ipairs(getElementsByType("player")) do
		if getElementData(allpl,"loggedIn") == true then
			if tonumber(getElementData(accSys:getPlayerAcc(allpl), "pAdmin")) > 0 then
			outputChatBox("#06aaff( New-Report ) #ffffffPlayer #aaaaaa"..getPlayerName(root).." ("..getElementData(root, "TarafID")..") #ffffffDarkhast #ff0000Report #ffffffDad.", allpl, 255, 255, 255, true)
			
			end
		end
	end
end)




addCommandHandler("reports",
function (thePlayer, command)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) > 8 then
	outputChatBox ( "#1E90FF▬▬▬▬(#B22222 Reports #1E90FF)▬▬▬▬", thePlayer, 230,0,0 ,true)
		for index, needHelps in ipairs( getElementsByType("player") ) do 
		
			if getElementData(needHelps, "needreport") == true then
			    
				outputChatBox ( "#bababaName: #008B8B"..getPlayerName(needHelps).."("..getElementData(needHelps, "TarafID")..") #bababaOnvan: #008B8B"..getElementData(needHelps,"helpoText").." #bababaMatn: #008B8B"..getElementData(needHelps,"helppText").."", thePlayer, 230,0,0 ,true)
			
		    end
		
		end
		outputChatBox ( "#1E90FF▬▬▬▬▬▬▬▬▬▬▬▬▬", thePlayer, 230,0,0 ,true)
	else
	end
end)





addCommandHandler("oreport",
function (thePlayer, command, player)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) > 8 then
		local find = miscSys:findPlayer(player)
		if find then
			if getElementData(find, "needreport") == true then
				setElementData(find, "needreport", nil, false)
				local myName = getPlayerName(thePlayer)
				local yourName = getPlayerName(find)
				setElementData(find, "onHelping", tostring(myName), false)
				setElementData(thePlayer, "onHelping", tostring(yourName), false)
				outputChatBox("#00ff00Report "..yourName.." Ra Baz Kardid!", thePlayer, 255, 255, 255, true)
				for k, chat_admini in ipairs (getElementsByType("player")) do
	        if getElementData(chat_admini, "loggedIn") == true then
	        if tonumber(getElementData(accSys:getPlayerAcc(chat_admini), "pAdmin")) > 0 then
	        outputChatBox("#06aaff( Admin-Warn ): #ffffffAdmin #aaaaaa"..getPlayerName(thePlayer).." #ffffffReport #c0c0c0"..getPlayerName(find).." #ffffffRa #00ff00Open #ffffffKard.", chat_admini, 208, 0, 15,true)
	end
	end
	end        
				outputChatBox("#06aaff( Report System ): #ffffffAdmin #aaaaaa"..myName.." #ffffffReport Shoma Ra #00ff00Open #ffffffKard.", find, 255, 255, 255, true)
				outputChatBox("#06aaff( Report System ): #ffffffBa Dastor #00ff00[/al] #ffffffMitavanid Ba Admin Marbote Chat Konid.", find, 255, 255, 255, true)
				for index, sendToHelpers in ipairs( getElementsByType("player") ) do 
					if getElementData(sendToHelpers, "loggedIn") == true then
						if sendToHelpers ~= thePlayer then
							
						end
					end
				end
			else
				outputChatBox("#ff0000In Player Report Nadade Ast!", thePlayer, 255, 255, 255, true)
			end
		else
			--outputChatBox("#ff0000Chenin Playeri Dakhel Server Nmibashad!", thePlayer, 255, 255, 255, true)
		end
		end
end)


addCommandHandler("al",
function (thePlayer, command, ...)
	if (...) then
		local message = table.concat({ ... }, " ")
		local onHelping = getElementData(thePlayer, "onHelping")
		if getElementData(thePlayer, "onHelping") ~= nil then
			for index, talkToHelper in ipairs( getElementsByType("player") ) do 
				if tostring(onHelping) == getPlayerName(talkToHelper) then
					if talkToHelper then
						if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) > 8 then
							outputChatBox("#06aaff( Report-Chat ) #c0c0c0Admin "..getPlayerName(thePlayer)..": #ffffff"..message, talkToHelper, 255, 255, 255, true)
							outputChatBox("#06aaff( Report-Chat ) #c0c0c0Admin "..getPlayerName(thePlayer)..": #ffffff"..message, thePlayer, 255, 255, 255, true)
						else
							outputChatBox("#06aaff( Report-Chat ) #c0c0c0Player "..getPlayerName(thePlayer)..": #ffffff"..message, talkToHelper, 255, 255, 255, true)
							outputChatBox("#06aaff( Report-Chat ) #c0c0c0Player "..getPlayerName(thePlayer)..": #ffffff"..message, thePlayer, 255, 255, 255, true)
						end
					end
				end
			end
		else    

			outputChatBox("#ff0000Reporti Baraye Shoma Baz Nis!", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#C0C0C0Bezan: /al [message]", thePlayer, 255, 255, 255, true)
	end
end)

addCommandHandler("creport",
function (thePlayer, command, player)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) > 8 then
		local find = miscSys:findPlayer(player)
		if find then
			if getElementData(find, "needreport") == true then
				setElementData(find, "needreport", nil, false)
				local myName = getPlayerName(thePlayer)
				local yourName = getPlayerName(find)
				outputChatBox("#00ff00Report "..yourName.." Ra Close Kardid!", thePlayer, 255, 255, 255, true)
				for k, chat_admini in ipairs (getElementsByType("player")) do
	        if getElementData(chat_admini, "loggedIn") == true then
	        if tonumber(getElementData(accSys:getPlayerAcc(chat_admini), "pAdmin")) > 0 then
	        outputChatBox("#06aaff( Admin-Warn ): #ffffffAdmin #aaaaaa"..getPlayerName(thePlayer).." #ffffffReport #c0c0c0"..getPlayerName(find).." #ffffffRa #ff0000Close #ffffffKard.!", chat_admini, 208, 0, 15,true)
	end
	end    
	end
				outputChatBox("#06aaff( Report System ): #ffffffAdmin #aaaaaa"..myName.."#ffffffReport Shoma Ra #ff0000Close #ffffffKard.", find, 255, 255, 255, true)
				outputChatBox("#06aaff( Report System ): #ffffffDar Sorate Dashtan Moshkel Mojadad #ff0000[/report] #ffffffDahid. #00ff00GL", find, 255, 255, 255, true)
				for index, sendToHelpers in ipairs( getElementsByType("player") ) do 
					if getElementData(sendToHelpers, "loggedIn") == true then
						if sendToHelpers ~= thePlayer then				end
					end
				end
			elseif getElementData(find, "onHelping") ~= nil then
				setElementData(find, "onHelping", nil, false)
				setElementData(thePlayer, "onHelping", nil, false)
				local myName = getPlayerName(thePlayer)
				local yourName = getPlayerName(find)
				outputChatBox("#00ff00Report "..yourName.." Ra Close Kardid!", thePlayer, 255, 255, 255, true)
				for k, chat_admini in ipairs (getElementsByType("player")) do
	        if getElementData(chat_admini, "loggedIn") == true then
	        if tonumber(getElementData(accSys:getPlayerAcc(chat_admini), "pAdmin")) > 0 then
	        outputChatBox("#06aaff( Admin-Warn ): #ffffffAdmin #aaaaaa"..getPlayerName(thePlayer).." #ffffffReport #c0c0c0"..getPlayerName(find).." #ffffffRa #ff0000Close #ffffffKard.", chat_admini, 208, 0, 15,true)
	end
	end
	end 
				outputChatBox("#06aaff( Report System ): #ffffffAdmin #aaaaaa"..myName.." #ffffffReport Shoma Ra #ff0000Close #ffffffKard.", find, 255, 255, 255, true)
				outputChatBox("#06aaff( Report System ): #ffffffDar Sorate Dashtan Moshkel Mojadad #ff0000[/report] #ffffffDahid. #00ff00GL", find, 255, 255, 255, true)
				
				for index, sendToHelpers in ipairs( getElementsByType("player") ) do 
					if getElementData(sendToHelpers, "loggedIn") == true then
						if sendToHelpers ~= thePlayer then
						end
					end
				end
			else
				outputChatBox("#ff0000Report In Player Open Nmibashad!", thePlayer, 255, 255, 255, true)
			end
		else
			outputChatBox("#ff0000Player Morede Nazar Peyda Nashod!", thePlayer, 255, 255, 255, true)
		end
	end
end)




addCommandHandler("changename",
function ( thePlayer, command, player, playerName )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 27 then
		outputChatBox("#EE0A0A[✖] #bababaDastresi Be In Dastoor Baraye Shoma Maghdoor Nist !", thePlayer, 255, 255, 255, true)
		return false
	end
		local find = miscSys:findPlayer ( player )
		if player then
		if find then
			local targetPlayer = getPlayerName ( find )
			outputChatBox("#04F716[☑] : #bababaShoma Name #00ff00"..targetPlayer.." #bababaRa Be #00ff00"..playerName.."#bababa Change Kardid !", thePlayer, 0, 255, 0,true)
			outputChatBox("#bababaAdmin #04F716"..getPlayerName(thePlayer).." #bababaName Shoma Ra Change Dad !", find, 0, 255, 0, true)
			outputDebugString("Admin "..getPlayerName(thePlayer).." Name "..targetPlayer.." Ra Change Kard!")
			playerName = tostring( playerName )
			setElementData(accSys:getPlayerAcc(find), "pName", playerName)
			setPlayerName(find,playerName)
			else
				outputChatBox("#EE0A0A[✖] #bababaChenin Playeri Dakhel Server Nmibashad !", thePlayer, 255, 255, 255, true)
			end
		else
			outputChatBox("#C0C0C0Bezan: /changename <PartOfName/ID> <New-Name>", thePlayer, 0, 255, 0,true)
		end
end
)

function FalseCommandNotLog () -- #zezaw
	if getElementData(source, "loggedIn") ~= true then
		cancelEvent()
	end
end
addEventHandler("onPlayerCommand", root, FalseCommandNotLog)

local SpamLogs = nil
--[[addCommandHandler("spamlogs",
function ( thePlayer, command, daghighe)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 8 then
		outputChatBox("#ff0000✖️ Shoma Dastresi Be In Dastoor Ra Nadarid!", thePlayer, 255, 255, 255, true)
		return false
	end
	local daghighe = tonumber(daghighe)
	if daghighe then
		if daghighe >= 1 and daghighe < 30 then
			SpamLogs = true
			outputDebugString("Admin "..getPlayerName(thePlayer).." Spam Logs Ra Baraye "..daghighe.." Daghighe On Kard")
			outputChatBox("#ff0000[Tavajoh]: #ffffffSpam Logs Baraye #00ff00"..daghighe.." #ffffffDaghighe #00ff00Faal #ffffffShod!", thePlayer, 255, 0, 255, true)
			SpamLogsTimer = setTimer(
			function ()
				SpamLogs = nil
				outputChatBox("#ff0000[Tavajoh]: #ffffffSpam Logs #ff0000Gheyre Faal #ffffffShod!", thePlayer, 255, 0, 255, true)
			end, daghighe*60000, 1)
		else
			outputChatBox("#ff0000✖️ #ffffffTime Faal Bodan Spam Logs Bayad Beyne 1~30 Daghighe Bashad!", thePlayer, 255, 255, 255, true)
		end
	else
		outputChatBox("#C0C0C0Bezan: /spamlogs <Time>", thePlayer, 255, 255, 255, true)
	end
end)]]
--========================================================================================================================
--[[addCommandHandler("spamlogsoff",
function (thePlayer, command)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 8 then
		outputChatBox("#ff0000✖️ Shoma Dastresi Be In Dastoor Ra Nadarid!", thePlayer, 255, 255, 255, true)
		return false
	end
	if SpamLogs == true then
		SpamLogs = nil
		killTimer ( SpamLogsTimer )
		outputChatBox("#ff0000[Tavajoh]: #ffffffSpam Logs #ff0000Gheyre Faal #ffffffShod!", thePlayer, 255, 0, 255, true)
		outputDebugString("Admin "..getPlayerName(thePlayer).." Spam Logs Ra Off Kard")
	else
		outputChatBox("#ff0000✖️ #ffffffSpam Logs Faal Nist Baraye Faal Kardan: /spamlogs!", thePlayer, 255, 255, 255, true)
	end
end)]]
--============================================================================================================================
 local komutkontrol = {} --#zezaw
function AntiSpam ()
	if isPlayerMuted ( source ) then -- Age Yebar Ziad Cmd Zad Dobare Kar Nakone
		cancelEvent()
	end
	if (not komutkontrol[source]) then
		komutkontrol[source] = 1
	elseif (komutkontrol[source] == 5) then
		if not isPlayerMuted ( source ) then
			if SpamLogs == true then
				exports.Logs:newLogSpam("Command","Player "..getPlayerName(source).." To 1 Sanie Az 5 Command Estefade Kard! ")
			end
		end
		setPlayerMuted ( source , true )
		cancelEvent()
		setTimer(setPlayerMuted, 1000, 1, source, false)
	else
		komutkontrol[source] = komutkontrol[source] + 1
		if not isPlayerMuted ( source ) then
			if SpamLogs == true then
				exports.Logs:newLogSpam("Command","Player "..getPlayerName(source).." To 1 Sanie Az 2 Command Estefade Kard! ")
			end
		end
		setPlayerMuted ( source , true )
		cancelEvent()
		setTimer(setPlayerMuted, 1000, 1, source, false)
	end
end
addEventHandler("onPlayerCommand", root, AntiSpam)
setTimer(function() komutkontrol = {} end, 1000, 0) 






addCommandHandler("leaderdemote",
function(thePlayer, cmd, preffe)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 21 then
		return false
	end
	if (preffe) then
		local reffeyarukemikhaddemoteshe = tonumber(preffe)
		local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM users;" )
		local result, numrows = dbPoll(query, dbpTime)
		if (result and numrows > 0) then
			for index, row in pairs(result) do
				local IDeYaru = row['pID']
				local RankeYaro = row['pMember']
				if tonumber(IDeYaru) == tonumber(reffeyarukemikhaddemoteshe) then
					if tonumber(RankeYaro) >= 1 then
						local name = row['pName']
						exports["notf"]:addNotification(thePlayer, "Leader "..name.." Ba Movafaghiat Demote Shod!" , 'success')
						outputChatBox("#00ff00Ok!", thePlayer, 255, 0, 0, true)
						local sefr = 0
						local query = dbQuery(exports.mysql:getMySQLC(), "UPDATE `users` SET `pMember` = '"..tonumber(sefr).."' WHERE `pID` = '"..tonumber(preffe).."'")
						dbFree(query)
					end
					if tonumber(RankeYaro) == 0 then
						exports["notf"]:addNotification(thePlayer, "In Player Leader Nist!" , 'error')
					end
				end
			end
		end
		dbFree(query)
	else
		outputChatBox("#bababaBezan: /leaderdemote <Referral-ID>", thePlayer, 255, 0, 0, true)
	end
end) 




addCommandHandler("fcdemote",
function(thePlayer, cmd, preffe)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 21 then
		return false
	end
	if (preffe) then
		local reffeyarukemikhaddemoteshe = tonumber(preffe)
		local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM users;" )
		local result, numrows = dbPoll(query, dbpTime)
		if (result and numrows > 0) then
			for index, row in pairs(result) do
				local IDeYaru = row['pID']
				local RankeYaro = row['pMember']
				if tonumber(IDeYaru) == tonumber(reffeyarukemikhaddemoteshe) then
					if tonumber(RankeYaro) >= 1 then
						local name = row['pName']
						exports["notf"]:addNotification(thePlayer, "(Member/Leader) "..name.." Ba Movafaghiat Demote Shod!" , 'success')
						outputChatBox("#00ff00Ok!", thePlayer, 255, 0, 0, true)
						local sefr = 0
						local query = dbQuery(exports.mysql:getMySQLC(), "UPDATE `users` SET `pMember` = '"..tonumber(sefr).."' WHERE `pID` = '"..tonumber(preffe).."'")
						dbFree(query)
					end
					if tonumber(RankeYaro) == 0 then
						exports["notf"]:addNotification(thePlayer, "In Player Admin Nist!" , 'error')
					end
				end
			end
		end
		dbFree(query)
	else
		outputChatBox("#bababaBezan: /fcdemote <Referral-ID>", thePlayer, 255, 0, 0, true)
	end
end)
--===========================================================================================================================
addCommandHandler("helperlist",
function(thePlayer, cmd)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 22 then
		return false
	end
local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM users;" )
local result, numrows = dbPoll(query, dbpTime)
outputChatBox ( "#bababa▬▬▬▬▬▬▬▬(#00E0FF List Helpers #bababa)▬▬▬▬▬▬▬▬", thePlayer, 230,0,0 ,true)
	if (result and numrows > 0) then
		setElementData(thePlayer,"helpernumber",1)
		for index, row in pairs(result) do
			local Adminses = row['pHelper']
			if Adminses >= 1 then
			local Onlinesh = row['pOnline']
				local name = row['pName']
				local pID = row['pID']
				local Levelssh = row['pLevel']
				if tonumber(Onlinesh) ~= 0 then  Onlinesh2 = "#00ff00Online" else Onlinesh2 = "#ff0000Offline" end
						if Adminses == 1 then
						AdminEsm = "Beta Helper"
						elseif Adminses == 2 then
						AdminEsm = "Helper"
						elseif Adminses == 3 then
						AdminEsm = "Head Helper"
			            end
				outputChatBox("#bababa[#02FF29"..getElementData(thePlayer,"helpernumber").."#bababa] : #fc9803"..name.."#bababa | #A7A7A7Referral: "..pID.." #bababa| #2BFF2ERank: "..AdminEsm.." #bababa| #FFFFFFVaziat: "..Onlinesh2.."", thePlayer, 255, 255, 255, true)
				local chanta = getElementData(thePlayer,"helpernumber")
				local chantabadi = tonumber(chanta) + 1
				setElementData(thePlayer,"helpernumber",chantabadi)
				outputChatBox ( "#bababa▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬", thePlayer, 230,0,0 ,true)
			end
		end
		setElementData(thePlayer,"helpernumber",nil)
		dbFree(query)
	end
	
end
)


addCommandHandler("helperdemote",
function(thePlayer, cmd, preffe)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 22 then
		return false
	end
	if (preffe) then
		local reffeyarukemikhaddemoteshe = tonumber(preffe)
		local query = dbQuery(exports.mysql:getMySQLC(), "SELECT * FROM users;" )
		local result, numrows = dbPoll(query, dbpTime)
		if (result and numrows > 0) then
			for index, row in pairs(result) do
				local IDeYaru = row['pID']
				local RankeYaro = row['pHelper']
				if tonumber(IDeYaru) == tonumber(reffeyarukemikhaddemoteshe) then
					if tonumber(RankeYaro) >= 1 then
						local name = row['pName']
						exports["notf"]:addNotification(thePlayer, "Helper "..name.." Ba Movafaghiat Demote Shod!" , 'success')
						outputChatBox("#00ff00Ok!", thePlayer, 255, 0, 0, true)
						local sefr = 0
						local query = dbQuery(exports.mysql:getMySQLC(), "UPDATE `users` SET `pHelper` = '"..tonumber(sefr).."' WHERE `pID` = '"..tonumber(preffe).."'")
						dbFree(query)
					end
					if tonumber(RankeYaro) == 0 then
						exports["notf"]:addNotification(thePlayer, "In Player Helper Nist!" , 'error')
					end
				end
			end
		end
		dbFree(query)
	else
		outputChatBox("#bababaBezan: /helperdemote <Referral-ID>", thePlayer, 255, 0, 0, true)
	end
end)

-- state variables
local speed = 0
local strafespeed = 0
local rotX, rotY = 0,0
local velocityX, velocityY, velocityZ
local enabled = false

-- configurable parameters
local options = {
	invertMouseLook = false,
	normalMaxSpeed = 2,
	slowMaxSpeed = 0.2,
	fastMaxSpeed = 12,
	smoothMovement = true,
	acceleration = 0.3,
	decceleration = 0.15,
	mouseSensitivity = 0.3,
	maxYAngle = 188,
	key_fastMove = "lshift",
	key_slowMove = "lalt",
	key_forward = "w",
	key_backward = "s",
	key_left = "a",
	key_right = "d"
}

local mouseFrameDelay = 0

-- local rootElement = getRootElement()
-- local localPlayer = getLocalPlayer()

local getKeyState = getKeyState
do
	local mta_getKeyState = getKeyState
	function getKeyState(key)
		if isMTAWindowActive() then
			return false
		else
			return mta_getKeyState(key)
		end
	end
end

-- PRIVATE

local function freecamFrame ()
    -- work out an angle in radians based on the number of pixels the cursor has moved (ever)
    local cameraAngleX = rotX
    local cameraAngleY = rotY

    local freeModeAngleZ = math.sin(cameraAngleY)
    local freeModeAngleY = math.cos(cameraAngleY) * math.cos(cameraAngleX)
    local freeModeAngleX = math.cos(cameraAngleY) * math.sin(cameraAngleX)
    local camPosX, camPosY, camPosZ = getCameraMatrix()

    -- calculate a target based on the current position and an offset based on the angle
    local camTargetX = camPosX + freeModeAngleX * 100
    local camTargetY = camPosY + freeModeAngleY * 100
    local camTargetZ = camPosZ + freeModeAngleZ * 100

	-- Calculate what the maximum speed that the camera should be able to move at.
    local mspeed = options.normalMaxSpeed
    if getKeyState ( options.key_fastMove ) then
        mspeed = options.fastMaxSpeed
	elseif getKeyState ( options.key_slowMove ) then
		mspeed = options.slowMaxSpeed
    end
	
	if options.smoothMovement then
		local acceleration = options.acceleration
		local decceleration = options.decceleration
	
	    -- Check to see if the forwards/backwards keys are pressed
	    local speedKeyPressed = false
	    if getKeyState ( options.key_forward ) then
			speed = speed + acceleration 
	        speedKeyPressed = true
	    end
		if getKeyState ( options.key_backward ) then
			speed = speed - acceleration 
	        speedKeyPressed = true
	    end

	    -- Check to see if the strafe keys are pressed
	    local strafeSpeedKeyPressed = false
		if getKeyState ( options.key_right ) then
	        if strafespeed > 0 then -- for instance response
	            strafespeed = 0
	        end
	        strafespeed = strafespeed - acceleration / 2
	        strafeSpeedKeyPressed = true
	    end
		if getKeyState ( options.key_left ) then
	        if strafespeed < 0 then -- for instance response
	            strafespeed = 0
	        end
	        strafespeed = strafespeed + acceleration / 2
	        strafeSpeedKeyPressed = true
	    end

	    -- If no forwards/backwards keys were pressed, then gradually slow down the movement towards 0
	    if speedKeyPressed ~= true then
			if speed > 0 then
				speed = speed - decceleration
			elseif speed < 0 then
				speed = speed + decceleration
			end
	    end

	    -- If no strafe keys were pressed, then gradually slow down the movement towards 0
	    if strafeSpeedKeyPressed ~= true then
			if strafespeed > 0 then
				strafespeed = strafespeed - decceleration
			elseif strafespeed < 0 then
				strafespeed = strafespeed + decceleration
			end
	    end

	    -- Check the ranges of values - set the speed to 0 if its very close to 0 (stops jittering), and limit to the maximum speed
	    if speed > -decceleration and speed < decceleration then
	        speed = 0
	    elseif speed > mspeed then
	        speed = mspeed
	    elseif speed < -mspeed then
	        speed = -mspeed
	    end
	 
	    if strafespeed > -(acceleration / 2) and strafespeed < (acceleration / 2) then
	        strafespeed = 0
	    elseif strafespeed > mspeed then
	        strafespeed = mspeed
	    elseif strafespeed < -mspeed then
	        strafespeed = -mspeed
	    end
	else
		speed = 0
		strafespeed = 0
		if getKeyState ( options.key_forward ) then speed = mspeed end
		if getKeyState ( options.key_backward ) then speed = -mspeed end
		if getKeyState ( options.key_left ) then strafespeed = mspeed end
		if getKeyState ( options.key_right ) then strafespeed = -mspeed end
	end

    -- Work out the distance between the target and the camera (should be 100 units)
    local camAngleX = camPosX - camTargetX
    local camAngleY = camPosY - camTargetY
    local camAngleZ = 0 -- we ignore this otherwise our vertical angle affects how fast you can strafe

    -- Calulcate the length of the vector
    local angleLength = math.sqrt(camAngleX*camAngleX+camAngleY*camAngleY+camAngleZ*camAngleZ)

    -- Normalize the vector, ignoring the Z axis, as the camera is stuck to the XY plane (it can't roll)
    local camNormalizedAngleX = camAngleX / angleLength
    local camNormalizedAngleY = camAngleY / angleLength
    local camNormalizedAngleZ = 0

    -- We use this as our rotation vector
    local normalAngleX = 0
    local normalAngleY = 0
    local normalAngleZ = 1

    -- Perform a cross product with the rotation vector and the normalzied angle
    local normalX = (camNormalizedAngleY * normalAngleZ - camNormalizedAngleZ * normalAngleY)
    local normalY = (camNormalizedAngleZ * normalAngleX - camNormalizedAngleX * normalAngleZ)
    local normalZ = (camNormalizedAngleX * normalAngleY - camNormalizedAngleY * normalAngleX)

    -- Update the camera position based on the forwards/backwards speed
    camPosX = camPosX + freeModeAngleX * speed
    camPosY = camPosY + freeModeAngleY * speed
    camPosZ = camPosZ + freeModeAngleZ * speed

    -- Update the camera position based on the strafe speed
    camPosX = camPosX + normalX * strafespeed
    camPosY = camPosY + normalY * strafespeed
    camPosZ = camPosZ + normalZ * strafespeed
	
	--Store the velocity
	velocityX = (freeModeAngleX * speed) + (normalX * strafespeed)
	velocityY = (freeModeAngleY * speed) + (normalY * strafespeed)
	velocityZ = (freeModeAngleZ * speed) + (normalZ * strafespeed)

    -- Update the target based on the new camera position (again, otherwise the camera kind of sways as the target is out by a frame)
    camTargetX = camPosX + freeModeAngleX * 100
    camTargetY = camPosY + freeModeAngleY * 100
    camTargetZ = camPosZ + freeModeAngleZ * 100

    -- Set the new camera position and target
    setCameraMatrix ( camPosX, camPosY, camPosZ, camTargetX, camTargetY, camTargetZ )
end

local function freecamMouse (cX,cY,aX,aY)
	--ignore mouse movement if the cursor or MTA window is on
	--and do not resume it until at least 5 frames after it is toggled off
	--(prevents cursor mousemove data from reaching this handler)
	if isCursorShowing() or isMTAWindowActive() then
		mouseFrameDelay = 5
		return
	elseif mouseFrameDelay > 0 then
		mouseFrameDelay = mouseFrameDelay - 1
		return
	end
	
	-- how far have we moved the mouse from the screen center?
    local width, height = guiGetScreenSize()
    aX = aX - width / 2 
    aY = aY - height / 2
	
	--invert the mouse look if specified
	if options.invertMouseLook then
		aY = -aY
	end
	
    rotX = rotX + aX * options.mouseSensitivity * 0.01745
    rotY = rotY - aY * options.mouseSensitivity * 0.01745
	
	local PI = math.pi
	if rotX > PI then
		rotX = rotX - 2 * PI
	elseif rotX < -PI then
		rotX = rotX + 2 * PI
	end
	
	if rotY > PI then
		rotY = rotY - 2 * PI
	elseif rotY < -PI then
		rotY = rotY + 2 * PI
	end
    -- limit the camera to stop it going too far up or down - PI/2 is the limit, but we can't let it quite reach that or it will lock up
	-- and strafeing will break entirely as the camera loses any concept of what is 'up'
    if rotY < -PI / 2.05 then
       rotY = -PI / 2.05
    elseif rotY > PI / 2.05 then
        rotY = PI / 2.05
    end
end

-- PUBLIC

function getFreecamVelocity()
	return velocityX,velocityY,velocityZ
end

-- params: x, y, z  sets camera's position (optional)
function setFreecamEnabled (x, y, z)
	if (x and y and z) then
	    setCameraMatrix ( camPosX, camPosY, camPosZ )
	end
	addEventHandler("onClientRender", rootElement, freecamFrame)
	addEventHandler("onClientCursorMove",rootElement, freecamMouse)
	enabled = true
	
	return true
end

-- param:  dontChangeFixedMode  leaves toggleCameraFixedMode alone if true, disables it if false or nil (optional)
function setFreecamDisabled()
	velocityX,velocityY,velocityZ = 0,0,0
	speed = 0
	strafespeed = 0
	removeEventHandler("onClientRender", rootElement, freecamFrame)
	removeEventHandler("onClientCursorMove",rootElement, freecamMouse)
	enabled = false
	
	return true
end
--setFreecamDisabled()

function isFreecamEnabled()
	return enabled
end

function getFreecamOption(theOption, value)
	return options[theOption]
end

function setFreecamOption(theOption, value)
	if options[theOption] ~= nil then
		options[theOption] = value
		return true
	else
		return false
	end
end

addEvent("doSetFreecamEnabled")
addEventHandler("doSetFreecamEnabled", root, setFreecamEnabled)

addEvent("doSetFreecamDisabled")
addEventHandler("doSetFreecamDisabled", root, setFreecamDisabled)

addEvent("doSetFreecamOption")
addEventHandler("doSetFreecamOption", root, setFreecamOption)

addCommandHandler("SakhtVideo", function()
	if isFreecamEnabled() then
		setFreecamDisabled()
		setCameraTarget(getLocalPlayer(), getLocalPlayer())
		toggleAllControls ( true, true, false )
		outputChatBox("#ff0000Disable", 255, 255, 255, true)
	else
		setFreecamEnabled()
		toggleAllControls ( false, true, false )
		outputChatBox("#00ff00Enable", 255, 255, 255, true)
	end
end)

-- addCommandHandler("cskin",
	-- function ( thePlayer, command, player, skinid )
		-- if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 4 then
			-- outputChatBox("#ff0000CMD:#ff0000 Motasefane In Dastoor Yaft Nashod!", thePlayer, 255, 255, 255, true)
			-- return false
		-- end
		       -- -- if not getElementData(thePlayer, "Staff") then
		-- -- outputChatBox("#ff0000Baraye Estefade Az Command haye Admini Bayd Dar Halate #00ff32 /aduty #ff0000 Bashid!", thePlayer, 255, 255, 255, true)
		-- -- return false
	-- -- end
		-- if player then
		-- if skinid then
		-- local find = miscSys:findPlayer ( player )
		-- if find then
			-- skinid = tonumber( skinid )
				-- local targetPlayer = getPlayerName ( find )
				-- setElementModel( find, skinid )
				-- setElementData(accSys:getPlayerAcc(find), "cSkin", skinid)
				-- outputChatBox("#00ff00☑️ #ffffffShoma Skin #00ff00"..targetPlayer.." #ffffffRa Be #00ff00"..skinid.." #ffffffSet Kardid!", thePlayer, 0, 255, 0, true)
				-- outputChatBox("#00ff00[Tavajoh]: #ffffffSkin Shoma Tavasote Admin #00ff00"..getPlayerName(thePlayer).." #ffffffBe #00ff00"..skinid.." #ffffffTaghir Yaft!", find, 0, 255, 0, true)
			-- else
				-- outputChatBox("#ff0000✖️ #ffffffID Skin Ra Vared Konid!", thePlayer, 255, 255, 255, true)
			-- end
			-- else
				-- outputChatBox("#ff0000✖️ #ffffffPlayer Peyda Nashod!", thePlayer, 255, 255, 255, true)
			-- end
			-- else
				-- outputChatBox("#C0C0C0Bezan: /cskin <PartOfName/ID> <Skin-ID>", thePlayer, 255, 0, 0, true)
			-- end
	-- end
-- )




addCommandHandler("changepass",
function ( thePlayer, command, player, pass )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 27 then
		outputChatBox("#33AA33Error: Motasefane dastresi be in dastoor baraye shoma maghdoor nist.", thePlayer, 255, 255, 255, true)
		return false
	end
		local find = miscSys:findPlayer ( player )
		if find then
			local targetPlayer = getPlayerName ( find )
			outputChatBox("#00ff00[Done]:#ffffffShoma Player #FFFF00"..targetPlayer.." #FFFFFFRa Be #FFFF00"..pass.."#FFFFFF Change Pass Kardid!", thePlayer, 0, 255, 0,true)
			outputChatBox("#00ff00[Info]:#ffffffShoma Tavasot Admin #FFFF00"..getPlayerName(thePlayer).."#FFFFFF Be Passe (#FFFF00"..pass..")#FFFFFF Change Pass Shodid!", find, 0, 255, 0, true)
			exports["[Vanish]Logs"]:CreateServerLog("Admin-Warn","Admin "..getPlayerName(thePlayer).." Passworde Player "..targetPlayer.." Ra Be "..pass.."Taghir Dad!")
			pass = tostring( pass )
			setElementData(accSys:getPlayerAcc(find), "pKey", pass)
		else
			outputChatBox("#ff0000[Error]:#ffffffChenin Playeri Peyda Nashod!", thePlayer, 0, 255, 0,true)
		end
end
)

addCommandHandler("givemat",
	function ( thePlayer, _, player, amount )
		if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 18 then
			outputChatBox("#33AA33Error: Motasefane dastresi be in dastoor baraye shoma maghdoor nist.", thePlayer, 255, 255, 255, true)
			return false
		end

		local find = miscSys:findPlayer(player)
		if find then
			if amount then
				local targetName = getPlayerName ( find )
				local oldMat = getElementData(accSys:getPlayerAcc(find), "pMats")
				setElementData(accSys:getPlayerAcc(find), "pMats", tonumber(amount))
				local totalMoney = getPlayerMoney ( find )
				outputChatBox("Meghdare "..convertNumber( amount ).." baraye "..targetName.." ferestade shod.", thePlayer, 0, 255, 0)
				outputChatBox("Mojoodie hamrahe "..targetName.." dar hale hazer "..convertNumber ( getElementData(accSys:getPlayerAcc(find), "pMats") ).." mibashad.", thePlayer, 0, 255, 0)

				outputChatBox("Meghdare "..convertNumber( amount ).." Mat az "..getPlayerName(thePlayer).." baraye shoma ersal shod.", find, 0, 255, 0) -- 11
				outputDebugString("Admin "..getPlayerName(thePlayer).." Be Player "..targetName.." Meghdar "..amount.."$ material Dad!")
			
			exports["Logs"]:CreateServerLog("Admin-Warn","Admin "..getPlayerName(thePlayer).." Be Player "..targetName.." Meghdare "..amount.."Material Dad!")
			else
				outputChatBox("#A9C4E4Syntax: /givemat <PartOfName> <Amount Of Money>", thePlayer, 255, 0, 0, true)
			end
		else
			outputChatBox("#F9F7CEError: Playere morede nazar yaft nashod.", thePlayer, 255, 0, 0, true)
		end
	end
)



addCommandHandler("setpid",
function ( thePlayer, command, player, level )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 27 then
		outputChatBox("#ff0000Shoma Dastresi Be In Dastoor Nadarid!", thePlayer, 255, 255, 255, true)
		return false
	end
		local find = miscSys:findPlayer ( player )
		if player then
		if find then
		if level then
		if tonumber(level) > 0 then
		   -- setElementData ( find, "Connect_Time", "90:50:30" )
			setElementData ( find, "Connect Time",5000 )

            setElementData(find, "TarafID", level) 
			outputChatBox("#00ff00[Done]: #ffffff Shoma ID #00ff00"..getPlayerName(find).." #ffffffRa Be #00ff00"..level.." #ffffffSet Kardid!", thePlayer, 255, 255, 255, true)
			outputChatBox("#00ff00Admin #ffffff"..getPlayerName(thePlayer).." ID Shoma Ra Be #ffffff"..level.." #00ff00Set Kard!", find, 255, 255, 255, true)
			outputDebugString("Admin "..getPlayerName(thePlayer).." ID'e "..targetPlayer.." Ra Be "..level.." Set Kard!")
		else
			outputChatBox("#ff0000[Error]: #ffffff ID Bayad Bishtar Az 0 Bashad!", thePlayer, 255, 255, 255, true)
		end
		else
			outputChatBox("#ff0000[Error]: #ffffff ID Ra Vared Konid!", thePlayer, 255, 255, 255, true)
		end
		else
			outputChatBox("#ff0000[Error]: #ffffffPlayer Peyda Nashod!", thePlayer, 255, 255, 255, true)
		end
		else
			outputChatBox("#C0C0C0Syntax: /setpid <PartOfName/ID> <ID>", thePlayer, 0, 255, 0,true)
		end
end)

addCommandHandler("setreff",
function ( thePlayer, command, player, level )
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) < 27 then
		outputChatBox("#ff0000Shoma Dastresi Be In Dastoor Nadarid!", thePlayer, 255, 255, 255, true)
		return false
	end
		local find = miscSys:findPlayer ( player )
		if player then
		if find then
		if level then
		if tonumber(level) > 0 then
			local targetPlayer = getPlayerName ( find )
			local level = tonumber(level)
			setElementData(accSys:getPlayerAcc(find), "pID", level)
			outputChatBox("#00ff00[Done]: #ffffff Shoma Referral #00ff00"..getPlayerName(find).." #ffffffRa Be #00ff00"..level.." #ffffffSet Kardid!", thePlayer, 255, 255, 255, true)
			outputChatBox("#00ff00Admin #ffffff"..getPlayerName(thePlayer).." Referral Shoma Ra Be #ffffff"..level.." #00ff00Set Kard!", find, 255, 255, 255, true)
			outputDebugString("Admin "..getPlayerName(thePlayer).." Referral'e "..targetPlayer.." Ra Be "..level.." Set Kard!")
		else
			outputChatBox("#ff0000[Error]: #ffffffLevel Bayad Bishtar Az 0 Bashad!", thePlayer, 255, 255, 255, true)
		end
		else
			outputChatBox("#ff0000[Error]: #ffffffLevel Ra Vared Konid!", thePlayer, 255, 255, 255, true)
		end
		else
			outputChatBox("#ff0000[Error]: #ffffffPlayer Peyda Nashod!", thePlayer, 255, 255, 255, true)
		end
		else
			outputChatBox("#C0C0C0Syntax: /setreff <PartOfName/ID> <reff>", thePlayer, 0, 255, 0,true)
		end
end)


addCommandHandler("noclip",
function (thePlayer)
	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pAdmin")) > 1 then
		triggerClientEvent(thePlayer, "command:noclip", thePlayer)
	end
end)

addCommandHandler("setnick",function(thePlayer,cmd,player,typs)
	if player and typs then

	end
end)
-- veh
------ MyPrize

addCommandHandler("prize",
function ( thePlayer, command )

	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pPrize")) == 1 then
		outputChatBox("#ff0000Error: Shoma Ghablan Daryaft Kardid!", thePlayer, 255, 255, 255, true)
		return
	end


	if tonumber(getElementData(accSys:getPlayerAcc(thePlayer), "pPrize")) == 0 then
		local goldPlayer = getElementData(accSys:getPlayerAcc(thePlayer), "pGold")
		setElementData(accSys:getPlayerAcc(thePlayer), "pGold", tonumber(goldPlayer) + 1000)
		setElementData(accSys:getPlayerAcc(thePlayer), "pPrize", 1)
		givePlayerMoney(thePlayer,9000000)
		outputChatBox("#00ff00[Done]: #ffffffShoma Mablaghe #00ff00 20,000,000 $#ffffffPool Va #00ff00 1000 #ffffff Gold Daryaft Kardid ", thePlayer, 0, 255, 0,true)
	else
		outputChatBox("#ff0000Error: Shoma Ghablan Daryaft Kardid!", thePlayer, 255, 255, 255, true)
	end
	
end)



