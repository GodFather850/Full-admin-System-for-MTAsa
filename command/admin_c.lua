---@diagnostic disable: undefined-global, lowercase-global, redundant-parameter, duplicate-set-field
local gunrv = nil
local showid = nil
addEvent("clearedebugscript", true)
addEventHandler("clearedebugscript", root,
function ()
    clearDebugBox ()
end
)
function gunRVFunction(_, _, _, _, _, _, car)
if gunrv then
	if car and getElementType(car) == "vehicle" then
		triggerServerEvent("gunrv:respawnVehicle", resourceRoot, car)
		outputChatBox("#12F20BVehicle Respawn Shod !", 255,255,255, true)
	end
end
end
addEventHandler ("onClientPlayerWeaponFire", localPlayer, gunRVFunction)

addEvent("gunrv:enableOrDisable", true)
addEventHandler("gunrv:enableOrDisable", root,
function ()
    if gunrv == true then
        gunrv = false
		outputChatBox("#EE0A0AGun Rv Disable !",255,255,0,true)
    else
        gunrv = true
		outputChatBox("#12F20BGun Rv Enable !",255,255,0,true)
    end
end
)

function ShowIDPanel(_, _, _, _, _, _, ob)
if showid then
	if ob then
		local obid = getElementModel(ob)
		outputChatBox("#6495EDID : "..obid,255,255,0,true)

		local obid2 = getElementID ( ob ) 
		outputChatBox("#8FBC8FName : "..obid2,255,255,0,true)
	end
end
end
addEventHandler ("onClientPlayerWeaponFire", localPlayer, ShowIDPanel)

music = nil

addEvent("play:music", true)
addEventHandler("play:music", root,
function (link, player, num)
		if link == "off" then
			if music then
				destroyElement(music)
				music = nil
			end
		else
			if music then
				destroyElement(music)
				music = nil
			end
			local x, y, z = getElementPosition(player)
			local dim = getElementDimension(player)
			music = playSound3D(link, x, y, z, true)
			setElementDimension(music, dim)
			if isPedInVehicle(player) then
				local veh = getPedOccupiedVehicle ( player )
				attachElements(music, veh,0,0,0,0)
			end
			setSoundMaxDistance(music, num)
		end
end)


-- 

addEvent("showid:enableOrDisable", true)
addEventHandler("showid:enableOrDisable", root,
function ()
    if showid == true then
        showid = false
		outputChatBox("#ff0000Show Me ID Disable !",255,255,0,true)
    else
        showid = true
		outputChatBox("#00ff00Show Me ID Enable !",255,255,0,true)
    end
end
)

addEventHandler ( "onClientPlayerDamage",root,
function ()
    if getElementData(source,"godmode") then
        cancelEvent()
    end
end)
 
addEventHandler("onClientPlayerStealthKill",localPlayer,
function (targetPlayer)
    if getElementData(targetPlayer,"godmode") then
        cancelEvent()
    end
end)


addEvent("PlayNotif",true)
addEventHandler("PlayNotif",getLocalPlayer(),function(root)
        sound = playSound("notif.mp3",false)
		setSoundVolume(sound,1)
end)




--------For Panel [ETP] !!

local screenW, screenH = guiGetScreenSize()
local font = guiCreateFont("files/Stats.ttf", 12)
local font2 = guiCreateFont("files/Stats.ttf", 11)
WindowPlayer = guiCreateWindow((screenW - 480) / 2, (screenH - 715) / 2.5, 480, 715, "Etelaat Player", false)
guiSetVisible(WindowPlayer, false)
guiSetProperty(WindowPlayer, "AlwaysOnTop", "True")
guiWindowSetSizable(WindowPlayer, false)

--WindowPlayerImages = guiCreateStaticImage(5,20,480,715,"files/bg.png",false, WindowPlayer)

Oks = guiCreateButton(430, 675, 30, 25, "X", false, WindowPlayer)
guiSetProperty(Oks, "NormalTextColour", "FFFF0000")
guiSetFont(Oks, font2)

