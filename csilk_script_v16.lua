-- Flagship Script

local rad_option_0a = "Recieve Bullseye Call"

local rad_option_0b = "Change Difficulty Setting"
local rad_option_1b = "Change Task Spawn Distance"
local rad_option_2b = "Toggle Enemy Smoke Markers"

local rad_option_0c = "Intercept: Fighters"
local rad_option_1c = "Intercept: Bomber and Escort"
local rad_option_2c = "Moving Mud: Fortified"



Radio_Table = {}

zone = {}
bzone = {}
mzone = {}

grpName = {}
mudName = {}
bgrpName = {}
egrpName = {}

smoke_marker = {}

--MudName = Mud[mrand]
--MudGrp = Group.getByName(MudName)
--MudUnits = MudGrp:getUnits()

RunwayID = 0


bspawnPsn = {}
espawnPsn = {}
spawnPsn = {}
mudPsn = {}


Smoke = 1
SmokeCoord = {}
Difficulty = "Easy"
Difficultymod = 1
Range = "Standard"
Task_Range = 2

Rad = {
  "Anapa-21 #1",
  "Anapa-21 #2",
  "Anapa-21 #3",
  "Anapa-21 #4",
  "Anapa-21 #5",
  "Anapa-21 #6",
  "Anapa-25T #1",
  "Anapa-25T #2",
  "Anapa-25T #3",
  "Anapa-25T #4",
  "Anapa-25T #5",
  "Anapa-25T #6",
  "Anapa-25 #1",
  "Anapa-25 #2",
  "Anapa-25 #3",
  "Anapa-25 #4",
  "Anapa-25 #5",
  "Anapa-25 #6",
  "Anapa-A10C #1",
  "Anapa-A10C #2",
  "Anapa-A10C #3",
  "Anapa-A10C #4",
  "Anapa-A10C #5",
  "Anapa-A10C #6",
  "Anapa-A10A #1",
  "Anapa-A10A #2",
  "Anapa-A10A #3",
  "Anapa-A10A #4",
  "Anapa-A10A #5",
  "Anapa-A10A #6",
  "Anapa-F15C #1",
  "Anapa-F15C #2",
  "Anapa-F15C #3",
  "Anapa-F15C #4",
  "Anapa-F15C #5",
  "Anapa-F15C #6",
  "Anapa-F86F #1",
  "Anapa-F86F #2",
  "Anapa-F86F #3",
  "Anapa-F86F #4",
  "Anapa-F86F #5",
  "Anapa-F86F #6",
  "Anapa-KA50 #1",
  "Anapa-KA50 #2",
  "Anapa-KA50 #3",
  "Anapa-KA50 #4",
  "Anapa-KA50 #5",
  "Anapa-KA50 #6",
  "Anapa-KA50 #7",
  "Anapa-KA50 #8",
  "Anapa-UH1H #1",
  "Anapa-UH1H #2",
  "Anapa-UH1H #3",
  "Anapa-UH1H #4",
  "Anapa-Mi8 #1",
  "Anapa-Mi8 #2",
  "Anapa-Mi8 #3",
  "Anapa-Mi8 #4",
  "Mozdok-21 #1",
  "Mozdok-21 #2",
  "Mozdok-21 #3",
  "Mozdok-21 #4",
  "Mozdok-21 #5",
  "Mozdok-21 #6",
  "Mozdok-15C #1",
  "Mozdok-15C #2",
  "Mozdok-15C #3",
  "Mozdok-15C #4",
  "Mozdok-15C #5",
  "Mozdok-15C #6",
  "Vaziani-21 #1",
  "Vaziani-21 #2",
  "Vaziani-21 #3",
  "Vaziani-21 #4",
  "Vaziani-21 #5",
  "Vaziani-21 #6",
  "Vaziani-15C #1",
  "Vaziani-15C #2",
  "Vaziani-15C #3",
  "Vaziani-15C #4",
  "Vaziani-15C #5",
  "Vaziani-15C #6",
  "Sochi-21 #1",
  "Sochi-21 #2",
  "Sochi-21 #3",
  "Sochi-21 #4",
  "Sochi-21 #5",
  "Sochi-21 #6",
  "Sochi-15C #1",
  "Sochi-15C #2",
  "Sochi-15C #3",
  "Sochi-15C #4",
  "Sochi-15C #5",
  "Sochi-15C #6",
  "Kutaisi-21 #1",
  "Kutaisi-21 #2",
  "Kutaisi-21 #3",
  "Kutaisi-21 #4",
  "Kutaisi-21 #5",
  "Kutaisi-21 #6",
  "Kutaisi-15C #1",
  "Kutaisi-15C #2",
  "Kutaisi-15C #3",
  "Kutaisi-15C #4",
  "Kutaisi-15C #5",
  "Kutaisi-15C #6",
  "Maykop-21 #1",
  "Maykop-21 #2",
  "Maykop-21 #3",
  "Maykop-21 #4",
  "Maykop-21 #5",
  "Maykop-21 #6",
  "Maykop-15C #1",
  "Maykop-15C #2",
  "Maykop-15C #3",
  "Maykop-15C #4",
  "Maykop-15C #5",
  "Maykop-15C #6",
}

