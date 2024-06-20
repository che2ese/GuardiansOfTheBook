local skillName = "Lightning" -- 스킬 파트 이름
local skillName2 = "Lightning2" -- 스킬 파트 이름2
local Sound = "Lightning" -- 적용할 사운드 이름
local CoolTime = 20 -- 스킬 재사용 대기시간
local Damage = 40 -- 스킬 데미지
local DamageCoolTime = 1 -- 스킬 데미지 쿨타임
local Delete = 2 -- 초를 기다리고 스킬 삭제

local ser = game:GetService("Debris")
local skill = game.ReplicatedStorage.Skill:FindFirstChild(skillName) -- 스킬 찾기
local skill2 = game.ReplicatedStorage.Skill:FindFirstChild(skillName2) -- 스킬 찾기2
local Cooldown = true
local DamageCool = false

script.Parent.SkillEvent.OnServerEvent:Connect(function(plr, X, Y, Z, Target) -- 플레이어가 스킬을 클릭하면
	if Cooldown == true then
		Cooldown = false

		local clone = skill:Clone() -- 스킬 복사
		clone.Parent = game.Workspace.SkillPart -- 스킬 적용
		clone.Position = Vector3.new(X, (Y + 23), Z) -- 스킬을 플레이어 클릭자리로 이동

		local clone2 = skill2:Clone() -- 스킬 복사2
		clone2.Parent = game.Workspace.SkillPart -- 스킬 적용2
		clone2.Position = Vector3.new(X, (Y + 10), Z) -- 스킬을 플레이어 클릭자리로 이동

		local function handleHit(hit)
			local mob = hit.Parent:FindFirstChild("mob") -- 몬스터 찾기

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
		end

		clone.Touched:Connect(handleHit)
		clone2.Touched:Connect(handleHit)

		script.Parent.Handle:FindFirstChild(Sound):Play() -- 오디오 틀기

		local bomb = game.ReplicatedStorage.Skill.Light:Clone()
		bomb.Parent = game.Workspace.SkillPart
		bomb.Position = clone2.Position + Vector3.new(0, -8, 0)

		script.Parent.SkillEvent:FireClient(plr)

		wait(Delete) -- 초뒤에 스킬 파트 삭제

		bomb:Destroy()

		while clone.Transparency <= 1 do -- 스킬 사라짐 효과
			clone.Transparency = clone.Transparency + 0.1
			wait()
		end

		while bomb.Transparency <= 1 do -- 스킬 사라짐 효과
			bomb.Transparency = bomb.Transparency + 0.1
			wait()
		end

		while clone2.Transparency <= 1 do -- 스킬 사라짐 효과
			clone2.Transparency = clone2.Transparency + 0.1
			wait()
		end

		clone:Destroy() -- 스킬파트 삭제
		clone2:Destroy() -- 스킬파트 삭제

		wait(CoolTime) -- 스킬 쿨타임 기다리기
		Cooldown = true
	end
end) -- 끝
