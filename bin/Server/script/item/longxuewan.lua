Include("\\script\\header\\taskid.lua");

function main(sel)
	if (GetLevel() < 90) then
		Talk(1,"","Ng��i ch�i ph�i c�p 90 tr� l�n v� �� n�p th� m�i s� d�ng ���c");
	return end;

	local nTotalTask = GetTask(TASK_RESET3);
	local nTaskValue = GetNumber(1,nTotalTask,7);	
	if(nTaskValue >= 2) then
		Msg2Player("M�i ng�y m�i ng��i ch� ���c s� dung 2 Long Huy�t Ho�n");
	return end;
	SetTask(TASK_RESET3, SetNumber(1,nTotalTask, 7, nTaskValue+1))
	nTotalTask = GetTask(TASK_RESET);
	nTaskValue = GetNumber(1,nTotalTask,4);
	SetTask(TASK_RESET, SetNumber(1,nTotalTask, 4, nTaskValue+1))
	Talk(1,"","Thu ���c th�m c� h�i 1 l�n tham gia ho�t ��ng <th�ch ��u th�i gian>!");
	RemoveItem(sel,1);
end