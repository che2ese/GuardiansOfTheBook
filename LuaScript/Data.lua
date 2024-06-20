local dataStoreService = game:GetService("DataStoreService")
local dataStore = dataStoreService:GetDataStore("StatData")

game.Players.PlayerAdded:Connect(function(plr)
	local Values = plr:WaitForChild("Values")
	
	local SpeedBoost = Instance.new("IntValue")
	SpeedBoost.Name = "SpeedBoost"
	SpeedBoost.Value = 0
	SpeedBoost.Parent = Values

	local CoinBoost = Instance.new("IntValue")
	CoinBoost.Name = "CoinBoost"
	CoinBoost.Value = 0
	CoinBoost.Parent = Values

	local PowerBoost = Instance.new("IntValue")
	PowerBoost.Name = "PowerBoost"
	PowerBoost.Value = 0
	PowerBoost.Parent = Values
	
	local HPBoost = Instance.new("IntValue")
	HPBoost.Name = "HPBoost"
	HPBoost.Value = 0
	HPBoost.Parent = Values

	local Point = Instance.new("IntValue")
	Point.Name = "Point"
	Point.Value = 0
	Point.Parent = Values
	
	local s, e = pcall(function()
		local data = dataStore:GetAsync(plr.UserId)

		if data ~= nil then
			SpeedBoost.Value = data[1]
			CoinBoost.Value = data[2]
			PowerBoost.Value = data[3]
			Point.Value = data[4]
			HPBoost.Value = data[5]
		end
	end)
end)

game.Players.PlayerRemoving:Connect(function(plr)
	local save = {
		plr.Values.SpeedBoost.Value,
		plr.Values.CoinBoost.Value,
		plr.Values.PowerBoost.Value,
		plr.Values.Point.Value,
		plr.Values.HPBoost.Value
	}

	local s, e = pcall(function()
		dataStore:SetAsync(plr.UserId, save)
	end)
end)