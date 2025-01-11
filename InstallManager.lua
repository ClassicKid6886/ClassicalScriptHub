local InstallStorage = loadstring(game:HttpGet("https://raw.githubusercontent.com/ClassicKid6886/ClassicalScriptHub/refs/heads/Storage/InstallStorage.lua"))()
local placeId = game.PlaceId

local loadString
for _, i in pairs(InstallStorage) do
  if i.id == placeId then
    loadString = i.link
    break
  end
end

if loadString then
  local scriptContent = game:HttpGet(loadString)
  loadstring(scriptContent)()
else
  warn("No matching script found for this PlaceId.")
end