Mud_Easy = {
  [1] = "Mud Fortified (Easy) #000",
  [2] = "Mud Fortified (Easy) #001",
}

Mud_Normal = {
  [1] = "Mud Fortified (Normal) #000",
  [2] = "Mud Fortified (Normal) #001",
}

Mud_Hard = {
  [1] = "Mud Fortified (Hard) #000",
  [2] = "Mud Fortified (Hard) #001",
}

Mud_VeryHard = {
  [1] = "Mud Fortified (VeryHard) #000",
  [2] = "Mud Fortified (VeryHard) #001",
}

Mud_Names = 2

Fighter_Names_Easy = {
  [1] = 'MiG-21 (Easy)',
  [2] = 'MiG-23 (Easy)',
  [3] = 'MiG-29S (Easy)',
  [4] = 'MiG-29A (Easy)',
  [5] = 'F-16C bl.52d (Easy)',
  [6] = 'Su-27 (Easy)',
  [7] = '2000-5 (Easy)',
  [8] = 'F-86 (Easy)',
  [9] = 'MiG-25PD (Easy)',
  [10] = 'F-16C (Easy)',
  [11] = 'F-4E (Easy)',
  [12] = 'F-5E (Easy)',	
}

Fighter_Names_Normal = {
  [1] = 'MiG-21 (Normal)',
  [2] = 'MiG-23 (Normal)',
  [3] = 'MiG-29S (Normal)',
  [4] = 'MiG-29A (Normal)',
  [5] = 'F-16C bl.52d (Normal)',
  [6] = 'Su-27 (Normal)',
  [7] = '2000-5 (Normal)',
  [8] = 'F-86 (Normal)',
  [9] = 'MiG-25PD (Normal)',
  [10] = 'F-16C (Normal)',
  [11] = 'F-4E (Normal)',
  [12] = 'F-5E (Normal)',	
}


Fighter_Names_Hard = {
  [1] = 'MiG-21 (Hard)',
  [2] = 'MiG-23 (Hard)',
  [3] = 'MiG-29S (Hard)',
  [4] = 'MiG-29A (Hard)',
  [5] = 'F-16C bl.52d (Hard)',
  [6] = 'Su-27 (Hard)',
  [7] = '2000-5 (Hard)',
  [8] = 'F-86 (Hard)',
  [9] = 'MiG-25PD (Hard)',
  [10] = 'F-16C (Hard)',
  [11] = 'F-4E (Hard)',
  [12] = 'F-5E (Hard)',	
}

Fighter_Names_VeryHard = {
  [1] = 'MiG-21 (VeryHard)',
  [2] = 'MiG-23 (VeryHard)',
  [3] = 'MiG-29S (VeryHard)',
  [4] = 'MiG-29A (VeryHard)',
  [5] = 'F-16C bl.52d (VeryHard)',
  [6] = 'Su-27 (VeryHard)',
  [7] = '2000-5 (VeryHard)',
  [8] = 'F-86 (VeryHard)',
  [9] = 'MiG-25PD (VeryHard)',
  [10] = 'F-16C (VeryHard)',
  [11] = 'F-4E (VeryHard)',
  [12] = 'F-5E (VeryHard)',	
}

Fighter_Names = 12

Bomber_Names_Easy = {
  [1] = 'Tu-22M3 (Easy)',
  [2] = 'Su-24M (Easy)',
  [3] = 'Su-25T (BEasy)',
  [4] = 'Su-25 (BEasy)',
  [5] = 'MiG-27K (BEasy)',
  [6] = 'Su-17 (BEasy)',
}

Bomber_Names_Normal = {
  [1] = 'Tu-22M3 (Normal)',
  [2] = 'Su-24M (Normal)',
  [3] = 'Su-25T (BNormal)',
  [4] = 'Su-25 (BNormal)',
  [5] = 'MiG-27K (BNormal)',
  [6] = 'Su-17 (BNormal)',
}

Bomber_Names_Hard = {
  [1] = 'Tu-22M3 (Hard)',
  [2] = 'Su-24M (Hard)',
  [3] = 'Su-25T (BHard)',
  [4] = 'Su-25 (BHard)',
  [5] = 'MiG-27K (BHard)',
  [6] = 'Su-17 (BHard)',
}

Bomber_Names_VeryHard = {
  [1] = 'Tu-22M3 (VeryHard)',
  [2] = 'Su-24M (VeryHard)',
  [3] = 'Su-25T (BVeryHard)',
  [4] = 'Su-25 (BVeryHard)',
  [5] = 'MiG-27K (BVeryHard)',
  [6] = 'Su-17 (BVeryHard)',
}

Bomber_Names = 6

CAS_Planes = {
  [1] = 'Tornado GR4 #1',
  [2] = 'Tornado IDS #1',
}


