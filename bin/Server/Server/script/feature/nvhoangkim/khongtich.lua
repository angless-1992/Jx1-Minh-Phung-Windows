Include("\\script\\header\\taskid.lua");
Include("\\script\\feature\\nvhoangkim\\hkhead.lua");
--npc khong tich dai su
function main(NpcIndex)
	local nTaskValue = GetTask(TASK_NVST);
	local nValue = GetNumber(2,nTaskValue,3);
	if(nValue == 17) then
		Say(14744,1,
		END_TALK.."/nv_601");
	return end
	Talk(1,"","Nh�n qu� tr�n ��i �� ��nh s�n. A Di �� Ph�t!");
end;

function nv_601()
	SetTask(TASK_NVST, SetNumber(2,GetTask(TASK_NVST),3,18));
	AddOwnExp(50000);
	Msg2Player("Kh�ng T�ch Th�n T�ng b�o b�n ra ngo�i th�nh th� s�c v�i �ng ta (182,177)")
	AddNote(2,1,"Kh�ng T�ch Th�n T�ng b�o b�n ra ngo�i th�nh th� s�c v�i �ng ta (182,177)");
end

function no()
end;