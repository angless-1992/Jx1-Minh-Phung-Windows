Include("\\script\\header\\taskid.lua");

function main(nItemIdx)
	local nValue = GetTask(TASK_RESET);
	local nUsed = GetNumber(1,nValue,9);
	if (nUsed >= 1) then
		Msg2Player("H�m nay c�c h� �� s� d�ng qu� ho�ng kim r�i, c�ng l�c t�ng qu� nhanh c�ng s� b� ph�n t�c d�ng ��. ��i ng�y mai r�i h�y d�ng nh�.")
	return end
	if (GetLevel() < 120) then
		Msg2Player("��ng c�p 120 tr� l�n m�i ���c s� d�ng Qu� Ho�ng Kim.")
	return end
    SetTask(TASK_RESET,SetNumber(1,nValue,9,nUsed+1))
    AddOwnExp(30000000)
    RemoveItem(nItemIdx,1)
end