Calls = missionCommands.addSubMenu("Mission Info",nil)
AnapaPath = missionCommands.addSubMenu("Anapa Tasks",nil)
MaykopPath = missionCommands.addSubMenu("Maykop Tasks",nil)
SochiPath = missionCommands.addSubMenu("Sochi-Adler Tasks",nil)
KutaisiPath = missionCommands.addSubMenu("Kutaisi Tasks",nil)
MozdokPath = missionCommands.addSubMenu("Mozdok Tasks",nil)
VazianiPath = missionCommands.addSubMenu("Vaziani Tasks",nil)
GameSet = missionCommands.addSubMenu("OPFS Settings",nil)

---------------
-- RADIO ADD --
---------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Radio_Add(arg, time)
------------------------------------------------------------------------------------------------------------------------------------------------------------------
  for i=1,#Rad do
    Add_Menu(Rad[i])
  end
  return time + 5
end
---
------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Add_Menu(unitName)
------------------------------------------------------------------------------------------------------------------------------------------------------------------
if Radio_Table[unitName] == nil then
  local unit = Unit.getByName(unitName)
    if unit == nil then
    return
    end
  local group = unit:getGroup()
    if group == nil then
    return
    end		
	
  Rad_GroupID = group:getID()   
		
  missionCommands.addCommandForGroup(Rad_GroupID, rad_option_0a, Calls, Bullscall, nil)
  --missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1a, Calls, Nothing, nil)
  missionCommands.addCommandForGroup(Rad_GroupID, rad_option_0b, GameSet, Change_Difficulty, nil)
  missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1b, GameSet, Change_Task_Range, nil)
  missionCommands.addCommandForGroup(Rad_GroupID, rad_option_2b, GameSet, Change_Smoke_Set, nil)
  --missionCommands.addCommandForGroup(Rad_GroupID, rad_option_3b, GameSet, Make_Smoke, nil)
  missionCommands.addCommandForGroup(Rad_GroupID, rad_option_0c, AnapaPath, Create_Fighter_Intercept, 'Anapa')
  missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1c, AnapaPath, Create_Bomber_Intercept, 'Anapa')
  missionCommands.addCommandForGroup(Rad_GroupID, rad_option_2c, AnapaPath, Create_Mud_Fortified, 'Anapa')

  missionCommands.addCommandForGroup(Rad_GroupID, rad_option_0c, MaykopPath, Create_Fighter_Intercept, 'Maykop')
  missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1c, MaykopPath, Create_Bomber_Intercept, 'Maykop')
  missionCommands.addCommandForGroup(Rad_GroupID, rad_option_2c, MaykopPath, Create_Mud_Fortified, 'Maykop')
	
  missionCommands.addCommandForGroup(Rad_GroupID, rad_option_0c, SochiPath, Create_Fighter_Intercept, 'Sochi')
  missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1c, SochiPath, Create_Bomber_Intercept, 'Sochi')
  missionCommands.addCommandForGroup(Rad_GroupID, rad_option_2c, SochiPath, Create_Mud_Fortified, 'Sochi')
	
  missionCommands.addCommandForGroup(Rad_GroupID, rad_option_0c, KutaisiPath, Create_Fighter_Intercept, 'Kutaisi')
  missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1c, KutaisiPath, Create_Bomber_Intercept, 'Kutaisi')
  missionCommands.addCommandForGroup(Rad_GroupID, rad_option_2c, KutaisiPath, Create_Mud_Fortified, 'Kutaisi')

  missionCommands.addCommandForGroup(Rad_GroupID, rad_option_0c, MozdokPath, Create_Fighter_Intercept, 'Mozdok')
  missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1c, MozdokPath, Create_Bomber_Intercept, 'Mozdok')
  missionCommands.addCommandForGroup(Rad_GroupID, rad_option_2c, MozdokPath, Create_Mud_Fortified, 'Mozdok')

  missionCommands.addCommandForGroup(Rad_GroupID, rad_option_0c, VazianiPath, Create_Fighter_Intercept, 'Vaziani')
  missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1c, VazianiPath, Create_Bomber_Intercept, 'Vaziani')
  missionCommands.addCommandForGroup(Rad_GroupID, rad_option_2c, VazianiPath, Create_Mud_Fortified, 'Vaziani')
	
  Radio_Table[unitName] = true
  end
end
---
---------------
-- SCHEDULER --
---------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Radio_Check()
------------------------------------------------------------------------------------------------------------------------------------------------------------------
  for i=1,#Rad do
    
    local unitName = Rad[i]
    local unit = Unit.getByName(unitName)
    
    if unit == nil then
      local playerName = unit:getPlayerName()
    end
  end
  timer.scheduleFunction(Radio_Check, nil, timer.getTime() + 2)
  return
