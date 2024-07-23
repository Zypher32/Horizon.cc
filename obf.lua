local repo = 'https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/'
local ESPLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/Exunys/Exunys-ESP/main/src/ESP.lua"))()

local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()

local ThemeManager = loadstring(game:HttpGet('https://raw.githubusercontent.com/Zypher32/theme/main/theme'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()
Library:Notify("Horizon.cc Has Identified That You Are Playing Rivals.")
Library:Notify("Loading Rivals...")
-- vars
local Camera = game:GetService("CurrentCamera")
local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Player = game:GetService("Players").LocalPlayer
local Character = game:GetService("Players").LocalPlayer.Character or workspace:FindFirstChild(Player.Name)
local Humanoid = Character.Humanoid
print(game:GetService("Players").LocalPlayer)
-- toggles
local WorldVisuals
local Ambient
local AmbientColor

local SpeedHack
local Speed

local InfiniteJump
local Noclip
local Fly
local FlySpeed = 5

local ArmChams
local WeaponChams
local ArmColor
local WeaponColor

-- Tables
local skybox_assets = {
    Default = { "91458024", "91457980", "91458024", "91458024", "91458024", "91458002" },
    Neptune = { "218955819", "218953419", "218954524", "218958493", "218957134", "218950090" },
    ["Among Us"] = { "5752463190", "5752463190", "5752463190", "5752463190", "5752463190", "5752463190" },
    Nebula = { "159454299", "159454296", "159454293", "159454286", "159454300", "159454288" },
    Vaporwave = { "1417494030", "1417494146", "1417494253", "1417494402", "1417494499", "1417494643" },
    Clouds = { "570557514", "570557775", "570557559", "570557620", "570557672", "570557727" },
    Twilight = { "264908339", "264907909", "264909420", "264909758", "264908886", "264907379" },
    DaBaby = { "7245418472", "7245418472", "7245418472", "7245418472", "7245418472", "7245418472" },
    Minecraft = { "1876545003", "1876544331", "1876542941", "1876543392", "1876543764", "1876544642" },
    Chill = { "5084575798", "5084575916", "5103949679", "5103948542", "5103948784", "5084576400" },
    Redshift = { "401664839", "401664862", "401664960", "401664881", "401664901", "401664936" },
    ["Deep Space"] = { "149397684", "149397686", "149397688", "149397692", "149397697", "149397702" },
    ["Winter"] = { "510645155", "510645130", "510645179", "510645117", "510645146", "510645195" },
}
local defaultSkyboxIDs = {Default = {"91458024", "91457980", "91458024", "91458024", "91458024", "91458002"} }

local Window = Library:CreateWindow({
    -- Set Center to true if you want the menu to appear in the center
    -- Set AutoShow to true if you want the menu to appear when it is created
    -- Position and Size are also valid options here
    -- but you do not need to define them unless you are changing them :)

    Title = 'Horizon.cc | Rivals | Free',
    Center = true,
    AutoShow = true,
    TabPadding = 8,
    MenuFadeTime = 0.2
})

local Tabs = {
    Combat = Window:AddTab('Combat'),
    Visuals = Window:AddTab('Visuals'),
	Exploits = Window:AddTab('Exploits'),
    World = Window:AddTab('World'),
    ['UI Settings'] = Window:AddTab('UI Settings'),
}

local HumanModCons = {}
function WalkSpeedModifier()
local speaker = game:GetService("Players").LocalPlayer

local Char = speaker.Character or workspace:FindFirstChild(speaker.Name)
		local Human = Char and Char:FindFirstChildWhichIsA("Humanoid")
		local function WalkSpeedChange()
			if Char and Human then
				Human.WalkSpeed = Speed
			end
		end
		WalkSpeedChange()
		HumanModCons.wsLoop = (HumanModCons.wsLoop and HumanModCons.wsLoop:Disconnect() and false) or Human:GetPropertyChangedSignal("WalkSpeed"):Connect(WalkSpeedChange)
		HumanModCons.wsCA = (HumanModCons.wsCA and HumanModCons.wsCA:Disconnect() and false) or speaker.CharacterAdded:Connect(function(nChar)
			Char, Human = nChar, nChar:WaitForChild("Humanoid")
			WalkSpeedChange()
			HumanModCons.wsLoop = (HumanModCons.wsLoop and HumanModCons.wsLoop:Disconnect() and false) or Human:GetPropertyChangedSignal("WalkSpeed"):Connect(WalkSpeedChange)
end)
end
function ToggleWalkSpeed()
HumanModCons.wsLoop = (HumanModCons.wsLoop and HumanModCons.wsLoop:Disconnect() and false) or nil
	HumanModCons.wsCA = (HumanModCons.wsCA and HumanModCons.wsCA:Disconnect() and false) or nil
end
local Player = game:GetService("Players").LocalPlayer
local Mouse = Player:GetMouse()
Mouse.KeyDown:connect(function(k)
if _G.infinjump then
if k:byte() == 32 then
Humanoid = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
Humanoid:ChangeState("Jumping")
wait(0.1)
Humanoid:ChangeState("Seated")
end
end
end)
local PlayerExploits = Tabs.Exploits:AddLeftGroupbox('Player Exploits')

PlayerExploits:AddToggle('InfiniteJump', {
    Text = 'Infinite Jump',
    Default = false, -- Default value (true / false)
    Tooltip = 'jump lots of times', -- Information shown when you hover over the toggle

    Callback = function(Value)
		_G.infinjump = Value
    end
})


PlayerExploits:AddToggle('SpeedHack', {
    Text = 'Speed Hack',
    Default = false, -- Default value (true / false)
    Tooltip = 'vroom', -- Information shown when you hover over the toggle

    Callback = function(Value)
         SpeedHack = Value
		 if Value then
			WalkSpeedModifier()
		 elseif Value == false then
			ToggleWalkSpeed()
		 end
    end
})
PlayerExploits:AddSlider("Speed", {
	Text = "Speed",
	Default = 16,
	Min = 0,
	Max = 200,
	Rounding = 1,
	Compact = true,
    Callback = function(Value)
       Speed = Value
    end
})

PlayerExploits:AddToggle('Fly', {
    Text = 'Fly',
    Default = false, -- Default value (true / false)
    Tooltip = 'fly', -- Information shown when you hover over the toggle

    Callback = function(Value)
         Fly = Value
		 
    end
})
PlayerExploits:AddSlider("FlySpeed", {
	Text = "Speed",
	Default = 5,
	Min = 0,
	Max = 200,
	Rounding = 1,
	Compact = true,
    Callback = function(Value)
       FlySpeed = Value
    end
})

RunService.RenderStepped:Connect(function()
	
		Humanoid.WalkSpeed = 50
	

end)
local CustomViewmodelTabBox = Tabs.Exploits:AddRightTabbox('Custom Viewmodel')
  local CustomViewmodelTab = CustomViewmodelTabBox:AddTab('Custom Viewmodel')


  local ViewmodelEnabled = false
  local ViewmodelPos = Vector3.new(0, 0, 0)
  local CurrentCamera = workspace.CurrentCamera
  local newindex
  newindex = hookmetamethod(game, '__newindex', function(obj, idx, val)
  if obj == CurrentCamera and idx == 'CFrame' and ViewmodelEnabled then
    val = val + (val.LookVector * ViewmodelPos.Z) + (val.RightVector * ViewmodelPos.X) + (val.UpVector * ViewmodelPos.Y)
  end
  return newindex(obj, idx, val)
  end)

  CustomViewmodelTab:AddToggle('ViewmodelEnabled', {Text = 'enabled', Default = ViewmodelEnabled}):OnChanged(function(Toggle)
  ViewmodelEnabled = Toggle
  end)

  CustomViewmodelTab:AddSlider('ViewmodelX', {Text = 'x-offset:', Default = 0, Min = -5, Max = 5, Rounding = 2, Compact = false}):OnChanged(function(Slider)
  ViewmodelPos = Vector3.new(Slider, ViewmodelPos.Y, ViewmodelPos.Z)
  end)

  CustomViewmodelTab:AddSlider('ViewmodelY', {Text = 'y-offset:', Default = 0, Min = -5, Max = 5, Rounding = 2, Compact = false}):OnChanged(function(Slider)
  ViewmodelPos = Vector3.new(ViewmodelPos.X, Slider, ViewmodelPos.Z)
  end)

  CustomViewmodelTab:AddSlider('ViewmodelZ', {Text = 'z-offset:', Default = 0, Min = -5, Max = 5, Rounding = 2, Compact = false}):OnChanged(function(Slider)
  ViewmodelPos = Vector3.new(ViewmodelPos.X, ViewmodelPos.Y, Slider)
  end)

  


local WorldVisuals = Tabs.World:AddLeftGroupbox('Lighting')
local CustomSkybox = Tabs.World:AddRightGroupbox('Custom Skybox')
local Chams = Tabs.World:AddRightGroupbox('Chams')
local Sky = Instance.new("Sky", Lighting)
local SkyboxE = false

Chams:AddToggle('ArmChams', {
    Text = 'Arms',
    Default = false, -- Default value (true / false)
    Tooltip = 'Arm Chams', -- Information shown when you hover over the toggle

    Callback = function(Value)
        ArmChams = Value
    end
}):AddColorPicker("ArmChamsColor", {
	Default = Color3.fromRGB(136, 4, 208),
	Title = "arm color",
    Callback = function(Value)
        ArmChamsColor = Value
    end
})




CustomSkybox:AddToggle("", {Text = "Custom Skybox"}):OnChanged(function(Value)
    SkyboxE = Value
    if Value == false then
        local skyboxData1 = defaultSkyboxIDs["Default"]
        
        for i, prop in ipairs({"SkyboxBk", "SkyboxDn", "SkyboxFt", "SkyboxLf", "SkyboxRt", "SkyboxUp"}) do
             Sky[prop] = "rbxassetid://" .. skyboxData1[i]
        end
    else
        local skyboxData_ = skybox_assets[Options.World_Skybox1.Value]
        
        for i, prop in ipairs({"SkyboxBk", "SkyboxDn", "SkyboxFt", "SkyboxLf", "SkyboxRt", "SkyboxUp"}) do
             Sky[prop] = "rbxassetid://" .. skyboxData_[i]
        end
    end
end)

CustomSkybox:AddDropdown('World_Skybox1', {Values = {"Default", "Neptune", "Among Us", "Nebula", "Vaporwave", "Clouds", "Twilight", "DaBaby", "Minecraft", "Chill", "Redshift", "Deep Space", "Winter"},Default = 1,Multi = false,Text = 'Custom Skybox',}):OnChanged(function(World_Skybox)
    local skyboxData_ = skybox_assets[World_Skybox]

    if SkyboxE == true then
        for i, prop in ipairs({"SkyboxBk", "SkyboxDn", "SkyboxFt", "SkyboxLf", "SkyboxRt", "SkyboxUp"}) do
             Sky[prop] = "rbxassetid://" .. skyboxData_[i]
        end
    end
end)



WorldVisuals:AddToggle('WorldVisuals', {
    Text = 'Enabled',
    Default = false, -- Default value (true / false)
    Tooltip = 'Enables Lighting', -- Information shown when you hover over the toggle

    Callback = function(Value)
        WorldVisuals = Value
    end
})
WorldVisuals:AddToggle('Ambient', {
    Text = 'Ambient',
    Default = false, -- Default value (true / false)
    Tooltip = 'Adjusts Ambient', -- Information shown when you hover over the toggle

    Callback = function(Value)
        Ambient = Value
		if Value == false then
			Lighting.Ambient = Color3.fromRGB(255,255,255)
		end
    end
}):AddColorPicker("AmbientColor", {
	Default = Color3.fromRGB(136, 4, 208),
	Title = "ambient color",
    Callback = function(Value)
        AmbientColor = Value
    end
})

WorldVisuals:AddToggle('RemoveShadows', {
    Text = 'Remove Shadows',
    Default = false, -- Default value (true / false)
    Tooltip = 'Removes Shadows', -- Information shown when you hover over the toggle

    Callback = function(Value)
        if Value then
			Lighting.GlobalShadows = false
		elseif Value == false then
			Lighting.GlobalShadows = true
		end
    end
})


RunService.RenderStepped:Connect(function()
	if WorldVisuals then
		if Ambient then
			Lighting.Ambient = AmbientColor
			Lighting.OutdoorAmbient = AmbientColor
		end


	end

	if ArmChams then
		print('asdasd')
			if game.Workspace:FindFirstChild("ViewModels") then
			print("okasd")
			local Viewmodels = workspace:FindFirstChild("ViewModels")
			if Viewmodels:FindFirstChild("FirstPerson") then
				for i,v in pairs( Viewmodels.FirstPerson:GetChildren("FirstPerson") ) do
					local CurrentVM = v
					print(v)
					v.LeftArm.Material = "ForceField"
					v.LeftArm.Transparency = 0.1
					v.LeftArm.Color = ArmChamsColor
					v.RightArm.Material = "ForceField"
					v.RightArm.Transparency = 0.1
					v.RightArm.Color = ArmChamsColor
				end
			end
		end
	end

end)

local VisualsTabbox = Tabs.Visuals:AddLeftGroupbox('Player ESP')
local BoxTabbox = Tabs.Visuals:AddRightGroupbox('Boxes')
local NamesTabbox = Tabs.Visuals:AddLeftGroupbox('Names')
local HealthBarsTabbox = Tabs.Visuals:AddRightGroupbox('Health Bars')

VisualsTabbox:AddToggle('VisualsEnabled', {
    Text = 'Enabled',
    Default = false, -- Default value (true / false)
    Tooltip = 'Enables Player Visuals', -- Information shown when you hover over the toggle

    Callback = function(Value)
        features:toggle("visuals", Value)
    end
})

VisualsTabbox:AddToggle('TeamCheck', {
    Text = 'Team Check',
    Default = false, -- Default value (true / false)
    Tooltip = 'Does / Doesnt Draw ESP On Teammates', -- Information shown when you hover over the toggle

    Callback = function(Value)
        visuals.teamCheck = Value
    end
})

VisualsTabbox:AddToggle('TeamColor', {
    Text = 'Team Color',
    Default = false, -- Default value (true / false)
    Tooltip = 'Overides ESP Colors To Team Colors', -- Information shown when you hover over the toggle

    Callback = function(Value)
        visuals.teamColor = Value
    end
})

BoxTabbox:AddToggle('Boxes', {
    Text = 'Boxes',
    Default = false, -- Default value (true / false)
    Tooltip = 'Box ESP', -- Information shown when you hover over the toggle

    Callback = function(Value)
        visuals.boxes.enabled = Value
    end
}):AddColorPicker("BoxesColor", {
	Default = Color3.fromRGB(136, 4, 208),
	Title = "box color",
    Callback = function(Value)
        visuals.boxes.color = Value
    end
})

BoxTabbox:AddToggle('BoxesOutline', {
    Text = 'Outline',
    Default = false, -- Default value (true / false)
    Tooltip = 'Outlines Boxes', -- Information shown when you hover over the toggle

    Callback = function(Value)
        visuals.boxes.outline.enabled = Value
    end
}):AddColorPicker("OutlinesColor", {
	Default = Color3.fromRGB(0, 0, 0),
	Title = "outline color",
    Callback = function(Value)
        visuals.boxes.outline.color = Value
    end
})

BoxTabbox:AddToggle('BoxesFilled', {
    Text = 'Filled',
    Default = false, -- Default value (true / false)
    Tooltip = 'Fills Boxes', -- Information shown when you hover over the toggle

    Callback = function(Value)
        visuals.boxes.filled.enabled = Value
    end
}):AddColorPicker("FilledColor", {
	Default = Color3.fromRGB(136, 4, 208),
	Title = "filled color",
    Callback = function(Value)
        visuals.boxes.filled.color = Value
    end
})

BoxTabbox:AddSlider("BoxesFilledTransparency", {
	Text = "transparency",
	Default = 0.25,
	Min = 0,
	Max = 1,
	Rounding = 1,
	Compact = true,
    Callback = function(Value)
        visuals.boxes.filled.transparency = Value
    end
})

NamesTabbox:AddToggle("Names", {
	Text = "enabled",
	Default = false,
}):AddColorPicker("NamesColor", {
	Default = Color3.fromRGB(136, 4, 208),
	Title = "names color",
})

Toggles.Names:OnChanged(function()
	visuals.names.enabled = Toggles.Names.Value
end)

Options.NamesColor:OnChanged(function()
	visuals.names.color = Options.NamesColor.Value
end)

NamesTabbox:AddToggle("NamesOutline", {
	Text = "outline",
	Default = false,
}):AddColorPicker("NamesOutlineColor", {
	Default = Color3.fromRGB(0, 0, 0),
	Title = "outline color",
})

Toggles.NamesOutline:OnChanged(function()
	visuals.names.outline.enabled = Toggles.NamesOutline.Value
end)

Options.NamesOutlineColor:OnChanged(function()
	visuals.names.outline.color = Options.NamesOutlineColor.Value
end)

HealthBarsTabbox:AddToggle("Health", {
	Text = "enabled",
	Default = false,
}):AddColorPicker("HealthColor", {
	Default = Color3.fromRGB(0, 255, 0),
	Title = "health color",
}):AddColorPicker("HealthLowColor", {
	Default = Color3.fromRGB(255, 0, 0),
	Title = "low health color",
})

Toggles.Health:OnChanged(function()
	visuals.health.enabled = Toggles.Health.Value
end)

Options.HealthColor:OnChanged(function()
	visuals.health.color = Options.HealthColor.Value
end)

Options.HealthLowColor:OnChanged(function()
	visuals.health.colorLow = Options.HealthLowColor.Value
end)

HealthBarsTabbox:AddToggle("HealthOutline", {
	Text = "outline",
	Default = false,
}):AddColorPicker("NamesOutlineColor", {
	Default = Color3.fromRGB(0, 0, 0),
	Title = "outline color",
})

Toggles.HealthOutline:OnChanged(function()
	visuals.health.outline.enabled = Toggles.HealthOutline.Value
end)

Options.NamesOutlineColor:OnChanged(function()
	visuals.health.outline.color = Options.NamesOutlineColor.Value
end)

HealthBarsTabbox:AddToggle("HealthText", {
	Text = "text",
	Default = false,
})

Toggles.HealthText:OnChanged(function()
	visuals.health.text.enabled = Toggles.HealthText.Value
end)

HealthBarsTabbox:AddToggle("HealthTextOutline", {
	Text = "text outline",
	Default = false,
})

Toggles.HealthTextOutline:OnChanged(function()
	visuals.health.text.outline.enabled = Toggles.HealthTextOutline.Value
end)













if not getgenv().AimbotSettings then
	getgenv().AimbotSettings = {
		TeamCheck = false, -- Press ] to toggle
		VisibleCheck = false,
		IgnoreTransparency = false, -- if enabled, visible check will automatically filter transparent objects
		IgnoredTransparency = 0.5, -- all parts with a transparency greater than this will be ignored (IgnoreTransparency has to be enabled)
		RefreshRate = 10, -- how fast the aimbot updates (milliseconds)
		Keybind = "MouseButton2",
		ToggleKey = "P",
		MaximumDistance = 300, -- Set this to something lower if you dont wanna lock on some random person across the map
		AlwaysActive = false,
		Aimbot = {
			Enabled = false,
			TargetPart = "Head",
			Use_mousemoverel = true,
			Strength = 100, -- 1% - 200%
			AimType = "Hold", -- "Hold" or "Toggle"
			AimAtNearestPart = false
		},
		AimAssist = {
			Enabled = false,
			MinFov = 15,
			MaxFov = 80,
			DynamicFov = true,
			ShowFov = false, -- Shows Min & Max fov
			Strength = 55, -- 1% - 100%
			SlowSensitivity = true,
			SlowFactor = 1.75, -- 1% - 10%
			RequireMovement = true
		},
		FovCircle = {
			Enabled = false,
			Dynamic = true,
			Radius = 100,
			Transparency = 1,
			Color = Color3.fromRGB(136, 4, 208),
			NumSides = 64,
		},
		TriggerBot = {
			Enabled = false,
			Delay = 60, -- how long it waits before clicking (milliseconds)
			Spam = true, -- for semi-auto weapons
			ClicksPerSecond = 10, -- set this to 0 to get anything higher than 37 cps
			UseKeybind = false, -- if enabled, your keybind must be held to use trigger bot
		},
		Crosshair = {
			Enabled = false,
			Transparency = 1,
			TransparencyKeybind = 1, -- when the keybind is held, the crosshair's transparency will be changed to this
			Color = Color3.fromRGB(255, 0, 0),
			RainbowColor = false,
			Length = 15,
			Thickness = 2,
			Offset = 0
		},
		Prediction = {
			Enabled = false,
			Strength = 1
		},
		Priority = {},
		Whitelisted = {}, -- Username or User ID
		WhitelistFriends = true, -- Automatically adds friends to the whitelist
		Ignore = {} -- Raycast Ignore
	}
