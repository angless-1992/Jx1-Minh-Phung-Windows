--hoangnhk
Include("\\script\\header\\taskid.lua");
Include("\\script\\feature\\nvhoangkim\\hkhead.lua");
function main(NpcIndex)
	local nTaskValue = GetTask(TASK_NVST);
	local nValue = GetNumber(2,nTaskValue,2);
	if(nValue == 9) then
	Say(10430,1,
		END_TALK.."/nv_401");
	return end
	Talk(1,"",10429);
end;

function nv_401()
	SetTask(TASK_NVST, SetNumber(2,GetTask(TASK_NVST),2,10));
	AddOwnExp(15000);
	Msg2Player("B�n l�n Ph�c Ng�u S�n T�y t�m T� �ao Hi�p.")
	AddNote(1,1,"H� V� Th� n�i b�n �i h� s�t T� �ao Hi�p hi�n �ang � Ph�c Ng�u S�n T�y (244,187)");
end;

function no()
end;