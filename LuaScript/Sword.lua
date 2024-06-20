local v = 0
local v2 = nil

local Level = 1
local monsterkill = 3
local point = 5
local coin = 10

local Level2 = 2
local monsterkill2 = 5
local point2 = 10
local coin2 = 30

local Level3 = 3
local monsterkill3 = 7
local point3 = 20
local coin3 = 50

local Level4 = 4
local monsterkill4 = 1
local point4 = 30
local coin4 = 70

local Level5 = 5
local monsterkill5 = 1
local point5 = 50
local coin5 = 100

local quest1Completed = false -- 퀘스트 1 완료 여부를 추적하기 위한 변수
local quest2Completed = false -- 퀘스트 2 완료 여부를 추적하기 위한 변수
local quest3Completed = false -- 퀘스트 3 완료 여부를 추적하기 위한 변수
local quest4Completed = false -- 퀘스트 4 완료 여부를 추적하기 위한 변수
local quest5Completed = false -- 퀘스트 5 완료 여부를 추적하기 위한 변수

script.Parent.MouseButton1Click:Connect(function()
	script.Parent.Parent.Parent.Mission.Visible = true

	script.Parent.Parent.Parent.Mission:TweenPosition(
		UDim2.new(0.364, 0,0.835, 0),
		"Out",
		"Quad",
		0.5,
		false
	)

	script.Parent.Parent:TweenPosition(
		UDim2.new(0.492, 0,1.2, 0),
		"Out",
		"Quad",
		0.5,
		false
	)

	wait(1)

	script.Parent.Parent.Visible = false
end)