end



local players = game:GetService("Players")
local player = players.LocalPlayer
local camera = workspace.CurrentCamera
local uis = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local mousemoverel = mousemoverel
local mouse1press = mouse1press or mouse1down
local mouse1release = mouse1release or mouse1up
local Drawingnew = Drawing.new 
local Fonts = Drawing.Fonts
local tableinsert = table.insert
local WorldToViewportPoint = camera.WorldToViewportPoint
local CFramenew = CFrame.new
local Vector2new = Vector2.new 
local fromRGB = Color3.fromRGB
local fromHSV = Color3.fromHSV
local mathfloor = math.floor
local mathclamp = math.clamp
local mathhuge = math.huge
local lower = string.lower
local mouse = uis:GetMouseLocation()
local osclock = os.clock
local RaycastParamsnew = RaycastParams.new
local taskwait = task.wait
local taskspawn = task.spawn

local GameId = game.GameId
local ss = getgenv().AimbotSettings
local Aimbot = ss.Aimbot
local AimAssist = ss.AimAssist
local FovCircle = ss.FovCircle
local Trigger = ss.TriggerBot
local Mouse = player:GetMouse()





local bodyparts = {
	"Head","UpperTorso","LowerTorso","LeftUpperArm","LeftLowerArm","LeftHand","RightUpperArm","RightLowerArm","RightHand","LeftUpperLeg","LeftLowerLeg","LeftFoot","RightUpperLeg","RightLowerLeg","RightFoot",
	"Torso","Left Arm","Right Arm","Left Leg","Right Leg",
	"Chest","Hips","LeftArm","LeftForearm","RightArm","RightForearm","LeftLeg","LeftForeleg","RightLeg","RightForeleg"
}



