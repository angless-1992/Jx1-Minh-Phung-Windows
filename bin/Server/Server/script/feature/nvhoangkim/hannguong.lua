Include("\\script\\header\\taskid.lua");
Include("\\script\\feature\\nvhoangkim\\hkhead.lua");
--npc han giang doc dieu tau - han ngu ong
function main(NpcIndex)
	local nTaskValue = GetTask(TASK_NVST);
	local nValue = GetNumber(2,nTaskValue,3);
	if(nValue == 13) then
		Say(14716,1,
		END_TALK.."/nv_501");
	return end
	Talk(1,"","��c c�u h�n giang, t�m nh� ch�nh th�y, ung dung t� t�i!");
end;

function nv_501()
	SetTask(TASK_NVST, SetNumber(2,GetTask(TASK_NVST),3,14));
	AddOwnExp(30000);
	Msg2Player("H�n Giang ��c �i�u T�u b�o b�n ��n n�i tr�ng tr�i (221,182) quy�t ��u v�i �ng ta!")	
	AddNote(2,1,"H�n Giang ��c �i�u T�u b�o b�n ��n n�i tr�ng tr�i (221,182) quy�t ��u v�i �ng ta!");
end

function no()
end;