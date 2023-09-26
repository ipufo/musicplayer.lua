local a = {}
local Player, ReplicatedStorage, Debris = game.Players.LocalPlayer, game.ReplicatedStorage, game.Debris
local storage
-- ye it do stuff :fiery: --
do
    if game.ReplicatedStorage:FindFirstChild('soundstoragestuff') then
        return
    else
        local storagething = Instance.new('Folder', game.ReplicatedStorage)
        storage = storagething
    end
end
function a:playaudio(delay, audioid, startpos)
    if storage:FindFirstChild(tostring(audioid)) then return end
    local sound = Instance.new("Sound")
    sound.Name = "" .. audioid
    sound.Parent = storage
    sound.SoundId = "rbxassetid://" .. audioid
    sound:Play()
    sound.Volume = 0
    local TimePosition
    if TimePosition then
        TimePosition = startpos
    end
    local time = TimePosition or 0
    local notplaying = false
    repeat
        task.wait()
    until sound.TimeLength ~= 0
    task.delay(sound.TimeLength, function() 
        sound:Destroy()
    end)
    task.spawn(function()
        repeat
            game.ReplicatedStorage.Damage11Sans:FireServer(Player.Character.Humanoid, Player.Character.HumanoidRootPart.CFrame, 0, 0, Vector3.new(), 9e99, "rbxassetid://" .. audioid, 1, 10)
            task.wait(delay)
            time += delay
        until not storage:FindFirstChild("" .. audioid) or notplaying
    end)
    function palyeraudio(Sound)
        if Sound:IsA("Sound") and Sound.SoundId == "rbxassetid://" .. audioid and storage:FindFirstChild("" .. audioid) then
            Sound.TimePosition = time
        end
    end
    workspace.Effects.DescendantAdded:Connect(palyeraudio)
end

function a:stopaudios()
    for Index, Sounds in pairs(storage:GetChildren()) do
        Sounds:Destroy()
    end
end

return a