local rootpart = (getchar and "Torso") or (ts and "Chest") or "HumanoidRootPart"

local setidentity = setidentity or setthreadidentity or set_thread_identity or setthreadcontext or set_thread_context or (syn and syn.set_thread_identity) or nil
function safecall(func, env, ...)
	if not setidentity then
		return func(...)
	end

	local suc, env = pcall(getsenv, env)
	return coroutine.wrap(function(...)
		setidentity(2)
		if suc then
			setfenv(0, env)
			setfenv(1, env)
		end
		return func(...)
	end)(...)
end


local oldfuncs = {}

function IsAlive(plr)
	local char = plr.Character
	local humanoid = char and char:FindFirstChild("Humanoid")
	if humanoid and humanoid.Health > 0 then
		return char
	end
	return false
end

function GetChar(plr)
	return plr.Character
end

function GetTeam(plr)
	return plr.Team
end

function IsFFA()
	local t = {}
	for _,v in next, players:GetPlayers() do
		local team = GetTeam(v)
		if team == nil then
			return true
		end

		team = team.Name or team
		if t[team] then
			return true
		else
			tableinsert(t, team)
		end
	end
	return #t == 1
end

function ClosestPlayer()
	mouse = uis:GetMouseLocation()
	local plr = nil
	local closest = mathhuge
	local myteam = GetTeam(player)
	for _,v in next, ss.Priority do
		v = players:FindFirstChild(v)
		if v and IsAlive(v) and InFov(v) then
			return v
		end
	end
	for _,v in next, players:GetPlayers() do
		if v ~= player then
			local char = GetChar(v)
			if char ~= nil then
				local cf = char:GetPivot()
				local vector, inViewport = WorldToViewportPoint(camera, cf.Position)
				if inViewport then
					local mag = (Vector2new(mouse.X, mouse.Y) - Vector2new(vector.X, vector.Y)).Magnitude
					local team = GetTeam(v)
					if mag < closest and ((team ~= nil and team ~= myteam) or team == nil or not ss.TeamCheck) then
						plr = v
						closest = mag
					end
				end
			end
		end
	end
	return plr
