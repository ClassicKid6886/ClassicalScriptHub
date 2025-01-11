local player = game.Players.LocalPlayer
local humanoidRootPart = player.Character.HumanoidRootPart
print("bruh")

local old = humanoidRootPart.CFrame
workspace.Map.Parent = game:GetService("ReplicatedStorage")
humanoidRootPart.Anchored = true
local Item_upvr = game.ReplicatedStorage.Events.Item

-- Function to calculate the distance between two points
local function calculateDistance(pointA, pointB)
    return (pointA - pointB).Magnitude
end

-- Collect all tools and sort them by distance from the player
local tools = {}
for i, v in ipairs(workspace.Items:GetChildren()) do
    if v:IsA("Tool") and v:FindFirstChild("Handle") and not v.Parent:IsA("Backpack") then
        table.insert(tools, v)
    end
end

table.sort(tools, function(a, b)
    return calculateDistance(a.Handle.Position, humanoidRootPart.Position) < calculateDistance(b.Handle.Position, humanoidRootPart.Position)
end)

local function safeTeleportToTool(tool)
    local success, message = pcall(function()
        local targetPosition = tool.Handle.Position
        local distance = calculateDistance(targetPosition, humanoidRootPart.Position)

        if distance <= 1000 then
            for step = 1, 10 do
                local stepPosition = (targetPosition - humanoidRootPart.Position) / 5
                humanoidRootPart.CFrame = humanoidRootPart.CFrame + stepPosition
                wait(0.1) -- Adjust the wait time between steps if needed
            end

            humanoidRootPart.CFrame = tool.Handle.CFrame
            Item_upvr:FireServer(tool)
            wait(2) -- Wait for 2 seconds before teleporting to the next item
        else
            print("Skipping tool at position " .. tostring(targetPosition) .. " because it is too far.")
        end
    end)

    if not success then
        print("Error teleporting to tool: " .. message)
    end
end

-- Teleport to each tool
for i, tool in ipairs(tools) do
    safeTeleportToTool(tool)
end

-- Ensure the map always returns to its original state and unanchor the humanoid root part
humanoidRootPart.CFrame = old
humanoidRootPart.Anchored = false
game:GetService("ReplicatedStorage").Map.Parent = workspace