addEvent("CheckPanelStats",true)
addEventHandler("CheckPanelStats",getLocalPlayer(),function(player,user,oname,pRamz,Serial,Lvl,Admines,PremG,TimePlay,Registers,LastLogins,RealName,Sexss,Senesh,Poolesh,Mutesh,Colorname,jailesh,vaziat,Matesh,factionLeader,Fpesh,Warnesh,rank,Joinesh,Skinesh,Shomaresh,Robpoint,Wantedesh,Gmail,Ipish,DalilBan,kasiKeKarde,TimeBanesh,Reffesh,Refkie,Heleprshs,Goldesh,Slotesh,Recoilesh,Bankesh,PassBankesh,Housesh,Ahangesh,Smsesh,Sharzhesh)
guiSetText ( names2, ""..user )
guiSetText ( onamess2, ""..oname )
guiSetText ( Ramzes2, ""..pRamz )
guiSetText ( Serials2, ""..Serial )
guiSetText ( Levels2, ""..Lvl )
guiSetText ( Adminssq, ""..Admines )
guiSetText ( Prg2, ""..PremG )
guiSetText ( TPL2, ""..TimePlay )
guiSetText ( RGT2, ""..Registers )
guiSetText ( LST2, ""..LastLogins )
guiSetText ( RLM2, ""..RealName )
guiSetText ( Sexs2, ""..Sexss )
guiSetText ( SN2, ""..Senesh )
guiSetText ( Csh2, ""..Poolesh )
guiSetText ( MTP2, ""..Mutesh )
guiSetText ( CRM2, ""..Colorname )
guiSetText ( JTM2, ""..jailesh )
guiSetText ( SRL2, ""..vaziat )
guiSetText ( MT2, ""..Matesh )
guiSetText ( Fc2, ""..factionLeader )
guiSetText ( RNK2, ""..rank )
guiSetText ( Fps2, ""..Fpesh )
guiSetText ( FWN2, ""..Warnesh )
guiSetText ( JF2, ""..Joinesh )
guiSetText ( Skn2, ""..Skinesh )
guiSetText ( NMB23, ""..Shomaresh )
guiSetText ( RBOP, ""..Robpoint )
guiSetText ( WENS, ""..Wantedesh )
guiSetText ( EMWWS, ""..Gmail )
guiSetText ( IPOI, ""..Ipish )
guiSetText ( DLSJDH, ""..DalilBan )
guiSetText ( BNBND, ""..kasiKeKarde )
guiSetText ( JJHHJJHH, ""..TimeBanesh )
guiSetText ( RFTR, ""..Reffesh )
guiSetText ( YYTTGHG, ""..Refkie )
guiSetText ( HBGHF, ""..Heleprshs )
guiSetText ( GFHFG, ""..Goldesh )
guiSetText ( Sik1, ""..Slotesh )
guiSetText ( Sik2, ""..Bankesh )
guiSetText ( PSBN, ""..PassBankesh )
guiSetText ( Kos1, ""..Housesh )
guiSetText ( Kos2, ""..Sharzhesh )
guiSetVisible(WindowPlayer, true)
showCursor(true)
playSoundFrontEnd ( 6 )
end )

names = guiCreateLabel(20, 30, 360, 50, "NickName : ", false, WindowPlayer)
guiLabelSetColor(names, 255 , 255 , 255 )
guiSetFont(names, font)

names2 = guiCreateLabel(115, 30, 360, 50, "", false, WindowPlayer)
guiLabelSetColor(names2,222, 144, 25)
guiSetFont(names2, font)

onamess = guiCreateLabel(20, 60, 360, 50, "OldName :", false, WindowPlayer)
guiLabelSetColor(onamess, 255 , 255 , 255 )
guiSetFont(onamess, font)

onamess2 = guiCreateLabel(115, 60, 360, 50, "", false, WindowPlayer)
guiLabelSetColor(onamess2, 222, 144, 25)
guiSetFont(onamess2, font)

Ramzes = guiCreateLabel(20, 90, 360, 50, "Ramz :", false, WindowPlayer)
guiLabelSetColor(Ramzes, 255 , 255 , 255 )
guiSetFont(Ramzes, font)

Ramzes2 = guiCreateLabel(80, 90, 360, 50, "", false, WindowPlayer)
guiLabelSetColor(Ramzes2, 222, 144, 25)
guiSetFont(Ramzes2, font)

Serials = guiCreateLabel(20, 120, 360, 50, "Serial :", false, WindowPlayer)
guiLabelSetColor(Serials, 255 , 255 , 255 )
guiSetFont(Serials, font)

Serials2 = guiCreateLabel(70, 120, 360, 50, "", false, WindowPlayer)
guiLabelSetColor(Serials2,222, 144, 25)
guiSetFont(Serials2, font)

Levels = guiCreateLabel(20, 150, 360, 50, "Level :", false, WindowPlayer)
guiLabelSetColor(Levels, 255 , 255 , 255 )
guiSetFont(Levels, font)