end

local params = RaycastParamsnew()
params.FilterType = Enum.RaycastFilterType.Blacklist
params.IgnoreWater = true
function IsVisible(plr, character, mycharacter, cf, targetpos, valid)
	local char = character or GetChar(plr)
	if ss.VisibleCheck and (valid or IsAlive(plr) and char:FindFirstChild(Aimbot.TargetPart)) then
		local mychar = mycharacter or GetChar(player)
		tableinsert(Ignore, mychar)
		params.FilterDescendantsInstances = Ignore
		local cf = cf or camera.CFrame.Position
		local targetpos = targetpos or char[Aimbot.TargetPart].Position
		local result = workspace:Raycast(cf, (targetpos - cf).Unit * 500, params)
		if result then
			local ins = result.Instance
			local isdes = ins:IsDescendantOf(char)
			local model = ins:FindFirstAncestorOfClass("Model")
			if ss.IgnoreTransparency then
				if ins.Transparency > ss.IgnoredTransparency and not (model ~= nil and model:FindFirstChildOfClass("Humanoid")) and not isdes then
					tableinsert(Ignore, ins)
					return IsVisible(plr, char, mychar, cf, targetpos, true)
				elseif isdes then
					return true
				end
			elseif isdes then
				return true
			end
		end
	elseif not ss.VisibleCheck and IsAlive(plr) then
		return true
	end
	return false
