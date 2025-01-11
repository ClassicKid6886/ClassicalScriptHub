print("Installing Classical Hub for Slap Battles")
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

Rayfield:Notify({
    Title = "Loading...",
    Content = "Classic Hub is loading. This will only take a moment...",
    Duration = 6.5,
    Image = "loader",
})

local GoToItemsFunction = loadstring(game:HttpGet('https://github.com/ClassicKid6886/ClassicalScriptHub/raw/refs/heads/SlapRoyal/GoToItems.lua'))()
local FlyFunction = loadstring(game:HttpGet('https://github.com/ClassicKid6886/ClassicalScriptHub/raw/refs/heads/Storage/UniversalFly_Velocity.lua'))()

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
    Icon = 0,
    LoadingTitle = "Welcome to Classical Hub - Slap Royal",
    LoadingSubtitle = "Getting thing ready...",
    Theme = "DarkBlue",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = nil,
        FileName = "ClassicHubSlapRoyal"
    },
    Discord = {
        Enabled = false,
        Invite = "noinvitelink",
        RememberJoins = true
    },
    KeySystem = false,
    KeySettings = {
        Title = "Untitled",
        Subtitle = "Key System",
        Note = "No method of obtaining the key is provided",
        FileName = "Key",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = {"Hello"}
    }
})

local GeneralTab = Window:CreateTab("General", "command")

local FlySection = GeneralTab:CreateSection("Fly")
local SliderFlySpeed = 10
local Slider = GeneralTab:CreateSlider({
    Name = "Fly Speed",
    Range = {10, 300},
    Increment = 2,
    Suffix = " Max. 300",
    CurrentValue = 10,
    Flag = "FlySpeedValue",
    Callback = function(Value)
        SliderFlySpeed = Value * 10
    end,
})

local FlyToggle = GeneralTab:CreateToggle({
    Name = "Toggle Fly",
    CurrentValue = false,
    Flag = "FlyToggleValue",
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
