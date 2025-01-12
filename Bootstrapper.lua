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

local WorldTab = Window:CreateTab("World", "map")

local WorldSection = WorldTab:CreateSection("Map Settings")
local WorldToggle = WorldTab:CreateToggle({
    Name = "Toggle Fly",
    CurrentValue = false,
    Flag = "HideWorldValue",
    Callback = function(Value)
        if Value then
            workspace:FindFirstChild("Map").Parent = game.ReplicatedStorage
        else
            game.ReplicatedStorage:FindFirstChild("Map").Parent = workspace
        end
    end,
})
WorldTab:CreateButton({
    Name = "Delete Acid",
    Callback = function()
        local mapFolder
        if workspace.Map then
            mapFolder = workspace.Map
        else
            mapFolder = game.ReplicatedStorage.Map
        end
        mapFolder:FindFirstChild("AcidAbnormality").Acid:Remove()
    end
})
WorldTab:CreateButton({
    Name = "Delete Lab",
    Callback = function()
        local mapFolder
        if workspace.Map then
            mapFolder = workspace.Map
        else
            mapFolder = game.ReplicatedStorage.Map
        end
        mapFolder:FindFirstChild("OriginOffice"):Remove()
    end
})
local WorldTpSection = WorldTab:CreateSection("Map Teleports")
WorldTab:CreateButton({
    Name = "Teleport Western",
    Callback = function()
        game.workspace:FindFirstChild(game.Players.LocalPlayer.Name).HumanoidRootPart.Position = Vector3.new(-551, 22, -186)
    end
})
WorldTab:CreateButton({
    Name = "Teleport MiniMarket",
    Callback = function()
        game.workspace:FindFirstChild(game.Players.LocalPlayer.Name).HumanoidRootPart.Position = Vector3.new(-572, 17, -511)
    end
})
WorldTab:CreateButton({
    Name = "Teleport Bar",
    Callback = function()
        game.workspace:FindFirstChild(game.Players.LocalPlayer.Name).HumanoidRootPart.Position = Vector3.new(-480, 17, -741)
    end
})
WorldTab:CreateButton({
    Name = "Teleport Acid",
    Callback = function()
        game.workspace:FindFirstChild(game.Players.LocalPlayer.Name).HumanoidRootPart.Position = Vector3.new(-80, 17, -827)
    end
})
WorldTab:CreateButton({
    Name = "Teleport Lighthouse",
    Callback = function()
        game.workspace:FindFirstChild(game.Players.LocalPlayer.Name).HumanoidRootPart.Position = Vector3.new(249, 55, -605)
    end
})
WorldTab:CreateButton({
    Name = "Teleport Forest",
    Callback = function()
        game.workspace:FindFirstChild(game.Players.LocalPlayer.Name).HumanoidRootPart.Position = Vector3.new(-30, 21, -21)
    end
})
WorldTab:CreateButton({
    Name = "Teleport Old School",
    Callback = function()
        game.workspace:FindFirstChild(game.Players.LocalPlayer.Name).HumanoidRootPart.Position = Vector3.new(500, 72, -376)
    end
})
WorldTab:CreateButton({
    Name = "Teleport Old Garage",
    Callback = function()
        game.workspace:FindFirstChild(game.Players.LocalPlayer.Name).HumanoidRootPart.Position = Vector3.new(409, 54, 54)
    end
})
WorldTab:CreateButton({
    Name = "Teleport Farm Shed",
    Callback = function()
        game.workspace:FindFirstChild(game.Players.LocalPlayer.Name).HumanoidRootPart.Position = Vector3.new(446, 94, 316)
    end
})
WorldTab:CreateButton({
    Name = "Teleport Lab Outside",
    Callback = function()
        game.workspace:FindFirstChild(game.Players.LocalPlayer.Name).HumanoidRootPart.Position = Vector3.new(477, 29, 330)
    end
})
WorldTab:CreateButton({
    Name = "Teleport Abandoned House",
    Callback = function()
        game.workspace:FindFirstChild(game.Players.LocalPlayer.Name).HumanoidRootPart.Position = Vector3.new(-25, 95, 424)
    end
})
WorldTab:CreateButton({
    Name = "Teleport Code House",
    Callback = function()
        game.workspace:FindFirstChild(game.Players.LocalPlayer.Name).HumanoidRootPart.Position = Vector3.new(-539, 65, 455)
    end
})
WorldTab:CreateButton({
    Name = "Teleport Water Cave",
    Callback = function()
        game.workspace:FindFirstChild(game.Players.LocalPlayer.Name).HumanoidRootPart.Position = Vector3.new(306, -20, -377)
    end
})
WorldTab:CreateButton({
    Name = "Teleport Big Cave",
    Callback = function()
        game.workspace:FindFirstChild(game.Players.LocalPlayer.Name).HumanoidRootPart.Position = Vector3.new(-284, -25, 446)
    end
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
