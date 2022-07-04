Include("\\script\\header\\factionhead.lua")

function main(nNpcIndex)
	if(nvthegioi(nNpcIndex) == 1) then
	return end;
local player_Faction = GetFaction();
	if (player_Faction == "") then
		Talk(1,"enroll_select","Trong thi�n h� c�c m�n ph�i do n� nhi s�ng l�p th� b�n m�n ��ng ��u!  �� t� b�n m�n kh�ng nh�ng v� ngh� cao c��ng, c�m k� thi h�a ��u tinh th�ng!  Ai n�i giang h� l� th� gi�i c�a nam nh�n th� c� nh�n b�n ph�i m� l�m g��ng")
	elseif (player_Faction == "emei") then
			if (GetNumber(1,GetTask(TASK_DUNGCHUNG2),9) == 0) then
				if GetLevel() >= 60 then
				Say("<npc>: Ti�u s� mu�i l�i xu�ng n�i ch�i �? C� c�n ta ��a v� n�i kh�ng?",4,"Xu�t s� xu�ng n�i/xuatsu","T�m hi�u khu v�c luy�n c�ng/map_help","T�m hi�u v� ngh� b�n m�n/skill_help","Xin chuy�n d�m l�i h�i th�m s� ph� /no")
				else
				Say("<npc>: Ti�u s� mu�i l�i xu�ng n�i ch�i �? C� c�n ta ��a v� n�i kh�ng?",3,"T�m hi�u khu v�c luy�n c�ng/map_help","T�m hi�u v� ngh� b�n m�n/skill_help","Xin chuy�n d�m l�i h�i th�m s� ph� /no")
				end
			else
				Say("<npc>: Ti�u s� mu�i l�i xu�ng n�i ch�i �? C� c�n ta ��a v� n�i kh�ng?",4,"Tr�ng ph�n m�n ph�i/trungphansumon","T�m hi�u khu v�c luy�n c�ng/map_help","T�m hi�u v� ngh� b�n m�n/skill_help","Xin chuy�n d�m l�i h�i th�m s� ph� /no")
			end
	elseif (player_Faction == "cuiyan") then				
		Talk(1,"","Qu� ph�i danh ch�n V�n Nam. Tr��c gi� ch�a c�ng b�n ph�i qua l�i. Kh�ng bi�t c� g� ch� gi�o! ")
	elseif (player_Faction == "tangmen") then
		Talk(1,"","Ng��i l� ng��i c�a Th�c Nam ���ng M�n? B�n m�n l� danh m�n ch�nh ph�i, tr��c gi� kh�ng qua l�i v�i nh�ng ng��i c� t� t��ng kh�ng ch�nh th�ng")
	elseif (player_Faction == "wudu") then
		Talk(1,"","B�n t� ma ngo�i ��o c�c ng��i!  Ai ai c�ng mu�n ti�u di�t! ")
	elseif (player_Faction == "tianwang") then
		Talk(1,"","Qu� bang bang ch� D��ng Anh l� m�t b�c n� trung h�o ki�t!  B�n ni t� l�u ng��ng m�!  Mong s� c� ng�y di�n ki�n! ")
	elseif (player_Faction == "shaolin") then
		Talk(1,"","A di �� ph�t!  Th� ra l� h�a th��ng  Thi�u l�m, kh�ng bi�t Huy�n Nh�n ��i s� g�n ��y c� kh�e kh�ng?")
	elseif (player_Faction == "wudang") then
		Talk(1,"","V� �ang hi�p ngh�a, danh ch�n thi�n h�. ��o Nh�t Ch�n Nh�n c�a qu� ph�i v� ch��ng m�n c�a b�n ph�i giao t�nh th�m s�u. Hai ph�i ch�ng ta c� th� n�i l�  anh em m�t nh� ")
	elseif (player_Faction == "kunlun") then
		Talk(1,"","T� ph�i v� qu� ph�i ch�a h� qua l�i, kh�ng bi�t c� g� ch� gi�o!?")
	elseif (player_Faction == "tianren") then
		Talk(1,"","C�c ng��i ph� thu�c Kim qu�c, lu�n d�m ng� giang s�n  ��i t�ng ta. V� l�m ch�nh ph�i ch�ng ta v� c�c ng��i th� kh�ng ��i tr�i chung! ")
	elseif (player_Faction == "gaibang") then
		Talk(1,"","Qu� bang ng��i ��ng th� m�nh, h�o kh� xung thi�n, b�n gi�o r�t vui ���c k�t giao v�i nh�ng b�ng h�u nh� v�y! ")
	end
end


function enroll_select()
if (GetSeries() == 2) and (GetCamp() == 0) then
		if (GetLevel() >= 10) then
			Say("Gia nh�p Nga My ph�i, ch�ng ta s� l� t� mu�i 1 nh�!  H�a ph�c c�ng h��ng! ", 2, "Gia nh�p Nga Mi ph�i/go", "�� ta suy ngh� k� l�i xem/thing")
		else
			Say("Tr��c ti�n mu�i h�y luy�n t�p l�i c�n b�n, ��t ��n <color=Red>c�p 10<color> ch�ng ta s� l� t� mu�i 1 nh�! ", 0)		
		end
	end
end;

function go()
gianhapmonphai(4)
end;

function thing()
	Talk(1,"",10213)
end;