

	-- Flagship Script

	local rad_option_0a = "Briefing: Last Mud"
	local rad_option_0b = "Briefing: Last Strike"
	local rad_option_0c = "Briefing: Last Convoy"
	local rad_option_0d = "Briefing: Last Airdrome"
	local rad_option_0e = "Briefing: Last Naval"

	local rad_option_1a = "Interdict: CAP"
	local rad_option_1b = "Interdict: Bombers"
	local rad_option_1c = "Escort: BARCAP (NOT AVAILABLE)"
	local rad_option_1d = "Mud: Fortified"
	local rad_option_1e = "Mud: Convoy"
	local rad_option_1f = "Mud: CAS (NOT AVAILABLE)"
	local rad_option_1g = "Strike: Facilities"
	local rad_option_1h = "Strike: Naval"
	
	

	local rad_option_2a = "Assault: Sochi-Adler"

	local rad_option_7a = "Enemy Smoke Markers"

	----------------
	-- Wanks Code --
	----------------
	-- radio option variables are grouped by function. ie- 0a-3a
	-- These variables define the displayed name for mission difficulty
	local rad_option_8a = "Very Easy"
	local rad_option_8b = "Easy"
	local rad_option_8c = "Normal"
	local rad_option_8d = "Hard"
	local rad_option_8e = "Very Hard"

	--These variables define displayed name for Task Spawn Distance
	local rad_option_9a = "Scramble"
	local rad_option_9b = "Close"
	local rad_option_9c = "Standard"
	local rad_option_9d = "Far"
	local rad_option_9e = "Very Far"
	local rad_option_9f = "Distant"
	local rad_option_9g = "Random"

	--Debug radio command (must have modified mission_scripting.lua in dcs scripts folder to not sanitize ios and lfs)
	local rad_option_9y = "Debugging - Reload Script"
	local rad_option_9z = "Debugging - Show Task Values"

	--------------------
	-- End Wanks Code --
	--------------------
	loopsthrough = 0
	
	Radio_Table = {}

	zone = {}
	bzone = {}
	mzone = ""

	grpName = {}
	
	bgrpName = {}
	egrpName = {}


	
	smoke_marker = {}

	Loops = 0
	RunwayID = 0
	Debugger = 0

	airfield = 0
	mudtask = 0
	convoytask = 0
	intercepttask = 0
	bombertask = 0

	airfield_complete = 0
	mud_complete = 0
	convoy_complete = 0
	intercept_complete = 0
	bomber_complete = 0

	message = {}

	bspawnPsn = {}
	espawnPsn = {}
	spawnPsn = {}
	mudPsn = {}

	Smoke = 0
	Scoord  = {}
	Difficulty = "Very Easy"
	Difficultymod = 1
	Range = "Standard"
	Task_Range = 2

	--This array contains all the available player aircraft at their respective airbase
	Rad = {
	  "Anapa-86 #1",
		"Anapa-86 #2",
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
	  "Anapa-86 #1",
	  "Anapa-86 #2",
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
	  "Nalchik-21 #1",
	  "Nalchik-21 #2",
	  "Nalchik-86 #1",
	  "Nalchik-15C #1",
	  "Nalchik-15C #2",
	  "Nalchik-27 #1",
	  "Nalchik-27 #2",
	  "Nalchik-A10A #1",
		"Nalchik-A10A #2",
		"Nalchik-A10C #1",
		"Nalchik-A10C #2",
		"Nalchik-25 #1",
		"Nalchik-25 #2",
		"Nalchik-25T #1",
		"Nalchik-25T #2",
	  "Tbilisi-86 #1",
		"Tbilisi-86 #2",
		"Tbilisi-27 #1",
		"Tbilisi-27 #2",
		"Tbilisi-27 #3",
		"Tbilisi-27 #4",
		"Tbilisi-21 #1",
	  "Tbilisi-21 #2",
	  "Tbilisi-21 #3",
	  "Tbilisi-21 #4",
	  "Tbilisi-21 #5",
	  "Tbilisi-21 #6",
	  "Tbilisi-15C #1",
	  "Tbilisi-15C #2",
	  "Tbilisi-15C #3",
	  "Tbilisi-15C #4",
		"Tbilisi-25 #1",
		"Tbilisi-25 #2",
		"Tbilisi-25 #3",
		"Tbilisi-25 #4",
		"Tbilisi-25T #1",
		"Tbilisi-25T #2",
		"Tbilisi-25T #3",
		"Tbilisi-25T #4",
		"Tbilisi-A10A #1",
		"Tbilisi-A10A #2",
		"Tbilisi-A10A #3",
		"Tbilisi-A10A #4",
		"Tbilisi-A10C #1",
		"Tbilisi-A10C #2",
		"Tbilisi-A10C #3",
		"Tbilisi-A10C #4",
		"Tbilisi-UH1H #1",
	  "Tbilisi-UH1H #2",
		"Tbilisi-KA50 #1",
		"Tbilisi-KA50 #2",
		"Tbilisi-Mi8 #1",
		"Tbilisi-Mi8 #2",
	  "Gudauta-86 #1",
		"Gudauta-86 #2",
		"Gudauta-21 #1",
	  "Gudauta-21 #2",
	  "Gudauta-21 #3",
	  "Gudauta-21 #4",
	  "Gudauta-21 #5",
	  "Gudauta-21 #6",
	  "Gudauta-15C #1",
	  "Gudauta-15C #2",
	  "Gudauta-15C #3",
	  "Gudauta-27 #1",
	  "Gudauta-27 #2",
		"Gudauta-27 #3",
		"Gudauta-25 #1",
		"Gudauta-25 #2",
		"Gudauta-25 #3",
		"Gudauta-25 #4",
		"Gudauta-25T #1",
		"Gudauta-25T #2",
		"Gudauta-25T #3",
		"Gudauta-25T #4",
		"Gudauta-A10A #1",
		"Gudauta-A10A #2",
		"Gudauta-A10A #3",
		"Gudauta-A10A #4",
		"Gudauta-A10C #1",
		"Gudauta-A10C #2",
		"Gudauta-A10C #3",
		"Gudauta-A10C #4",
	  "Kutaisi-86 #1",
		"Kutaisi-86 #2",
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
	  "Kutaisi-27 #1",
	  "Kutaisi-27 #2",
		"Kutaisi-27 #3",
		"Kutaisi-27 #4",
		"Kutaisi-A10A #1",
		"Kutaisi-A10A #2",
		"Kutaisi-A10A #3",
		"Kutaisi-A10A #4",
		"Kutaisi-A10C #1",
		"Kutaisi-A10C #2",
		"Kutaisi-A10C #3",
		"Kutaisi-A10C #4",
		"Kutaisi-25 #1",
		"Kutaisi-25 #2",
		"Kutaisi-25 #3",
		"Kutaisi-25 #4",
		"Kutaisi-25T #1",
		"Kutaisi-25T #2",
		"Kutaisi-25T #3",
		"Kutaisi-25T #4",
		"Kutaisi-UH1H #1",
		"Kutaisi-KA50 #1",
		"Kutaisi-KA50 #2",
	  "Maykop-86 #1",
		"Maykop-86 #2",
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
		"Maykop-25 #1",
		"Maykop-25 #2",
		"Maykop-25 #3",
		"Maykop-25 #4",
		"Maykop-25T #1",
		"Maykop-25T #2",
		"Maykop-25T #3",
		"Maykop-25T #4",
		"Maykop-27 #1",
		"Maykop-27 #2",
		"Maykop-27 #3",
		"Maykop-27 #4",
		"Maykop-A10A #1",
		"Maykop-A10A #2",
		"Maykop-A10A #3",
		"Maykop-A10A #4",
		"Maykop-A10C #1",
		"Maykop-A10C #2",
		"Maykop-A10C #3",
		"Maykop-A10C #4",
		"Maykop-UH1H #1",
	  "Maykop-UH1H #2",
		"Maykop-KA50 #1",
		"Maykop-KA50 #2",
		"Maykop-Mi8 #1",
		"Maykop-Mi8 #2",
	}
	-----------------------
	-- Static MUD Arrays --
	-----------------------

	Mud_Names = 2 -- variable for number of availale MUD Per Difficulty

	Mud_VeryEasy = {
	  [1] = "Mud (VeryEasy) #000",
		[2] = "Mud (VeryEasy) #001",
	}
	Mud_Easy = {
	  [1] = "Mud (Easy) #000",
		[2] = "Mud (Easy) #001",
	}
	Mud_Normal = {
	  [1] = "Mud (Normal) #000",
		[2] = "Mud (Normal) #001",
	}
	Mud_Hard = {
	  [1] = "Mud (Hard) #000",
		[2] = "Mud (Hard) #001",
	}
	Mud_VeryHard = {
	  [1] = "Mud (VeryHard) #000",
		[2] = "Mud (VeryHard) #001",
	}
	---------------------------
	-- End Static MUD Arrays --
	---------------------------
	
	
	------------------------
	--  Enemy Ship Arrays --
	------------------------
	Ship_Names = 2 -- variable for number of available ships per difficulty
	
	Ship_VeryEasy = {
		[1] = "Ship (VeryEasy) #000",
		[2] = "Ship (VeryEasy) #001",
	}
	Ship_Easy = {
		[1] = "Ship (Easy) #000",
		[2] = "Ship (Easy) #001",
	}
	Ship_Normal = {
		[1] = "Ship (Normal) #000",
		[2] = "Ship (Normal) #001",
	}
	Ship_Hard = {
		[1] = "Ship (Hard) #000",
		[2] = "Ship (Hard) #001",
	}
	Ship_VeryHard = {
		[1] = "Ship (VeryHard) #000",
		[2] = "Ship (VeryHard) #001",
	}
	--------------------------
	-- End Ships 						--
	--------------------------
	
	--------------------------
	-- Boat								--
	--------------------------
		Boat_Names = 5 -- variable for number of available ships per difficulty
	Boat_VeryEasy = {
		[1] = "Boat (VeryEasy) #000",
		[2] = "Boat (VeryEasy) #001",
		[3] = "Boat (VeryEasy) #002",
		[4] = "Boat (VeryEasy) #003",
		[5] = "Boat (VeryEasy) #004",
	}
	Boat_Easy = {
		[1] = "Boat (Easy) #000",
		[2] = "Boat (Easy) #001",
		[3] = "Boat (Easy) #002",
		[4] = "Boat (Easy) #003",
		[5] = "Boat (Easy) #004",
	}
	Boat_Normal = {
		[1] = "Boat (Normal) #000",
		[2] = "Boat (Normal) #001",
		[3] = "Boat (Normal) #002",
		[4] = "Boat (Normal) #003",
		[5] = "Boat (Normal) #004",
	}
	Boat_Hard = {
		[1] = "Boat (Hard) #000",
		[2] = "Boat (Hard) #001",
		[3] = "Boat (Hard) #002",
		[4] = "Boat (Hard) #003",
		[5] = "Boat (Hard) #004",
	}
	Boat_VeryHard = {
		[1] = "Boat (VeryHard) #000",
		[2] = "Boat (VeryHard) #001",
		[3] = "Boat (VeryHard) #002",
		[4] = "Boat (VeryHard) #003",
		[5] = "Boat (VeryHard) #004",
	}
	--------------------------
	-- End of Boat					--
	--------------------------

	-----------------------
	-- Moving MUD Arrays --
	-----------------------

	Mud_Convoys = 2 -- variable for number of availale Moving MUD Per Difficulty

	Mud_Convoy_VeryEasy = {
	  [1] = "Mud Convoy (VeryEasy) #000",
		[2] = "Mud Convoy (VeryEasy) #001",
	}
	Mud_Convoy_Easy = {
	  [1] = "Mud Convoy (Easy) #000",
		[2] = "Mud Convoy (Easy) #001",
	}
	Mud_Convoy_Normal = {
	  [1] = "Mud Convoy (Normal) #000",
		[2] = "Mud Convoy (Normal) #001",
	}
	Mud_Convoy_Hard = {
	  [1] = "Mud Convoy (Hard) #000",
		[2] = "Mud Convoy (Hard) #001",
	}
	Mud_Convoy_VeryHard = {
	  [1] = "Mud Convoy (VeryHard) #000",
		[2] = "Mud Convoy (VeryHard) #001",
	}
	---------------------------
	-- End Moving MUD Arrays --
	---------------------------
	
	
	-----------------------------
	-- Surface to air missiles --
	-----------------------------
	Sam_Launchers = 2
	
	Sam_VeryEasy = {
	[1] = 'Sam (VeryEasy) #000',
	[2] = 'Sam (VeryEasy) #001',
	}
	
	Sam_Easy = {
	[1] = 'Sam (Easy) #000',
	[2] = 'Sam (Easy) #001',
	}
	
	Sam_Normal = {
	[1] = 'Sam (Normal) #000',
	[2] = 'Sam (Normal) #001',
	}
	
	Sam_Hard = {
	[1] = 'Sam (Hard) #000',
	[2] = 'Sam (Hard) #001',
	}
	
	Sam_VeryHard = {
	[1] = 'Sam (VeryHard) #000',
	[2] = 'Sam (VeryHard) #001',
	}

	-----------------------------
	--Iinfantry spawning array --
	-----------------------------
Infantry_Squads = 5
	
	Infantry_VeryEasy = {
		[1] = 'Infantry (VeryEasy) #000',
		[2] = 'Infantry (VeryEasy) #001',
		[3] = 'Infantry (VeryEasy) #002',
		[4] = 'Infantry (VeryEasy) #003',
		[5] = 'Infantry (VeryEasy) #004',
	}
	Infantry_Easy = {
		[1] = 'Infantry (Easy) #000',
		[2] = 'Infantry (Easy) #001',
		[3] = 'Infantry (Easy) #002',
		[4] = 'Infantry (Easy) #003',
		[5] = 'Infantry (Easy) #004',
	}
	Infantry_Normal = {
		[1] = 'Infantry (Normal) #000',
		[2] = 'Infantry (Normal) #001',
		[3] = 'Infantry (Normal) #002',
		[4] = 'Infantry (Normal) #003',
		[5] = 'Infantry (Normal) #004',
	}
	Infantry_Hard = {
		[1] = 'Infantry (Hard) #000',
		[2] = 'Infantry (Hard) #001',
		[3] = 'Infantry (Hard) #002',
		[4] = 'Infantry (Hard) #003',
		[5] = 'Infantry (Hard) #004',
	}
	Infantry_VeryHard = {
		[1] = 'Infantry (VeryHard) #000',
		[2] = 'Infantry (VeryHard) #001',
		[3] = 'Infantry (VeryHard) #002',
		[4] = 'Infantry (VeryHard) #003',
		[5] = 'Infantry (VeryHard) #004',
	}
	---------------------------------
	--End Infantry spawning array --
	---------------------------------
	
		-----------------------------
	--Iinfantry spawning array --
	-----------------------------
