print("Installing Classical Hub for Slap Battles")
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

--if game.PlaceId == 9431156611 then

Rayfield:Notify({
    Title = "Loading...",
    Content = "Classic Hub is loading. This will only take a moment...",
    Duration = 6.5,
    Image = "loader",
 })

--loadstring(game:HttpGet(('')))()

local GoToItemsFunction = loadstring(game:HttpGet(('https://github.com/ClassicKid6886/ClassicalScriptHub/raw/refs/heads/SlapRoyal/GoToItems.lua')))()
local FlyFunction = loadstring(game:HttpGet(('https://github.com/ClassicKid6886/ClassicalScriptHub/raw/refs/heads/Storage/UniversalFly_Velocity.lua')))()

local function SendError(Message)
    Rayfield:Notify({
        Title = "Unexpected Error",
        Content = Message,
        Duration = 6.5,
        Image = "ban",
     })
end

local Window = Rayfield:CreateWindow({
    Name = "Classical Hub - Slap Royal",
    Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
    LoadingTitle = "Welcome to Classical Hub - Slap Royal",
    LoadingSubtitle = "Getting thing ready...",
    Theme = "DarkBlue", -- Check https://docs.sirius.menu/rayfield/configuration/themes
 
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface
 
    ConfigurationSaving = {
       Enabled = true,
       FolderName = nil, -- Create a custom folder for your hub/game
       FileName = "ClassicHubSlapRoyal"
    },
 
    Discord = {
       Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
       Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
       RememberJoins = true -- Set this to false to make them join the discord every time they load it up
    },
 
    KeySystem = false, -- Set this to true to use our key system
    KeySettings = {
       Title = "Untitled",
       Subtitle = "Key System",
       Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
       FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
       SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
       GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
       Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
    }
 })

local GeneralTab = Window:CreateTab("General", "command")


local FlySection = GeneralTab:CreateSection("Fly")
local SliderFlySpeed = 5
local Slider = FlySection:CreateSlider({
    Name = "Fly Speed",
    Range = {1, 300},
    Increment = 5,
    Suffix = "Max. 300",
    CurrentValue = 5,
    Flag = "FlySpeedValue", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        SliderFlySpeed = value
    end,
 })
local FlyToggle = FlySection:CreateToggle({
    Name = "Toggle Fly",
    CurrentValue = false,
    Flag = "FlyToggleValue", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        FlyFunction(Value, SliderFlySpeed)
    end,
 })

local ExtraTab = Window:CreateTab("Extra", "anvil")

ExtraTab:CreateButton({
	Name = "Go To Items",
	Callback = function()
      		GoToItemsFunction()
  	end    
})

local ScriptTab = Window:CreateTab("Script", "scroll")

ScriptTab:CreateButton({
	Name = "Kill Script",
	Callback = function()
            Rayfield:Destroy()
  	end    
})