Levels2 = guiCreateLabel(70, 150, 360, 50, "", false, WindowPlayer)
guiLabelSetColor(Levels2,222, 144, 25)
guiSetFont(Levels2, font)


Adminss = guiCreateLabel(20, 180, 360, 50, "Admins :", false, WindowPlayer)
guiLabelSetColor(Adminss, 255 , 255 , 255 )
guiSetFont(Adminss, font)

Adminssq = guiCreateLabel(90, 180, 360, 50, "", false, WindowPlayer)
guiLabelSetColor(Adminssq, 222, 144, 25 )
guiSetFont(Adminssq, font)

Prg = guiCreateLabel(20, 210, 360, 50, "Premium Gold :", false, WindowPlayer)
guiLabelSetColor(Prg, 255 , 255 , 255 )
guiSetFont(Prg, font)

Prg2 = guiCreateLabel(135, 210, 360, 50, "", false, WindowPlayer)
guiLabelSetColor(Prg2, 222, 144, 25 )
guiSetFont(Prg2, font)

TPL = guiCreateLabel(20, 240, 360, 50, "Time Play:", false, WindowPlayer)
guiLabelSetColor(TPL, 255 , 255 , 255 )
guiSetFont(TPL, font)

TPL2 = guiCreateLabel(100, 240, 360, 50, "", false, WindowPlayer)
guiLabelSetColor(TPL2,222, 144, 25 )
guiSetFont(TPL2, font)

RGT = guiCreateLabel(20, 270, 360, 50, "RegisterTime :", false, WindowPlayer)
guiLabelSetColor(RGT, 255 , 255 , 255 )
guiSetFont(RGT, font)

RGT2 = guiCreateLabel(130, 270, 360, 50, "", false, WindowPlayer)
guiLabelSetColor(RGT2, 222, 144, 25)
guiSetFont(RGT2, font)

LST = guiCreateLabel(20, 300, 360, 50, "LastLogin:", false, WindowPlayer)
guiLabelSetColor(LST, 255 , 255 , 255 )
guiSetFont(LST, font)

LST2 = guiCreateLabel(100, 300, 360, 50, "", false, WindowPlayer)
guiLabelSetColor(LST2, 222, 144, 25 )
guiSetFont(LST2, font)

RLM = guiCreateLabel(20, 330, 360, 50, "RealName :", false, WindowPlayer)
guiLabelSetColor(RLM, 255 , 255 , 255 )
guiSetFont(RLM, font)

RLM2 = guiCreateLabel(100, 330, 360, 50, "", false, WindowPlayer)
guiLabelSetColor(RLM2, 222, 144, 25 )
guiSetFont(RLM2, font)

Sexs = guiCreateLabel(20, 360, 360, 50, "Sex :", false, WindowPlayer)
guiLabelSetColor(Sexs, 255 , 255 , 255 )
guiSetFont(Sexs, font)

Sexs2 = guiCreateLabel(60, 360, 360, 50, "", false, WindowPlayer)
guiLabelSetColor(Sexs2, 222, 144, 25 )
guiSetFont(Sexs2, font)

SN = guiCreateLabel(20, 390, 360, 50, "Sen :", false, WindowPlayer)
guiLabelSetColor(SN, 255 , 255 , 255 )
guiSetFont(SN, font)

SN2 = guiCreateLabel(60, 390, 360, 50, "", false, WindowPlayer)
guiLabelSetColor(SN2, 222, 144, 25 )
guiSetFont(SN2, font)

Csh = guiCreateLabel(20, 420, 360, 50, "Cash :", false, WindowPlayer)
guiLabelSetColor(Csh, 255 , 255 , 255 )
guiSetFont(Csh, font)

Csh2 = guiCreateLabel(70, 420, 360, 50, "", false, WindowPlayer)
guiLabelSetColor(Csh2, 222, 144, 25 )
guiSetFont(Csh2, font)

MTP = guiCreateLabel(20, 450, 360, 50, "MuteTime :", false, WindowPlayer)
guiLabelSetColor(MTP, 255 , 255 , 255 )
guiSetFont(MTP, font)

MTP2 = guiCreateLabel(110, 450, 360, 50, "", false, WindowPlayer)
guiLabelSetColor(MTP2, 222, 144, 25 )
guiSetFont(MTP2, font)

CRM = guiCreateLabel(20, 480, 360, 50, "ColorName :", false, WindowPlayer)
guiLabelSetColor(CRM, 255 , 255 , 255 )
guiSetFont(CRM, font)

