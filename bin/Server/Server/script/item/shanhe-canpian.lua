Include("\\script\\header\\taskid.lua")

function main(nItemIdx)
	local nWorldMaps = GetTask(TASK_SHXT);
	local _,detail = FindItemEx(nItemIdx);
	if (detail == 439) then
		nWorldMaps = nWorldMaps + 100;
		SetTask(TASK_SHXT,nWorldMaps);
		Msg2Player("B�n nh�n ���c 100 m�nh b�n �� S�n H� X� T�c! Hi�n t�i b�n c� t�ng c�ng "..nWorldMaps.." m�nh b�n �� S�n H� X� T�c.");
	elseif (detail == 2523) then
		nWorldMaps = nWorldMaps + 1000;
		SetTask(TASK_SHXT,nWorldMaps);
		Msg2Player("��i hi�p nh�n ���c 1000 m�nh b�n �� s�n h� x� t�c! T�ng c�ng c� "..nWorldMaps.." m�nh b�n �� S�n H� X� T�c.");
	end
	RemoveItem(nItemIdx,1);
end
