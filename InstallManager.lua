local storageLink = "https://raw.githubusercontent.com/ClassicKid6886/ClassicalScriptHub/refs/heads/Storage/InstallStorage.lua"

local success, InstallStorage = pcall(function()
    return loadstring(game:HttpGet(storageLink, true))()
end)

if success and type(InstallStorage) == "table" then
    local placeId = game.PlaceId
    local installLink = nil

    for _, scriptInfo in ipairs(InstallStorage) do
        if scriptInfo.id == placeId then
            installLink = scriptInfo.link
            break
        end
    end

    if installLink then
        local success, err = pcall(function()
            loadstring(game:HttpGet(installLink, true))()
        end)
        if success then
            print("Script successfully installed.")
        else
            warn("Failed to install script: " .. err)
        end
    else
        warn("No script found for this PlaceId.")
    end
else
    warn("Failed to fetch InstallStorage.")
end