end
task.spawn(function() -- update ignore list (i have no idea if i even need this but whatever)
	while true do
		if ss ~= nil and typeof(ss.Ignore) == "table" then
			for _,v in next, ss.Ignore do
				tableinsert(Ignore, v)
			end
		end
		taskwait(3)
	end
end)

local fov
function InFov(plr,Fov)
	mouse = uis:GetMouseLocation()
	if IsAlive(plr) then
		local char = GetChar(plr)
		if ts and char:FindFirstChild("Body") then
			char = char.Body
		end
		local target = char:FindFirstChild(Aimbot.TargetPart)
		if target then
			local _, inViewport = WorldToViewportPoint(camera, target.Position)
			if (FovCircle.Enabled or AimAssist.Enabled) and inViewport then
				for _,v in next, char:GetChildren() do
					if table.find(bodyparts, v.Name) and v.ClassName:find("Part") then
						local vector2, inViewport2 = WorldToViewportPoint(camera, v.Position)
						if inViewport2 and (Vector2new(mouse.X, mouse.Y) - Vector2new(vector2.X, vector2.Y)).Magnitude <= (Fov or fov.Radius or FovCircle.Radius) then
							return true
						end
					end
				end
			elseif not FovCircle.Enabled and IsAlive(plr) then
				return true
			end
		else
			return false
		end
	end
	return false
end


oldfuncs.alive = IsAlive
oldfuncs.character = GetChar
oldfuncs.team = GetTeam
oldfuncs.ffa = IsFFA
oldfuncs.closest = ClosestPlayer
oldfuncs.visible = IsVisible
oldfuncs.fov = InFov

function IsWhitelisted(plr)
	if table.find(ss.Whitelisted, (plr.Name or plr.UserId)) then
		return true
	end
	return false
end

local uit = Enum.UserInputType
local kc = Enum.KeyCode
local mb1 = uit.MouseButton1
local conn1 = uis.InputBegan:Connect(function(i,gp)
	if gp then
		return
	end
	local a = ss.Keybind:find("Mouse") and uit[ss.Keybind] or kc[ss.Keybind]
	local b = kc[ss.ToggleKey] ~= nil and kc[ss.ToggleKey]
	if i.UserInputType == a or i.KeyCode == a then
		if Aimbot.AimType == "Toggle" then
			ads = not ads
		else
			ads = true
		end
	elseif i.KeyCode == b then
		Aimbot.Enabled = not Aimbot.Enabled
		fov.Visible = Aimbot.Enabled
		AimAssist.Enabled = not AimAssist.Enabled
	end
	if i.UserInputType == mb1 then
		mousedown = true
	end
end)
local conn2 = uis.InputEnded:Connect(function(i,gp)
	if gp then
		return
	end
	local a = ss.Keybind:find("Mouse") and uit[ss.Keybind] or kc[ss.Keybind]
	if (i.UserInputType == a or i.KeyCode == a) and Aimbot.AimType == "Hold" then
		ads = false
	end
	if i.UserInputType == mb1 then
		mousedown = false
	end
end)

