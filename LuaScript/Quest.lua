game.ReplicatedStorage.Quest.OnServerEvent:Connect(function(plr, value, coin, point)
	if value == "Level" then
		if plr.Values:FindFirstChild("Point") then
			plr.Values.Point.Value += point
		end
		plr.leaderstats.Coin.Value += coin
	end
	if value == "Level2" then
		if plr.Values:FindFirstChild("Point") then
			plr.Values.Point.Value += point
		end
		plr.leaderstats.Coin.Value += coin
	end
	if value == "Level3" then
		if plr.Values:FindFirstChild("Point") then
			plr.Values.Point.Value += point
		end
		plr.leaderstats.Coin.Value += coin
	end
	if value == "Level4" then
		if plr.Values:FindFirstChild("Point") then
			plr.Values.Point.Value += point
		end
		plr.leaderstats.Coin.Value += coin
	end
	if value == "Level5" then
		if plr.Values:FindFirstChild("Point") then
			plr.Values.Point.Value += point
		end
		plr.leaderstats.Coin.Value += coin
	end
end)