CRM2 = guiCreateLabel(110, 480, 360, 50, "", false, WindowPlayer)
guiLabelSetColor(CRM2, 222, 144, 25)
guiSetFont(CRM2, font)

JTM = guiCreateLabel(20, 510, 360, 50, "JailTime :", false, WindowPlayer)
guiLabelSetColor(JTM, 255 , 255 , 255 )
guiSetFont(JTM, font)

JTM2 = guiCreateLabel(100, 510, 360, 50, "", false, WindowPlayer)
guiLabelSetColor(JTM2, 222, 144, 25 )
guiSetFont(JTM2, font)

SRL = guiCreateLabel(20, 540, 360, 50, "SerialLock :", false, WindowPlayer)
guiLabelSetColor(SRL, 255 , 255 , 255 )
guiSetFont(SRL, font)

SRL2 = guiCreateLabel(120, 540, 360, 50, "", false, WindowPlayer)
guiLabelSetColor(SRL2, 222, 144, 25 )
guiSetFont(SRL2, font)

MT = guiCreateLabel(20, 570, 360, 50, "Mats :", false, WindowPlayer)
guiLabelSetColor(MT, 255 , 255 , 255 )
guiSetFont(MT, font)

MT2 = guiCreateLabel(70, 570, 360, 50, "", false, WindowPlayer)
guiLabelSetColor(MT2, 222, 144, 25 )
guiSetFont(MT2, font)

Fc = guiCreateLabel(20, 600, 360, 50, "Faction :", false, WindowPlayer)
guiLabelSetColor(Fc, 255 , 255 , 255 )
guiSetFont(Fc, font)

Fc2 = guiCreateLabel(90, 600, 360, 50, "", false, WindowPlayer)
guiLabelSetColor(Fc2, 222, 144, 25)
guiSetFont(Fc2, font)

RNK = guiCreateLabel(20, 630, 360, 50, "Rank :", false, WindowPlayer)
guiLabelSetColor(RNK, 255 , 255 , 255 )
guiSetFont(RNK, font)

RNK2 = guiCreateLabel(70, 630, 360, 50, "", false, WindowPlayer)
guiLabelSetColor(RNK2, 222, 144, 25 )
guiSetFont(RNK2, font)

Fps = guiCreateLabel(260, 30, 360, 50, "Fp :", false, WindowPlayer)
guiLabelSetColor(Fps, 255 , 255 , 255 )
guiSetFont(Fps, font)

Fps2 = guiCreateLabel(290, 30, 360, 50, "", false, WindowPlayer)
guiLabelSetColor(Fps2, 222, 144, 25 )
guiSetFont(Fps2, font)

FWN = guiCreateLabel(260, 60, 360, 50, "FWawrn :", false, WindowPlayer)
guiLabelSetColor(FWN, 255 , 255 , 255 )
guiSetFont(FWN, font)

FWN2 = guiCreateLabel(330, 60, 360, 50, "", false, WindowPlayer)
guiLabelSetColor(FWN2, 222, 144, 25 )
guiSetFont(FWN2, font)

JF = guiCreateLabel(260, 90, 360, 50, "FJoin :", false, WindowPlayer)
guiLabelSetColor(JF, 255 , 255 , 255 )
guiSetFont(JF, font)

JF2 = guiCreateLabel(310, 90, 360, 50, "", false, WindowPlayer)
guiLabelSetColor(JF2, 222, 144, 25 )
guiSetFont(JF2, font)

Skn = guiCreateLabel(260, 240, 100, 50, "Skin :", false, WindowPlayer)
guiLabelSetColor(Skn, 255 , 255 , 255 )
guiSetFont(Skn, font)

Skn2 = guiCreateLabel(310, 240, 100, 50, "", false, WindowPlayer)
guiLabelSetColor(Skn2, 222, 144, 25 )
guiSetFont(Skn2, font)

NMB = guiCreateLabel(260, 150, 360, 50, "Number :", false, WindowPlayer)
guiLabelSetColor(NMB, 255 , 255 , 255 )
guiSetFont(NMB, font)

NMB23 = guiCreateLabel(330, 150, 360, 50, "", false, WindowPlayer)
guiLabelSetColor(NMB23, 222, 144, 25)
guiSetFont(NMB23, font)

NMB2 = guiCreateLabel(260, 180, 360, 50, "RobPoint :", false, WindowPlayer)
guiLabelSetColor(NMB2, 255 , 255 , 255 )
guiSetFont(NMB2, font)