Infantry2_Squads = 5
	
	Infantry2_VeryEasy = {
		[1] = 'Infantry2 (VeryEasy) #000',
		[2] = 'Infantry2 (VeryEasy) #001',
		[3] = 'Infantry2 (VeryEasy) #002',
		[4] = 'Infantry2 (VeryEasy) #003',
		[5] = 'Infantry2 (VeryEasy) #004',
	}
	Infantry2_Easy = {
		[1] = 'Infantry2 (Easy) #000',
		[2] = 'Infantry2 (Easy) #001',
		[3] = 'Infantry2 (Easy) #002',
		[4] = 'Infantry2 (Easy) #003',
		[5] = 'Infantry2 (Easy) #004',
	}
	Infantry2_Normal = {
		[1] = 'Infantry2 (Normal) #000',
		[2] = 'Infantry2 (Normal) #001',
		[3] = 'Infantry2 (Normal) #002',
		[4] = 'Infantry2 (Normal) #003',
		[5] = 'Infantry2 (Normal) #004',
	}
	Infantry2_Hard = {
		[1] = 'Infantry2 (Hard) #000',
		[2] = 'Infantry2 (Hard) #001',
		[3] = 'Infantry2 (Hard) #002',
		[4] = 'Infantry2 (Hard) #003',
		[5] = 'Infantry2 (Hard) #004',
	}
	Infantry2_VeryHard = {
		[1] = 'Infantry2 (VeryHard) #000',
		[2] = 'Infantry2 (VeryHard) #001',
		[3] = 'Infantry2 (VeryHard) #002',
		[4] = 'Infantry2 (VeryHard) #003',
		[5] = 'Infantry2 (VeryHard) #004',
	}
	---------------------------------
	--End Infantry spawning array --
	---------------------------------

	-----------------------------
	-- Fighter spawning arrays --
	-----------------------------
	-- The following arrays contain available enemy aircraft the Spawn Fighter function pulls from

	Fighter_Names = 12 -- variable for number of available fighters

	Fighter_Names_VeryEasy = {
	[1] = 'F-86 (Easy)',
	[2] = 'F-86 (Easy)',
	[3] = 'F-86 (Easy)',
	[4] = 'F-86 (Easy)',
	[5] = 'F-86 (Easy)',
	[6] = 'F-86 (Easy)',
	[7] = 'F-86 (Easy)',
	[8] = 'F-86 (Easy)',
	[9] = 'F-86 (Normal)',
	[10] = 'F-86 (Normal)',
	[11] = 'F-86 (Hard)',
	[12] = 'F-86 (VeryHard)',
	}
	
	Fighter_Names_Easy = {
	  [1] = 'MiG-21 (Easy)',
	  [2] = 'MiG-23 (Easy)',
	  [3] = 'MiG-21 (Easy)',
	  [4] = 'MiG-23 (Easy)',
	  [5] = 'MiG-21 (Easy)',
		[6] = 'MiG-23 (Easy)',
		[7] = 'F-4E (Easy)',
	  [8] = 'F-5E (Easy)',	
		[9] = 'F-4E (Easy)',
	  [10] = 'F-5E (Easy)',	
	  [11] = 'F-4E (Easy)',
	  [12] = 'F-5E (Easy)',	
	}
	Fighter_Names_Normal = {
	  [1] = 'MiG-21 (Normal)',
	  [2] = 'MiG-23 (Normal)',
	  [3] = 'MiG-21 (Hard)',
	  [4] = 'MiG-23 (Hard)',
	  [5] = 'F-4E (Normal)',
	  [6] = 'F-5E (Normal)',	
		[7] = 'F-4E (Hard)',
	  [8] = 'F-5E (Hard)',
		[9] = 'MiG-21 (Hard)',
	  [10] = 'MiG-23 (Hard)',
		[11] = 'F-4E (Hard)',
	  [12] = 'F-5E (Hard)',
	}
	Fighter_Names_Hard = {
	  [1] = 'MiG-29S (Normal)',
		[2] = 'MiG-29S (Hard)',
	  [3] = 'MiG-29A (Normal)',
		[4] = 'MiG-29A (Hard)',
	  [5] = 'F-16C bl.52d (Normal)',
		[6] = 'MiG-25PD (Hard)',
	  [7] = 'Su-27 (Normal)',
		[8] = 'Su-27 (Hard)',
	  [9] = '2000-5 (Hard)',
	  [10] = '2000-5 (VeryHard)',
	  [11] = 'F-16C (Normal)',
		[12] = 'F-16C (Hard)',	
	}
	Fighter_Names_VeryHard = {
	  [1] = 'MiG-29S (Hard)',
		[2] = 'MiG-29S (VeryHard)',
	  [3] = 'MiG-29A (Hard)',
		[4] = 'MiG-29A (VeryHard)',
	  [5] = 'F-16C bl.52d (Hard)',
		[6] = 'F-16C bl.52d (VeryHard)',
	  [7] = 'Su-27 (VeryHard)',
		[8] = 'Su-27 (VeryHard)',
		[9] = 'Su-27 (VeryHard)',
	  [10] = 'MiG-25PD (VeryHard)',
	  [11] = 'F-16C (VeryHard)',
		[12] = 'Su-27 (Hard)',
	}
	------------------------
	-- End Fighter Arrays --
	------------------------
	-----------------------------------
	-- Airfield task spawning arrays --
	-----------------------------------
	-- Names of the groups used for airfield attack tasks
	-------------------------
	-- Sochi Airfield Task --
	-------------------------
	Sochi_Names_VeryEasy = {
		[1] = 'Sochi Airfield (Easy) #000',
	}
	Sochi_Names_Easy = {
		[1] = 'Sochi Airfield (Easy) #000',
	}
	Sochi_Names_Normal = {
		[1] = 'Sochi Airfield (Normal) #000',
	}
	Sochi_Names_Hard = {
		[1] = 'Sochi Airfield (Hard) #000',
	}
	Sochi_Names_VeryHard = {
		[1] = 'Sochi Airfield (VeryHard) #000',
	}
	---------------------
	--End Sochi Arrays --
	---------------------
	-----------------------------------
	-- End airfield task spawning arrays--
	-----------------------------------

	------------------------------------
	-- Attacker plane spawning arrays --
	------------------------------------
	-- The following arrays contain available enemy aircraft the Spawn Fighter function pulls from

	Attacker_Names = 4 -- variable for number of availale ground attackers

	Attacker_Names_Easy = {
	  [1] = 'Su-25T (BEasy)',
	  [2] = 'Su-25 (BEasy)',
	  [3] = 'MiG-27K (BEasy)',
	  [4] = 'Su-17 (BEasy)',
	}
	Attacker_Names_Normal = {
	  [1] = 'Su-25T (BNormal)',
	  [2] = 'Su-25 (BNormal)',
	  [3] = 'MiG-27K (BNormal)',
	  [4] = 'Su-17 (BNormal)',
	}
	Attacker_Names_Hard = {
	  [1] = 'Su-25T (BHard)',
	  [2] = 'Su-25 (BHard)',
	  [3] = 'MiG-27K (BHard)',
	  [4] = 'Su-17 (BHard)',
	}
	Attacker_Names_VeryHard = {
	  [1] = 'Su-25T (BVeryHard)',
	  [2] = 'Su-25 (BVeryHard)',
	  [3] = 'MiG-27K (BVeryHard)',
	  [4] = 'Su-17 (BVeryHard)',
	}
	------------------------------
	-- End Ground Attack Arrays --
	------------------------------

	----------------------------
	-- Bomber spawning arrays --
	----------------------------
	-- The following arrays contain available enemy aircraft the Spawn Fighter function pulls from

	Bomber_Names = 2 --variable for number of availale fighters

	Bomber_Names_Easy = {
		[1] = 'Tu-22M3 (Easy)',
	  [2] = 'Su-24M (Easy)',
	}
	Bomber_Names_Normal = {
		[1] = 'Tu-22M3 (Normal)',
	  [2] = 'Su-24M (Normal)',
	}
	Bomber_Names_Hard = {
		[1] = 'Tu-22M3 (Hard)',
	  [2] = 'Su-24M (Hard)',
	}
	Bomber_Names_VeryHard = {
		[1] = 'Tu-22M3 (VeryHard)',
	  [2] = 'Su-24M (VeryHard)',
	}
	------------------------
	-- End Bomber Arrays --
	------------------------

	----------------------------
	-- CAS spawning arrays --
	----------------------------
	-- The following arrays contain available enemy aircraft the Spawn CAS function pulls from

	CAS_Planes = {
	  [1] = 'Tornado GR4 #1',
	  [2] = 'Tornado IDS #1',
	}
	------------------------
	-- End CAS Arrays --
	------------------------

	-- Removes submenus so that reloading the script does not result in duplicate submenus in the list
	-- this was added because of the loading of the script debug option.
	missionCommands.removeItem({"Mission Info"})
	missionCommands.removeItem({"Airfield Tasks"})
	missionCommands.removeItem({"Anapa Tasks"})
	missionCommands.removeItem({"Maykop Tasks"})
	missionCommands.removeItem({"Gudauta Tasks"})
	missionCommands.removeItem({"Kutaisi Tasks"})
	missionCommands.removeItem({"Nalchik Tasks"})
	missionCommands.removeItem({"Tbilisi Tasks"})
	missionCommands.removeItem({"OPFS Settings"})
	missionCommands.removeItem({"Debug"})
	
	 --variables defining f10 sub-menu items
	Calls = missionCommands.addSubMenu("Mission Info",nil)
	Airdromes = missionCommands.addSubMenu("Airfield Tasks",nil)
	AnapaPath = missionCommands.addSubMenu("Anapa Tasks",nil)
	MaykopPath = missionCommands.addSubMenu("Maykop Tasks",nil)
	GudautaPath = missionCommands.addSubMenu("Gudauta Tasks",nil)
	KutaisiPath = missionCommands.addSubMenu("Kutaisi Tasks",nil)
	NalchikPath = missionCommands.addSubMenu("Nalchik Tasks",nil)
	TbilisiPath = missionCommands.addSubMenu("Tbilisi Tasks",nil)
	GameSet = missionCommands.addSubMenu("OPFS Settings",nil)
	Debug = missionCommands.addSubMenu("Debug",nil)

	----------------
	-- Wanks Code --
	----------------
	--The are sub-menu variables, the parent menu is GameSet
	DifficultySet = missionCommands.addSubMenu("Set Difficulty", GameSet)
	DistanceSet = missionCommands.addSubMenu("Set Spawn Range", GameSet)

	--------------------
	-- End Wanks Code --
	--------------------

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
			
			
	  
	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_9y, Debug, reloadscript, nil)
	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_9z, Debug, Debug_Toggle, nil)
	
	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_0a, Calls, Bullscall1, nil)
	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_0b, Calls, Bullscall2, nil)
	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_0c, Calls, Bullscall3, nil)
	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_0d, Calls, Bullscall4, nil)
	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_0e, Calls, Bullscall5, nil)

	--missionCommands.addCommandForGroup(Rad_GroupID, rad_option_0c, Calls, BRAcall, nil)
	
	    
	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_7a, GameSet, Change_Smoke_Set, nil)
	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_2a, Airdromes, Create_Airfield, 'Sochi')
	  
	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1a, AnapaPath, Create_Fighter_Intercept, 'Anapa')
	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1b, AnapaPath, Create_Bomber_Intercept, 'Anapa')
	--missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1c, AnapaPath, Create_Escort, 'Anapa')
	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1d, AnapaPath, Create_Mud, 'Anapa')
	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1e, AnapaPath, Create_Mud_Convoy, 'Anapa')
	--missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1f, AnapaPath, Create_Mud_CAS, 'Anapa')
	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1g, AnapaPath, Create_Strike, 'Anapa')
	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1h, AnapaPath, Create_Naval, 'OceanNorth')

	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1a, MaykopPath, Create_Fighter_Intercept, 'Maykop')
	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1b, MaykopPath, Create_Bomber_Intercept, 'Maykop')
	--missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1c, MaykopPath, Create_Escort, 'Maykop')
	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1d, MaykopPath, Create_Mud, 'Maykop')
	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1e, MaykopPath, Create_Mud_Convoy, 'Maykop')
	--missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1f, MaykopPath, Create_Mud_CAS, 'Maykop')
	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1g, MaykopPath, Create_Strike, 'Maykop')
	--missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1h, MaykopPath, Create_Naval, 'Maykop')
	
	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1a, GudautaPath, Create_Fighter_Intercept, 'Gudauta')
	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1b, GudautaPath, Create_Bomber_Intercept, 'Gudauta')
	--missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1c, GudautaPath, Create_Escort, 'Gudauta')
	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1d, GudautaPath, Create_Mud, 'Gudauta')
	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1e, GudautaPath, Create_Mud_Convoy, 'Gudauta')
	--missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1f, GudautaPath, Create_Mud_CAS, 'Gudauta')
	--missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1g, GudautaPath, Create_Strike, 'Gudauta')
	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1h, GudautaPath, Create_Naval, 'OceanMid')
	
	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1a, KutaisiPath, Create_Fighter_Intercept, 'Kutaisi')
	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1b, KutaisiPath, Create_Bomber_Intercept, 'Kutaisi')
	--missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1c, KutaisiPath, Create_Escort, 'Kutaisi')
	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1d, KutaisiPath, Create_Mud, 'Kutaisi')
	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1e, KutaisiPath, Create_Mud_Convoy, 'Kutaisi')
	--missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1f, KutaisiPath, Create_Mud_CAS, 'Kutaisi')
	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1g, KutaisiPath, Create_Strike, 'Kutaisi')
	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1h, KutaisiPath, Create_Naval, 'OceanSouth')

	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1a, NalchikPath, Create_Fighter_Intercept, 'Nalchik')
	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1b, NalchikPath, Create_Bomber_Intercept, 'Nalchik')
	--missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1c, NalchikPath, Create_Escort, 'Nalchik')
	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1d, NalchikPath, Create_Mud, 'Nalchik')
	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1e, NalchikPath, Create_Mud_Convoy, 'Nalchik')
	--missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1f, NalchikPath, Create_Mud_CAS, 'Nalchik')
	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1g, NalchikPath, Create_Strike, 'Nalchik')
	--missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1h, NalchikPath, Create_Naval, 'Nalchik')
	

	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1a, TbilisiPath, Create_Fighter_Intercept, 'Tbilisi')
	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1b, TbilisiPath, Create_Bomber_Intercept, 'Tbilisi')
	--missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1c, TbilisiPath, Create_Escort, 'Tbilisi')
	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1d, TbilisiPath, Create_Mud, 'Tbilisi')
	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1e, TbilisiPath, Create_Mud_Convoy, 'Tbilisi')
	--missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1f, TbilisiPath, Create_Mud_CAS, 'Tbilisi')
	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1g, TbilisiPath, Create_Strike, 'Tbilisi')
	--missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1h, TbilisiPath, Create_Naval, 'Tbilisi')
		----------------
	-- Wanks Code --
	----------------
	-- These commands set the function of the radio options in the difficulty sub-menu
	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_8a, DifficultySet, Set_Difficuty_VeryEasy, nil) -- 'Very Easy'
	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_8b, DifficultySet, Set_Difficuty_Easy, nil) -- 'Easy'
	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_8c, DifficultySet, Set_Difficuty_Normal, nil) -- 'Normal'
	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_8d, DifficultySet, Set_Difficuty_Hard, nil) -- 'Hard'
	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_8e, DifficultySet, Set_Difficuty_VeryHard, nil) -- 'Very Hard'

	-- These commands set the function of the radio options in the target range sub-menu
	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_9a, DistanceSet, Set_Distance_Scramble, nil) -- Scramble
	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_9b, DistanceSet, Set_Distance_Close, nil) -- Close
	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_9c, DistanceSet, Set_Distance_Standard, nil) -- Standard
	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_9d, DistanceSet, Set_Distance_Far, nil) -- Far
	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_9e, DistanceSet, Set_Distance_Veryfar, nil) -- Very far
	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_9f, DistanceSet, Set_Distance_Distant, nil) -- Distant
	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_9g, DistanceSet, Set_Distance_Random, nil) -- Random

	--------------------
	-- End Wanks Code --
	--------------------
	Radio_Table[unitName] = true

		end
	end
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

	-----------
	-- Intro --
	-----------
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	function Introduce_Mission(arg, time)
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	local msg = {}
	msg.text = ' Chameleon_Silk is proud to present, Operation Flagship... Alpha Test2'
	msg.displayTime = 45
	msg.msgFor = {coa = {'all'}} 
	mist.message.add(msg)

	local msg = {} 
	msg.text = '  '
	msg.displayTime = 45
	msg.msgFor = {coa = {'all'}} 
	mist.message.add(msg)

	local msg = {} 
	msg.text = ' Mission utilizes heavily modified Interception Script by akp '
	msg.displayTime = 45
	msg.msgFor = {coa = {'all'}} 
	mist.message.add(msg)
	
		local msg = {} 
	msg.text = ' Mission utilizes Chameleon Silks task system script. '
	msg.displayTime = 45
	msg.msgFor = {coa = {'all'}} 
	mist.message.add(msg)

	local msg = {} 
	msg.text = ' Global difficulty has been set to '..tostring(Difficulty)
	msg.displayTime = 45
	msg.msgFor = {coa = {'all'}} 
	mist.message.add(msg)

	local msg = {} 
	msg.text = ' Task spawn start range has been set to '..tostring(Range)
	msg.displayTime = 45
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
	function Create_Fighter_Intercept(_Area)
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	-- based off of Kutaisi Intercept script by akp, but modified for my own use.
	local zone = trigger.misc.getZone(_Area)
	local rand = mist.random(1,Fighter_Names)
	intercepttask = 1

	  if Difficultymod == 1 then
	    grpName = Fighter_Names_VeryEasy[rand]
	  end
		
		if Difficultymod == 2 then
	    grpName = Fighter_Names_Easy[rand]
	  end

	  if Difficultymod == 3 then
	    grpName = Fighter_Names_Normal[rand]
	  end

	  if Difficultymod == 4 then
	    grpName = Fighter_Names_Hard[rand]
	  end
		
		if Difficultymod == 5 then
	    grpName = Fighter_Names_VeryHard[rand]
	  end

	  spawnPsn = {}

	  if Task_Range == 1 then
	    spawnPsn = mist.getRandPointInCircle(zone.point, zone.radius * 0.75, zone.radius * 0.40)
			trigger.action.outSoundForCoalition(coalition.side.RED, 'scramble.ogg')
	  end

	  if Task_Range == 2 then
	    spawnPsn = mist.getRandPointInCircle(zone.point, zone.radius * 1.00, zone.radius * 0.75)
			trigger.action.outSoundForCoalition(coalition.side.RED, 'standard.ogg')
	  end

	  if Task_Range == 3 then
	    spawnPsn = mist.getRandPointInCircle(zone.point, zone.radius * 1.25, zone.radius * 1.00)
			trigger.action.outSoundForCoalition(coalition.side.RED, 'far.ogg')
	  end

	  if Task_Range == 4 then
	    spawnPsn = mist.getRandPointInCircle(zone.point, zone.radius * 1.50, zone.radius * 1.25)
			trigger.action.outSoundForCoalition(coalition.side.RED, 'veryfar.ogg')
	  end
		
		if Task_Range == 5 then
	    spawnPsn = mist.getRandPointInCircle(zone.point, zone.radius * 1.75, zone.radius * 1.50)
			trigger.action.outSoundForCoalition(coalition.side.RED, 'veryfar.ogg')
	  end
		
	  if Task_Range == 6 then
	    spawnPsn = mist.getRandPointInCircle(zone.point, zone.radius * 2.00, zone.radius * 1.75)
			trigger.action.outSoundForCoalition(coalition.side.RED, 'veryfar.ogg')
	  end
		
	trigger.action.activateGroup(Group.getByName(grpName))
	grp = Group.getByName(grpName)
	
	local InitwpSpeed = mist.random(600,700)
	local wpSpeed = mist.utils.kmphToMps(InitwpSpeed)
	local wpAlt = mist.random(5000,8000)
	local wpPsn = mist.getRandPointInCircle(spawnPsn, zone.radius * 0.15, zone.radius * 0.01)
	local wpPsn2 = mist.getRandPointInCircle(spawnPsn, zone.radius * 2.00, zone.radius * 1.50)
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
		
	local vars = {} 
	vars.groupName = grpName
	vars.action = "respawn"
	vars.point = spawnPsn
	vars.route = path
	mist.teleportToPoint(vars)			
		
	--loops_through = loops_through + 1	
	
	--local vars = {} 
	--vars.groupName = grpName
	--vars.action = "clone"
	--vars.point = spawnPsn
	--vars.route = path
	--mist.teleportToPoint(vars)			

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
		
	checkunits4 = {
	groupName = grpName,
	percent = 40,
	flag = 401,
	stopFlag = 402,
	toggle = true,
	}
	mist.flagFunc.group_alive_less_than(checkunits4)

	trigger.action.outSoundForCoalition(coalition.side.RED, 'airtask.ogg')

	end
	---

	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	function Create_Bomber_Intercept(_bArea)
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	-- based off of Kutaisi Intercept script by akp, but modified for my own use.
	bzone = trigger.misc.getZone(_bArea)
	bombertask = 1
	bspawnPsn = {}
	espawnPsn = {}
	bpath = {}
	epath = {}
	
	if _bArea == 'Anapa' then
		RunwayID = 12
	end

	if _bArea == 'Maykop' then
		RunwayID = 16
	end

	if _bArea == 'Gudauta' then
		RunwayID = 21
	end

	if _bArea == 'Kutaisi' then
		RunwayID = 25
	end

	if _bArea == 'Nalchik' then
		RunwayID = 27
	end

	if _bArea == 'Tbilisi' then
		RunwayID = 30
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
	
  local brand = mist.random(1,2)
  local erand = mist.random(1,Fighter_Names)
	
	if Difficultymod == 1 then
		bgrpName = Bomber_Names_Easy[brand]
		egrpName = Fighter_Names_VeryEasy[erand]
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
		egrpName = Fighter_Names_Hard[erand]
	end
	
	if Difficultymod == 5 then
		bgrpName = Bomber_Names_VeryHard[brand]
		egrpName = Fighter_Names_VeryHard[erand]
	end

	if Task_Range == 1 then
		trigger.action.outSoundForCoalition(coalition.side.RED, 'scramble.ogg')
		bspawnPsn = mist.getRandPointInCircle(bzone.point, bzone.radius * 0.70, bzone.radius * 0.50)
		espawnPsn = mist.getRandPointInCircle(bzone.point, bzone.radius * 0.50, bzone.radius * 0.35)
	end

	if Task_Range == 2 then
		trigger.action.outSoundForCoalition(coalition.side.RED, 'standard.ogg')
		bspawnPsn = mist.getRandPointInCircle(bzone.point, bzone.radius * 1.00, bzone.radius * 0.80)
		espawnPsn = mist.getRandPointInCircle(bzone.point, bzone.radius * 0.80, bzone.radius * 0.60)
	end

	if Task_Range == 3 then
		trigger.action.outSoundForCoalition(coalition.side.RED, 'far.ogg')
		bspawnPsn = mist.getRandPointInCircle(bzone.point, bzone.radius * 1.25, bzone.radius * 0.90)
		espawnPsn = mist.getRandPointInCircle(bzone.point, bzone.radius * 0.90, bzone.radius * 0.75)
	end

	if Task_Range == 4 then
		trigger.action.outSoundForCoalition(coalition.side.RED, 'veryfar.ogg')
		bspawnPsn = mist.getRandPointInCircle(bzone.point, bzone.radius * 1.50, bzone.radius * 1.25)
		espawnPsn = mist.getRandPointInCircle(bzone.point, bzone.radius * 1.25, bzone.radius * 1.00)
	end
	
	if Task_Range == 5 then
		trigger.action.outSoundForCoalition(coalition.side.RED, 'veryfar.ogg')
		bspawnPsn = mist.getRandPointInCircle(bzone.point, bzone.radius * 1.75, bzone.radius * 1.50)
		espawnPsn = mist.getRandPointInCircle(bzone.point, bzone.radius * 1.50, bzone.radius * 1.25)
	end

	if Task_Range == 6 then
		trigger.action.outSoundForCoalition(coalition.side.RED, 'veryfar.ogg')
		bspawnPsn = mist.getRandPointInCircle(bzone.point, bzone.radius * 2.00, bzone.radius * 1.75)
		espawnPsn = mist.getRandPointInCircle(bzone.point, bzone.radius * 1.75, bzone.radius * 1.50)
	end

	trigger.action.activateGroup(Group.getByName(bgrpName))
									
	local bInitwpSpeed = mist.random(525,625)
	local bwpSpeed = mist.utils.kmphToMps(bInitwpSpeed)
	local bwpAlt = mist.random(6100,9000)
	local bwpPsn = mist.getRandPointInCircle(bzone.point, bzone.radius * 0.50, bzone.radius * 0.35)
	local bwpPsn2 = mist.getRandPointInCircle(bzone.point, bzone.radius * 0.02, bzone.radius * 0.01)
	local bwpPsn3 = mist.getRandPointInCircle(bzone.point, bzone.radius * 0.25, bzone.radius * 0.15)
	local bwpPsn4 = mist.getRandPointInCircle(bzone.point, bzone.radius * 0.35, bzone.radius * 0.15)
	local bwpPsn5 = mist.getRandPointInCircle(bzone.point, bzone.radius * 2.00, bzone.radius * 1.99)

	trigger.action.outSoundForCoalition(coalition.side.RED, 'airtask.ogg')			

	bpath[1] = mist.fixedWing.buildWP(bspawnPsn, bwpSpeed, bwpAlt, "BARO")			-- altitude and speed reversed.
	bpath[2] = mist.fixedWing.buildWP(bwpPsn, bwpSpeed, bwpAlt, "BARO")		
	bpath[3] = mist.fixedWing.buildWP(bwpPsn2, bwpSpeed, bwpAlt, "BARO")
	bpath[4] = mist.fixedWing.buildWP(bwpPsn3, bwpSpeed, bwpAlt, "BARO")
	bpath[5] = mist.fixedWing.buildWP(bwpPsn4, bwpSpeed, bwpAlt, "BARO")
	bpath[6] = mist.fixedWing.buildWP(bwpPsn5, bwpSpeed, bwpAlt, "BARO")	

	--bpath[3].task = {}
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
	}			bpath[1].ETA_locked = false
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
	  
	  local eInitwpSpeed = mist.random(700,900)
	  local ewpSpeed = mist.utils.kmphToMps(eInitwpSpeed)
	  local ewpAlt = mist.random(2000,6000)
	  
	  epath[1] = mist.fixedWing.buildWP(bspawnPsn, ewpSpeed, ewpAlt, "BARO")
	  epath[2] = mist.fixedWing.buildWP(bwpPsn, ewpSpeed, ewpAlt, "BARO")
		epath[3] = mist.fixedWing.buildWP(bwpPsn5, ewpSpeed, ewpAlt, "BARO")

	  
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

		

		local checkunits5 = {
		groupName = bgrpName,
		percent = 40,
		flag = 501,
		stopFlag = 502,
		 toggle = true,
	 }
	 mist.flagFunc.group_alive_less_than(checkunits5)

	 --return
	end

	---

	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	function Create_Mud(_mArea)
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	local mzone = trigger.misc.getZone(_mArea)
	local mrand = mist.random(1,Mud_Names)
	mudtask = 1

	--trigger.action.deactivateGroup(Group.getByName(InfName))
	local MudName = {}
	local MudNameb = {}
	local InfName1 = {}
	local InfName2 = {}
	local InfName3 = {}
	local InfName4 = {}
	local InfName5 = {}
	local InfName1c = {}
	local InfName2c = {}
	local InfName3c = {}
	local InfName4c = {}
	local InfName5c = {}
	local SamName1 = {}
	local SamName1b = {}

	--if MudName ==  then
		local msg = {}
	  msg.text = ' Creating Mud.'
	  msg.displayTime = 5
	  msg.msgFor = {coa = {'all'}}
	  mist.message.add(msg)

	trigger.action.outSoundForCoalition(coalition.side.RED, 'groundtask.ogg')

	if Difficultymod == 1 then
	  MudName = Mud_VeryEasy[mrand]
		InfName1 = Infantry_VeryEasy[1]
		InfName2 = Infantry_VeryEasy[2]
		InfName3 = Infantry_VeryEasy[3]
		InfName4 = Infantry_VeryEasy[4]
		InfName5 = Infantry_VeryEasy[5]
	end

	if Difficultymod == 2 then
	  MudName = Mud_Easy[mrand]
		InfName1 = Infantry_Easy[1]
		InfName2 = Infantry_Easy[2]
		InfName3 = Infantry_Easy[3]
		InfName4 = Infantry_Easy[4]
		InfName5 = Infantry_Easy[5]
	end

	if Difficultymod == 3 then
	  MudName = Mud_Normal[mrand]
		InfName1 = Infantry_Normal[1]
		InfName2 = Infantry_Normal[2]
		InfName3 = Infantry_Normal[3]
		InfName4 = Infantry_Normal[4]
		InfName5 = Infantry_Normal[5]
	end

	if Difficultymod == 4 then
	  MudName = Mud_Hard[mrand]
		InfName1 = Infantry_Hard[1]
		InfName2 = Infantry_Hard[2]
		InfName3 = Infantry_Hard[3]
		InfName4 = Infantry_Hard[4]
		InfName5 = Infantry_Hard[5]
	end
	
	if Difficultymod == 5 then
	  MudName = Mud_VeryHard[mrand]
		InfName1 = Infantry_VeryHard[1]
		InfName2 = Infantry_VeryHard[2]
		InfName3 = Infantry_VeryHard[3]
		InfName4 = Infantry_VeryHard[4]
		InfName5 = Infantry_VeryHard[5]
	end
	
		
	

		--trigger.action.activateGroup(Group.getByName(MudName))
		--trigger.action.activateGroup(Group.getByName(InfName1))
		--trigger.action.activateGroup(Group.getByName(InfName2))
		--trigger.action.activateGroup(Group.getByName(InfName3))
		--trigger.action.activateGroup(Group.getByName(InfName4))
		--trigger.action.activateGroup(Group.getByName(InfName5))
		local MudGrpData = mist.getGroupData(MudName)
			

			
		  for i = 1, 100 do
	    if Task_Range == 1 then
	      mudPsn = mist.getRandPointInCircle(mzone.point, mzone.radius * 0.25, mzone.radius * 0.10)
	    elseif Task_Range == 2 then
	      mudPsn = mist.getRandPointInCircle(mzone.point, mzone.radius * 0.40, mzone.radius * 0.25)
	    elseif Task_Range == 3 then
	      mudPsn = mist.getRandPointInCircle(mzone.point, mzone.radius * 0.65, mzone.radius * 0.40)
	    elseif Task_Range == 4 then
	      mudPsn = mist.getRandPointInCircle(mzone.point, mzone.radius * 0.85, mzone.radius * 0.65)		
			elseif Task_Range == 5 then
	      mudPsn = mist.getRandPointInCircle(mzone.point, mzone.radius * 1.00, mzone.radius * 0.85)	
			elseif Task_Range == 6 then
	      mudPsn = mist.getRandPointInCircle(mzone.point, mzone.radius * 1.25, mzone.radius * 1.05)
			end

			
					if mist.isTerrainValid(mudPsn, {'LAND'}) == true and mist.terrainHeightDiff(mudPsn, 19) < 2 then				
					break

					end

	  

		end

		local mvars = {}
	  mvars.groupName = MudName
	  mvars.action = "respawn"
	  mvars.point = mudPsn
	  --mvars.disperse = true
	  --mvars.maxDisp = 100
	  --mvars.radius = 20
		MudNamec = mist.teleportToPoint(mvars)
		
		formisttable = '[g]' .. MudNamec
		targets = mist.makeUnitTable({formisttable})
		
		AddOP(MudNamec) -- add MBOT to it
		
			 local infvars = {}
		infvars.groupName = InfName1
	  infvars.action = "respawn"
	  infvars.point = mudPsn
		infvars.disperse = true
	  infvars.maxDisp = 100
	  infvars.radius = 100
		infvars.innerRadius = 70
		InfName1c = mist.teleportToPoint(infvars)

		--mist.spawnRandomizedGroup(InfName1)
		
		local infvars = {}
		infvars.groupName = InfName2
	  infvars.action = "respawn"
	  infvars.point = mudPsn
		infvars.disperse = true
	  infvars.maxDisp = 100
	  infvars.radius = 100
		infvars.innerRadius = 70
		InfName2c = mist.teleportToPoint(infvars)
		
		local infvars = {}
		infvars.groupName = InfName3
	  infvars.action = "respawn"
	  infvars.point = mudPsn
		infvars.disperse = true
	  infvars.maxDisp = 100
	  infvars.radius = 100
		infvars.innerRadius = 70
		InfName3c = mist.teleportToPoint(infvars)
		
		
	local infvars = {}
		infvars.groupName = InfName4
	  infvars.action = "respawn"
	  infvars.point = mudPsn
		infvars.disperse = true
	  infvars.maxDisp = 100
	  infvars.radius = 100
		infvars.innerRadius = 70
		InfName4c =  mist.teleportToPoint(infvars)
		
		local infvars = {}
		infvars.groupName = InfName5
	  infvars.action = "respawn"
	  infvars.point = mudPsn
		infvars.disperse = true
	  infvars.maxDisp = 100
	  infvars.radius = 100
		infvars.innerRadius = 70
		InfName5c = mist.teleportToPoint(infvars)		  
			
		--mist.spawnRandomizedGroup(MudName)
		--mist.spawnRandomizedGroup(InfName1)
		--mist.spawnRandomizedGroup(InfName2)
		--mist.spawnRandomizedGroup(InfName3)
		--mist.spawnRandomizedGroup(InfName4)
		--mist.spawnRandomizedGroup(InfName5)
		
		
		local randomizer_disperse = 0
		local randomizer_radius = 0
		local randomizer_inner_radius = 0
		local randomizer_max_disperse = 0
		local use_randomizer = 0
		--use_randomizer = mist.random(0,1)
		randomizer_disperse = mist.random(0,1)
		randomizer_max_disperse = mist.random(220,320)
		randomizer_radius = mist.random(220,280)
		randomizer_inner_radius = mist.random(200,220)
		
		--if use_randomizer == 1 then
		local mvars = {}
	  mvars.groupName = MudName
	  mvars.action = "teleport"
	  mvars.point = mudPsn
	  mvars.disperse = randomizer_disperse
	  mvars.maxDisp = randomizer_max_disperse
	  mvars.radius = randomizer_radius
		mvars.innerRadius = randomizer_inner_radius
		MudNamec = mist.teleportToPoint(mvars)


			
	 local infvars = {}
		infvars.groupName = InfName1
	  infvars.action = "teleport"
	  infvars.point = mudPsn
		infvars.disperse = true
	  infvars.maxDisp = 25
	  infvars.radius = 400
		infvars.innerRadius = 360
		InfName1c = mist.teleportToPoint(infvars)

		--mist.spawnRandomizedGroup(InfName1)
		
		local infvars = {}
		infvars.groupName = InfName2
	  infvars.action = "teleport"
	  infvars.point = mudPsn
		infvars.disperse = true
	  infvars.maxDisp = 25
	  infvars.radius = 300
		infvars.innerRadius = 270
		InfName2c = mist.teleportToPoint(infvars)
		
		local infvars = {}
		infvars.groupName = InfName3
	  infvars.action = "teleport"
	  infvars.point = mudPsn
		infvars.disperse = true
	  infvars.maxDisp = 25
	  infvars.radius = 300
		infvars.innerRadius = 270
		InfName3c= mist.teleportToPoint(infvars)
		
		
	local infvars = {}
		infvars.groupName = InfName4
	  infvars.action = "teleport"
	  infvars.point = mudPsn
		infvars.disperse = true
	  infvars.maxDisp = 25
	  infvars.radius = 300
		infvars.innerRadius = 270
		InfName4c =  mist.teleportToPoint(infvars)
		
		local infvars = {}
		infvars.groupName = InfName5
	  infvars.action = "teleport"
	  infvars.point = mudPsn
		infvars.disperse = true
	  infvars.maxDisp = 25
	  infvars.radius = 300
		infvars.innerRadius = 270
		InfName5c = mist.teleportToPoint(infvars)		    
	  
			local msg = {}
	  msg.text = ' Mud task has been created '
	  msg.displayTime = 20
	  msg.msgFor = {coa = {'all'}}
	  mist.message.add(msg)
		
		mist.removeFunction(InfFunc1c)
		mist.removeFunction(InfFunc2c)
		mist.removeFunction(InfFunc3c)
		mist.removeFunction(InfFunc4c)
		mist.removeFunction(InfFunc5c)
	
		
		
		InfFunc1c = nil
		local randomizer_time = 0
		randomizer_time = mist.random(45,90)
		InfFunc1c = mist.scheduleFunction(Move_Infantry, {InfName1c}, randomizer_time, randomizer_time)
		  
		InfFunc2c = nil
		local randomizer_time = 0
		randomizer_time = mist.random(45,90)
		InfFunc2c = mist.scheduleFunction(Move_Infantry, {InfName2c}, randomizer_time, randomizer_time)
	
		InfFunc3c = nil
		local randomizer_time = 0
		randomizer_time = mist.random(45,90)
		InfFunc3c = mist.scheduleFunction(Move_Infantry, {InfName3c}, randomizer_time, randomizer_time)
		
		InfFunc4c = nil
		local randomizer_time = 0
		randomizer_time = mist.random(45,90)
		InfFunc4c = mist.scheduleFunction(Move_Infantry, {InfName4c}, randomizer_time, randomizer_time)
	
		InfFunc5c = nil
		local randomizer_time = 0
		randomizer_time = mist.random(45,90)
		InfFunc5c = mist.scheduleFunction(Move_Infantry, {InfName5c}, randomizer_time, randomizer_time)
		
		trigger.action.outSoundForCoalition(coalition.side.RED, 'bombing4.ogg')

		--Make_Smoke(mzone, nil)
		--return
		
			 local checkunits2 = {
	   groupName = MudName,
	   percent = 33,
		 flag = 201,
		stopFlag = 202,
		 toggle = true,
	 }
	 mist.flagFunc.group_alive_less_than(checkunits2)

	end
	---
	
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	function Create_Strike(_mArea)
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	local mzone = trigger.misc.getZone(_mArea)
	local mrand = mist.random(1,Mud_Names)
	local srand = mist.random(1,Sam_Launchers)
	striketask = 1

	--trigger.action.deactivateGroup(Group.getByName(InfName))
	local MudName = {}
	local MudNamed = {}
	local InfName1 = {}
	local InfName2 = {}
	local InfName3 = {}
	local InfName4 = {}
	local InfName5 = {}
	local InfName1d = {}
	local InfName2d = {}
	local InfName3d = {}
	local InfName4d = {}
	local InfName5d = {}
	local SamName1 = {}
	local SamName1d = {}


	--if MudName ==  then
		local msg = {}
	  msg.text = ' Creating Strike Mission.'
	  msg.displayTime = 5
	  msg.msgFor = {coa = {'all'}}
	  mist.message.add(msg)

	trigger.action.outSoundForCoalition(coalition.side.RED, 'groundtask.ogg')

	if Difficultymod == 1 then
	  MudName = Mud_VeryEasy[mrand]
		--SamName = ''
		InfName1 = Infantry2_VeryEasy[1]
		InfName2 = Infantry2_VeryEasy[2]
		InfName3 = Infantry2_VeryEasy[3]
		InfName4 = Infantry2_VeryEasy[4]
		InfName5 = Infantry2_VeryEasy[5]
		SamName1 = Sam_VeryEasy[srand]
	end

	if Difficultymod == 2 then
	  MudName = Mud_Easy[mrand]
		--SamName = ''
		InfName1 = Infantry2_Easy[1]
		InfName2 = Infantry2_Easy[2]
		InfName3 = Infantry2_Easy[3]
		InfName4 = Infantry2_Easy[4]
		InfName5 = Infantry2_Easy[5]
		SamName1 = Sam_Easy[srand]
	end

	if Difficultymod == 3 then
	  MudName = Mud_Normal[mrand]
		--SamName = ''
		InfName1 = Infantry2_Normal[1]
		InfName2 = Infantry2_Normal[2]
		InfName3 = Infantry2_Normal[3]
		InfName4 = Infantry2_Normal[4]
		InfName5 = Infantry2_Normal[5]
		SamName1 = Sam_Normal[srand]
	end

	if Difficultymod == 4 then
	  MudName = Mud_Hard[mrand]
		--SamName = ''
		InfName1 = Infantry2_Hard[1]
		InfName2 = Infantry2_Hard[2]
		InfName3 = Infantry2_Hard[3]
		InfName4 = Infantry2_Hard[4]
		InfName5 = Infantry2_Hard[5]
		SamName1 = Sam_Hard[srand]
	end
	
	if Difficultymod == 5 then
	  MudName = Mud_VeryHard[mrand]
		--SamName = ''
		InfName1 = Infantry2_VeryHard[1]
		InfName2 = Infantry2_VeryHard[2]
		InfName3 = Infantry2_VeryHard[3]
		InfName4 = Infantry2_VeryHard[4]
		InfName5 = Infantry2_VeryHard[5]
		SamName1 = Sam_VeryHard[srand]
	end
	
		
	

		--trigger.action.activateGroup(Group.getByName(MudName))
		--trigger.action.activateGroup(Group.getByName(SamName1))
		--trigger.action.activateGroup(Group.getByName(InfName1))
		--trigger.action.activateGroup(Group.getByName(InfName2))
		--trigger.action.activateGroup(Group.getByName(InfName3))
		--trigger.action.activateGroup(Group.getByName(InfName4))
		--trigger.action.activateGroup(Group.getByName(InfName5))
		--local MudGrpData = mist.getGroupData(MudName)
			

			
		  for i = 1, 500 do
	    if Task_Range == 1 then
	      mudPsn = mist.getRandPointInCircle(mzone.point, mzone.radius * 0.25, mzone.radius * 0.10)
	    elseif Task_Range == 2 then
	      mudPsn = mist.getRandPointInCircle(mzone.point, mzone.radius * 0.40, mzone.radius * 0.25)
	    elseif Task_Range == 3 then
	      mudPsn = mist.getRandPointInCircle(mzone.point, mzone.radius * 0.65, mzone.radius * 0.40)
	    elseif Task_Range == 4 then
	      mudPsn = mist.getRandPointInCircle(mzone.point, mzone.radius * 0.85, mzone.radius * 0.65)		
			elseif Task_Range == 5 then
	      mudPsn = mist.getRandPointInCircle(mzone.point, mzone.radius * 1.00, mzone.radius * 0.85)	
			elseif Task_Range == 6 then
	      mudPsn = mist.getRandPointInCircle(mzone.point, mzone.radius * 1.25, mzone.radius * 1.05)
			end

			
					if mist.isTerrainValid(mudPsn, {'LAND'}) == true and mist.terrainHeightDiff(mudPsn, 80) < 25 then				
					break

					end
		end
		

		
		local buildPsn = mist.utils.makeVec3(mudPsn)		
			
			local randomobjects = 0
			local randomobjects = mist.random(1,8)
			
	if randomobjects == 1 then
			local vars = 
			{
			 type = "Tech combine",
			 country = 'GEORGIA',
			 category = "Fortifications", 
			 x = buildPsn.x,
			 y = buildPsn.z + math.random(200,300),
			 --name = "Strike1", 
			 groupName = "Strike1",
			 heading = 0.47123889803847
			}
			mist.dynAddStatic(vars)
			local vars2 = 
			{
			 type = "Workshop A",
			 country = 'GEORGIA',
			 category = "Fortifications", 
			 x = buildPsn.x,
			 y = buildPsn.z + math.random(300, 600),
			 --name = "Strike2", 
			 groupName = "Strike2",
			 heading = 0.47123889803847
			}
			mist.dynAddStatic(vars2)
			local vars3 = 
			{
			 type = "Repair workshop",
			 country = 'GEORGIA',
			 category = "Fortifications", 
			 x = buildPsn.x + math.random(300, 590),
			 y = buildPsn.z + math.random(300,600),
			 --name = "Strike3", 
			 groupName = "Strike3",
			 heading = 0.47123889803847
			}
			mist.dynAddStatic(vars3)
			
			
			elseif randomobjects == 2 then
						local vars = 
			{
			 type = "Supermarket A",
			 country = 'GEORGIA',
			 category = "Fortifications", 
			 x = buildPsn.x,
			 y = buildPsn.z + math.random(200,300),
			 --name = "Strike1", 
			 groupName = "Strike1",
			 heading = 0.47123889803847
			}
			mist.dynAddStatic(vars)
			local vars2 = 
			{
			 type = "Supermarket A",
			 country = 'GEORGIA',
			 category = "Fortifications", 
			 x = buildPsn.x,
			 y = buildPsn.z + math.random(300, 600),
			 --name = "Strike2", 
			 groupName = "Strike2",
			 heading = 0.47123889803847
			}
			mist.dynAddStatic(vars2)
			local vars3 = 
			{
			 type = "Supermarket A",
			 country = 'GEORGIA',
			 category = "Fortifications", 
			 x = buildPsn.x + math.random(300, 590),
			 y = buildPsn.z + math.random(300,600),
			 --name = "Strike3", 
			 groupName = "Strike3",
			 heading = 0.47123889803847
			}
			mist.dynAddStatic(vars3)
			
						elseif randomobjects == 3 then
						local vars = 
			{
			 type = "TV tower",
			 country = 'GEORGIA',
			 category = "Fortifications", 
			 x = buildPsn.x,
			 y = buildPsn.z + math.random(200,300),
			 --name = "Strike1", 
			 groupName = "Strike1",
			 heading = 0.47123889803847
			}
			mist.dynAddStatic(vars)
			local vars2 = 
			{
			 type = "Supermarket A",
			 country = 'GEORGIA',
			 category = "Fortifications", 
			 x = buildPsn.x,
			 y = buildPsn.z + math.random(300, 600),
			 --name = "Strike2", 
			 groupName = "Strike2",
			 heading = 0.47123889803847
			}
			mist.dynAddStatic(vars2)
			local vars3 = 
			{
			 type = "TV tower",
			 country = 'GEORGIA',
			 category = "Fortifications", 
			 x = buildPsn.x + math.random(300, 590),
			 y = buildPsn.z + math.random(300,600),
			 --name = "Strike3", 
			 groupName = "Strike3",
			 heading = 0.47123889803847
			}
			mist.dynAddStatic(vars3)
			
									elseif randomobjects == 4 then
						local vars = 
			{
			 type = "Bunker",
			 country = 'GEORGIA',
			 category = "Fortifications", 
			 x = buildPsn.x,
			 y = buildPsn.z + math.random(200,300),
			 --name = "Strike1", 
			 groupName = "Strike1",
			 heading = 0.47123889803847
			}
			mist.dynAddStatic(vars)
			local vars2 = 
			{
			 type = "Sand Box",
			 country = 'GEORGIA',
			 category = "Fortifications", 
			 x = buildPsn.x,
			 y = buildPsn.z + math.random(300, 600),
			 --name = "Strike2", 
			 groupName = "Strike2",
			 heading = 0.47123889803847
			}
			mist.dynAddStatic(vars2)
			local vars3 = 
			{
			 type = "Military staff",
			 country = 'GEORGIA',
			 category = "Fortifications", 
			 x = buildPsn.x + math.random(300, 590),
			 y = buildPsn.z + math.random(300,600),
			 --name = "Strike3", 
			 groupName = "Strike3",
			 heading = 0.47123889803847
			}
			mist.dynAddStatic(vars3)
			
												elseif randomobjects == 5 then
						local vars = 
			{
			 type = "Bunker",
			 country = 'GEORGIA',
			 category = "Fortifications", 
			 x = buildPsn.x,
			 y = buildPsn.z + math.random(200,300),
			 --name = "Strike1", 
			 groupName = "Strike1",
			 heading = 0.47123889803847
			}
			mist.dynAddStatic(vars)
			local vars2 = 
			{
			 type = "outpost",
			 country = 'GEORGIA',
			 category = "Fortifications", 
			 x = buildPsn.x,
			 y = buildPsn.z + math.random(300, 600),
			 --name = "Strike2", 
			 groupName = "Strike2",
			 heading = 0.47123889803847
			}
			mist.dynAddStatic(vars2)
			local vars3 = 
			{
			 type = "Sandbox",
			 country = 'GEORGIA',
			 category = "Fortifications", 
			 x = buildPsn.x + math.random(300, 590),
			 y = buildPsn.z + math.random(300,600),
			 --name = "Strike3", 
			 groupName = "Strike3",
			 heading = 0.47123889803847
			}
			mist.dynAddStatic(vars3)
			
															elseif randomobjects == 6 then
						local vars = 
			{
			 type = "Bunker",
			 country = 'GEORGIA',
			 category = "Fortifications", 
			 x = buildPsn.x,
			 y = buildPsn.z + math.random(200,300),
			 --name = "Strike1", 
			 groupName = "Strike1",
			 heading = 0.47123889803847
			}
			mist.dynAddStatic(vars)
			local vars2 = 
			{
			 type = "outpost",
			 country = 'GEORGIA',
			 category = "Fortifications", 
			 x = buildPsn.x,
			 y = buildPsn.z + math.random(300, 600),
			 --name = "Strike2", 
			 groupName = "Strike2",
			 heading = 0.47123889803847
			}
			mist.dynAddStatic(vars2)
			local vars3 = 
			{
			 type = "Military staff",
			 country = 'GEORGIA',
			 category = "Fortifications", 
			 x = buildPsn.x + math.random(300, 590),
			 y = buildPsn.z + math.random(300,600),
			 --name = "Strike3", 
			 groupName = "Strike3",
			 heading = 0.47123889803847
			}
			mist.dynAddStatic(vars3)
			
																		elseif randomobjects == 7 then
						local vars = 
			{
			 type = "outpost",
			 country = 'GEORGIA',
			 category = "Fortifications", 
			 x = buildPsn.x,
			 y = buildPsn.z + math.random(200,300),
			 --name = "Strike1", 
			 groupName = "Strike1",
			 heading = 0.47123889803847
			}
			mist.dynAddStatic(vars)
			local vars2 = 
			{
			 type = "Military staff",
			 country = 'GEORGIA',
			 category = "Fortifications", 
			 x = buildPsn.x,
			 y = buildPsn.z + math.random(300, 600),
			 --name = "Strike2", 
			 groupName = "Strike2",
			 heading = 0.47123889803847
			}
			mist.dynAddStatic(vars2)
			local vars3 = 
			{
			 type = "Sandbox",
			 country = 'GEORGIA',
			 category = "Fortifications", 
			 x = buildPsn.x + math.random(300, 590),
			 y = buildPsn.z + math.random(300,600),
			 --name = "Strike3", 
			 groupName = "Strike3",
			 heading = 0.47123889803847
			}
			mist.dynAddStatic(vars3)
			
																					elseif randomobjects == 8 then
						local vars = 
			{
			 type = "TV Tower",
			 country = 'GEORGIA',
			 category = "Fortifications", 
			 x = buildPsn.x,
			 y = buildPsn.z + math.random(200,300),
			 --name = "Strike1", 
			 groupName = "Strike1",
			 heading = 0.47123889803847
			}
			mist.dynAddStatic(vars)
			local vars2 = 
			{
			 type = "TV Tower",
			 country = 'GEORGIA',
			 category = "Fortifications", 
			 x = buildPsn.x,
			 y = buildPsn.z + math.random(300, 600),
			 --name = "Strike2", 
			 groupName = "Strike2",
			 heading = 0.47123889803847
			}
			mist.dynAddStatic(vars2)
			local vars3 = 
			{
			 type = "Military staff",
			 country = 'GEORGIA',
			 category = "Fortifications", 
			 x = buildPsn.x + math.random(300, 590),
			 y = buildPsn.z + math.random(300,600),
			 --name = "Strike3", 
			 groupName = "Strike3",
			 heading = 0.47123889803847
			}
			mist.dynAddStatic(vars3)
			
			end
			
			 --type = "TV tower",			
			 --type = "Supermarket A",			
			 --type = "TV tower",			
			 --type = "Military staff",			
			 --type = "house2arm",			
			 --type = "Tech combine",			
			 --type = "Military staff",			 
			 --type = "Bunker",			 
			 --type = "outpost",
			 --type = "Railway station",
			 --type = "WC",
			 --type = "Sandbox",
			 --type = "house2arm",
			 --type = "Workshop A",
			 

				local msg = {}
	  msg.text = ' Done.'
	  msg.displayTime = 5
	  msg.msgFor = {coa = {'all'}}
	  mist.message.add(msg)

		
		local randomizer_disperse = 0
		local randomizer_radius = 0
		local randomizer_inner_radius = 0
		local randomizer_max_disperse = 0
		randomizer_disperse = 1
		randomizer_max_disperse = mist.random(275,325)
		randomizer_radius = mist.random(550,550)
		randomizer_inner_radius = 500
		
		local mvars = {}
	  mvars.groupName = MudName
	  mvars.action = "respawn"
	  mvars.point = mudPsn
	  mvars.disperse = randomizer_disperse
	  mvars.maxDisp = randomizer_max_disperse
	  mvars.radius = randomizer_radius
		mvars.innerRadius = randomizer_inner_radius
		MudNamed = mist.teleportToPoint(mvars)
		
		formisttable2 = '[g]' .. MudNamed	
		targets2 = mist.makeUnitTable({formisttable2})
		
		AddOP(MudNamed) -- add MBOT to it
		
		
		
				local mvars = {}
	  mvars.groupName = SamName1
	  mvars.action = "respawn"
	  mvars.point = mudPsn
	  mvars.disperse = randomizer_disperse 
	  mvars.maxDisp = randomizer_max_disperse
	  mvars.radius = randomizer_radius
		mvars.innerRadius = randomizer_inner_radius
		SamName1 = mist.teleportToPoint(mvars)
		
				local infvars = {}
		infvars.groupName = InfName1
	  infvars.action = "respawn"
	  infvars.point = mudPsn
	  infvars.disperse = randomizer_disperse
	  infvars.maxDisp = 225
	  infvars.radius = randomizer_radius
		infvars.innerRadius = randomizer_inner_radius
		InfName1d = mist.teleportToPoint(infvars)

		
		local infvars = {}
		infvars.groupName = InfName2
	  infvars.action = "respawn"
	  infvars.point = mudPsn
	  infvars.disperse = randomizer_disperse
	  infvars.maxDisp = 225
	  infvars.radius = randomizer_radius
		infvars.innerRadius = randomizer_inner_radius
		InfName2d = mist.teleportToPoint(infvars)
		
		local infvars = {}
		infvars.groupName = InfName3
	  infvars.action = "respawn"
	  infvars.point = mudPsn
	  infvars.disperse = randomizer_disperse
	  infvars.maxDisp = 225
	  infvars.radius = randomizer_radius
		infvars.innerRadius = randomizer_inner_radius
		InfName3d = mist.teleportToPoint(infvars)
		
		
	local infvars = {}
		infvars.groupName = InfName4
	  infvars.action = "respawn"
	  infvars.point = mudPsn
	  infvars.disperse = randomizer_disperse
	  infvars.maxDisp = 225
	  infvars.radius = randomizer_radius
		infvars.innerRadius = randomizer_inner_radius
		InfName4d = mist.teleportToPoint(infvars)
		
		local infvars = {}
		infvars.groupName = InfName5
	  infvars.action = "respawn"
	  infvars.point = mudPsn
	  infvars.disperse = randomizer_disperse
	  infvars.maxDisp = 225
	  infvars.radius = randomizer_radius
		infvars.innerRadius = randomizer_inner_radius
		InfName5d = mist.teleportToPoint(infvars)		 
		
							local msg = {}
	  msg.text = ' Post Inf.'
	  msg.displayTime = 5
	  msg.msgFor = {coa = {'all'}}
	  mist.message.add(msg)
			
		--mist.spawnRandomizedGroup(MudName)
		--mist.spawnRandomizedGroup(MudName)
		--mist.spawnRandomizedGroup(InfName1)
		--mist.spawnRandomizedGroup(InfName2)
		--mist.spawnRandomizedGroup(InfName3)
		--mist.spawnRandomizedGroup(InfName4)
		--mist.spawnRandomizedGroup(InfName5)
		
		
		local msg = {}
	  msg.text = ' Pre-Tele.'
	  msg.displayTime = 5
	  msg.msgFor = {coa = {'all'}}
	  mist.message.add(msg)
		
		
		local mvars = {}
	  mvars.groupName = MudName
	  mvars.action = "teleport"
	  mvars.point = mudPsn
		mvars.disperse = randomizer_disperse
	  mvars.maxDisp = randomizer_max_disperse
	  mvars.radius = randomizer_radius
		mvars.innerRadius = randomizer_inner_radius
		MudName5d = mist.teleportToPoint(mvars)
	
		
		local mvars = {}
	  mvars.groupName = SamName1
	  mvars.action = "teleport"
	  mvars.point = mudPsn
	  mvars.disperse = randomizer_disperse
	  mvars.maxDisp = randomizer_max_disperse
	  mvars.radius = randomizer_radius
		mvars.innerRadius = randomizer_inner_radius
		SamName1d = mist.teleportToPoint(mvars)
		
		local infvars = {}
		infvars.groupName = InfName1
	  infvars.action = "teleport"
	  infvars.point = mudPsn
	  mvars.disperse = randomizer_disperse
	  mvars.maxDisp = 100
	  mvars.radius = randomizer_radius
		mvars.innerRadius = randomizer_inner_radius
		InfName1d = mist.teleportToPoint(infvars)

		
		local infvars = {}
		infvars.groupName = InfName2
	  infvars.action = "teleport"
	  infvars.point = mudPsn
	  mvars.disperse = randomizer_disperse
	  mvars.maxDisp = 100
	  mvars.radius = randomizer_radius
		mvars.innerRadius = randomizer_inner_radius
		InfName2d = mist.teleportToPoint(infvars)
		
		local infvars = {}
		infvars.groupName = InfName3
	  infvars.action = "teleport"
	  infvars.point = mudPsn
	  mvars.disperse = randomizer_disperse
	  mvars.maxDisp = 100
	  mvars.radius = randomizer_radius
		mvars.innerRadius = randomizer_inner_radius
		InfName3d = mist.teleportToPoint(infvars)
		 
		local infvars = {}
		infvars.groupName = InfName4
	  infvars.action = "teleport"
	  infvars.point = mudPsn
	  mvars.disperse = randomizer_disperse
	  mvars.maxDisp = 100
	  mvars.radius = randomizer_radius
		mvars.innerRadius = randomizer_inner_radius
		InfName4d = mist.teleportToPoint(infvars)
		
		local infvars = {}
		infvars.groupName = InfName5
	  infvars.action = "teleport"
	  infvars.point = mudPsn
	  infvars.disperse = randomizer_disperse
	  infvars.maxDisp = 100
	  infvars.radius = randomizer_radius
		infvars.innerRadius = randomizer_inner_radius
		InfName5d = mist.teleportToPoint(infvars)		 
		
 
	--

	 
	 
		mist.removeFunction(InfFunc1d)
		mist.removeFunction(InfFunc2d)
		mist.removeFunction(InfFunc3d)
		mist.removeFunction(InfFunc4d)
		mist.removeFunction(InfFunc5d)
		
		
		InfFunc1d = nil
		local randomizer_time = 0
		randomizer_time = mist.random(45,90)
		InfFunc1d = mist.scheduleFunction(Move_Infantry, {InfName1d}, randomizer_time, randomizer_time)
		  
		InfFunc2d = nil
		local randomizer_time = 0
		randomizer_time = mist.random(45,90)
		InfFunc2d = mist.scheduleFunction(Move_Infantry, {InfName2d}, randomizer_time, randomizer_time)
	
		InfFunc3d = nil
		local randomizer_time = 0
		randomizer_time = mist.random(45,90)
		InfFunc3d = mist.scheduleFunction(Move_Infantry, {InfName3d}, randomizer_time, randomizer_time)
		
		InfFunc4d = nil
		local randomizer_time = 0
		randomizer_time = mist.random(45,90)
		InfFunc4d = mist.scheduleFunction(Move_Infantry, {InfName4d}, randomizer_time, randomizer_time)
	
		InfFunc5d = nil
		local randomizer_time = 0
		randomizer_time = mist.random(45,90)
		InfFunc5d = mist.scheduleFunction(Move_Infantry, {InfName5d}, randomizer_time, randomizer_time)
	
		
					local msg = {}
	  msg.text = ' Strike task has been created '
	  msg.displayTime = 20
	  msg.msgFor = {coa = {'all'}}
	  mist.message.add(msg)
		trigger.action.outSoundForCoalition(coalition.side.RED, 'bombing3.ogg')
		
			 local Strike_Area = {}
   Strike_Area.x = mudPsn.x
	 Strike_Area.y = mudPsn.y
	 Strike_Area.z = mudPsn.z
   radius = 1000
	
	mist.flagFunc.mapobjs_dead_zones { zones = Strike_Area, flag = 601, req_num = 3, stopFlag = 602}
		
