Include("\\script\\header\\taskid.lua");
Include("\\script\\feature\\nvhoangkim\\hkhead.lua");
--npc Dao thach mon
function main(NpcIndex)
	local nTaskValue = GetTask(TASK_NVST);
	local nValue = GetNumber(2,nTaskValue,4);
	if(nValue == 13) then
		Say(10874,1,
		END_TALK.."/nv_40");
	return end
	if(nValue == 14 and GetLevel() >= 40) then
		nv_401();
	return end
	if(nValue == 16 and GetItemCount(0,4,199)>0) then
		Say(10877,1,
		END_TALK.."/done40");
	return end
	Talk(1,"",14933);
end;

function nv_40()
	SetTask(TASK_NVST, SetNumber(2,GetTask(TASK_NVST),4,14));
	if(GetLevel() >= 40) then
		nv_401();
	else
		Talk(1,"",10875);
	end
end

function nv_401()
	SetTask(TASK_NVST, SetNumber(2,GetTask(TASK_NVST),4,15));
	Say(10876,1,
		END_TALK.."/no");
	Msg2Player("�i Th�c C��ng S�n t�m Ti�u V� Th��ng");
	AddNote(3,1,"��o Th�ch M�n nh� b�n h� s�t Ti�u V� Th��ng � Th�c C��ng S�n (243,200)");
end

function done40()
	if(DelItem(1,0,4,199)==1) then
	SetTask(TASK_NVST, SetNumber(2,GetTask(TASK_NVST),4,17));
	AddItemID(AddItem(0,4,462,0,0,5,0,0));
	AddOwnExp(280000);
	AddSkillState(509,1,0,180);
	Msg2Player("B�n nh�n ���c Tr�n Minh Chi Li�n.");
	AddItemID(AddItem(2,0,184,0,0,0,5));
	Msg2Player("B�n nh�n ���c 1 chi�c nh�n.")
	Msg2Player("B�n nh�n ���c 280.000 �i�m kinh nghi�m");
	Msg2Player("Quay v� Giang T�n Th�n t�m Ph� L�i Th� ");
	AddNote(3,1,"Ho�n th�nh nhi�m v�! H�n n�i b�n h�y quay v� Giang T�n Th�n t�m Ph� L�i Th�");
	Talk(1,"fwd","L�n n�y may nh� ng��i gi�p, nh�ng th� n�y ta t�ng ng��i.");
	end
end

function fwd()
	Talk(1,"taytuy",10878);
end;

function taytuy()
	if(GetFactionCamp() == 2) then
	Say("B�n nh�n ���c 1 c� h�i t�y �i�m k� n�ng mi�n ph�.",1,"B�t ��u t�y/taykynang");
	end
end;

function no()
end;