end
---------------
-- INTRODUCE --
---------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Introduce_Mission(arg, time)
------------------------------------------------------------------------------------------------------------------------------------------------------------------
  local msg = {}
  msg.text = ' Chameleon_Silk is proud to present, Operation Flagship... Alpha Test'
  msg.displayTime = 60
  msg.msgFor = {coa = {'all'}} 
    mist.message.add(msg)

  local msg = {} 
  msg.text = '  '
  msg.displayTime = 20
  msg.msgFor = {coa = {'all'}} 
    mist.message.add(msg)

  local msg = {} 
  msg.text = ' Mission utilizes heavily modified Interception Script by akp '
  msg.displayTime = 20
  msg.msgFor = {coa = {'all'}} 
    mist.message.add(msg)

  local msg = {} 
  msg.text = ' Global difficulty has been set to '..tostring(Difficulty)
  msg.displayTime = 20
  msg.msgFor = {coa = {'all'}} 
    mist.message.add(msg)

  local msg = {} 
  msg.text = ' Task spawn start range has been set to '..tostring(Range)
  msg.displayTime = 20
  msg.msgFor = {coa = {'all'}} 
    mist.message.add(msg)

  local pickSFX = mist.random(1,4)

  if pickSFX == 1 then
    trigger.action.outSoundForCoalition(coalition.side.RED, 'variation1.ogg')
  end

  if pickSFX == 2 then
    trigger.action.outSoundForCoalition(coalition.side.RED, 'variation2.ogg')
  end

  if pickSFX == 3 then
    trigger.action.outSoundForCoalition(coalition.side.RED, 'variation3.ogg')
  end

  if pickSFX == 4 then
    trigger.action.outSoundForCoalition(coalition.side.RED, 'variation4.ogg')
  end
  return
end
---
------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Nothing()
------------------------------------------------------------------------------------------------------------------------------------------------------------------
  local msg = {}
    msg.text = ' Feature is unavailable at this time sorry.'
    msg.displayTime = 10
    msg.msgFor = {coa = {'red'}} 
      mist.message.add(msg)
  return
end
---
------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Create_Fighter_Intercept(_Area)
------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- based off of Kutaisi Intercept script by akp, but modified for my own use.
local zone = trigger.misc.getZone(_Area)
		
local rand = mist.random(1,Fighter_Names)

  if Difficultymod == 1 then
    grpName = Fighter_Names_Easy[rand]
  end
	
  if Difficultymod == 2 then
    grpName = Fighter_Names_Normal[rand]
  end

  if Difficultymod == 3 then
    grpName = Fighter_Names_Hard[rand]
  end

  if Difficultymod == 4 then
    grpName = Fighter_Names_VeryHard[rand]
  end

  spawnPsn = {}

  if Task_Range == 1 then
    spawnPsn = mist.getRandPointInCircle(zone.point, zone.radius, zone.radius * 0.75)
  end

  if Task_Range == 2 then
    spawnPsn = mist.getRandPointInCircle(zone.point, zone.radius, zone.radius * 0.825)
  end

  if Task_Range == 3 then
    spawnPsn = mist.getRandPointInCircle(zone.point, zone.radius, zone.radius * 0.90)
  end

  if Task_Range == 4 then
    spawnPsn = mist.getRandPointInCircle(zone.point, zone.radius, zone.radius * 0.99)
  end
	
  local msg = {} 
    msg.text = ' Choosing from interceptor list. Plane number  '..tostring(rand)..tostring(grpName)..tostring(_Area)
    msg.displayTime = 10
    msg.msgFor = {coa = {'all'}} 
    mist.message.add(msg)		

    trigger.action.activateGroup(Group.getByName(grpName))
    grp = Group.getByName(grpName)
  local InitwpSpeed = mist.random(600,700)
  local wpSpeed = mist.utils.kmphToMps(InitwpSpeed)
  local wpAlt = mist.random(5000,8000)
  local wpPsn = mist.getRandPointInCircle(spawnPsn, zone.radius * 0.70, zone.radius * 0.40)
  local wpPsn2 = mist.getRandPointInCircle(spawnPsn, zone.radius * 0.75, zone.radius * 0.10)
  local path = {}
    path[1] = mist.fixedWing.buildWP(spawnPsn, wpSpeed, wpAlt, "BARO")
    path[2] = mist.fixedWing.buildWP(wpPsn, wpSpeed, wpAlt, "BARO")
    path[3] = mist.fixedWing.buildWP(wpPsn2, wpSpeed, wpAlt,"BARO")
    path[1].task = {
      id = "ComboTask",
      params = {
        tasks = {
          [1] = {
            number = 1,
            auto = true,
            id = "EngageTargets",
            enabled = true,
            key = "CAP",
            params = {
              targetTypes = {
                [1] = "Air",
              }, -- end of targetTypes
              priority = 0,
            }, -- end of params
          }, -- end of [1]
          [2] = {
            number = 2,
            auto = false,
            id = "Orbit",
            enabled = true,
            params = {
              altitudeEdited = false,
              pattern = "Race-Track",
              speed = wpSpeed,
              altitude = wpAlt,
              speedEdited = true,
            }, -- end of params
          }, -- end of [2]
          [3] = {
            enabled = true,
            auto = false,
            id = "WrappedAction",
            number = 1,
            params = {
              action = {
                id = "Option",
                params = {
                  value = false,
                  name = 6,
                }, -- end of params
              }, -- end of action
            }, -- end of params
          }, -- end of [3]
        }, -- end of tasks
      } -- end of params
    }
	
	  --path[1] = path[2].task
		--path[3] = path[2].task
		

    local vars = {} 
      vars.groupName = grpName
      vars.action = "respawn"
      vars.point = spawnPsn
      vars.route = path
      	mist.teleportToPoint(vars)			

    local con = grp:getController()
      con:setOption(AI.Option.Air.id.RTB_ON_BINGO, false)
      con:setOption(AI.Option.Air.id.RADAR_USING, AI.Option.Air.val.RADAR_USING.FOR_CONTINUOUS_SEARCH)
      con:setOption(AI.Option.Air.id.ROE, AI.Option.Air.val.ROE.OPEN_FIRE_WEAPON_FREE)
			con:setOption(AI.Option.Air.id.FLARE_USING, AI.Option.Air.val.FLARE_USING.AGAINST_FIRED_MISSILE)
			con:setOption(AI.Option.Air.id.REACTION_ON_THREAT, AI.Option.Air.val.REACTION_ON_THREAT.EVADE_FIRE)
      

    local msg = {} 
      msg.text = ' Intercept task has been created, search and destroy target.'
      msg.displayTime = 20
      msg.msgFor = {coa = {'all'}} 
        mist.message.add(msg)