fov = Drawingnew("Circle")
fov.Visible = true
fov.Transparency = 1
fov.Color = fromRGB(255,255,255)
fov.Thickness = 1
fov.NumSides = 64
fov.Radius = 100
fov.Filled = false

-- aim assist fov circles and labels
local fov1, fov2, label1, label2 = Drawingnew("Circle"), Drawingnew("Circle"), Drawingnew("Text"), Drawingnew("Text")
do
	for _,v in next, {fov1, fov2} do
		v.Visible = false
		v.Transparency = 1 
		v.Thickness = 1 
		v.NumSides = 64
		v.Radius = 100
		v.Filled = false
	end
	fov1.Color = fromRGB(255,0,0)
	fov2.Color = fromRGB(0, 0, 255)
	
	for _,v in next, {label1,label2} do
		v.Visible = false
		v.Transparency = 1
		v.Size = 32 
		v.Center = true 
		v.Outline = true 
		v.OutlineColor = fromRGB(0,0,0)
		v.Font = Fonts.UI
	end
	label1.Color = fromRGB(255,255,255)
	label1.Text = "Aim Assist only works when the player is outside the Red circle and inside the Blue circle"
	label2.Color = fromRGB(255,0,0)
	label2.Text = "You cannot use Aimbot and Aim Assist at the same time!"
end
function removefov()
	fov:Remove()
	fov1:Remove()
	fov2:Remove()
	label1:Remove()
	label2:Remove()
end



local lastupdate = osclock()
function update()
	ss.RefreshRate = mathclamp(ss.RefreshRate, 0, mathhuge)
	if osclock() - lastupdate < (ss.RefreshRate / 1000) then
		return
	end
	lastupdate = osclock()

	mouse = uis:GetMouseLocation()
	local min, max, dyn, size = AimAssist.MinFov, AimAssist.MaxFov, AimAssist.DynamicFov, camera.ViewportSize
	local bot, assist = Aimbot.Enabled, AimAssist.Enabled

	local plr = ClosestPlayer()
	local s = (bot and not assist and Aimbot) or (assist and not bot and AimAssist) or nil
	if plr ~= nil and s ~= nil then
		local char, mychar = GetChar(plr), GetChar(player)
		local cf, ccf = char:GetBoundingBox(), camera.CFrame
		local dist = (ccf.Position - cf.Position).Magnitude

		if (ads or ss.AlwaysActive) and dist <= ss.MaximumDistance then
			if IsVisible(plr) and not IsWhitelisted(plr) then
				local str = mathclamp(s.Strength, 1, (bot and 200) or (assist and 100))
				local target = Aimbot.TargetPart
				if ts and char:FindFirstChild("Body") then
					char = char.Body
				end
				if s.AimAtNearestPart then
					mouse = uis:GetMouseLocation()
					local closest = mathhuge
					for _,v in next, bodyparts do
						local part = char:FindFirstChild(v)
						if part then
							local vector = WorldToViewportPoint(camera, part.Position)
							local mag = (mouse - Vector2new(vector.X, vector.Y)).Magnitude
							if mag < closest then
								closest = mag
								target = part
							end
						end
					end
				else
					target = char:FindFirstChild(target)
				end
				if bot then
					if InFov(plr) and target then
						local position = target.Position
						if ss.Prediction.Enabled then
							local str = mathclamp(ss.Prediction.Strength, 1, 20) / 10
							position += target.Velocity * str * (ccf.Position - target.Position).Magnitude / 100
						end
						local vector = WorldToViewportPoint(camera, position)
						if Aimbot.Use_mousemoverel then
							str /= 100
							mousemoverel((vector.X - mouse.X) * str, (vector.Y - mouse.Y) * str)
						else
							camera.CFrame = CFramenew(ccf.Position, char[target.Name].Position)
						end
					end
				end
				if assist then
					local inmaxfov = InFov(plr, max)
					if not InFov(plr, min) and inmaxfov then
						local factor = AimAssist.SlowFactor
						if AimAssist.SlowSensitivity then
							factor = mathclamp(factor, 1, 10)
							uis.MouseDeltaSensitivity = (inmaxfov and (olddelta / factor)) or olddelta
						end
						if (AimAssist.RequireMovement and mychar:FindFirstChild("Humanoid") and mychar.Humanoid.MoveDirection.Magnitude > 0) or not AimAssist.RequireMovement or getchar then
							local body = WorldToViewportPoint(camera, char[rootpart].Position)
							local head = WorldToViewportPoint(camera, char.Head.Position)
							local vector = body
							if (mouse - Vector2new(head.X, head.Y)).Magnitude < (mouse - Vector2new(body.X, body.Y)).Magnitude then
								vector = head
							end
		
							-- distance based strength
							local mag = (ccf.Position - char[rootpart].Position).Magnitude
							local mult = (mag <= 20 and 2) or (mag <= 40 and 1.4) or 1
		
							if ads then
								mult /= 1.8
							end
							if AimAssist.SlowSensitivity then
								mult *= factor
							end
		
							str *= mult
							str /= 1000
							mousemoverel((vector.X - mouse.X) * str, (vector.Y - mouse.Y) * str * 1.2)
						end
					elseif assist and not inmaxfov then
						uis.MouseDeltaSensitivity = olddelta
					end
				end
			elseif assist and not InFov(plr, max) then
				uis.MouseDeltaSensitivity = olddelta
			end
		end
	end
	

	if FovCircle.Enabled then
		fov.Position = mouse
		fov.NumSides = FovCircle.NumSides
		fov.Radius = FovCircle.Radius
		fov.Transparency = FovCircle.Transparency
		fov.Color = FovCircle.Color
		if FovCircle.Dynamic then
			fov.Radius = FovCircle.Radius / (camera.FieldOfView / 80)
		end
	else
		fov.Transparency = 0
	end

	local showfov = AimAssist.ShowFov
	max = (dyn and not ads and max) or (dyn and ads and max / (camera.FieldOfView / 100)) or max
	fov1.Visible = showfov
	fov2.Visible = showfov
	label1.Visible = showfov
	label2.Visible = bot and assist
	if showfov then
		fov1.Position = mouse
		fov1.Radius = min

		fov2.Position = mouse
		fov2.Radius = max

		label1.Position = Vector2new(size.X / 2, (size.Y / 2) + max + 10)
	end
	if bot and assist then
		label2.Position = Vector2new(size.X / 2, (size.Y / 2) + max + 42)
		return
	end

	
