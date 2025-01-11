print("Installing Classical Hub for Slap Battles")
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

if game.PlaceId == 9431156611 then

OrionLib:MakeNotification({
    Name = "Loading...",
    Content = "Classic Hub is loading. This will only take a moment...",
    Image = "rbxassetid://12472046162",
    Time = 5
})

--loadstring(game:HttpGet(('')))()

local GoToItemsFunction = loadstring(game:HttpGet(('https://github.com/ClassicKid6886/ClassicalScriptHub/raw/refs/heads/SlapRoyal/GoToItems.lua')))()

local function SendError(Message)
    OrionLib:MakeNotification({
        Name = "Unexpected Error",
        Content = Message,
        Image = "rbxassetid://12472046162",
        Time = 5
    })
end

local Window = OrionLib:MakeWindow({Name = "Classical Hub - Slap Royal", HidePremium = false, IntroText = "Welcome to Classical Hub - Slap Royal", SaveConfig = true, ConfigFolder = "ClassicHubSlapRoyalConfig"})

local ExtraTab = Window:MakeTab({
	Name = "Extra",
	Icon = "rbxassetid://10696045527",
	PremiumOnly = false
})

ExtraTab:AddButton({
	Name = "Go To Items",
	Callback = function()
      		GoToItemsFunction()
  	end    
})



else
    OrionLib:MakeNotification({
        Name = "Unexpected Error",
        Content = "Classic Hub is not in the right place...",
        Image = "rbxassetid://12472046162",
        Time = 5
    })
end

OrionLib:Init()