RBOP = guiCreateLabel(340, 180, 360, 50, "", false, WindowPlayer)
guiLabelSetColor(RBOP,222, 144, 25 )
guiSetFont(RBOP, font)

NMB3 = guiCreateLabel(260, 210, 360, 50, "Wanted :", false, WindowPlayer)
guiLabelSetColor(NMB3, 255 , 255 , 255 )
guiSetFont(NMB3, font)

WENS = guiCreateLabel(330, 210, 360, 50, "", false, WindowPlayer)
guiLabelSetColor(WENS, 222, 144, 25 )
guiSetFont(WENS, font)

NMB4 = guiCreateLabel(20, 660, 360, 50, "Email :", false, WindowPlayer)
guiLabelSetColor(NMB4, 255 , 255 , 255 )
guiSetFont(NMB4, font)

EMWWS = guiCreateLabel(70, 660, 360, 50, "", false, WindowPlayer)
guiLabelSetColor(EMWWS, 222, 144, 25 )
guiSetFont(EMWWS, font)

NMB5 = guiCreateLabel(260, 270, 360, 50, "IP :", false, WindowPlayer)
guiLabelSetColor(NMB5, 255 , 255 , 255 )
guiSetFont(NMB5, font)

IPOI = guiCreateLabel(290, 270, 360, 50, "", false, WindowPlayer)
guiLabelSetColor(IPOI,222, 144, 25)
guiSetFont(IPOI, font)

NMB6 = guiCreateLabel(260, 300, 360, 50, "Dalileban :", false, WindowPlayer)
guiLabelSetColor(NMB6, 255 , 255 , 255 )
guiSetFont(NMB6, font)

DLSJDH = guiCreateLabel(340, 300, 360, 50, "", false, WindowPlayer)
guiLabelSetColor(DLSJDH, 222, 144, 25)
guiSetFont(DLSJDH, font)

NMB7 = guiCreateLabel(260, 330, 360, 50, "BannedBy :", false, WindowPlayer)
guiLabelSetColor(NMB7, 255 , 255 , 255 )
guiSetFont(NMB7, font)

BNBND = guiCreateLabel(345, 330, 360, 50, "", false, WindowPlayer)
guiLabelSetColor(BNBND, 222, 144, 25 )
guiSetFont(BNBND, font)

NMB8 = guiCreateLabel(260, 360, 360, 50, "BanTime :", false, WindowPlayer)
guiLabelSetColor(NMB8, 255 , 255 , 255 )
guiSetFont(NMB8, font)

JJHHJJHH = guiCreateLabel(335, 360, 360, 50, "", false, WindowPlayer)
guiLabelSetColor(JJHHJJHH, 222, 144, 25 )
guiSetFont(JJHHJJHH, font)

NMB9 = guiCreateLabel(260, 390, 360, 50, "Refferal :", false, WindowPlayer)
guiLabelSetColor(NMB9, 255 , 255 , 255 )
guiSetFont(NMB9, font)

RFTR = guiCreateLabel(330, 390, 360, 50, "", false, WindowPlayer)
guiLabelSetColor(RFTR, 222, 144, 25)
guiSetFont(RFTR, font)


NMB99 = guiCreateLabel(260, 420, 360, 50, "RefKie :", false, WindowPlayer)
guiLabelSetColor(NMB99, 255 , 255 , 255 )
guiSetFont(NMB99, font)

YYTTGHG = guiCreateLabel(320, 420, 360, 50, "", false, WindowPlayer)
guiLabelSetColor(YYTTGHG, 222, 144, 25 )
guiSetFont(YYTTGHG, font)

NMB88 = guiCreateLabel(260, 450, 360, 50, "Heleprs :", false, WindowPlayer)
guiLabelSetColor(NMB88, 255 , 255 , 255 )
guiSetFont(NMB88, font)

HBGHF = guiCreateLabel(330, 450, 360, 50, "", false, WindowPlayer)
guiLabelSetColor(HBGHF, 222, 144, 25 )
guiSetFont(HBGHF, font)

NMB77 = guiCreateLabel(260, 480, 360, 50, "Gold :", false, WindowPlayer)
guiLabelSetColor(NMB77, 255 , 255 , 255 )
guiSetFont(NMB77, font)

GFHFG = guiCreateLabel(310, 480, 360, 50, "", false, WindowPlayer)
guiLabelSetColor(GFHFG, 222, 144, 25 )
guiSetFont(GFHFG, font)