--end -- break for loop

  trigger.action.outSoundForCoalition(coalition.side.RED, 'airtask.ogg')

--return
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Create_Bomber_Intercept(_bArea)
------------------------------------------------------------------------------------------------------------------------------------------
-- based off of Kutaisi Intercept script by akp, but modified for my own use.
local bzone = trigger.misc.getZone(_bArea)
--bZone_Used = _bArea
	
  if _bArea == 'Anapa' then
    RunwayID = 12
  end

  if _bArea == 'Maykop' then
    RunwayID = 16
  end

  if _bArea == 'Sochi' then
    RunwayID = 18
  end

  if _bArea == 'Kutaisi' then
    RunwayID = 25
  end

  if _bArea == 'Mozdok' then
    RunwayID = 28
  end

  if _bArea == 'Vaziani' then
    RunwayID = 31
  end

--0 Airdrome_0
--1Khersones
--2 Saki
--3Simpheropol
--4 Razdolnoe
--5 Dzhankoy
--6 Kirovskoe
--7 Kerch
--8 Belbek
--9 Krasnogvardeyskoye
--10 Octyabrskoe
--11 Gvardeyskoe
--12 Anapa
--13 Krasnodar
--14 Novorossiysk
--15 Krymsk
--16 Maykop
--17 Gelendzhik
--18 Sochi
--19 Krasnodar_P
--20 Sukhumi
--21 Gudauta
--22 Batumi
--23 Tskhakaya
--24 Kobuleti
--25 Kutaisi
--26 MinVody
--27 Nalchik
--28 Mozdok
--29 Lochini
--30 TbilisiMilitary
--31 Vaziani
--32 Beslan
	
  local brand = mist.random(1,Bomber_Names)
  local erand = mist.random(1,Fighter_Names)
  --local bgrpName = Bomber_Names[brand]

  if Difficultymod == 1 then
    bgrpName = Bomber_Names_Easy[brand]
    egrpName = Fighter_Names_Easy[erand]
  end

  if Difficultymod == 2 then
    bgrpName = Bomber_Names_Normal[brand]
    egrpName = Fighter_Names_Easy[erand]
  end

  if Difficultymod == 3 then
    bgrpName = Bomber_Names_Hard[brand]
    egrpName = Fighter_Names_Normal[erand]
  end
	
  if Difficultymod == 4 then
    bgrpName = Bomber_Names_VeryHard[brand]
    egrpName = Fighter_Names_Normal[erand]
  end

  bspawnPsn = {}
  espawnPsn = {}
  bpath = {}
  epath = {}

  if Task_Range == 1 then
    bspawnPsn = mist.getRandPointInCircle(bzone.point, bzone.radius, bzone.radius * 0.475)
    espawnPsn = mist.getRandPointInCircle(bzone.point, bzone.radius, bzone.radius * 0.475)
  end

  if Task_Range == 2 then
    bspawnPsn = mist.getRandPointInCircle(bzone.point, bzone.radius, bzone.radius * 0.625)
    espawnPsn = mist.getRandPointInCircle(bzone.point, bzone.radius, bzone.radius * 0.625)
  end

  if Task_Range == 3 then
    bspawnPsn = mist.getRandPointInCircle(bzone.point, bzone.radius, bzone.radius * 0.775)
    espawnPsn = mist.getRandPointInCircle(bzone.point, bzone.radius, bzone.radius * 0.775)
  end

  if Task_Range == 4 then
    bspawnPsn = mist.getRandPointInCircle(bzone.point, bzone.radius, bzone.radius * 0.925)
    espawnPsn = mist.getRandPointInCircle(bzone.point, bzone.radius, bzone.radius * 0.925)
  end

  local bInitwpSpeed = mist.random(425,525)
  local bwpSpeed = mist.utils.kmphToMps(bInitwpSpeed)
  local bwpAlt = mist.random(6100,9000)

  --local ewpSpeed = mist.random(850,1025)			