end
---

------------------------------------------------------------------------------------------------------------------------------------------------------------------
	function Create_Naval(_mArea)
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	local mzone = trigger.misc.getZone(_mArea)
	local mrand = mist.random(1,Ship_Names)
	--local srand = mist.random(1,Sam_Launchers)
	navaltask = 1

	--trigger.action.deactivateGroup(Group.getByName(BoatName))
	local ShipName = {}
	local ShipNamed = {}
	local BoatName1 = {}
	local BoatName2 = {}
	local BoatName3 = {}
	local BoatName4 = {}
	local BoatName5 = {}
	local BoatName1d = {}
	local BoatName2d = {}
	local BoatName3d = {}
	local BoatName4d = {}
	local BoatName5d = {}
	--local SamName1 = {}
	--local SamName1d = {}
			local randomizer_disperse = 0
		local randomizer_radius = 0
		local randomizer_inner_radius = 0
		local randomizer_max_disperse = 0
		randomizer_disperse = 1
		randomizer_max_disperse = mist.random(3000,3000)
		randomizer_radius = mist.random(3000,3000)
		randomizer_inner_radius = mist.random(2000,2500)

	--if MudName ==  then
		local msg = {}
	  msg.text = ' Creating Naval Mission.'
	  msg.displayTime = 5
	  msg.msgFor = {coa = {'all'}}
	  mist.message.add(msg)

	trigger.action.outSoundForCoalition(coalition.side.RED, 'groundtask.ogg')

	if Difficultymod == 1 then
	 ShipName = Ship_VeryEasy[mrand]
		--SamName = ''
		BoatName1 = Boat_VeryEasy[1]
		BoatName2 = Boat_VeryEasy[2]
		BoatName3 = Boat_VeryEasy[3]
		BoatName4 = Boat_VeryEasy[4]
		BoatName5 = Boat_VeryEasy[5]
	end

	if Difficultymod == 2 then
	  ShipName = Ship_Easy[mrand]
		--SamName = ''
		BoatName1 = Boat_Easy[1]
		BoatName2 = Boat_Easy[2]
		BoatName3 = Boat_Easy[3]
		BoatName4 = Boat_Easy[4]
		BoatName5 = Boat_Easy[5]
	end

	if Difficultymod == 3 then
	  ShipName = Ship_Normal[mrand]
		--SamName = ''
		BoatName1 = Boat_Normal[1]
		BoatName2 = Boat_Normal[2]
		BoatName3 = Boat_Normal[3]
		BoatName4 = Boat_Normal[4]
		BoatName5 = Boat_Normal[5]
	end

	if Difficultymod == 4 then
	  ShipName = Ship_Hard[mrand]
		--SamName = ''
		BoatName1 = Boat_Hard[1]
		BoatName2 = Boat_Hard[2]
		BoatName3 = Boat_Hard[3]
		BoatName4 = Boat_Hard[4]
		BoatName5 = Boat_Hard[5]
	end
	
	if Difficultymod == 5 then
	  ShipName = Ship_VeryHard[mrand]
		--SamName = ''
		BoatName1 = Boat_VeryHard[1]
		BoatName2 = Boat_VeryHard[2]
		BoatName3 = Boat_VeryHard[3]
		BoatName4 = Boat_VeryHard[4]
		BoatName5 = Boat_VeryHard[5]
	end
	
		
	

		--trigger.action.activateGroup(Group.getByName(ShipName))
		--trigger.action.activateGroup(Group.getByName(SamName1))
		--trigger.action.activateGroup(Group.getByName(InfName1))
		--trigger.action.activateGroup(Group.getByName(InfName2))
		--trigger.action.activateGroup(Group.getByName(InfName3))
		--trigger.action.activateGroup(Group.getByName(InfName4))
		--trigger.action.activateGroup(Group.getByName(InfName5))
		--local MudGrpData = mist.getGroupData(ShipName)
			

			
		  for i = 1, 500 do
	    
			if Task_Range == 1 then
	      mudPsn = mist.getRandPointInCircle(mzone.point, mzone.radius * 0.25, mzone.radius * 0.10)
	    elseif Task_Range == 2 then
	      mudPsn = mist.getRandPointInCircle(mzone.point, mzone.radius * 0.40, mzone.radius * 0.25)
	    elseif Task_Range == 3 then
	      mudPsn = mist.getRandPointInCircle(mzone.point, mzone.radius * 0.65, mzone.radius * 0.40)
	    elseif Task_Range == 4 then
	      mudPsn = mist.getRandPointInCircle(mzone.point, mzone.radius * 0.85, mzone.radius * 0.65)		
			elseif Task_Range == 5 then
	      mudPsn = mist.getRandPointInCircle(mzone.point, mzone.radius * 1.00, mzone.radius * 0.85)	
			elseif Task_Range == 6 then
	      mudPsn = mist.getRandPointInCircle(mzone.point, mzone.radius * 1.25, mzone.radius * 1.05)
			end

			
			
				--	if mist.isTerrainValid(mudPsn, {'WATER'}) == true and
					if mist.isTerrainValid(mudPsn, {'WATER'}) == true and mist.terrainHeightDiff(mudPsn, 100) < 2 then
					break
					end
		end
		

		
		local buildPsn = mist.utils.makeVec3(mudPsn)		
			
			--local randomobjects = 0
			--local randomobjects = mist.random(1,9)
			
			local vars = 
			{
			 type = "Oil platform",
			 country = 'GEORGIA',
			 category = "Fortifications", 
			 x = buildPsn.x,
			 y = buildPsn.z + math.random(1575, 1575),
			 --name = "Strike1", 
			 groupName = "Strike1",
			 heading = 0.47123889803847
			}
			mist.dynAddStatic(vars)
			local vars2 = 
			{
			 type = "Oil platform",
			 country = 'GEORGIA',
			 category = "Fortifications", 
			 x = buildPsn.x,
			 y = buildPsn.z + math.random(2575, 3575),
			 --name = "Strike2", 
			 groupName = "Strike2",
			 heading = 0.47123889803847
			}
			mist.dynAddStatic(vars2)
			local vars3 = 
			{
			 type = "Oil platform",
			 country = 'GEORGIA',
			 category = "Fortifications", 
			 x = buildPsn.x + math.random(1025, 2025),
			 y = buildPsn.z + math.random(1025, 2025),
			 --name = "Strike3", 
			 groupName = "Strike3",
			 heading = 0.47123889803847
			}
			mist.dynAddStatic(vars3)


				local msg = {}
	  msg.text = ' Platforms placed.'
	  msg.displayTime = 5
	  msg.msgFor = {coa = {'all'}}
	  mist.message.add(msg)

		
		local navalvars = {}
	  navalvars.groupName = ShipName
	  navalvars.action = "respawn"
	  navalvars.point = mudPsn
	  navalvars.disperse = randomizer_disperse
	  navalvars.maxDisp = randomizer_max_disperse
	  navalvars.radius = randomizer_radius
		navalvars.innerRadius = randomizer_inner_radius
		ShipNamed = mist.teleportToPoint(navalvars)
		
		formisttable5 = '[g]' .. ShipNamed
		targets5 = mist.makeUnitTable({formisttable5})
		
		AddOP(ShipNamed) -- add MBOT to it
		
		local msg = {}
	  msg.text = ' Post Mbot.'
	  msg.displayTime = 5
	  msg.msgFor = {coa = {'all'}}
	  mist.message.add(msg)
		

		
				local navalvars = {}
		navalvars.groupName = BoatName1
	  navalvars.action = "respawn"
	  navalvars.point = mudPsn
	  navalvars.disperse = randomizer_disperse
	  navalvars.maxDisp = 25
	  navalvars.radius = randomizer_radius
		navalvars.innerRadius = randomizer_inner_radius
		BoatName1d = mist.teleportToPoint(navalvars)

		
		local navalvars = {}
		navalvars.groupName = BoatName2
	  navalvars.action = "respawn"
	  navalvars.point = mudPsn
		navalvars.disperse = true
	  navalvars.disperse = randomizer_disperse
	  navalvars.maxDisp = 25
	  navalvars.radius = randomizer_radius
		navalvars.innerRadius = randomizer_inner_radius
		BoatName2d = mist.teleportToPoint(navalvars)
		
		local navalvars = {}
		navalvars.groupName = BoatName3
	  navalvars.action = "respawn"
	  navalvars.point = mudPsn
	  navalvars.disperse = randomizer_disperse
	  navalvars.maxDisp = 25
	  navalvars.radius = randomizer_radius
		navalvars.innerRadius = randomizer_inner_radius
		BoatName3d = mist.teleportToPoint(navalvars)
		
		
	local navalvars = {}
		navalvars.groupName = BoatName4
	  navalvars.action = "respawn"
	  navalvars.point = mudPsn
	  navalvars.disperse = randomizer_disperse
	  navalvars.maxDisp = 25
	  navalvars.radius = randomizer_radius
		navalvars.innerRadius = randomizer_inner_radius
		BoatName4d = mist.teleportToPoint(navalvars)
		
		local navalvars = {}
		navalvars.groupName = BoatName5
	  navalvars.action = "respawn"
	  navalvars.point = mudPsn
	  navalvars.disperse = randomizer_disperse
	  navalvars.maxDisp = 25
	  navalvars.radius = randomizer_radius
		navalvars.innerRadius = randomizer_inner_radius
		BoatName5d = mist.teleportToPoint(navalvars)		 
		
							local msg = {}
	  msg.text = ' Post Boats.'
	  msg.displayTime = 5
	  msg.msgFor = {coa = {'all'}}
	  mist.message.add(msg)
			
		--mist.spawnRandomizedGroup(ShipName)
		--mist.spawnRandomizedGroup(ShipName)
		--mist.spawnRandomizedGroup(BoatName1)
		--mist.spawnRandomizedGroup(BoatName2)
		--mist.spawnRandomizedGroup(BoatName3)
		--mist.spawnRandomizedGroup(BoatName4)
		--mist.spawnRandomizedGroup(BoatName5)		
		
		local navalvars = {}
	  navalvars.groupName = ShipName
	  navalvars.action = "teleport"
	  navalvars.point = mudPsn
		ShipNamed = mist.teleportToPoint(navalvars)
		
		local navalvars = {}
		navalvars.groupName = BoatName1
	  navalvars.action = "teleport"
	  navalvars.point = mudPsn
	  navalvars.disperse = randomizer_disperse
	  navalvars.maxDisp = 25
	  navalvars.radius = randomizer_radius
		navalvars.innerRadius = randomizer_inner_radius
		BoatName1d = mist.teleportToPoint(navalvars)

		
		local navalvars = {}
		navalvars.groupName = BoatName2
	  navalvars.action = "teleport"
	  navalvars.point = mudPsn
	  navalvars.disperse = randomizer_disperse
	  navalvars.maxDisp = 25
	  navalvars.radius = randomizer_radius - 1000
		navalvars.innerRadius = randomizer_inner_radius - 1000
		BoatName2d = mist.teleportToPoint(navalvars)
		
		local navalvars = {}
		navalvars.groupName = BoatName3
	  navalvars.action = "teleport"
	  navalvars.point = mudPsn
	  navalvars.disperse = randomizer_disperse
	  navalvars.maxDisp = 25
	  navalvars.radius = randomizer_radius - 1000
		navalvars.innerRadius = randomizer_inner_radius - 1000
		BoatName3d = mist.teleportToPoint(navalvars)
		 
		local navalvars = {}
		navalvars.groupName = BoatName4
	  navalvars.action = "teleport"
	  navalvars.point = mudPsn
	  navalvars.disperse = randomizer_disperse
	  navalvars.maxDisp = 25
	  navalvars.radius = randomizer_radius - 1000
		navalvars.innerRadius = randomizer_inner_radius - 1000
		BoatName4d = mist.teleportToPoint(navalvars)
		
		local navalvars = {}
		navalvars.groupName = BoatName5
	  navalvars.action = "teleport"
	  navalvars.point = mudPsn
	  navalvars.disperse = randomizer_disperse
	  navalvars.maxDisp = 25
	  navalvars.radius = randomizer_radius - 1000
		navalvars.innerRadius = randomizer_inner_radius - 1000
		BoatName5d = mist.teleportToPoint(navalvars)		 
		
 
	--

	 
	 
		mist.removeFunction(ShipFunc1d)
		mist.removeFunction(BoatFunc1d)
		mist.removeFunction(BoatFunc2d)
		mist.removeFunction(BoatFunc3d)
		mist.removeFunction(BoatFunc4d)
		mist.removeFunction(BoatFunc5d)
		
		
		BoatFunc1d = nil
		local randomizer_time = 0
		randomizer_time = mist.random(45,90)
		BoatFunc1d = mist.scheduleFunction(Move_Boats, {BoatName1d}, randomizer_time, randomizer_time)
		  
		BoatFunc2d = nil
		local randomizer_time = 0
		randomizer_time = mist.random(45,90)
		BoatFunc2d = mist.scheduleFunction(Move_Boats, {BoatName2d}, randomizer_time, randomizer_time)
	
		BoatFunc3d = nil
		local randomizer_time = 0
		randomizer_time = mist.random(45,90)
		BoatFunc3d = mist.scheduleFunction(Move_Boats, {BoatName3d}, randomizer_time, randomizer_time)
		
		BoatFunc4d = nil
		local randomizer_time = 0
		randomizer_time = mist.random(45,90)
		BoatFunc4d = mist.scheduleFunction(Move_Boats, {BoatName4d}, randomizer_time, randomizer_time)
	
		BoatFunc5d = nil
		local randomizer_time = 0
		randomizer_time = mist.random(45,90)
		BoatFunc5d = mist.scheduleFunction(Move_Boats, {BoatName5d}, randomizer_time, randomizer_time)
		
		ShipFunc1d = nil
		local randomizer_time = 0
		randomizer_time = mist.random(45,690)
		ShipFunc1d = mist.scheduleFunction(Move_Ships, {ShipNamed}, randomizer_time, randomizer_time)
	
		
					local msg = {}
	  msg.text = ' Naval task has been created '
	  msg.displayTime = 20
	  msg.msgFor = {coa = {'all'}}
	  mist.message.add(msg)
		trigger.action.outSoundForCoalition(coalition.side.RED, 'bombing3.ogg')
		
			 local Strike_Area2 = {}
   Strike_Area2.x = buildPsn.x
	 Strike_Area2.y = buildPsn.y
	 Strike_Area2.z = buildPsn.z
   radius = 13000
	
	mist.flagFunc.mapobjs_dead_zones { zones = Strike_Area2, flag = 701, req_num = 3, stopFlag = 702}
		