NMB66 = guiCreateLabel(260, 510, 360, 50, "Slot Car :", false, WindowPlayer)
guiLabelSetColor(NMB66, 255 , 255 , 255 )
guiSetFont(NMB66, font)

Sik1 = guiCreateLabel(330, 510, 360, 50, "", false, WindowPlayer)
guiLabelSetColor(Sik1, 222, 144, 25 )
guiSetFont(Sik1, font)

NMB55 = guiCreateLabel(260, 540, 360, 50, "Bank Cash :", false, WindowPlayer)
guiLabelSetColor(NMB55, 255 , 255 , 255 )
guiSetFont(NMB55, font)

Sik2 = guiCreateLabel(350, 540, 360, 50, "", false, WindowPlayer)
guiLabelSetColor(Sik2, 222, 144, 25 )
guiSetFont(Sik2, font)

NMB44 = guiCreateLabel(260, 570, 360, 50, "Pass Bank :", false, WindowPlayer)
guiLabelSetColor(NMB44, 255 , 255 , 255 )
guiSetFont(NMB44, font)

PSBN = guiCreateLabel(340, 570, 360, 50, "", false, WindowPlayer)
guiLabelSetColor(PSBN, 222, 144, 25)
guiSetFont(PSBN, font)

NMB22 = guiCreateLabel(260, 600, 360, 50, "House ID :", false, WindowPlayer)
guiLabelSetColor(NMB22, 255 , 255 , 255 )
guiSetFont(NMB22, font)

Kos1 = guiCreateLabel(340, 600, 360, 50, "", false, WindowPlayer)
guiLabelSetColor(Kos1, 222, 144, 25 )
guiSetFont(Kos1, font)

NMB111 = guiCreateLabel(260, 630, 360, 50, "Sharj :", false, WindowPlayer)
guiLabelSetColor(NMB111, 255 , 255 , 255 )
guiSetFont(NMB111, font)

Kos2 = guiCreateLabel(310, 630, 360, 50, "", false, WindowPlayer)
guiLabelSetColor(Kos2,222, 144, 25 )
guiSetFont(Kos2, font)

addEventHandler("onClientGUIClick", getRootElement(),
function ()
    if source == Oks then
        guiSetProperty(WindowPlayer, "Visible", "False")
		showCursor(false)
		playSoundFrontEnd ( 0 )
    end
end)


---For Fly Car 

local CarFly = false

addEvent("CFly",true)
addEventHandler("CFly", root,
function ( thePlayer )
	if ( thePlayer == getLocalPlayer() ) then
		if CarFly == true then
			CarFly = false
			setWorldSpecialPropertyEnabled( "aircars", false )
			setWorldSpecialPropertyEnabled( "hovercars", false )
			outputChatBox("#00CADA[Cfly]: #ffffffCar Fly #ff0000Off #ffffffShod!", 255, 255, 255, true)
		else
			CarFly = true
			setWorldSpecialPropertyEnabled( "aircars", true )
			setWorldSpecialPropertyEnabled( "hovercars", true )
			outputChatBox("#00CADA[Cfly]: #ffffffCar Fly #00ff00On #ffffffShod!", 255, 255, 255, true)
		end
	end
end)


---For Mother Fucker

addEvent("makeFireworks", true)
targets = { }
function createFireworks(element,x,y,z)
    math.randomseed(getTickCount()+x+y+z)
    for i=1,20 do
        targets[i] = createObject(1212,x+math.random(-50,50),y+math.random(-50,50),z+50)
        setTimer(setElementAlpha,100,1,targets[i],0)
        setTimer(destroyElement,80000,1,targets[i])
        setTimer(moveObject,4000,1,targets[i],5000,x+math.random(-50,50),y+math.random(-50,50),z+50,0,0,0,"SineCurve")
    end
    
     setTimer(function()
        for i=1,20 do
            setTimer(createProjectile,175*i,1,element,20,x,y,z+0.5,1.0,targets[i],90,0,0,0,0,0.001,2780)
        end
        end,1000,2)
        
end
addEventHandler("makeFireworks", root, createFireworks)


----For Music 

local subTrackOnSoundDown = 0.1
local subTrackOnSoundUp = 0.1
local spam
local spam2

function print(message, r, g, b)
    outputChatBox(message, r, g, b)
end