local bwpPsn = mist.getRandPointInCircle(bzone.point, bzone.radius * 0.10, bzone.radius * 0.5)
local bwpPsn2 = mist.getRandPointInCircle(bzone.point, bzone.radius * 0.10, bzone.radius * 0.4)
local bwpPsn3 = mist.getRandPointInCircle(bzone.point, bzone.radius * 0.10, bzone.radius * 0.3)
local bwpPsn4 = mist.getRandPointInCircle(bzone.point, bzone.radius * 0.10, bzone.radius * 0.2)
local bwpPsn5 = mist.getRandPointInCircle(bzone.point, bzone.radius * 0.10, bzone.radius * 0.1)

trigger.action.activateGroup(Group.getByName(bgrpName))
trigger.action.outSoundForCoalition(coalition.side.RED, 'airtask.ogg')			


bpath[1] = mist.fixedWing.buildWP(bspawnPsn, bwpSpeed, bwpAlt, "BARO")			-- altitude and speed reversed.
bpath[2] = mist.fixedWing.buildWP(bwpPsn, bwpSpeed, bwpAlt, "BARO")		
bpath[3] = mist.fixedWing.buildWP(bwpPsn2, bwpSpeed, bwpAlt, "BARO")
bpath[4] = mist.fixedWing.buildWP(bwpPsn3, bwpSpeed, bwpAlt, "BARO")
bpath[5] = mist.fixedWing.buildWP(bwpPsn4, bwpSpeed, bwpAlt, "BARO")
bpath[6] = mist.fixedWing.buildWP(bwpPsn5, bwpSpeed, bwpAlt, "BARO")	


