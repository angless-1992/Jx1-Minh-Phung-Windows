Include("\\script\\header\\taskid.lua")

function main(nItemIdx)
	local eatexp = GetTask(TASK_EVENT2)
	local randomexp = {500000, 1000000, 1500000}
	if(eatexp > 100000000)  then
		Msg2Player("B�n �� �n qu� nhi�u S�c�la, coi ch�ng b� s�u r�ng ��!")
		return 1
	else			
		local i = random(1, 3)
		AddOwnExp(randomexp[i]) 
		SetTask(TASK_EVENT2,eatexp+randomexp[i])
		if(GetTask(TASK_EVENT2) >= 100000000) then
		Msg2Player("B�n �� �n qu� nhi�u S�c�la, coi ch�ng b� s�u r�ng ��!")
		end
		RemoveItem(nItemIdx,1);
	end
end