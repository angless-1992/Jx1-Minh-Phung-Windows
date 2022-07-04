Include("\\script\\header\\factionhead.lua")
Include("\\script\\header\\taskid.lua")
Include("\\script\\npckhac\\hoanhson\\doccokiem.lua");
function main(nNpcIndex)
	if(nvthegioi(nNpcIndex) == 1) then
	return end;
	if (nvbalang() == 1) then
	return end;
local player_Faction = GetFaction();
	if (player_Faction == "") then
		Talk(3, "enroll_select", "Bang ch� D��ng Anh v� ngh� cao c��ng, gan d� h�n ng��i, kh�ng k�m g� tu mi nam t�!", "B�n m�n quy lu�t uy nghi�m, ng��i ��ng th� m�nh! Kh�ng ai trong thi�n h� d�m coi khinh!", "B�n bang v�a ch�ng Kim v�a kh�ng T�ng! Huynh �� ��u xu�t th�n l� d�n ngh�o, phi�u b�t giang h� l� v� k� sinh nhai! Ai l�m vua b�n ta ch� c�n quan t�m")
	elseif (player_Faction == "tianwang") then
			if (GetNumber(1,GetTask(TASK_DUNGCHUNG2),9) == 0) then
				if GetLevel() >= 60 then
				Say("<npc>: H�o huynh ��! Ch�ng ta l�i g�p nhau r�i! C� c� h�i ta s� u�ng r��u c�ng nhau!",4,"Xu�t s� xu�ng n�i/xuatsu","T�m hi�u khu v�c luy�n c�ng/map_help","T�m hi�u v� ngh� b�n m�n/skill_help","Xin chuy�n d�m l�i h�i th�m s� ph� /no")
				else
				Say("<npc>: H�o huynh ��! Ch�ng ta l�i g�p nhau r�i! C� c� h�i ta s� u�ng r��u c�ng nhau!",3,"T�m hi�u khu v�c luy�n c�ng/map_help","T�m hi�u v� ngh� b�n m�n/skill_help","Xin chuy�n d�m l�i h�i th�m s� ph� /no")
				end
			else
				Say("<npc>: H�o huynh ��! Ch�ng ta l�i g�p nhau r�i! C� c� h�i ta s� u�ng r��u c�ng nhau!",4,"Tr�ng ph�n m�n ph�i/trungphansumon","T�m hi�u khu v�c luy�n c�ng/map_help","T�m hi�u v� ngh� b�n m�n/skill_help","Xin chuy�n d�m l�i h�i th�m s� ph� /no")
			end
	elseif (player_Faction == "emei") then				
		Talk(1,"","Thanh Hi�u S� Th�i c�a qu� ph�i tinh th�ng ph�t h�c, v� ngh� cao c��ng, b�n m�n ng��ng m� �� l�u!")
	elseif (player_Faction == "cuiyan") then				
		Talk(1,"","N� nh�n v�n �� phi�n, n� nh�n bi�t v� c�ng l�i c�ng phi�n h�n! Ng��i c�a qu� ph�i ch�ng ta kh�ng d�m tr�u v�o!")
	elseif (player_Faction == "tangmen") then
		Talk(1,"","Ng��i h�c v� c�n ph�i quang minh l�i l�c! Ta gh�t nh�t b�n ng��i d�ng �m kh� h� ��c th� ng��i kh�c!")
	elseif (player_Faction == "wudu") then				
		Talk(1,"","Tuy b�n bang kh�ng m� mu�i t�n nhi�m b�t c� danh m�n ch�nh ph�i n�o nh�ng c�ng coi khinh b�n h� ��c �� h�n!")
	elseif (player_Faction == "shaolin") then				
		Talk(1,"","C�ng phu Thi�u L�m th� c� g� hay ho? H�a th��ng ��c kinh gi�i m�i l� ��ng, h�c ng��i ta ��nh nhau �� l�m gi?")
	elseif (player_Faction == "wudang") then				
		Talk(1,"","Xin chuy�n l�i h�i th�m c�a t�i h� ��n ��o Nh�t Ch�n Nh�n! C� d�p s� ��n �� th�nh gi�o ng��i!")
	elseif (player_Faction == "kunlun") then				
		Talk(1,"","Qu� ph�i g�n ��y ph�t tri�n th�n t�c! Qu� kh�ng ph�i h� danh! Nh�ng c�ng ��ng qu� xem th��ng v� l�m Trung nguy�n!")
	elseif (player_Faction == "tianren") then				
		Talk(1,"","Ch�ng ta quy�t kh�ng giao h�o v�i b�n ng��i Kim!")
	elseif (player_Faction == "gaibang") then
		Talk(1,"","Qu� bang v� b�n bang h�p th�nh Thi�n h� l��ng ��i bang, c� c� h�i ch�ng ta n�n th�n thi�t h�n n�a")
	end
end

function nvbalang()
	if (GetNumber(1,GetTask(TASK_DAOTAYTUY),9) == 2) then
		Talk(1, "", 11303)
		AddItemID(AddItem(0,4,180,0,0,5,0,0))
		SetTask(TASK_DAOTAYTUY, SetNumber(1,nTaskValue,9,3));
		return 1;
	end
	return 0;
end

function enroll_select()
if (GetSeries() == 0) and (GetCamp() == 0) then
		if (GetLevel() >= 10) then					--�ȼ��ﵽʮ��
			Say("Gia nh�p b�n bang, ch�ng ta s� l� huynh �� m�t nh�, h�a ph�c c�ng h��ng!", 2, "Gia nh�p Thi�n V��ng Bang/go", "�� ta suy ngh� k� l�i xem/thing")
		else
			Talk(1,"","C�n b�n c�a ng��i c�n k�m l�m! H�y �i luy�n t�p th�m, bao gi� ��n <color=Red>c�p 10<color> l�i ��n t�m ta!")
		end
	end
end;

function go()
gianhapmonphai(1)
end;

function thing()
	Talk(1,"",10366)
end;