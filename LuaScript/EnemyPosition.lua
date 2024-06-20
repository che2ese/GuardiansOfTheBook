local reposition = script.Parent.HumanoidRootPart.Position + Vector3.new(0, 3, 0) --자신의 처음 위치를 기억

local value = false
local value2 = false

local rangevalue = 10 --플레이어 탐색 범위
local walkvalue = 10 --방황 범위
local walktime = 2 --방황 후 서 있을 시간


local mob = script.Parent
local anim = mob.mob:LoadAnimation(script.Parent.WalkAnimation)

function plrtarget(pos) --함수 선언
	local rootpart
	local range = rangevalue --범위 설정
	
	for i, v in pairs(game.Workspace:children()) do --존재하는 모든 파트를 구하기
		local plr = v
		
		if plr.ClassName == "Model" and plr ~= script.Parent then -- 존재하는 모든 파트중 모델이고 몬스터자신이 아닌 것을 고름
			
			local RP = plr:findFirstChild("HumanoidRootPart") --그중 루트파트를 찾음
			local h = plr:findFirstChild("Humanoid")--그중 휴머노이드를 찾음
			
			if RP and h and h.Health > 0 then --플레이어이고 체력이 0 이상이라면
				if (RP.Position - pos).magnitude < range then --범위 체크하기
					rootpart = RP
					range = (RP.Position - pos).magnitude --범위 값을 정리
				end
			end
		end
	end
	
	return rootpart --범위 값을 보냄
end

wait(1) -- 1초 기다리기
anim:Play() --애니메이션 플레이

game:GetService("RunService").Heartbeat:Connect(function() --아주 빠르게 계속 반복
	local target = plrtarget(script.Parent.HumanoidRootPart.Position) --범위 값을 받음
	
	if target ~= nil then --범위안에 플레이어가 있으면
		if value == false then
			value = true
			anim:Play() --애니메이션 플레이
		end
		
		mob.mob:MoveTo(target.Position) --플레이어 따라가기
	elseif target == nil then --범위 안에 없으면
		if value == false and value2 == false then
			value2 = true

			while true do --반복
				if value == true then --범위 안 플레이어가 있으면
					break --반복문 중지
				end
				
				local random = math.random(-walkvalue, walkvalue) --랜덤 위치 고르기
				local random2 = math.random(-walkvalue, walkvalue) --랜덤 위치 고르기2
				
				mob.mob:MoveTo(reposition + Vector3.new(random, 0, random2)) --랜덤 위치로 이동 (방황)
				mob.mob.MoveToFinished:Wait() --위치에 이동하면
				anim:Stop() --애니메이션 멈춤
				wait(walktime) --walktime초동안 기다림
				anim:Play() --다시 애니메이션 플레이
			end
			
			value2 = false
		elseif value == true and value2 == false then --플레이어를 따라가다가 플레이어가 범위 밖으로 나가면
			mob.mob:MoveTo(reposition) --다시 원위치로 이동
			wait(walktime) --walktime초동안 기다림
			value = false
		end
	end
end)