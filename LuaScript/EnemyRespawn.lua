local mob = script.Parent
local humanoid = mob.mob

local clone = script.Parent:Clone() --몬스터 복사
local reposition = script.Parent.HumanoidRootPart.Position + Vector3.new(0, 3, 0) --몬스터가 죽었을때 리스폰시킬 위치

local respwantime = 3 --몬스터가 죽으면, 다시 환생하기전 쿨타임

humanoid:GetPropertyChangedSignal("Health"):Connect(function() --몬스터의 체력구하기
	if humanoid.Health <= 0 then --체력이 0이면
		wait(respwantime) --respwantime만큼 기다림
		clone.Parent = game.Workspace
		clone:MoveTo(reposition) --reposition로 이동

		script.Parent:Destroy() --죽은 몬스터는 삭제
	end
end)