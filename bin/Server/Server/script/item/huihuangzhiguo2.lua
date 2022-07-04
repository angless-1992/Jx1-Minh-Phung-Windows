Include("\\script\\event\\demhuyhoang\\event.lua");
Include("\\script\\header\\taskid.lua");

function main(nItemIdx)
	if (GetLevel() < 90) then
		Talk(1,"","B�n ch� c� th� �n qu� Huy ho�ng S� c�p.")
		return
	elseif (GetLevel() >= 120) then
		Talk(1,"","B�n ch� c� th� �n qu� Huy ho�ng Cao c�p.")
		return
	end
	local nValue = GetTask(TASK_RESET);
	local nUsed = GetNumber(1,nValue,1);
	if (nUsed >= MAX_HUYHOANG_PER_DAY) then
		Msg2Player(format("H�m nay b�n �� �n %d qu� Huy ho�ng, v� c�ng th�ng ti�n qu� nhanh d� g�y t�c d�ng ph�n ngh�ch, ng�y mai h�y ti�p t�c v�y.",MAX_HUYHOANG_PER_DAY))
	return end
    SetTask(TASK_RESET,SetNumber(1,nValue,1,nUsed+1))
    AddOwnExp(2000000)
    RemoveItem(nItemIdx,1)
end

