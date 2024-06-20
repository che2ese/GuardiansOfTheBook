local walkspeed = 13 --몬스터의 속도 
local maxhealth = 100 --몬스터의 최대 HP
local health = 100 --몬스터의 HP

local mob = script.Parent --몬스터 구하기
local humanoid = mob.mob --몬스터의 휴머노이드 구하기

humanoid.WalkSpeed = walkspeed --휴머노이드의 스피드 정하기
humanoid.MaxHealth = maxhealth --휴머노이드의 MAX HP 정하기
humanoid.Health = health --휴머노이드의 HP 정하기