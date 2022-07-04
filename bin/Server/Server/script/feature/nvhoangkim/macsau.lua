--hoangnhk
Include("\\script\\header\\taskid.lua");
Include("\\script\\feature\\nvhoangkim\\hkhead.lua");
function main(NpcIndex)
	local nTaskValue = GetTask(TASK_NVST);
	local nValue = GetNumber(2,nTaskValue,2);
	local nNumItem = GetItemCount(0,4,455);
	if(nValue == 1 and nNumItem > 0) then
		Say(10374,1,
		END_TALK.."/no");
		DelItem(nNumItem, 4, 455);
		SetTask(TASK_NVST, SetNumber(2,nTaskValue,2,2));
		Msg2Player("M�c S�u b�o b�n ra b�n t�u ngo�i th�nh g�p c� �y")
		AddNote(1,2,"M�c S�u ph�t hi�n trong th� c� ��c! B�n kh�ng mu�n l� danh t�nh c�a Long Ng�, xem ra b�n trong c� u�n kh�c. M�c S�u h�n b�n � ngo�i th�nh ��i L�. �c chi�n xem ra kh� tr�nh kh�i.");
		AddNote(1,1,"M�c S�u h�n b�n t�i b�n t�u ngo�i th�nh ��i L� <color=Red>(204,186)<color>");
	return end
	if(nValue == 3) then
		Say(10398,1,
		"��i tho�i v�i M�c X�o Nhi/macxaonhi");
	return end
	if(nValue == 4 and GetLevel() >= 30) then
		Say(10400,1,
		END_TALK.."/nv_30");
	return end
	if(nValue == 7 and GetItemCount(0,4,461) > 0) then
		DelItem(1,0,4,461);
		Talk(1, "done30", format("��y kh�ng ph�i l� Ho�ng Kim L�n sao? %s B�n l�nh c�a ng��i c�ng kh�ng t�.",GetName()))
	return end
	if(nValue == 8 and GetLevel() >= 40) then
		Say(10428,1,
		END_TALK.."/nv_40");
	return end
	if(nValue == 11 and GetItemCount(0,4,460) > 0) then
		DelItem(1,0,4,460);
		Talk(1, "done40", format("C�u Hi�n Chi Ch�! %s, ta qu� nhi�n kh�ng nh�n l�m ng��i.",GetName()))
	return end
	if(nValue == 18) then
		Say(10216,1,
		"��i tho�i v�i M�c S�u/forward601");
	return end
	Talk(1,"",10373);
end;

function nv_30()
	SetTask(TASK_NVST, SetNumber(2,GetTask(TASK_NVST),2,5));
	AddOwnExp(10000);
	Msg2Player("M�c S�u b�o b�n �i Th�nh �� T�n T��ng T� t�m C�ng T� Ti�u �i�u tra tung t�ch c�a Ho�ng Kim L�n.")
	AddNote(1,2,"M�c S�u r�t ng��ng m� b�n v� h� l� tin t�c c�a Thi�n Ho�ng Long Kh�. B� gi�p n�y T�n Th�y Ho�ng tri�u t�p th� r�n 7 n��c ch� t�o ra. Xung quanh b� gi�p th�n b� n�y c�n bao nhi�u �m m�u?");
	AddNote(1,2,"M�c S�u b�o b�n �i <color=red>Ph��ng T��ng<color> t�m Ng�o V�n T�ng<color=red> (198,206)<color>, �ng ta s� cho b�n bi�t nhi�u b� m�t!");
	AddNote(1,0,"C�ng T� Ti�u<enter>C�ng T� Ti�u c�a c�i nh� n�i, m�n h� c� h�n 3 ng�n s� t�. Nh�ng ch� v� 1 ch� T�nh m� b�t ch�p t�t c�.");
	AddNote(1,1,"M�c S�u b�o b�n �i Th�nh �� T�n T��ng T� t�m C�ng T� Ti�u �i�u tra tung t�ch c�a Ho�ng Kim L�n (403,319)");
end;

function nv_40()
	SetTask(TASK_NVST, SetNumber(2,GetTask(TASK_NVST),2,9));
	AddOwnExp(15000);
	Msg2Player("M�c S�u b�o b�n �i D��ng Ch�u t�m  H� V� Th� �i�u tra tung t�ch c�a C�u Hi�n Chi Ch�.")
	AddNote(1,1,"M�c S�u b�o b�n �i D��ng Ch�u t�m  H� V� Th� �i�u tra tung t�ch c�a C�u Hi�n Chi Ch� (212,194)");
end;

function macxaonhi()
	Say(10399,1,
	END_TALK.."/done20");
	Msg2Player("M�c S�u b�o sau n�y s� t�m b�n.")
end;

function forward601()
	Say(10242,1,
		"��i tho�i v�i Nam Cung Phi V�n/forward602");
end;

function forward602()
	Say(10286,1,
		"L�i ��i tho�i v�i M�c S�u/forward603");
end;

function forward603()
	Say(10313,1,
		END_TALK.."/done60");
end;

function done20()
	SetTask(TASK_NVST, SetNumber(2,GetTask(TASK_NVST),2,4));
	AddOwnExp(5000);
	AddSkillState(509,1,0,180);
	AddItemID(AddItem(0,0,10,2,1,0,0,0));
	AddItemID(AddItem(2,0,183,0,0,0,5));
	Msg2Player("B�n nh�n ���c 1 con tu�n m� v� 1 ��i gi�y.")
end;

function done30()
	SetTask(TASK_NVST, SetNumber(2,GetTask(TASK_NVST),2,8));
	AddOwnExp(10000);
	AddSkillState(509,1,0,180);
	Msg2Player("M�c S�u n�i sau n�y s� t�m b�n");
	AddItemID(AddItem(2,0,176,0,0,0,5));
	Msg2Player("B�n nh�n ���c 1 kh�i m�o.")
	Talk(1,"","C� g�ng l�n");
end;

function done40()
	SetTask(TASK_NVST, SetNumber(2,GetTask(TASK_NVST),2,12));
	AddOwnExp(20000);
	AddSkillState(509,1,0,180);
	AddItemID(AddItem(2,0,178,0,0,0,5));
	Msg2Player("B�n nh�n ���c 1 h�ng li�n.")
	Msg2Player("M�c S�u n�i sau n�y s� t�m b�n. C� ta s� gi�p b�n ti�n h�nh t�y t�y, b�n �� c� c� h�i s�a �i�m k� n�ng. N�u b�n kh�ng thu�c phe ch�nh ph�i s� kh�ng ���c c� h�i n�y.")
	if(GetFactionCamp() == 1) then
	Say("B�n nh�n ���c 1 c� h�i t�y �i�m k� n�ng mi�n ph�.",1,"B�t ��u t�y/taykynang");
	end
end;

function done60()
	SetTask(TASK_NVST, SetNumber(2,GetTask(TASK_NVST),2,19));
	AddOwnExp(90000);
	AddSkillState(509,1,0,180);
	Msg2Player("M�c S�u s� c�ng Nam Cung Phi V�n ��n Thi�n Long t� gi�i quy�t m�t s� chuy�n, b�n h�y v� g�p Long Ng�.")
end;

function no()
end;