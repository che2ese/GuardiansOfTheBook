local damage = 7 --몬스터의 데미지
local damagecool = 3 --플레이어에게 데미지를 입힌 후, 다시 데미지 입히기전 쿨타임

local value = false

for i, v in pairs(script.Parent:GetChildren()) do --몬스터안에 파트 구하기
	if v.ClassName == "MeshPart" or v.ClassName == "Part" then --파트라면(휴머노이드나 아이템 제외하기 위해)
		v.Touched:Connect(function(hit) --파트에 무언가 닿이면
			local h = hit.Parent:FindFirstChild("Humanoid") --플레이어인지 확인

			if value == false and h and script.Parent.mob.Health > 0 then --조건 확인
				value = true
				h:TakeDamage(damage) --플레이어에게 데미지 입힘 
				wait(damagecool) --damagecool 만큼 기다림
				value = false
			end
		end)
	end
end