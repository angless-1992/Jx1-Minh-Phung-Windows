Include("\\script\\header\\taskid.lua");
function main()
	local nTaskValue = GetTask(TASK_NVDANHVONG2);
	local nTask = GetNumber(1,nTaskValue,8);
	if(nTask == 2) then
		SetTask(TASK_NVDANHVONG2, SetNumber(1,nTaskValue,8,3));
		if(GetSex() == 0) then
		AddItemID(AddItem(0,0,5,0,1,3,0,0))
		else
		AddItemID(AddItem(0,0,5,2,1,3,0,0))
		end
		AddRepute(6)
		Msg2Player("Ho�n th�nh nhi�m v�. H�ng Mai r�t c�m k�ch tr��c ngh�a c� c�a b�n.")
		Msg2Player("B�n nh�n ���c 1 ��i h�i.")
		Msg2Player("Thanh th� giang h� c�a b�n t�ng th�m 6 �i�m.")
		Talk(1,"",12936)
	else
	Talk(1,"",12937)
	end
end