end
---
	
	
	
	

	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	function Create_Mud_Convoy(_mArea)

	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	mzone = trigger.misc.getZone(_mArea)
	local mrand = mist.random(1,Mud_Convoys)
	convoytask = 1
	
	MudName = {}
	ConvoySend = {}

		local msg = {}
	  msg.text = ' Creating Moving Mud.'
	  msg.displayTime = 5
	  msg.msgFor = {coa = {'all'}}
	  mist.message.add(msg)

	trigger.action.outSoundForCoalition(coalition.side.RED, 'groundtask.ogg')

	if Difficultymod == 1 then
	  MudName = Mud_Convoy_VeryEasy[mrand]
		end
	
	if Difficultymod == 2 then
	  MudName = Mud_Convoy_Easy[mrand]
		end

	if Difficultymod == 3 then
	  MudName = Mud_Convoy_Normal[mrand]
		end

	if Difficultymod == 4 then
	  MudName = Mud_Convoy_Hard[mrand]
		end

	if Difficultymod == 5 then
	  MudName = Mud_Convoy_VeryHard[mrand]
		end

		trigger.action.activateGroup(Group.getByName(MudName))
		local MudGrpData = mist.getGroupData(MudName)


		

			
		  for i = 1, 100 do
	    if Task_Range == 1 then
	      mudPsn = mist.getRandPointInCircle(mzone.point, mzone.radius * 0.25, mzone.radius * 0.10)
				
	    elseif Task_Range == 2 then
	      mudPsn = mist.getRandPointInCircle(mzone.point, mzone.radius * 0.40, mzone.radius * 0.25)
				
	    elseif Task_Range == 3 then
	      mudPsn = mist.getRandPointInCircle(mzone.point, mzone.radius * 0.65, mzone.radius * 0.40)
				
	    elseif Task_Range == 4 then
	      mudPsn = mist.getRandPointInCircle(mzone.point, mzone.radius * 0.85, mzone.radius * 0.65)
				
			elseif Task_Range == 5 then
	      mudPsn = mist.getRandPointInCircle(mzone.point, mzone.radius * 1.00, mzone.radius * 0.85)
				
			elseif Task_Range == 6 then
	      mudPsn = mist.getRandPointInCircle(mzone.point, mzone.radius * 1.25, mzone.radius * 1.05)
				
			end
		
					if mist.isTerrainValid(mudPsn, {'LAND'}) == true and mist.terrainHeightDiff(mudPsn, 19) < 2  then				
					break

					end
		end
							
	


		
		--mist.spawnRandomizedGroup(MudName)
	
			local mvars = {}	
		mvars.groupName = MudName
	  mvars.action = "respawn"
	  mvars.point = mudPsn
	  --mvars.disperse = true
	  --mvars.maxDisp = 100
	  --mvars.radius = 20
		MudNameb = mist.teleportToPoint(mvars)
								
								
	local mvars = {}
	  mvars.groupName = MudName
	  mvars.action = "teleport"
	  mvars.point = mudPsn
	  --mvars.disperse = true
	  --mvars.maxDisp = 100
	  --mvars.radius = 20
		MudNameb = mist.teleportToPoint(mvars)
			
		formisttable3 = '[g]' .. MudNameb
		targets3 = mist.makeUnitTable({formisttable3})
		AddOP(MudNameb) -- add MBOT to it

		MoveMud = MudNameb


	 			
		--mist.removeFunction(ConvoyFunc)
		ConvoyFunc = nil
		ConvoyFunc = mist.scheduleFunction(Move_Convoy, {MudNameb}, 5, 300) 
		
		trigger.action.outSoundForCoalition(coalition.side.RED, 'bombing.ogg')
		--Make_Smoke(mudPsn, nil)
		--return
		
					local checkunits3 = {
	  groupName = MudNameb,
	  percent = 33,
		flag = 301,
		stopFlag = 302,
		 toggle = true,
	 }
	 mist.flagFunc.group_alive_less_than(checkunits3)
		
		local msg = {}
	  msg.text = ' Convoy has been created.'
	  msg.displayTime = 5
	  msg.msgFor = {coa = {'all'}}
	  mist.message.add(msg)

	end

	---

	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	function Create_Airfield(_afArea)

	------------------------------------------------------------------------------------------------------------------------------------------------------------------

	mzone = trigger.misc.getZone(_afArea)
	airfield = 1

	--trigger.action.deactivateGroup(Group.getByName(InfName))
	AFName1 = 'Infantry (Airdrome) #000'
	AFName2 = 'Infantry (Airdrome) #001'
	AFName3 = 'Infantry (Airdrome) #002'
	AFName4 = 'Infantry (Airdrome) #003'
	DefensesNames = ""
	airdromePsn = {}

	--if MudName ==  then
		local msg = {}
	  msg.text = ' Creating Airfield Defenses at ' ..tostring(_afArea)
	  msg.displayTime = 5
	  msg.msgFor = {coa = {'all'}}
	  mist.message.add(msg)

	trigger.action.outSoundForCoalition(coalition.side.RED, 'groundtask.ogg')

	if _afArea == 'Sochi' then
		if Difficultymod == 1 then
			DefensesName = Sochi_Names_Easy[1]
			airdromePsn = mist.getRandPointInCircle(mzone.point, mzone.radius * 0.60, mzone.radius * 0.45)
			airdromePsn2 = mist.getRandPointInCircle(mzone.point, mzone.radius * 0.60, mzone.radius * 0.45)
			airdromePsn3 = mist.getRandPointInCircle(mzone.point, mzone.radius * 0.40, mzone.radius * 0.25)
			airdromePsn4 = mist.getRandPointInCircle(mzone.point, mzone.radius * 0.40, mzone.radius * 0.25)
		end
	
		if Difficultymod == 2 then
			DefensesName = Sochi_Names_Easy[1]
			airdromePsn = mist.getRandPointInCircle(mzone.point, mzone.radius * 0.60, mzone.radius * 0.45)
			airdromePsn2 = mist.getRandPointInCircle(mzone.point, mzone.radius * 0.60, mzone.radius * 0.45)
			airdromePsn3 = mist.getRandPointInCircle(mzone.point, mzone.radius * 0.40, mzone.radius * 0.25)
			airdromePsn4 = mist.getRandPointInCircle(mzone.point, mzone.radius * 0.40, mzone.radius * 0.25)
		end

		if Difficultymod == 3 then
			DefensesName = Sochi_Names_Normal[1]
			airdromePsn = mist.getRandPointInCircle(mzone.point, mzone.radius * 0.60, mzone.radius * 0.45)
			airdromePsn2 = mist.getRandPointInCircle(mzone.point, mzone.radius * 0.60, mzone.radius * 0.45)
			airdromePsn3 = mist.getRandPointInCircle(mzone.point, mzone.radius * 0.40, mzone.radius * 0.25)
			airdromePsn4 = mist.getRandPointInCircle(mzone.point, mzone.radius * 0.40, mzone.radius * 0.25)
		end
		
			if Difficultymod == 4 then
			DefensesName = Sochi_Names_Hard[1]
			airdromePsn = mist.getRandPointInCircle(mzone.point, mzone.radius * 0.60, mzone.radius * 0.45)
			airdromePsn2 = mist.getRandPointInCircle(mzone.point, mzone.radius * 0.60, mzone.radius * 0.45)
			airdromePsn3 = mist.getRandPointInCircle(mzone.point, mzone.radius * 0.40, mzone.radius * 0.25)
			airdromePsn4 = mist.getRandPointInCircle(mzone.point, mzone.radius * 0.40, mzone.radius * 0.25)
		end

		if Difficultymod == 5 then
			DefensesName = Sochi_Names_VeryHard[1]
			airdromePsn = mist.getRandPointInCircle(mzone.point, mzone.radius * 0.60, mzone.radius * 0.45)
			airdromePsn2 = mist.getRandPointInCircle(mzone.point, mzone.radius * 0.60, mzone.radius * 0.45)
			airdromePsn4 = mist.getRandPointInCircle(mzone.point, mzone.radius * 0.40, mzone.radius * 0.25)
			airdromePsn3 = mist.getRandPointInCircle(mzone.point, mzone.radius * 0.40, mzone.radius * 0.25)
		end

		else

		local msg = {}
			msg.text = ' Bad Airfield Name'
			msg.displayTime = 5
			msg.msgFor = {coa = {'all'}}
			mist.message.add(msg)
			return

		end


				trigger.action.activateGroup(Group.getByName(DefensesName))
			

		formisttable4 = '[g]' .. MudNameb
		targets4 = mist.makeUnitTable({formisttable4})
		
		AddOP(MudNameb) -- add MBOT to it


		mist.respawnGroup(DefensesName)
		mist.spawnRandomizedGroup(DefensesName)

			local infvars = {}
		infvars.groupName = AFName1
	  infvars.action = "respawn"
	  infvars.point = airdromePsn
	  --infvars.disperse = true
	  --infvars.maxDisp = 10
	  --infvars.radius = 20
		mist.teleportToPoint(infvars)
			local infvars = {}
		infvars.groupName = AFName2
	  infvars.action = "respawn"
	  infvars.point = airdromePsn2
	  --infvars.disperse = true
	  --infvars.maxDisp = 10
	  --infvars.radius = 20
		mist.teleportToPoint(infvars)
			local infvars = {}

		infvars.groupName = AFName3
	  infvars.action = "respawn"
	  infvars.point = airdromePsn3
	  --infvars.disperse = true
	  --infvars.maxDisp = 10
	  --infvars.radius = 20
		mist.teleportToPoint(infvars)
			local infvars = {}
		infvars.groupName = AFName4
	  infvars.action = "respawn"
	  infvars.point = airdromePsn4
	  --infvars.disperse = true
	  --infvars.maxDisp = 10
	  --infvars.radius = 20
		mist.teleportToPoint(infvars)
			local msg = {}

	  msg.text = ' Created airfield task'
	  msg.displayTime = 20
	  msg.msgFor = {coa = {'all'}}
	  mist.message.add(msg)
			trigger.action.outSoundForCoalition(coalition.side.RED, 'bombing.ogg')
		 local checkunits1 = {
	  groupName = DefensesName,
	  percent = 33,
		flag = 101,
		stopFlag = 102,
		 toggle = true,
	 }
	 mist.flagFunc.group_alive_less_than(checkunits1)
	 
	 mist.removeFunction(AFFunc1)
	 mist.removeFunction(AFFunc2)
	 mist.removeFunction(AFFunc3)
	 mist.removeFunction(AFFunc4)
	 
	 local randomizer_time = 0
	 randomizer_time = mist.random(45,90)
	 
		AFFunc1 = nil
		AFFunc1 = mist.scheduleFunction(Move_Infantry, {AFName1}, randomizer_time, randomizer_time) 
		
		AFFunc2 = nil
		AFFunc2 = mist.scheduleFunction(Move_Infantry, {AFName2}, randomizer_time, randomizer_time) 
		
		AFFunc3 = nil
		AFFunc3 = mist.scheduleFunction(Move_Infantry, {AFName3}, randomizer_time, randomizer_time) 
		
		AFFunc4 = nil
		AFFunc4 = mist.scheduleFunction(Move_Infantry, {AFName4}, randomizer_time, randomizer_time) 
	   
	  

	end

	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	function Move_Convoy(_Mud)
	------------------------------------------------------------------------------------------------------------------------------------------------------------------	
	local MoveConvoy = {}

	local randomizer_speed = 0
	local randomizer_dir = 0
	local randomizer_dist = 0
	MoveConvoy = _Mud
	randomizer_speed = math.random(25,44)
	randomizer_dir = math.random(1,359)
	randomizer_dist = math.random(2000, 2500)
			local formationrand = mist.random(1,6)
		if formationrand == 1 then
		mist.groupRandomDistSelfSafe(MoveConvoy, randomizer_dist, 'Off Road', randomizer_dir, randomizer_speed)
			elseif formationrand == 2 then
		mist.groupRandomDistSelfSafe(MoveConvoy, randomizer_dist, 'Cone', randomizer_dir, randomizer_speed)
			elseif formationrand == 3 then
		mist.groupRandomDistSelfSafe(MoveConvoy, randomizer_dist, 'Rank', randomizer_dir, randomizer_speed)
			elseif formationrand == 4 then
		mist.groupRandomDistSelfSafe(MoveConvoy, randomizer_dist, 'Diamond', randomizer_dir, randomizer_speed)
			elseif formationrand == 5 then
		mist.groupRandomDistSelfSafe(MoveConvoy, randomizer_dist, 'EchelonL', randomizer_dir, randomizer_speed)
			elseif formationrand == 6 then
		mist.groupRandomDistSelfSafe(MoveConvoy, randomizer_dist, 'EchelonR', randomizer_dir, randomizer_speed)

		end

	--return
	end
	---

	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	function Move_Infantry(_infantry)
	------------------------------------------------------------------------------------------------------------------------------------------------------------------	
		
			
	local randomizer_speed = 0
	local randomizer_dir = 0
	local randomizer_dist = 0
	local Infantry_Name = {}
	Infantry_Name = _infantry
	randomizer_speed = math.random(1,4)
	randomizer_dir = math.random(1,359)
	randomizer_dist = math.random(25, 200)

			local formationrand = mist.random(1,8)
			
			if formationrand == 1 then
		mist.groupRandomDistSelf(Infantry_Name, randomizer_dist, 'Rank', randomizer_dir, randomizer_speed)
		
			elseif formationrand == 3 then
		mist.groupRandomDistSelf(Infantry_Name, randomizer_dist, 'EchelonL', randomizer_dir, randomizer_speed)

		elseif formationrand == 4 then
		mist.groupRandomDistSelf(Infantry_Name, randomizer_dist, 'EchelonR', randomizer_dir, randomizer_speed)

		end

	--return
	end

	---

	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	function Move_Ships(_Boats)
	------------------------------------------------------------------------------------------------------------------------------------------------------------------	
		
			
	local randomizer_speed = 0
	local randomizer_dir = 0
	local randomizer_dist = 0
	local Infantry_Name = {}
	Boat_Name = _Boats
	randomizer_speed = math.random(7,14)
	randomizer_dir = math.random(90,270)
	randomizer_dist = math.random(1500, 2000)

			local formationrand = mist.random(1,1)
			
			if formationrand == 1 then
		mist.groupRandomDistSelf(Boat_Name, randomizer_dist, 'Off Road', randomizer_dir, randomizer_speed)
		end

	--return
	end

	---
	
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	function Move_Boats(_Boats)
	------------------------------------------------------------------------------------------------------------------------------------------------------------------	
		
			
	local randomizer_speed = 0
	local randomizer_dir = 0
	local randomizer_dist = 0
	local Infantry_Name = {}
	Boat_Name = _Boats
	randomizer_speed = math.random(44,50)
	randomizer_dir = math.random(1,359)
	randomizer_dist = math.random(1000, 4000)

			local formationrand = mist.random(1,4)
			
			if formationrand == 1 then
		mist.groupRandomDistSelf(Boat_Name, randomizer_dist, 'Rank', randomizer_dir, randomizer_speed)
		
			elseif formationrand == 3 then
		mist.groupRandomDistSelf(Boat_Name, randomizer_dist, 'EchelonL', randomizer_dir, randomizer_speed)

		elseif formationrand == 4 then
		mist.groupRandomDistSelf(Boat_Name, randomizer_dist, 'EchelonR', randomizer_dir, randomizer_speed)

		end

	--return
	end

	---

	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	function Make_Smoke(_coord)
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
			  local Scoord = {}
				Scoord = mist.utils.zoneToVec3(_coord)
				

	--			local msg = {} 
	--			msg.text = ' Attempted to smoke target area '
	--			msg.displayTime = 5
	--			msg.msgFor = {coa = {'all'}}
	  --  	mist.message.add(msg)

		trigger.action.smoke({x=Scoord.x + math.random(1,200), y= land.getHeight({x = Scoord.x, y = Scoord.z}), z= Scoord.z + math.random(1, 200)}, trigger.smokeColor.Red)
		
	end
	---

	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	function Bullscall1()
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
		trigger.action.outSoundForCoalition(coalition.side.RED, 'datalink.ogg')
	local msg = {}
	  msg.units = targets
	  msg.ref = 'red'
	  msg.displayTime = 90
	  msg.msgFor = {coa = {'red'}}
	  msg.text = ' Bullseye at Maykop, Imperial: '
	  msg.metric = false
	  msg.alt = true
	  mist.msgBullseye(msg)
	  
			local msg = {}
	  msg.units = targets
	  msg.ref = 'red'
	  msg.displayTime = 90
	  msg.msgFor = {coa = {'red'}}
	  msg.text = ' Bullseye at Maykop, Metric: '
	  msg.metric = true
	  msg.alt = true
	    mist.msgBullseye(msg)
			

		local msg = {}	
		msg.units = targets
	  msg.ref = 'blue'
	  msg.displayTime = 90
	  msg.msgFor = {coa = {'red'}}
	  msg.text = ' Bullseye at Khashuri, Imperial: '
	  msg.metric = false
	  msg.alt = true
	  mist.msgBullseye(msg)
	  
			local msg = {}
	  msg.units = targets
	  msg.ref = 'blue'
	  msg.displayTime = 90
	  msg.msgFor = {coa = {'red'}}
	  msg.text = ' Bullseye at Khashuri, Metric: '
	  msg.metric = true
	  msg.alt = true
	    mist.msgBullseye(msg)
			
						local msg = {} 
			msg.units = targets
			msg.acc = 4
			msg.displayTime = 90
			msg.msgFor = {coa = {'red'}} 
			msg.text = ' Grid Reference: '
			mist.msgMGRS(msg)
	  --return

	end
	---
	
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	function Bullscall2()
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
		trigger.action.outSoundForCoalition(coalition.side.RED, 'datalink.ogg')
	local msg = {}
	  msg.units = targets2
	  msg.ref = 'red'
	  msg.displayTime = 90
	  msg.msgFor = {coa = {'red'}}
	  msg.text = ' Bullseye at Maykop, Imperial: '
	  msg.metric = false
	  msg.alt = true
	  mist.msgBullseye(msg)
	  
			local msg = {}
	  msg.units = targets2
	  msg.ref = 'red'
	  msg.displayTime = 90
	  msg.msgFor = {coa = {'red'}}
	  msg.text = ' Bullseye at Maykop, Metric: '
	  msg.metric = true
	  msg.alt = true
	    mist.msgBullseye(msg)
			

		local msg = {}	
		msg.units = targets2
	  msg.ref = 'blue'
	  msg.displayTime = 90
	  msg.msgFor = {coa = {'red'}}
	  msg.text = ' Bullseye at Khashuri, Imperial: '
	  msg.metric = false
	  msg.alt = true
	  mist.msgBullseye(msg)
	  
			local msg = {}
	  msg.units = targets2
	  msg.ref = 'blue'
	  msg.displayTime = 90
	  msg.msgFor = {coa = {'red'}}
	  msg.text = ' Bullseye at Khashuri, Metric: '
	  msg.metric = true
	  msg.alt = true
	    mist.msgBullseye(msg)
	 -- return
	 			local msg = {} 
			msg.units = targets2
			msg.acc = 4
			msg.displayTime = 90
			msg.msgFor = {coa = {'red'}} 
			msg.text = ' Grid Reference: '
			mist.msgMGRS(msg)
	 

	end
	---
	
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	function Bullscall3()
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
		trigger.action.outSoundForCoalition(coalition.side.RED, 'datalink.ogg')
	local msg = {}
	  msg.units = targets3
	  msg.ref = 'red'
	  msg.displayTime = 90
	  msg.msgFor = {coa = {'red'}}
	  msg.text = ' Bullseye at Maykop, Imperial: '
	  msg.metric = false
	  msg.alt = true
	  mist.msgBullseye(msg)
	  
			local msg = {}
	  msg.units = targets3
	  msg.ref = 'red'
	  msg.displayTime = 90
	  msg.msgFor = {coa = {'red'}}
	  msg.text = ' Bullseye at Maykop, Metric: '
	  msg.metric = true
	  msg.alt = true
	    mist.msgBullseye(msg)
			

		local msg = {}	
		msg.units = targets3
	  msg.ref = 'blue'
	  msg.displayTime = 90
	  msg.msgFor = {coa = {'red'}}
	  msg.text = ' Bullseye at Khashuri, Imperial: '
	  msg.metric = false
	  msg.alt = true
	  mist.msgBullseye(msg)
	  
			local msg = {}
	  msg.units = targets3
	  msg.ref = 'blue'
	  msg.displayTime = 90
	  msg.msgFor = {coa = {'red'}}
	  msg.text = ' Bullseye at Khashuri, Metric: '
	  msg.metric = true
	  msg.alt = true
	    mist.msgBullseye(msg)
	 -- return
	 
	 			local msg = {} 
			msg.units = targets3
			msg.acc = 4
			msg.displayTime = 90
			msg.msgFor = {coa = {'red'}} 
			msg.text = ' Grid Reference: '
			mist.msgMGRS(msg)

	end
	---
	
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	function Bullscall4()
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
		trigger.action.outSoundForCoalition(coalition.side.RED, 'datalink.ogg')
	local msg = {}
	  msg.units = targets4
	  msg.ref = 'red'
	  msg.displayTime = 90
	  msg.msgFor = {coa = {'red'}}
	  msg.text = ' Bullseye at Maykop, Imperial: '
	  msg.metric = false
	  msg.alt = true
	  mist.msgBullseye(msg)
	  
			local msg = {}
	  msg.units = targets4
	  msg.ref = 'red'
	  msg.displayTime = 90
	  msg.msgFor = {coa = {'red'}}
	  msg.text = ' Bullseye at Maykop, Metric: '
	  msg.metric = true
	  msg.alt = true
	    mist.msgBullseye(msg)
			

		local msg = {}	
		msg.units = targets4
	  msg.ref = 'blue'
	  msg.displayTime = 90
	  msg.msgFor = {coa = {'red'}}
	  msg.text = ' Bullseye at Khashuri, Imperial: '
	  msg.metric = false
	  msg.alt = true
	  mist.msgBullseye(msg)
	  
			local msg = {}
	  msg.units = targets4
	  msg.ref = 'blue'
	  msg.displayTime = 90
	  msg.msgFor = {coa = {'red'}}
	  msg.text = ' Bullseye at Khashuri, Metric: '
	  msg.metric = true
	  msg.alt = true
	    mist.msgBullseye(msg)
	  --return
					local msg = {} 
			msg.units = targets4
			msg.acc = 4
			msg.displayTime = 90
			msg.msgFor = {coa = {'red'}} 
			msg.text = ' Grid Reference: '
			mist.msgMGRS(msg)

	end
	---
	
		------------------------------------------------------------------------------------------------------------------------------------------------------------------
	function Bullscall5()
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
		trigger.action.outSoundForCoalition(coalition.side.RED, 'datalink.ogg')
	local msg = {}
	  msg.units = targets5
	  msg.ref = 'red'
	  msg.displayTime = 90
	  msg.msgFor = {coa = {'red'}}
	  msg.text = ' Bullseye at Maykop, Imperial: '
	  msg.metric = false
	  msg.alt = true
	  mist.msgBullseye(msg)
	  
			local msg = {}
	  msg.units = targets5
	  msg.ref = 'red'
	  msg.displayTime = 90
	  msg.msgFor = {coa = {'red'}}
	  msg.text = ' Bullseye at Maykop, Metric: '
	  msg.metric = true
	  msg.alt = true
	    mist.msgBullseye(msg)
			

		local msg = {}	
		msg.units = targets5
	  msg.ref = 'blue'
	  msg.displayTime = 90
	  msg.msgFor = {coa = {'red'}}
	  msg.text = ' Bullseye at Khashuri, Imperial: '
	  msg.metric = false
	  msg.alt = true
	  mist.msgBullseye(msg)
	  
			local msg = {}
	  msg.units = targets5
	  msg.ref = 'blue'
	  msg.displayTime = 90
	  msg.msgFor = {coa = {'red'}}
	  msg.text = ' Bullseye at Khashuri, Metric: '
	  msg.metric = true
	  msg.alt = true
	    mist.msgBullseye(msg)
	  --return
					local msg = {} 
			msg.units = targets5
			msg.acc = 2
			msg.displayTime = 90
			msg.msgFor = {coa = {'red'}} 
			msg.text = ' Grid Reference: '
			mist.msgMGRS(msg)

	end
	---
	
	----------------
	-- Wanks Code --
	----------------
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	function Set_Difficuty_VeryEasy()
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	local New_Set = "Very Easy"
	Difficultymod = 1

	trigger.action.outSoundForCoalition(coalition.side.RED, 'setting.ogg')
	  local msg = {} 
	    msg.text = ' Global difficulty has been set to '..tostring(New_Set)
	    msg.displayTime = 20
	    msg.msgFor = {coa = {'all'}}
	      mist.message.add(msg)

	    --return
	end
	------
	
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	function Set_Difficuty_Easy()
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	local New_Set = "Easy"
	Difficultymod = 2

	trigger.action.outSoundForCoalition(coalition.side.RED, 'setting.ogg')
	  local msg = {} 
	    msg.text = ' Global difficulty has been set to '..tostring(New_Set)
	    msg.displayTime = 20
	    msg.msgFor = {coa = {'all'}}
	      mist.message.add(msg)

	    --return
	end
	------

	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	function Set_Difficuty_Normal()

	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	local New_Set = "Normal"
	Difficultymod = 3

	trigger.action.outSoundForCoalition(coalition.side.RED, 'setting.ogg')

	  local msg = {} 
	    msg.text = ' Global difficulty has been set to '..tostring(New_Set)

	    msg.displayTime = 20
	    msg.msgFor = {coa = {'all'}}
	    	mist.message.add(msg)
	    --return

	end
	-------

	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	function Set_Difficuty_Hard()
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	local New_Set = "Hard"
	Difficultymod = 4

	trigger.action.outSoundForCoalition(coalition.side.RED, 'setting.ogg')

	  local msg = {} 
	    msg.text = ' Global difficulty has been set to '..tostring(New_Set)

	    msg.displayTime = 20
	    msg.msgFor = {coa = {'all'}}
	    	mist.message.add(msg)
	    --return

	end

	------

	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	function Set_Difficuty_VeryHard()
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	local New_Set = "Very Hard"
	Difficultymod = 5

	trigger.action.outSoundForCoalition(coalition.side.RED, 'setting.ogg')
	  local msg = {} 
	    msg.text = ' Global difficulty has been set to '..tostring(New_Set)
	    msg.displayTime = 20
	    msg.msgFor = {coa = {'all'}}
	    	mist.message.add(msg)

	    --return
	end
	------

	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	-- This is the Scramble Distance function, it sets the Task_Range variable and displays a messages
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	function Set_Distance_Scramble()

	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	local Range = "Scramble"
	Task_Range = 1

	trigger.action.outSoundForCoalition(coalition.side.RED, 'range.ogg')  

	  local msg = {}
	    msg.text = ' Task spawn start range has been set to '..tostring(Range)

	    msg.displayTime = 20
	    msg.msgFor = {coa = {'all'}}
	      mist.message.add(msg)
	  --return

	end
	-- This is the Close Distance function, it sets the Task_Range variable and displays a messages
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	function Set_Distance_Close()
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	local Range = "Close"
	Task_Range = 2

	trigger.action.outSoundForCoalition(coalition.side.RED, 'range.ogg')  

	  local msg = {}
	    msg.text = ' Task spawn start range has been set to '..tostring(Range)

	    msg.displayTime = 20
	    msg.msgFor = {coa = {'all'}}
	      mist.message.add(msg)
	  --return

	end

	-- This is the Standard Distance function, it sets the Task_Range variable and displays a messages

	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	function Set_Distance_Standard()

	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	local Range = "Standard"
	Task_Range = 3

	trigger.action.outSoundForCoalition(coalition.side.RED, 'range.ogg')  

	  local msg = {}
	    msg.text = ' Task spawn start range has been set to '..tostring(Range)

	    msg.displayTime = 20
	    msg.msgFor = {coa = {'all'}}
	      mist.message.add(msg)
	  --return

	end
	-- This is the Far Distance function, it sets the Task_Range variable and displays a messages
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	function Set_Distance_Far()
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	local Range = "Far"
	Task_Range = 4

	trigger.action.outSoundForCoalition(coalition.side.RED, 'range.ogg')  

	  local msg = {}
	    msg.text = ' Task spawn start range has been set to '..tostring(Range)

	    msg.displayTime = 20
	    msg.msgFor = {coa = {'all'}}
	      mist.message.add(msg)
	  --return

	end

	-- This is the Very Far Distance function, it sets the Task_Range variable and displays a messages
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	function Set_Distance_Veryfar()
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	local Range = "Very Far"
	Task_Range = 5

	trigger.action.outSoundForCoalition(coalition.side.RED, 'range.ogg')  

	  local msg = {}
	    msg.text = ' Task spawn start range has been set to '..tostring(Range)

	    msg.displayTime = 20
	    msg.msgFor = {coa = {'all'}}
	      mist.message.add(msg)
	  --return

	end

	-- This is the Distant Distance function, it sets the Task_Range variable and displays a messages
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	function Set_Distance_Distant()
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	local Range = "Distant"
	Task_Range = 6

	trigger.action.outSoundForCoalition(coalition.side.RED, 'range.ogg')  
	  local msg = {}
	    msg.text = ' Task spawn start range has been set to '..tostring(Range)
	    msg.displayTime = 20
	    msg.msgFor = {coa = {'all'}}
	      mist.message.add(msg)

	 -- return

	end

	-- This is the Random Distance function, it sets the Task_Range variable and displays a messages
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	function Set_Distance_Random()
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	local Range = "Random"
	Task_Range = math.random(1,6)

	trigger.action.outSoundForCoalition(coalition.side.RED, 'range.ogg')  
	  local msg = {}
	    msg.text = ' Task spawn start range has been set to '..tostring(Range)
	    msg.displayTime = 20
	    msg.msgFor = {coa = {'all'}}
	      mist.message.add(msg)
	 -- return

	end
	------

	--------------------
	-- End Wanks Code --
	--------------------

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
	 -- return

	end

	----
	---------------------------------------------------------------------------------------------------------------------------
	function doScriptFile(fN)
	---------------------------------------------------------------------------------------------------------------------------
		local function log(s)
			print(tostring(s))
			trigger.action.outText(tostring(s), 10)

		end

		
		local f, err = loadfile(fN)
		if f then
			local err, errMsg = pcall(f)
			if not err then
				log('LUA ERROR- unable to run ' .. fN .. ', reason: ' .. tostring(errMsg))  --catches runtime errors.

			end

		else
			log('LUA ERROR- unable to load ' .. fN .. ', reason: ' .. tostring(err))  --catches syntax errors.

		end
	end

	---

	--[[Useage example:
	if you have the file named "ScriptFile.lua" in Saved Games/DCS.
	Put this code in a DO SCRIPT action that is triggered by an F10 radio menu selection.
	]]

	----------------------------------
	function reloadscript()
	----------------------------------
	do
		local fName = lfs.writedir() .. [[csilk_script.lua]]
		doScriptFile(fName)

			  local msg = {} 
	    msg.text = ' Reloaded script GOODLUCK. '

	    msg.displayTime = 10
	    msg.msgFor = {coa = {'all'}}
	    mist.message.add(msg)

		end

	end

	---

	-----------------------------------
	function Mission_Complete_Checks(arg, time)
	-----------------------------------

	--airfield_complete = trigger.misc.getUserFlag('101')		-- when true this triggers the mission accomplished/message/clean up.
	--mud_complete = trigger.misc.getUserFlag('201')
	--convoy_complete = trigger.misc.getUserFlag('301')
	--intercept_complete = trigger.misc.getUserFlag('401')
	--bomber_complete = trigger.misc.getUserFlag('501')

	if trigger.misc.getUserFlag('102') == 1 then
			trigger.action.setUserFlag('102',0)

	end

	if trigger.misc.getUserFlag('202') == 1 then
			trigger.action.setUserFlag('202',0)

	end

	if trigger.misc.getUserFlag('302') == 1 then
			trigger.action.setUserFlag('302',0)

	end

	if trigger.misc.getUserFlag('402') == 1 then

			trigger.action.setUserFlag('402',0)

	end

	if trigger.misc.getUserFlag('502') == 1 then

			trigger.action.setUserFlag('502',0)

	end
	
	if trigger.misc.getUserFlag('602') == 1 then

			trigger.action.setUserFlag('602',0)

	end
	
		if trigger.misc.getUserFlag('702') == 1 then

			trigger.action.setUserFlag('702',0)

	end

		 

	if trigger.misc.getUserFlag('101') == 1 then

	if airfield == 1 then

			local msg = {}
			msg.text = ' Airfield task has been completed.'

	    msg.displayTime = 60
	    msg.msgFor = {coa = {'all'}}
	    mist.message.add(msg)
			trigger.action.setUserFlag('102', 1)				-- stop victory
			airfield = 0
			airfield_complete = 0
			trigger.action.outSoundForCoalition(coalition.side.RED, 'missioncomplete.ogg')
			--trigger.action.deactivateGroup(Group.getByName(DefensesName))				-- deactivate airfield defenses	

	end

	end

	if trigger.misc.getUserFlag('201') == 1 then

	if mudtask == 1 then

			local msg = {}
			msg.text = ' Mud task has been completed.'

	    msg.displayTime = 60
	    msg.msgFor = {coa = {'all'}}
	    mist.message.add(msg)
			trigger.action.setUserFlag('202', 1)				-- stop victory
			mudtask = 0
			mud_complete = 0
			trigger.action.outSoundForCoalition(coalition.side.RED, 'missioncomplete.ogg')
			--trigger.action.deactivateGroup(Group.getByName(MudName))				-- deactivate mud

	end

	end

	if trigger.misc.getUserFlag('301') == 1 then
	if convoytask == 1 then

			local msg = {}
			msg.text = ' Convoy task has been completed.'

	    msg.displayTime = 60
	    msg.msgFor = {coa = {'all'}}
	    mist.message.add(msg)
			trigger.action.setUserFlag('302', 1)				-- stop victory
			convoytask = 0
			convoy_complete = 0
			trigger.action.outSoundForCoalition(coalition.side.RED, 'missioncomplete.ogg')
			--trigger.action.deactivateGroup(Group.getByName(MoveMud))				-- deactivate convoy

	end

	end

	if trigger.misc.getUserFlag('401') == 1 then
	if interceptortask == 1 then
			local msg = {}

			msg.text = ' Interceptor task has been completed.'

	    msg.displayTime = 60
	    msg.msgFor = {coa = {'all'}}
	    mist.message.add(msg)
			interceptortask = 0
			intercept_complete = 0
			trigger.action.setUserFlag('402', 1)				-- stop victory
			trigger.action.outSoundForCoalition(coalition.side.RED, 'missioncomplete.ogg')
			--trigger.action.deactivateGroup(Group.getByName(grpName))				-- deactivate fighters

	end
	end

	if trigger.misc.getUserFlag('501') == 1 then
	if bombertask == 1 then
			local msg = {}

			msg.text = ' Bomber intercept task has been completed.'

	    msg.displayTime = 60
	    msg.msgFor = {coa = {'all'}}
	    mist.message.add(msg)
			trigger.action.setUserFlag('502', 1)				-- stop victory
			bombertask = 0
			bomber_complete = 0

			trigger.action.outSoundForCoalition(coalition.side.RED, 'missioncomplete.ogg')
			--trigger.action.deactivateGroup(Group.getByName(egrpName))				-- deactivate escorts
			--trigger.action.deactivateGroup(Group.getByName(bgrpName))				-- deactivate bombers

	end
	end
	
		if trigger.misc.getUserFlag('601') == 1 then
				if striketask == 1 then
				local msg = {}

			msg.text = ' Strike mission completed.'

	    msg.displayTime = 60
	    msg.msgFor = {coa = {'all'}}
	    mist.message.add(msg)
			trigger.action.setUserFlag('602', 1)				-- stop victory
			striketask = 0
			strike_complete = 0

			trigger.action.outSoundForCoalition(coalition.side.RED, 'missioncomplete.ogg')
			--trigger.action.deactivateGroup(Group.getByName(egrpName))				-- deactivate escorts
			--trigger.action.deactivateGroup(Group.getByName(bgrpName))				-- deactivate bombers
			
				end
			end
			
					if trigger.misc.getUserFlag('701') == 1 then
				if navaltask == 1 then
				local msg = {}

			msg.text = ' Naval mission completed.'

	    msg.displayTime = 60
	    msg.msgFor = {coa = {'all'}}
	    mist.message.add(msg)
			trigger.action.setUserFlag('702', 1)				-- stop victory
			navaltask = 0
			naval_complete = 0

			trigger.action.outSoundForCoalition(coalition.side.RED, 'missioncomplete.ogg')
			--trigger.action.deactivateGroup(Group.getByName(egrpName))				-- deactivate escorts
			--trigger.action.deactivateGroup(Group.getByName(bgrpName))				-- deactivate bombers
			
				end
			end
	


	Debug_Show()
	--return time + 5

