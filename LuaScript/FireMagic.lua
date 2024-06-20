local skillName = "Fire" -- 스킬 파트 이름
local Sound = "fire" -- 적용할 사운드 이름 (추천)
local Sound2 = "Bomb" -- 적용할 사운드 이름 (추천)
local CoolTime = 10 -- 스킬 재사용 대기시간
local Damage = 20 -- 스킬 데미지
local DamageCoolTime = 1 -- 스킬 데미지 쿨타임 (추천)
local Delete = 0.2 -- 초를 기다리고 스킬 삭제 (추천)
local Ammo = 5 -- 날라갈 탄 갯수 (고정)

local ser = game:GetService("Debris")
local tweenService = game:GetService("TweenService")
local skill = game.ReplicatedStorage.Skill:FindFirstChild(skillName) -- 스킬 찾기
local Cooldown = true
local DamageCool = false

function tween(X, Y, Z, clone)
	local Posi = {Position = Vector3.new(X, Y, Z)}

	local info = TweenInfo.new(
		0.2,
		Enum.EasingStyle.Linear,
		Enum.EasingDirection.Out,
		0,
		false
	)

	local tween = tweenService:Create(clone, info, Posi)
	tween:Play()
end

script.Parent.SkillEvent.OnServerEvent:Connect(function(plr, X, Y, Z, Target) -- 플레이어가 스킬을 클릭하면
	if Cooldown == true then
		if Ammo > 0 then
			Ammo -= 1
			local clone = skill:Clone() -- 스킬 복사
			clone.Parent = game.Workspace.SkillPart -- 스킬 적용
			clone.Orientation = script.Parent.Handle.Orientation
			clone.Position = script.Parent.Handle.Position

			clone.Touched:Connect(function(hit) -- 무언가 스킬에 닿으면
				local mob = hit.Parent:FindFirstChild("mob") -- 몬스터 찾기

				if hit ~= script.Parent.Handle then
					local bomb = game.ReplicatedStorage.Skill.Explosion2:Clone()
					bomb.Parent = game.Workspace.SkillPart
					bomb.Position = Vector3.new(clone.Position.X, clone.Position.Y, clone.Position.Z)

					ser:AddItem(bomb, 0.2)
					ser:AddItem(clone, Delete)
				end

				if mob ~= nil and mob.Health > 0 then -- 몬스터가 맞고 체력이 0 이상이면
					if not DamageCool then
						DamageCool = true
						mob:TakeDamage(Damage) -- 몬스터에게 데미지 입히기

						if mob.Health <= 0 then -- 몬스터가 죽었을 때
							game.ReplicatedStorage:WaitForChild("Quest"):FireClient(plr, hit.Parent.Name) -- 퀘스트에 영향을 주는 클라이언트 이벤트 발생
						end

						wait(DamageCoolTime) -- 스킬 데미지 쿨타임 기다리기
						DamageCool = false
					end
				end
			end) -- 끝

			tween(X, Y, Z, clone)
			script.Parent.Handle:FindFirstChild(Sound):Play() -- 오디오 틀기

		elseif Ammo == 0 then -- 탄환이 0이 되면
			Cooldown = false
			Ammo = 5 -- 다시 탄환 충전
			wait(CoolTime) -- 쿨타임
			Cooldown = true
		end
	end
end) -- 끝