end
--local conn3 = RunService.RenderStepped:Connect(update)
local name = ""
for _ = 1, math.random(16, 24) do
	name ..= string.char(math.random(97, 122))
end
RunService:BindToRenderStep(name, 0, update)
local conn4 = players.PlayerAdded:Connect(function(plr)
	if ss.WhitelistFriends and player:IsFriendsWith(plr.UserId) then
		tableinsert(ss.Whitelisted, plr.UserId)
	end
end)
if typeof(ss.Keybind) == "EnumItem" then
	ss.Keybind = ss.Keybind.Name
end
if typeof(ss.ToggleKey) == "EnumItem" then
	ss.ToggleKey = ss.ToggleKey.Name
end

local aimbot = {Version = VERSION}
local destroyed = false

function ValidType(type)
	return type == "Other" or ss[type] ~= nil
end
function ValidOption(type,option)
	return (type == "Other" and ss[option] ~= nil) or ss[type][option] ~= nil
end
function aimbot:Toggle(type)
	assert(ValidType(type),"Universal Aimbot: bad argument to #1 'Toggle' (Invalid Type)")
	if type == ("Whitelisted" or "Ignore") then
		ss[type] = not ss[type]
	else
		ss[type].Enabled = not ss[type].Enabled
	end
end
function aimbot:Get(type,option)
	assert(ValidType(type),"Universal Aimbot: bad argument to #1 'Get' (Invalid Type)")
	assert(ValidOption(type,option),"Universal Aimbot: bad argument to #2 'Get' (Invalid Option)")
	if type == "Other" then
		return ss[option]
	end
	return ss[type][option]
end
function aimbot:Set(type,option,value)
	assert(ValidType(type),"Universal Aimbot: bad argument to #1 'Set' (Invalid Type)")
	assert(ValidOption(type,option),"Universal Aimbot: bad argument to #2 'Set' (Invalid Option)")
	assert(value ~= nil,"Universal Aimbot: bad argument to #3 'Set'")
	if type == "Other" then
		ss[option] = value
	else
		ss[type][option] = value
	end
end
function aimbot:SetFunction(a,f)
	assert(typeof(a) == "string",("Universal Aimbot: bad argument to #1 'SetFunction' (string expected, got %s)"):format(typeof(a)))
	assert(typeof(f) == "function",("Universal Aimbot: bad argument to #2 'SetFunction' (function expected, got %s)"):format(typeof(f)))
	a = lower(a)
	if a == "alive" then
		IsAlive = f
	elseif a == "character" then
		GetChar = f
	elseif a == "team" then
		GetTeam = f
	elseif a == "ffa" then
		IsFFA = f
	elseif a == "closest" then
		ClosestPlayer = f
	elseif a == "visible" then
		IsVisible = f
	end
end
function aimbot:ResetFunction(a)
	assert(typeof(a) == "string",("Universal Aimbot: bad argument to #1 'ResetFunction' (string expected, got %s)"):format(typeof(a)))
	a = lower(a)
	assert(oldfuncs[a] ~= nil,"Universal Aimbot: bad argument to #1 'ResetFunction' (invalid function)")
	local f = oldfuncs[a]
	if a == "alive" then
		IsAlive = f
	elseif a == "character" then
		GetChar = f
	elseif a == "team" then
		GetTeam = f
	elseif a == "ffa" then
		IsFFA = f
	elseif a == "closest" then
		ClosestPlayer = f
	elseif a == "visible" then
		IsVisible = f
	end
end
function aimbot:Destroy()
	if destroyed then return end
	conn1:Disconnect()
	conn2:Disconnect()
	--conn3:Disconnect()
	conn4:Disconnect()
	RunService:UnbindFromRenderStep(name)
	removefov()
	removecrosshair()
	uis.MouseDeltaSensitivity = olddelta
	destroyed = true
end









local AimbotSettings = Tabs.Combat:AddLeftGroupbox('Aimbot Settings')
local FOVSettings = Tabs.Combat:AddRightGroupbox('FOV Settings')

AimbotSettings:AddToggle('AimbotEnabled', {
    Text = 'Enabled',
    Default = false, -- Default value (true / false)
    Tooltip = 'Enables Aimbot', -- Information shown when you hover over the toggle

    Callback = function(Value)
        getgenv().AimbotSettings.Aimbot.Enabled = Value
		getgenv().AimbotSettings.FovCircle.Enabled = Value
    end
})
AimbotSettings:AddToggle('AimbotTeamCheck', {
    Text = 'Team Check',
    Default = false, -- Default value (true / false)
    Tooltip = 'Doesnt Target Teammates', -- Information shown when you hover over the toggle

    Callback = function(Value)
        getgenv().AimbotSettings.TeamCheck = Value
    end
})
AimbotSettings:AddToggle('AimbotVisibleChecl', {
    Text = 'Visible Check',
    Default = false, -- Default value (true / false)
    Tooltip = 'Doesnt Target Teammates', -- Information shown when you hover over the toggle

    Callback = function(Value)
        getgenv().AimbotSettings.VisibleCheck = Value
    end
})
AimbotSettings:AddToggle('Prediction', {
    Text = 'Prediction',
    Default = false, -- Default value (true / false)
    Tooltip = 'Predicts Player Movement | Highly Recommended', -- Information shown when you hover over the toggle

    Callback = function(Value)
        getgenv().AimbotSettings.Prediction.Enabled = Value
    end
})

