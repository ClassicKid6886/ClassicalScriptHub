print("Installing Classical Hub for Slap Battles")
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

if game.PlaceId == 9431156611 then
local Window = OrionLib:MakeWindow({Name = "Classical Hub - Slap Royal", HidePremium = false, SaveConfig = true, ConfigFolder = "ClassicHubSlapRoyalConfig"})

local function SendError(Message)
    OrionLib:MakeNotification({
        Name = "Unexpected Error",
        Content = Message,
        Image = "rbxassetid://12472046162",
        Time = 5
    })
end


else
    OrionLib:MakeNotification({
        Name = "Unexpected Error",
        Content = "Classic Hub is not in the right place...",
        Image = "rbxassetid://12472046162",
        Time = 5
    })
end

OrionLib:Init()
