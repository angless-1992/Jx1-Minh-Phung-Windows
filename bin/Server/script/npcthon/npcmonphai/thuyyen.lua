Include("\\script\\header\\factionhead.lua")

function main(nNpcIndex)
	if(nvthegioi(nNpcIndex) == 1) then
	return end;
local player_Faction = GetFaction();
	if (player_Faction == "") then
		Talk(1,"enroll_select","Th�y Y�n m�n ch�ng ta tuy to�n l� n�, nh�ng v� ngh� l�y 'Khinh, Kho�i, K�, M�' m� n�i ti�ng giang h�. T� mu�i t� t�m!  Trong giang h� kh�ng ai d�m coi khinh")
	elseif (player_Faction == "cuiyan") then
			if (GetNumber(1,GetTask(TASK_DUNGCHUNG2),9) == 0) then
				if GetLevel() >= 60 then
				Say("<npc>: T� t� t�i sao xu�t s� v�y!  C� � ��y t� t�i ch�ng ph�i vui v� l�m sao!?",4,"Xu�t s� xu�ng n�i/xuatsu","T�m hi�u khu v�c luy�n c�ng/map_help","T�m hi�u v� ngh� b�n m�n/skill_help","Xin chuy�n d�m l�i h�i th�m s� ph� /no")
				else
				Say("<npc>: T� t� t�i sao xu�t s� v�y!  C� � ��y t� t�i ch�ng ph�i vui v� l�m sao!?",3,"T�m hi�u khu v�c luy�n c�ng/map_help","T�m hi�u v� ngh� b�n m�n/skill_help","Xin chuy�n d�m l�i h�i th�m s� ph� /no")
				end
			else
				Say("<npc>: T� t� t�i sao xu�t s� v�y!  C� � ��y t� t�i ch�ng ph�i vui v� l�m sao!?",4,"Tr�ng ph�n m�n ph�i/trungphansumon","T�m hi�u khu v�c luy�n c�ng/map_help","T�m hi�u v� ngh� b�n m�n/skill_help","Xin chuy�n d�m l�i h�i th�m s� ph� /no")
			end
	elseif (player_Faction == "emei") then				
		Talk(1,"","Xinh ��p nh� hoa t��i m� h�ng ng�y c� ��i di�n v�i Thanh ��ng C� Ph�t!  Ta kh�ng th�ch c�c ng��i � �i�m n�y! ")
	elseif (player_Faction == "tangmen") then
		Talk(1,"","Hai ph�i ch�ng ta li�n minh l�i, kh�ng c�n ph�i ph�n tranh n�a! Ch�ng ph�i l� h� s� �?")
	elseif (player_Faction == "wudu") then
		Talk(1,"","Ta gh�t nh�t l� c�i b�n len l�n h� ��c h�i ng��i!  �y!  Kh�ng ph�i ta n�i ng��i! ")
	elseif (player_Faction == "tianwang") then
		Talk(1,"","D��ng H� c�a Thi�n V��ng bang c�c ng��i c�n k�m xa t� t� c�a ta, thi�n h� nam nh�n qu� nhi�n ch�ng ra g� h�t! ")
	elseif (player_Faction == "shaolin") then
		Talk(1,"","H�a th��ng ��u tr�c sao l�i ��n n�i c�a c�c n� nhi th� n�y?! ")
	elseif (player_Faction == "wudang") then
		Talk(1,"","Qu� m�n l�y hi�p ngh�a l�m tr�ng, nh�ng kh�ng bi�t ��n T� Nam c� bi�t h� th�n hay kh�ng m� c� b�m theo c�c s� t� xinh ��p c�a ch�ng ta")
	elseif (player_Faction == "kunlun") then
		Talk(1,"","C�n L�n ph�i ph�t tri�n th�n t�c! Ti�u n� r�t ng��ng m�! ")
	elseif (player_Faction == "tianren") then
		Talk(1,"","Ai l�m ho�ng �� th� c�ng m�c!  Nh�ng c�c ng��i t�n s�t sinh linh th� b�n c� n��ng kh�ng b� qua! ")
	elseif (player_Faction == "gaibang") then
		Talk(2,"","��i hi�p!  ��ng qua ��y! ","�! B� ch�t!!! ")
	end
end


function enroll_select()
if (GetSeries() == 2) and (GetCamp() == 0) then
		if (GetLevel() >= 10) then
			Say(10188, 2, "Gia nh�p Th�y Y�n/go", "�� ta suy ngh� k� l�i xem/thing")
		else
			Talk(1,"","C�n b�n c�a ng��i c�n k�m l�m! H�y �i luy�n t�p th�m, bao gi� ��n c�p 10 l�i ��n t�m ta!")
		end
	end
end;

function go()
gianhapmonphai(5)
end;

function thing()
	Talk(1,"",10187)
end;
