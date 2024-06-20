local basespeed = 16
local basehp = 100

game.Players.PlayerAdded:Connect(function(plr)
	plr.CharacterAdded:Connect(function(char)
		local speed = plr.Character.Humanoid.WalkSpeed + (plr.Values.SpeedBoost.Value / 100)
		plr.Character.Humanoid.WalkSpeed = speed
		plr.Character.Humanoid.MaxHealth = plr.Character.Humanoid.MaxHealth + (plr.Values.HPBoost.Value * 10)
		plr.Character.Humanoid.Health = plr.Character.Humanoid.Health + (plr.Values.HPBoost.Value * 10)
	end)
end)

game.ReplicatedStorage.StatsPoint.OnServerEvent:Connect(function(plr, value)
	local point = plr.Values.Point
	local value = plr.Values:FindFirstChild(value)
	
	if value and point.Value >= 1 and value.Value < 50 then
		value.Value += 1
		point.Value -= 1
		
		if value.Name == "SpeedBoost" then
			local speed = basespeed + (plr.Values.SpeedBoost.Value / 100)
			plr.Character.Humanoid.WalkSpeed = speed
		end
		
		if value.Name == "HPBoost" then
			local hp = basehp + (plr.Values.HPBoost.Value * 10)
			plr.Character.Humanoid.MaxHealth = hp
		end
	end
end)