bpath[3].task = {
  id = "ComboTask",
  params = {
    tasks = {
      [1] = {
      	number = 1,
      	auto = false,
      	id = "BombingRunway",
      	enabled = true,
      	params = {
      	  altitudeEnabled = false,
      	  attackQtyLimit = false,
      	  attackQty = 1,
      	  expend = "Auto",
      	  altitude = 3750,
      	  directionEnabled = false,
      	  groupAttack = true,
      	  runwayId = RunwayID,
      	  weaponType = 1073741822,
      	  direction = 0,
        }, -- end of params
      }, -- end of [1]
      [2] =  {
        enabled = true,
        auto = false,
        id = "WrappedAction",
        number = 1,
        params =  {
          action = {
            id = "Option",
            params = {
              value = false,
              name = 6,
            },-- end of params
          }, -- end of action
        }, -- end of params
      }, -- end of [2]
    }, -- end of tasks
  } -- end of params
}


			bpath[1].ETA_locked = false
			bpath[1].speed_locked = true
			bpath[2].ETA_locked = false
			bpath[2].speed_locked = true
			bpath[3].ETA_locked = false
			bpath[3].speed_locked = true
			bpath[4].ETA_locked = false
			bpath[4].speed_locked = true
			bpath[5].ETA_locked = false
			bpath[5].speed_locked = true
			bpath[6].ETA_locked = false
			bpath[6].speed_locked = true
			
	

  local bvars = {} 
  bvars.groupName = bgrpName
  bvars.action = "respawn"
  bvars.point = bspawnPsn
  bvars.route = bpath
	mist.teleportToPoint(bvars)
  
  bgrp = Group.getByName(bgrpName)
  
  local bcon = bgrp:getController()
    bcon:setOption(AI.Option.Air.id.RTB_ON_BINGO, false)
    bcon:setOption(AI.Option.Air.id.RADAR_USING, AI.Option.Air.val.RADAR_USING.FOR_CONTINUOUS_SEARCH)
    bcon:setOption(AI.Option.Air.id.ROE, AI.Option.Air.val.ROE.OPEN_FIRE)
		bcon:setOption(AI.Option.Air.id.REACTION_ON_THREAT, AI.Option.Air.val.REACTION_ON_THREAT.PASSIVE_DEFENCE)
		bcon:setOption(AI.Option.Air.id.FLARE_USING, AI.Option.Air.val.FLARE_USING.WHEN_FLYING_NEAR_ENEMIES)
  
  BomberID = bgrp:getID()
	
	trigger.action.activateGroup(Group.getByName(egrpName))
  
  local eInitwpSpeed = mist.random(500,600)
  local ewpSpeed = mist.utils.kmphToMps(eInitwpSpeed)
  local ewpAlt = mist.random(4000,6000)
  
  epath[1] = mist.fixedWing.buildWP(bspawnPsn, ewpSpeed, ewpAlt, "BARO")
  epath[2] = mist.fixedWing.buildWP(bwpPsn, ewpSpeed, ewpAlt, "BARO")
	epath[3] = mist.fixedWing.buildWP(bwpPsn2, ewpSpeed, ewpAlt, "BARO")

  
  epath[1].task = {
    id = "ComboTask",
    params = {
      tasks = {
        [1] = {
          number = 1,
          auto = true,
          id = "EngageTargets",
          enabled = true,
          key = "CAP",
					params = {
            targetTypes = {
              [1] = "Air",
            }, -- end of targetTypes
            priority = 0
          }, -- end of params
        }, -- end of [1]
        [2] = {
          number = 2,
          auto = false,
          id = "Follow",
          enabled = true,
          params = {
            lastWptIndexFlagChangedManually = true,
            groupId = BomberID,
            lastWptIndexFlag = false,
            pos = {
              y = -500,
              x = -200,
              z = 0,
            }, -- end of ["pos"]
          }, -- end of ["params"]
        }, -- end of [2]
        [3] = {
          enabled = true,
          auto = false,
          id = "WrappedAction",
          number = 3,
          params = {
            action = {
              id = "Option",
              params = {
                value = false,
                name = 6,
              }, -- end of params
            }, -- end of action
          }, -- end of params
        }, -- end of 3
      }, -- end of tasks
    } -- end of params
  }
	
	
  --epath[1].ETA_locked = false
  --epath[1].speed_locked = true
  --epath[2].ETA_locked = false
  --epath[2].speed_locked = true
  --epath[3].ETA_locked = false
  --epath[3].speed_locked = true
    
  
    local evars = {}
      evars.groupName = egrpName
			evars.action = "respawn"
      evars.point = bspawnPsn
      evars.route = epath
      mist.teleportToPoint(evars)
    
    egrp = Group.getByName(egrpName)
    
    local econ = egrp:getController()
      econ:setOption(AI.Option.Air.id.RTB_ON_BINGO, false)
      econ:setOption(AI.Option.Air.id.RADAR_USING, AI.Option.Air.val.RADAR_USING.FOR_CONTINUOUS_SEARCH)
      econ:setOption(AI.Option.Air.id.ROE, AI.Option.Air.val.ROE.OPEN_FIRE_WEAPON_FREE)
			econ:setOption(AI.Option.Air.id.FLARE_USING, AI.Option.Air.val.FLARE_USING.AGAINST_FIRED_MISSILE)
			econ:setOption(AI.Option.Air.id.REACTION_ON_THREAT, AI.Option.Air.val.REACTION_ON_THREAT.EVADE_FIRE)
    
    local msg = {}
    msg.text = ' Choosing from interceptor list. Plane number  '..tostring(brand)..tostring(bgrpName)..tostring(_bArea)
    msg.displayTime = 10
    msg.msgFor = {coa = {'all'}}
      mist.message.add(msg)
    
    local msg = {}
      msg.text = ' Choosing from escort list. Plane number  '..tostring(erand)..tostring(egrpName)..tostring(_bArea)
      msg.displayTime = 10
      msg.msgFor = {coa = {'all'}}
        mist.message.add(msg)
        
    local msg = {}
      msg.text = ' Bomber intercept task has been created. '
      msg.displayTime = 20
      msg.msgFor = {coa = {'all'}}
        mist.message.add(msg)
        
    local msg = {}
      msg.text = ' Escort is following  '..tostring(BomberID)
      msg.displayTime = 20
      msg.msgFor = {coa = {'all'}}
        mist.message.add(msg)
--end -- break for loop



--return
end
---

------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Create_Mud_Fortified(_mArea)
------------------------------------------------------------------------------------------------------------------------------------------------------------------
local mzone = trigger.misc.getZone(_mArea)
local mrand = mist.random(1,Mud_Names)

--SmokeCoord = {}
--SmokeCoord = mist.utils.zoneToVec3('Anapa')

trigger.action.outSoundForCoalition(coalition.side.RED, 'groundtask.ogg')

if Difficultymod == 1 then
  MudName = Mud_Easy[mrand]
end

if Difficultymod == 2 then
  MudName = Mud_Normal[mrand]
end

if Difficultymod == 3 then
  MudName = Mud_Hard[mrand]
end

if Difficultymod == 4 then
  MudName = Mud_VeryHard[mrand]
end


local MudGrp = Group.getByName(MudName)

--local unitNames = MudGrp:getUnits()			-- important collects all units from the group named MudGrp
formisttable = '[g]' .. MudName

trigger.action.activateGroup(Group.getByName(MudName))

local msg = {}
  msg.text = ' Creating mud task '..tostring(MudName) ..tostring(formisttable)
  msg.displayTime = 20
  msg.msgFor = {coa = {'all'}}
    mist.message.add(msg)
  targets = mist.makeUnitTable({formisttable})
  for i = 1, 1000 do
    if Task_Range == 1 then
      mudPsn = mist.getRandPointInCircle(mzone.point, mzone.radius * 0.65, mzone.radius * 0.475)
    elseif Task_Range == 2 then
      mudPsn = mist.getRandPointInCircle(mzone.point, mzone.radius * 0.77, mzone.radius * 0.633)
    elseif Task_Range == 3 then
      mudPsn = mist.getRandPointInCircle(mzone.point, mzone.radius * 0.95, mzone.radius * 0.775)
    elseif Task_Range == 4 then
      mudPsn = mist.getRandPointInCircle(mzone.point, mzone.radius * 1.20, mzone.radius * 0.900)
    if mist.isTerrainValid(mudPsn, {'LAND', 'ROAD'}) == true then
    break
    end
  end