local rx, ry = guiGetScreenSize()
button = {}
window = guiCreateWindow((rx - 295), (ry / 2 - 253 / 2), 293, 253, "Speakers", false)
guiWindowSetSizable(window, false)
guiSetVisible(window, false)
CurrentSpeaker = guiCreateLabel(8, 33, 254, 17, "Vaziate Speaker:", false, window)
volume = guiCreateLabel(10, 50, 252, 17, "Max Sound 100%", false, window)
pos = guiCreateLabel(10, 66, 252, 15, "X: 0 | Y: 0 | Z: 0", false, window)
guiCreateLabel(11, 81, 251, 15, "Link:", false, window)
url = guiCreateEdit(11, 96, 272, 23, "", false, window)
button["place"] = guiCreateButton(9, 129, 274, 20, "Create Speaker", false, window)
guiSetProperty(button["place"], "HoverTextColour", "FF7FFF00")
button["remove"] = guiCreateButton(9, 159, 274, 20, "Destroy Speaker", false, window)
guiSetProperty(button["remove"], "HoverTextColour", "FF00FF00")
button["v-"] = guiCreateButton(9, 189, 128, 20, "Volume -", false, window)
button["v+"] = guiCreateButton(155, 189, 128, 20, "Volume +", false, window)
button["close"] = guiCreateButton(9, 219, 274, 20, "Exit", false, window)

local isSound = false
addEvent("onPlayerViewSpeakerManagement", true)
addEventHandler("onPlayerViewSpeakerManagement", root,
    function(current)
        local toState = not guiGetVisible(window)
        guiSetVisible(window, toState)
        showCursor(toState)
        if (toState == true) then
            guiSetInputMode("no_binds_when_editing")
            local x, y, z = getElementPosition(localPlayer)
            guiSetText(pos, "X: " .. math.floor(x) .. " | Y: " .. math.floor(y) .. " | Z: " .. math.floor(z))
            if (current) then
                guiSetText(CurrentSpeaker, "Vaziate Speaker: Faal")
                isSound = true
            else
                guiSetText(CurrentSpeaker, "Vaziate Speaker: Gheyr Faal")
            end
        end
    end
)

addEventHandler("onClientGUIClick", root,
    function()
        if (source == button["close"]) then
            guiSetVisible(window, false)
            showCursor(false)
        elseif (source == button["place"]) then
            if (isURL()) then
				if spam and isTimer(spam) then return print("Spam Nakonid , Lotfan 5 Sanie Sabr Konid!", 255, 0, 0) end
				spam = setTimer(function() end,5000,1)
                triggerServerEvent("onPlayerPlaceSpeakerBox", localPlayer, guiGetText(url), isPedInVehicle(localPlayer))
                guiSetText(CurrentSpeaker, "Vaziate Speaker: Faal")
                isSound = true
                guiSetText(volume, "Current Volume: 100%")
            else
                print("Link Music Ra Vared Konid!", 255, 0, 0)
            end
        elseif (source == button["remove"]) then
			if spam2 and isTimer(spam2) then return print("Spam Nakonid , Lotfan 3 Sanie Sabr Konid!", 255, 0, 0) end
			spam2 = setTimer(function() end,3000,1)
            triggerServerEvent("onPlayerDestroySpeakerBox", localPlayer)
            guiSetText(CurrentSpeaker, "Vaziate Speaker: Gheyr Faal")
            isSound = false
            guiSetText(volume, "Max Sound: 100%")
        elseif (source == button["v-"]) then
            if (isSound) then
                local toVol = math.round(getSoundVolume(speakerSound[localPlayer]) - subTrackOnSoundDown, 2)
                if (toVol > 0.0) then
                    print("Volume set to " .. math.floor(toVol * 100) .. "%!", 0, 255, 0)
                    triggerServerEvent("onPlayerChangeSpeakerBoxVolume", localPlayer, toVol)
                    guiSetText(volume, "Max Sound: " .. math.floor(toVol * 100) .. "%")
                else
                    print("Az In kamtar Nmishe!", 255, 0, 0)
                end
            end
        elseif (source == button["v+"]) then
            if (isSound) then
                local toVol = math.round(getSoundVolume(speakerSound[localPlayer]) + subTrackOnSoundUp, 2)
                if (toVol < 1.1) then
                    print("Volum Tanzim Shod Roye: " .. math.floor(toVol * 100) .. "%!", 0, 255, 0)
                    triggerServerEvent("onPlayerChangeSpeakerBoxVolume", localPlayer, toVol)
                    guiSetText(volume, "Max Sound: " .. math.floor(toVol * 100) .. "%")
                else
                    print("Volum Bishtar Az in Nmishe!", 255, 0, 0)
                end
            end
        end
    end
)