AimbotSettings:AddSlider("PredictionStrength", {
	Text = "Prediction Strength",
	Default = 0.75,
	Min = 0,
	Max = 3,
	Rounding = 1,
	Compact = true,
    Callback = function(Value)
        getgenv().AimbotSettings.Prediction.Strength = Value
    end
})

AimbotSettings:AddSlider("MaxDistance", {
	Text = "Max Distance",
	Default = 300,
	Min = 0,
	Max = 3000,
	Rounding = 1,
	Compact = true,
    Callback = function(Value)
        getgenv().AimbotSettings.MaximumDistance = Value
    end
})

AimbotSettings:AddSlider("Strength", {
	Text = "Strength:",
	Default = 100,
	Min = 0,
	Max = 100,
	Rounding = 1,
	Compact = true,
    Callback = function(Value)
        getgenv().AimbotSettings.Aimbot.Strength = Value
    end
})

AimbotSettings:AddDropdown('AimbotPart', {
    Values = { "Head" },
    Default = 1, -- number index of the value / string
    Multi = false, -- true / false, allows multiple choices to be selected

    Text = 'Target Part',
    Tooltip = 'The Part The Aimbot Will Target', -- Information shown when you hover over the dropdown

    Callback = function(Value)
        getgenv().AimbotSettings.Aimbot.TargetPart = Value
    end
})

FOVSettings:AddToggle('FOVEnabled', {
    Text = 'Enabled',
    Default = false, -- Default value (true / false)
    Tooltip = 'Enables FOV', -- Information shown when you hover over the toggle

    Callback = function(Value)
		getgenv().AimbotSettings.FovCircle.Enabled = Value
    end
}):AddColorPicker("FOVColor", {
	Default = Color3.fromRGB(136, 4, 208),
	Title = "fov color",
    Callback = function(Value)
        getgenv().AimbotSettings.FovCircle.Color = Value
    end
})
FOVSettings:AddToggle('DynamicFOV', {
    Text = 'Dynamic',
    Default = false, -- Default value (true / false)
    Tooltip = 'Changes FOV size if scoped in', -- Information shown when you hover over the toggle

    Callback = function(Value)
		getgenv().AimbotSettings.FovCircle.Dynamic = Value
    end
})

FOVSettings:AddSlider("Radius", {
	Text = "Radius:",
	Default = 100,
	Min = 0,
	Max = 500,
	Rounding = 1,
	Compact = true,
    Callback = function(Value)
        getgenv().AimbotSettings.FovCircle.Radius = Value
    end
})

FOVSettings:AddSlider("Transparency", {
	Text = "Transparency:",
	Default = 1,
	Min = 0,
	Max = 1,
	Rounding = 1,
	Compact = true,
    Callback = function(Value)
        getgenv().AimbotSettings.FovCircle.Transparency = Value
    end
})

getgenv().UAIM = aimbot





Library:SetWatermarkVisibility(true)


local FrameTimer = tick()
local FrameCounter = 0;
local FPS = 60;

local WatermarkConnection = game:GetService('RunService').RenderStepped:Connect(function()
    FrameCounter += 1;

    if (tick() - FrameTimer) >= 1 then
        FPS = FrameCounter;
        FrameTimer = tick();
        FrameCounter = 0;
    end;

    Library:SetWatermark(('Horizon.cc | Rivals | Free | %s fps | %s ms'):format(
        math.floor(FPS),
        math.floor(game:GetService('Stats').Network.ServerStatsItem['Data Ping']:GetValue())
    ));
end);

Library.KeybindFrame.Visible = false; -- todo: add a function for this

Library:OnUnload(function()
    WatermarkConnection:Disconnect()

    print('Unloaded!')
    Library.Unloaded = true
end)

-- UI Settings
local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('Menu')

-- I set NoUI so it does not show up in the keybinds menu
MenuGroup:AddButton('Unload', function() Library:Unload() end)
MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'End', NoUI = true, Text = 'Menu keybind' })

Library.ToggleKeybind = Options.MenuKeybind -- Allows you to have a custom keybind for the menu

-- Addons:
-- SaveManager (Allows you to have a configuration system)
-- ThemeManager (Allows you to have a menu theme system)

-- Hand the library over to our managers
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)

-- Ignore keys that are used by ThemeManager.
-- (we dont want configs to save themes, do we?)
SaveManager:IgnoreThemeSettings()

-- Adds our MenuKeybind to the ignore list
-- (do you want each config to have a different menu key? probably not.)
SaveManager:SetIgnoreIndexes({ 'MenuKeybind' })

-- use case for doing it this way:
-- a script hub could have themes in a global folder
-- and game configs in a separate folder per game
ThemeManager:SetFolder('MyScriptHub')
SaveManager:SetFolder('MyScriptHub/specific-game')

-- Builds our config menu on the right side of our tab
SaveManager:BuildConfigSection(Tabs['UI Settings'])

-- Builds our theme menu (with plenty of built in themes) on the left side
-- NOTE: you can also call ThemeManager:ApplyToGroupbox to add it to a specific groupbox
ThemeManager:ApplyToTab(Tabs['UI Settings'])

-- You can use the SaveManager:LoadAutoloadConfig() to load a config
-- which has been marked to be one that auto loads!
SaveManager:LoadAutoloadConfig()

Library:Notify("Loaded.")
Library:Notify("Thank you for choosing Horizon.cc!")
Library:Notify("Current Status: Undetected💚")