game.ReplicatedStorage.Quest.OnClientEvent:Connect(function(val)
	if script.Parent.Parent.Parent.Mission.Visible == false then
		if val == "A" and not quest1Completed then
			print(v)
			script.Parent.Parent.Visible = true
			v2 = "A"

			script.Parent.Parent:TweenPosition(
				UDim2.new(0.492, 0,0.706, 0),
				"Out",
				"Quad",
				0.5,
				false
			)

			script.Parent.Parent.TextLabel.Text = "저를 도와주실 수 있나요?\n"..Level.." 레벨 몹 "..monsterkill.." 마리를 처치해 주세요!"
			script.Parent.Parent.Parent.Mission.Text = "미션\n"..Level.." 레벨 몹 "..monsterkill.." 마리 처치 ("..v.."/"..monsterkill..") 보상: Point: "..point..", Coin: "..coin
		elseif val == "B" and quest1Completed and not quest2Completed then
			print(v)
			script.Parent.Parent.Visible = true
			v2 = "B"

			script.Parent.Parent:TweenPosition(
				UDim2.new(0.492, 0,0.706, 0),
				"Out",
				"Quad",
				0.5,
				false
			)

			script.Parent.Parent.TextLabel.Text = "저를 도와주실 수 있나요?\n"..Level2.." 레벨 몹 "..monsterkill2.." 마리를 처치해 주세요!"
			script.Parent.Parent.Parent.Mission.Text = "미션\n"..Level2.." 레벨 몹 "..monsterkill2.." 마리 처치 ("..v.."/"..monsterkill2..") 보상: Point: "..point2..", Coin: "..coin2
		elseif val == "C" and quest2Completed and not quest3Completed then
			print(v)
			script.Parent.Parent.Visible = true
			v2 = "C"

			script.Parent.Parent:TweenPosition(
				UDim2.new(0.492, 0,0.706, 0),
				"Out",
				"Quad",
				0.5,
				false
			)

			script.Parent.Parent.TextLabel.Text = "공항 2층에 몬스터들이 출현했어요.\n 2층 올라가는 법을 찾아\n"..Level3.." 레벨 몹 "..monsterkill3.." 마리를 처치해 주세요!"
			script.Parent.Parent.Parent.Mission.Text = "미션\n"..Level3.." 레벨 몹 "..monsterkill3.." 마리 처치 ("..v.."/"..monsterkill3..") 보상: Point: "..point3..", Coin: "..coin3
		elseif val == "D" and quest3Completed and not quest4Completed then
			print(v)
			script.Parent.Parent.Visible = true
			v2 = "D"

			script.Parent.Parent:TweenPosition(
				UDim2.new(0.492, 0,0.706, 0),
				"Out",
				"Quad",
				0.5,
				false
			)

			script.Parent.Parent.TextLabel.Text = "활주로에 보스 몹이 나타났어요!\n "..Level4.." 레벨 보스 몹 "..monsterkill4.." 마리를 처치해 주세요!"
			script.Parent.Parent.Parent.Mission.Text = "미션\n"..Level4.." 레벨 보스 몹 "..monsterkill4.." 마리 처치 ("..v.."/"..monsterkill4..") 보상: Point: "..point4..", Coin: "..coin4
		elseif val == "E" and quest4Completed and not quest5Completed then
			print(v)
			script.Parent.Parent.Visible = true
			v2 = "E"

			script.Parent.Parent:TweenPosition(
				UDim2.new(0.492, 0,0.706, 0),
				"Out",
				"Quad",
				0.5,
				false
			)

			script.Parent.Parent.TextLabel.Text = "마지막 도전을 기다리고 있어요!\n "..Level5.." 레벨 최종 보스 몹 "..monsterkill5.." 마리를 처치해 주세요!"
			script.Parent.Parent.Parent.Mission.Text = "미션\n"..Level5.." 레벨 보스 몹 "..monsterkill5.." 마리 처치 ("..v.."/"..monsterkill5..") 보상: Point: "..point5..", Coin: "..coin5
		end
	end

	if script.Parent.Parent.Parent.Mission.Visible == true then
		if val == tostring(Level) and v2 == "A" then
			v += 1
			script.Parent.Parent.Parent.Mission.Text = "미션\n"..Level.." 레벨 몹 "..monsterkill.." 마리 처치 ("..v.."/"..monsterkill..") 보상: Point: "..point..", Coin: "..coin
			if v >= monsterkill then
				script.Parent.Parent.Parent.Mission.Text = "미션 완료!\n2층으로 올라가보세요!\n보상: Point: "..point..", Coin: "..coin
				quest1Completed = true
				wait(3)

				script.Parent.Parent.Parent.Mission:TweenPosition(
					UDim2.new(0.364, 0,1.2, 0),
					"Out",
					"Quad",
					0.5,
					false
				)

				wait(0.5)

				script.Parent.Parent.Parent.Mission.Visible = false
				v = 0
				game.ReplicatedStorage.Quest:FireServer("Level", coin, point)
			end
		end

		if val == tostring(Level2) and v2 == "B" then
			v += 1
			script.Parent.Parent.Parent.Mission.Text = "미션\n"..Level2.." 레벨 몹 "..monsterkill2.." 마리 처치 ("..v.."/"..monsterkill2..") 보상: Point: "..point2..", Coin: "..coin2
			if v >= monsterkill2 then
				script.Parent.Parent.Parent.Mission.Text = "미션 완료!\n숨겨진 시계를 찾아 발판을 밟아보세요!\n보상: Point: "..point2..", Coin: "..coin2
				quest2Completed = true
				wait(3)

				script.Parent.Parent.Parent.Mission:TweenPosition(
					UDim2.new(0.364, 0,1.2, 0),
					"Out",
					"Quad",
					0.5,
					false
				)

				wait(0.5)

				script.Parent.Parent.Parent.Mission.Visible = false
				v = 0
				game.ReplicatedStorage.Quest:FireServer("Level2", coin2, point2)
			end
		end

		if val == tostring(Level3) and v2 == "C" then
			v += 1
			script.Parent.Parent.Parent.Mission.Text = "미션\n"..Level3.." 레벨 몹 "..monsterkill3.." 마리 처치 ("..v.."/"..monsterkill3..") 보상: Point: "..point3..", Coin: "..coin3
			if v >= monsterkill3 then
				script.Parent.Parent.Parent.Mission.Text = "미션 완료!\n보상: Point: "..point3..", Coin: "..coin3
				quest3Completed = true
				wait(3)

				script.Parent.Parent.Parent.Mission:TweenPosition(
					UDim2.new(0.364, 0,1.2, 0),
					"Out",
					"Quad",
					0.5,
					false
				)

				wait(0.5)

				script.Parent.Parent.Parent.Mission.Visible = false
				v = 0
				game.ReplicatedStorage.Quest:FireServer("Level3", coin3, point3)
			end
		end

		if val == tostring(Level4) and v2 == "D" then
			v += 1
			script.Parent.Parent.Parent.Mission.Text = "미션\n"..Level4.." 레벨 보스 몹 "..monsterkill4.." 마리 처치 ("..v.."/"..monsterkill4..") 보상: Point: "..point4..", Coin: "..coin4
			if v >= monsterkill4 then
				script.Parent.Parent.Parent.Mission.Text = "미션 완료!\n 바로 앞에 보이는 npc에게 가보세요!\n보상: Point: "..point4..", Coin: "..coin4
				quest4Completed = true
				wait(3)

				script.Parent.Parent.Parent.Mission:TweenPosition(
					UDim2.new(0.364, 0,1.2, 0),
					"Out",
					"Quad",
					0.5,
					false
				)

				wait(0.5)

				script.Parent.Parent.Parent.Mission.Visible = false
				v = 0
				game.ReplicatedStorage.Quest:FireServer("Level4", coin4, point4)
			end
		end

		if val == tostring(Level5) and v2 == "E" then
			v += 1
			script.Parent.Parent.Parent.Mission.Text = "미션\n"..Level5.." 레벨 최종 보스 몹 "..monsterkill5.." 마리 처치 ("..v.."/"..monsterkill5..") 보상: Point: "..point5..", Coin: "..coin5
			if v >= monsterkill5 then
				script.Parent.Parent.Parent.Mission.Text = "미션 완료!\n 축하합니다! 모든 퀘스트를 완료했습니다!\n보상: Point: "..point5..", Coin: "..coin5
				quest5Completed = true
				wait(3)

				script.Parent.Parent.Parent.Mission:TweenPosition(
					UDim2.new(0.364, 0,1.2, 0),
					"Out",
					"Quad",
					0.5,
					false
				)

				wait(0.5)

				script.Parent.Parent.Parent.Mission.Visible = false
				v = 0
				game.ReplicatedStorage.Quest:FireServer("Level5", coin5, point5)
			end
		end
	end
end)

script.Parent.Parent.Parent.Mission.Butten.MouseButton1Click:Connect(function()
	script.Parent.Parent.Parent.Mission:TweenPosition(
		UDim2.new(0.364, 0,1.2, 0),
		"Out",
		"Quad",
		0.5,	
		false
	)

	wait(1)

	script.Parent.Parent.Parent.Mission.Visible = false

	v = 0
end)
