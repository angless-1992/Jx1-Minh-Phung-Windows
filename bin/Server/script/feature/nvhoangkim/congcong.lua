Include("\\script\\header\\taskid.lua");
Include("\\script\\feature\\nvhoangkim\\hkhead.lua");
--npc thai cong cong
function main(NpcIndex)
	local nTaskValue = GetTask(TASK_NVST);
	local nValue = GetNumber(2,nTaskValue,4);
	if(nValue == 2) then
		Say(10674,1,
		END_TALK.."/nv_201");
	return end
	if(nValue == 4 and GetItemCount(0,4,503)>0) then
		Say(10704,1,
		END_TALK.."/nv_202");
	return end
	Talk(1,"",10675);
end;

function nv_201()
	SetTask(TASK_NVST, SetNumber(2,GetTask(TASK_NVST),4,3));
	Msg2Player("�i l�n Ph�c Ng�u S�n ��ng t�m Kim ph�t.")
	AddNote(3,1,"Th�i c�ng c�ng n�i b�n �i Ph�c Ng�u s�n ��nh b�i Ti�u K� Nhi (226,205)");
end

function nv_202()
	if(DelItem(1,0,4,503)==1) then
	SetTask(TASK_NVST, SetNumber(2,GetTask(TASK_NVST),4,5));
	Msg2Player("B�n nh�n ���c 1 b�nh Thi�n H��ng Ng�c Chi Cao. Mang v� cho V�n Nhi.")
	end
end

function no()
end;