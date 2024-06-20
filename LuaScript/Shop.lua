local ReplicatedStorage = game:GetService("ReplicatedStorage")
local healPlayerEvent = Instance.new("RemoteEvent")
healPlayerEvent.Name = "HealPlayer"
healPlayerEvent.Parent = ReplicatedStorage

healPlayerEvent.OnServerEvent:Connect(function(player)
	local character = player.Character or player.CharacterAdded:Wait()
	local humanoid = character:FindFirstChild("Humanoid")
	if humanoid then
		humanoid.Health = math.min(humanoid.MaxHealth, humanoid.Health + 30) -- 50만큼 체력 회복
	end
end)