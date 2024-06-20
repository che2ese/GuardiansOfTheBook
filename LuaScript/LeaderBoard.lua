local dataStoreService = game:GetService("DataStoreService")
local dataStore = dataStoreService:GetDataStore("BaseStats")

local ExpName = "Exp"
local LevelName = "Level"
local CoinName = "Money"

game.Players.PlayerAdded:Connect(function(plr)
	local leader = Instance.new("IntValue")
	leader.Name = "leaderstats"
	leader.Parent = plr

	local Values = Instance.new("IntValue")
	Values.Name = "Values"
	Values.Parent = plr

	local Level = Instance.new("IntValue")
	Level.Name = LevelName
	Level.Value = 1
	Level.Parent = Values

	local Exp = Instance.new("IntValue")
	Exp.Name = ExpName
	Exp.Value = 0
	Exp.Parent = Values

	local Coin = Instance.new("IntValue")
	Coin.Name = CoinName
	Coin.Value = 0
	Coin.Parent = leader
	
	local s, e = pcall(function()
		local data = dataStore:GetAsync(plr.UserId)
		
		if data ~= nil then
			Level.Value = data[1]
			Exp.Value = data[2]
			Coin.Value = data[3]
		end
	end)
	
	plr:WaitForChild("Values").Exp.Changed:Connect(function()
		local Maxexp = plr.Values[LevelName].Value * 9

		if plr.Values[ExpName].Value >= Maxexp and plr.Values[LevelName].Value <= 100 then --최대 레벨을 바꿀려면 100을 변경하세요
			plr.Values[ExpName].Value = 0
			plr.leaderstats[CoinName].Value += plr.Values[LevelName].Value * 50
			plr.Values[LevelName].Value += 1
			plr.Values:WaitForChild("Point").Value += 3
		end
	end)
end)

game.Players.PlayerRemoving:Connect(function(plr)
	local save = {
		plr.Values[LevelName].Value,
		plr.Values[ExpName].Value,
		plr.leaderstats[CoinName].Value
	}
	
	local s, e = pcall(function()
		dataStore:SetAsync(plr.UserId, save)
	end)
end)

if not game:GetService("RunService"):IsStudio() then
	game:BindToClose(function()
		local Player = game.Players:GetPlayers()
		
		if Player <= 1 then
			return
		end

		for i, v in pairs(Player) do
			local save = {
				v.Values[LevelName].Value,
				v.Values[ExpName].Value,
				v.leaderstats[CoinName].Value
			}

			dataStore:SetAsync(v.UserId, save)
			wait(5)
		end
	end)
end