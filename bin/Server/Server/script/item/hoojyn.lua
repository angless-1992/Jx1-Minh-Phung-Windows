Include("\\script\\header\\taskid.lua")

function main(nItemIdx)
	local nTaskValue = GetTask(TASK_RESET3);
	local nTask = GetNumber(2,TASK_RESET3,3);
	if (nTask <= 30) then
	local k = random(1,120)
	SetTask(TASK_RESET3,SetNumber(2,GetTask(TASK_RESET3),3,nTask+1));
	if (k >=63) then
	local m = random (5,45)
	n = GetLevel()
	AddOwnExp(n*m*30)
	else
	local m = random (5,45)
	n = GetLevel()
	Earn(n*m*5)
	end
	else
	Talk(1,"","H�m nay �� m� �� 30 C�m nang Ho�ng Kim r�i, ng�y mai h�y m� ti�p")
	end
end 