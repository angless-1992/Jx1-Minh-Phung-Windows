--hoangnhk
Include("\\script\\header\\taskid.lua");

function main(nItemIdx)
	if(RemoveItem(nItemIdx,1)==1)then
	local nTaskValue = GetTask(TASK_THITTUOI);
	nTaskValue = nTaskValue + 1;
	SetTask(TASK_THITTUOI, nTaskValue);	
	local nTask = GetNumber(2,GetTask(TASK_DUNGCHUNG2),4);
	if (nTaskValue == 1) and (nTask == 0 ) then
		Msg2Player("B�n c� th� ��n c�c V� s� � c�c T�n Th� Th�n nh�n 1 v�i nhi�m v� mua b�n th�t t��i.")
	elseif (nTask ~= 0 ) then
		if (nTask == nTaskValue) then
			Msg2Player("B�n �� nh�n ���c �� th�t t��i, c� th� tr� v� t�m V� s� giao nhi�m v�.")
		end
	end
	end;
end