end
	---

	function Debug_Show()

			if Debugger == 1 then
			local msg = {}
	    msg.text = ' Debug variables'
	    msg.displayTime = 1
	    msg.msgFor = {coa = {'all'}}
	    mist.message.add(msg)

			

			local msg = {}
	    msg.text = ' TasksStart' ..tostring(airfield) ..tostring(mudtask) ..tostring(convoytask) ..tostring(intercepttask) ..tostring(bombertask) ..tostring(striketask)
	    msg.displayTime = 1
	    msg.msgFor = {coa = {'all'}}
	    mist.message.add(msg)

			
			local msg = {}
	    msg.text = ' CompletedTask' ..tostring(airfield_complete) ..tostring(mud_complete) ..tostring(convoy_complete) ..tostring(intercept_complete) ..tostring(bomber_complete) .tostring(strike_complete)
	    msg.displayTime = 1
	    msg.msgFor = {coa = {'all'}}
	    mist.message.add(msg)
			

			local msg = {}
	    msg.text = ' Debug variables'
	    msg.displayTime = 1
	    msg.msgFor = {coa = {'all'}}
	    mist.message.add(msg)

			end


	end

	function Debug_Toggle()
	  local Old_Set = Debugger
	  local New_Set = nil
	  local DebugSet = ""

	  if Old_Set == 1 then
	    New_Set = 0
	    Debugger = New_Set
	    DebugSet = "disabled"
	  end
		  if Old_Set == 0 then
	    New_Set = 1
	    Debugger = New_Set
	    DebugSet = "enabled"
	  end

	  trigger.action.outSoundForCoalition(coalition.side.RED, 'range.ogg')
	  local msg = {} 
	    msg.text = ' Debug information is '..tostring(DebugSet)
	    msg.displayTime = 20
	    msg.msgFor = {coa = {'all'}}
	      mist.message.add(msg)

	 -- return
	end

	-- Scheduled functions (run on timer)

	------------------------------------------------------------------
	timer.scheduleFunction(Radio_Add, nil, timer.getTime() + 5)
	timer.scheduleFunction(Radio_Check, nil, timer.getTime() + 2)

	timer.scheduleFunction(Introduce_Mission, nil, timer.getTime() + 4)
	timer.scheduleFunction(Mission_Complete_Checks, nil, timer.getTime() + 5) 
	------------------------------------------------------------------

