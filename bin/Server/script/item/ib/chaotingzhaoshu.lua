Include("\\script\\header\\taskid.lua");
function main(nItemIdx)
	if (GetPK() == 0) then
		Say("Hi�n t�i �i�m PK c�a b�n l� 0, kh�ng c�n s� d�ng 'Th� ��c xa tri�u ��nh'", 0);
		Msg2Player("Hi�n t�i �i�m PK c�a b�n l� 0, kh�ng c�n s� d�ng 'Th� ��c xa tri�u ��nh'");
		return 1;
	end;
	RemoveItem(nItemIdx,1);
	SetPK(0);
	Say("B�n s� d�ng <color=yellow>"..GetNameItem(nItemIdx).."<color>, tr� PK b�y gi� c�a ng��i l� 0", 0);
	Msg2Player("B�n s� d�ng <color=yellow>"..GetNameItem(nItemIdx).."<color> tr� PK b�y gi� c�a ng��i l� 0");
	if (GetWorldPos() == 208) then
		SetTask(TASK_DUNGCHUNG3, SetNumber(3,GetTask(TASK_DUNGCHUNG3),3,0));
	end;
end;

function no()
end;