end

local mvars = {}
  mvars.groupName = MudName
  mvars.action = "respawn"
  mvars.point = mudPsn
  --mvars.disperse = true
  --mvars.maxDisp = 50
  --mvars.radius = 25 
    mist.teleportToPoint(mvars)
  
local msg = {}
  msg.text = ' Mud task has been created '..tostring(MudName)
  msg.displayTime = 20
  msg.msgFor = {coa = {'all'}}
    mist.message.add(msg)
    
    
  --timer.scheduleFunction(Make_Smoke, nil, timer.getTime() + 5)
  return
end
---
------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Make_Smoke(arg, time)
------------------------------------------------------------------------------------------------------------------------------------------------------------------

  if Smoke == 1 then
	trigger.action.smoke({x=SmokeCoord.x + math.random(1,200), y= land.getHeight({x = SmokeCoord.x, y = SmokeCoord.z}), z= SmokeCoord.z + math.random(1, 200)}, trigger.smokeColor.Red)
    return time + 90
  end

  if Smoke == 0 then
    return
  end
end
---

------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Bullscall()
------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
trigger.action.outSoundForCoalition(coalition.side.RED, 'datalink.ogg')
local msg = {}
  msg.units = targets
  msg.ref = 'red'
  msg.displayTime = 90
  msg.msgFor = {coa = {'red'}}
  msg.text = ' Imperial: '
  msg.metric = false
  msg.alt = true
    mist.msgBullseye(msg)
  return
end
---
			
------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Change_Difficulty()
------------------------------------------------------------------------------------------------------------------------------------------------------------------
  local Old_Set = Difficulty
  local New_Set = {}

  if Old_Set == "Very Hard" then
    New_Set = "Easy"
    Difficulty = New_Set
    Difficultymod = 1
  end

  if Old_Set == "Hard" then
    New_Set = "Very Hard"
    Difficulty = New_Set
    Difficultymod = 4
  end
	
  if Old_Set == "Normal" then
    New_Set = "Hard"
    Difficulty = New_Set
    Difficultymod = 3
  end
	
  if Old_Set == "Easy" then
    New_Set = "Normal"
    Difficulty = New_Set
    Difficultymod = 2
  end

  trigger.action.outSoundForCoalition(coalition.side.RED, 'setting.ogg')
  local msg = {} 
    msg.text = ' Global difficulty has been set to '..tostring(New_Set)
    msg.displayTime = 20
    msg.msgFor = {coa = {'all'}}
    	mist.message.add(msg)
    return
end
---

------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Change_Task_Range()
------------------------------------------------------------------------------------------------------------------------------------------------------------------
  local Old_Set = Range
  local New_Set = ""

  if Old_Set == "Furthest" then
    New_Set = "Closest"
    Range = New_Set
    Task_Range = 1
  end

  if Old_Set == "Far" then
    New_Set = "Furthest"
    Range = New_Set
    Task_Range = 4
  end
	
  if Old_Set == "Standard" then
    New_Set = "Far"
    Range = New_Set
    Task_Range = 3
  end
	
  if Old_Set == "Closest" then
    New_Set = "Standard"
    Range = New_Set
    Task_Range = 2
  end

  trigger.action.outSoundForCoalition(coalition.side.RED, 'range.ogg')
  
  local msg = {}
    msg.text = ' Task spawn start range has been set to '..tostring(Range)
    msg.displayTime = 20
    msg.msgFor = {coa = {'all'}}
      mist.message.add(msg)
  return
end
---

------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Change_Smoke_Set()
------------------------------------------------------------------------------------------------------------------------------------------------------------------
  local Old_Set = Smoke
  local New_Set = nil
  local SmokeSet = ""

  if Old_Set == 1 then
    New_Set = 0
    Smoke = New_Set
    SmokeSet = "disabled"
  end
	
  if Old_Set == 0 then
    New_Set = 1
    Smoke = New_Set
    SmokeSet = "enabled"
  end

  trigger.action.outSoundForCoalition(coalition.side.RED, 'range.ogg')
  local msg = {} 
    msg.text = ' Marking of enemy mud with smoke is '..tostring(SmokeSet)
    msg.displayTime = 20
    msg.msgFor = {coa = {'all'}}
      mist.message.add(msg)
  return
end
---

-- Scheduled functions (run on timer)
------------------------------------------------------------------
timer.scheduleFunction(Radio_Add, nil, timer.getTime() + 5)
timer.scheduleFunction(Radio_Check, nil, timer.getTime() + 2)
timer.scheduleFunction(Introduce_Mission, nil, timer.getTime() + 4)
------------------------------------------------------------------