speakerSound = {}
addEvent("onPlayerStartSpeakerBoxSound", true)
addEventHandler("onPlayerStartSpeakerBoxSound", root,
    function(who, url, isCar)
        if (isElement(speakerSound[who])) then
            destroyElement(speakerSound[who])
        end
        if string.len(url) > 150 then
            return
        end
        local x, y, z = getElementPosition(who)
        speakerSound[who] = playSound3D(url, x, y, z, true)
        setSoundVolume(speakerSound[who], 1)
        setSoundMinDistance(speakerSound[who], 230)
        setSoundMaxDistance(speakerSound[who], 250)
        if (isCar) then
            local car = getPedOccupiedVehicle(who)
            attachElements(speakerSound[who], car, 0, 5, 1)
        end
    end
)

addEvent("onPlayerDestroySpeakerBox", true)
addEventHandler("onPlayerDestroySpeakerBox", root,
    function(who)
        if (isElement(speakerSound[who])) then
            destroyElement(speakerSound[who])
        end
    end
)

addEvent("onPlayerChangeSpeakerBoxVolumeC", true)
addEventHandler("onPlayerChangeSpeakerBoxVolumeC", root,
    function(who, vol)
        if (isElement(speakerSound[who])) then
            setSoundVolume(speakerSound[who], tonumber(vol))
        end
    end
)

function isURL()
    if string.len(tostring(url)) < 150 then
        if (guiGetText(url) ~= "") then
            return true
        else
            return false
        end
    end
end

function math.round(number, decimals, method)
    decimals = decimals or 0
    local factor = 10 ^ decimals
    if (method == "ceil" or method == "floor") then
        return math[method](number * factor) / factor
    else
        return tonumber(("%." .. decimals .. "f"):format(number))
    end
end


--- For Report 

local screenW, screenH = guiGetScreenSize()
local font = guiCreateFont("files/GOTHIC.ttf", 11)
BG = guiCreateWindow((screenW - 300) / 2, (screenH - 350) / 2, 300, 350, "Report", false)

Onvan = guiCreateEdit(10, 65, 320, 25, "", false, BG)
guiSetFont(Onvan, font)
guiEditSetMaxLength ( Onvan, 20 )  

OnvanLb = guiCreateLabel(10, 30, 70, 30, "Onvan:", false, BG)
guiLabelSetColor(OnvanLb, 203, 203, 203)
guiSetFont(OnvanLb, font)

Tozih = guiCreateLabel(10, 105, 100, 30, "Tozihat:", false, BG)
guiLabelSetColor(Tozih, 203, 203, 203)
guiSetFont(Tozih, font)

editBoxo = guiCreateMemo(10, 140, 400, 130, "", false, BG)

Close = guiCreateButton(10, 300, 100, 30, "Close", false, BG)
guiSetFont(Close, font)
guiSetProperty(Close, "NormalTextColour", "FFFE0000" )

Send = guiCreateButton(200, 300, 100, 30, "Send", false, BG)
guiSetFont(Send, font)
guiSetProperty(Send, "NormalTextColour", "FF00FF00" )

guiSetProperty(BG,"Visible","False")


-----

addEvent("OpenReports",true)
addEventHandler("OpenReports",getLocalPlayer(),
function (thePlayer)
	guiSetProperty(BG,"Visible","True")
	guiSetInputEnabled( true )
	showCursor(true)
end)


-------

addEventHandler("onClientGUIClick",getRootElement(),function()
	if source == Close then
		guiSetProperty(BG,"Visible","False")
		showCursor(false)
		guiSetInputEnabled( false )
		playSoundFrontEnd ( 20 )
	elseif source == Send then
	    local message = guiGetText(editBoxo)
		local onvan = guiGetText(Onvan)
		if ( string.len ( guiGetText ( Onvan ) ) ) > 1 or ( string.len ( guiGetText ( editBoxo ) ) ) > 1 then
			local payam = tostring(message)
			local onvann = tostring(onvan)
			triggerServerEvent("SendReports",getLocalPlayer(),getLocalPlayer(),payam,onvann)
			exports["notf"]:addNotification( "Report Shoma Baraye Admin Haye Server Ersal Shod!" , 'success')
			guiSetInputEnabled( false )
			playSoundFrontEnd ( 20 )
			guiSetProperty(BG,"Visible","False")
			showCursor(false)			
		else
			exports["notf"]:addNotification( "Kadr Haye Report Khali Mibashad!" , 'error')
			playSoundFrontEnd ( 4 )
		end
	
	end
end)

