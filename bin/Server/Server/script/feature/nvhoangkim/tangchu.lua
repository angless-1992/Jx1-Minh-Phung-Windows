Include("\\script\\header\\taskid.lua");
Include("\\script\\feature\\nvhoangkim\\hkhead.lua");
--npc tang chu
function main(NpcIndex)
	local nTaskValue = GetTask(TASK_NVST);
	local nValue = GetNumber(2,nTaskValue,4);
	if(nValue == 11) then
		Say(10849,1,
		END_TALK.."/nv_304");
	return end
	Talk(1,"","Kh�ng bi�t con trai ta b�y gi� sao r�i, c� ���c b�nh an v� s� kh�ng...");
end;

function nv_304()
	SetTask(TASK_NVST, SetNumber(2,GetTask(TASK_NVST),4,12));
	Msg2Player("Quay v� t�m Ph� L�i Th� h�i th�m.");
	Talk(1,"",10850);
end

function no()
end;