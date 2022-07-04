Include("\\script\\header\\factionhead.lua")

function main(nNpcIndex)
	if(nvthegioi(nNpcIndex) == 1) then
	return end;
local player_Faction = GetFaction();
	if (player_Faction == "") then
		Talk(3, "enroll_select", "Thi�n h� v� h�c, B�c t�n Thi�u l�m, nam s�ng V� �ang. Ch�c ng��i �� t�ng nghe qua?", "V� c�ng b�n ph�i l�y t�nh ch� ��ng, l�y nhu kh�c c��ng, l�y ng�n th�ng d�i, l�y ch�m ��nh nhanh, l�y � v�n kh�, l�y kh� v�n th�n, ��nh sau t�i tr��c. Khi�m t�n �i�m ��m, l�y v� h�nh th�ng h�u h�nh, �� l� c�nh gi�i v� h�c t�i cao!", "V� ngh� b�n m�n c� 'ng� b�t truy�n': y�u �u�i, hi�m ��c, h�o th�ng, cu�ng t�u, gian d�m s� kh�ng truy�n v� c�ng")
	elseif (player_Faction == "wudang") then
			if (GetNumber(1,GetTask(TASK_DUNGCHUNG2),9) == 0) then
				if GetLevel() >= 60 then
				Say("<npc>: Tuy ng��i �� xu�t s� nh�ng ch�ng ta v�n th��ng nh� ��n! D�o n�y c� kh�e kh�ng?",4,"Xu�t s� xu�ng n�i/xuatsu","T�m hi�u khu v�c luy�n c�ng/map_help","T�m hi�u v� ngh� b�n m�n/skill_help","Xin chuy�n d�m l�i h�i th�m s� ph� /no")
				else
				Say("<npc>: Tuy ng��i �� xu�t s� nh�ng ch�ng ta v�n th��ng nh� ��n! D�o n�y c� kh�e kh�ng?",3,"T�m hi�u khu v�c luy�n c�ng/map_help","T�m hi�u v� ngh� b�n m�n/skill_help","Xin chuy�n d�m l�i h�i th�m s� ph� /no")
				end
			else
				Say("<npc>: Tuy ng��i �� xu�t s� nh�ng ch�ng ta v�n th��ng nh� ��n! D�o n�y c� kh�e kh�ng?",4,"Tr�ng ph�n m�n ph�i/trungphansumon","T�m hi�u khu v�c luy�n c�ng/map_help","T�m hi�u v� ngh� b�n m�n/skill_help","Xin chuy�n d�m l�i h�i th�m s� ph� /no")
			end
	elseif (player_Faction == "emei") then
		Talk(1,"","Nga My n� hi�p! Ti�u ��o xin k�nh l�! S� ph� Thanh Hi�u S� Th�i c� kh�e kh�ng?")
	elseif (player_Faction == "cuiyan") then
		Talk(1,"","Ti�u ��o r�t b�i ph�c c�ng phu Th�y Y�n m�n! Kh�ng bi�t c� n��ng c� g� ch� gi�o!?")
	elseif (player_Faction == "tangmen") then
		Talk(1,"","Tuy ch��ng m�n qu� ph�i t�nh t�nh n�ng n�y, h�nh s� kh�ng theo qui t�c, nh�ng r�t th�ng th�n! Kh�ng h� danh ch�n qu�n t�!")
	elseif (player_Faction == "wudu") then
		Talk(1,"","B�n l�nh d�ng ��c cao si�u th� cu�i c�ng c�ng l� h� ��ng �� h�n! Kh�ng c� tinh th�n v� h�c!")
	elseif (player_Faction == "tianwang") then
		Talk(1,"","S�m nghe n�i huynh �� Thi�n v��ng bang ai c�ng l� anh h�ng h�o h�n! H�m nay g�p m�t qu� nhi�n danh b�t h� truy�n!")
	elseif (player_Faction == "shaolin") then
		Talk(1,"","Th� ra l� ti�u s� ph� Thi�u l�m! Kh�ng bi�t c� g� ch� gi�o!")
	elseif (player_Faction == "kunlun") then
		Talk(1,"","Th� ra l� �� t� C�n L�n ph�i! Kh�ng bi�t c� g� ch� gi�o!")
	elseif (player_Faction == "tianren") then
		Talk(1,"","K� �n m�y n�y v�n t� l�u ng��ng m� Nga My ki�m thu�t. H�m nay ���c g�p n� hi�p ��y, th�t th�a l�ng mong ��c!")
	elseif (player_Faction == "gaibang") then
		Talk(1,"","Bang ch� c�a qu� bang v� ch��ng m�n c�a t� ph�i v�n l� b�ng h�u tri giao! Qu� bang c� vi�c g� t� ph�i nh�t ��nh l�p t�c gi�p ��!")
	end
end


function enroll_select()
if (GetSeries() == 4) and (GetCamp() == 0) then
		if (GetLevel() >= 10) then						--�ȼ��ﵽʮ��
			Say("N�u mu�n gia nh�p b�n ph�i ph�i thay ��i t�m t�nh, chuy�n t�m tu h�nh, t��ng lai c� r�t nhi�u c� h�i ch� ��n ng��i!", 2, "Gia nh�p V� �ang/go", "�� ta suy ngh� k� l�i xem/thing")
		else
			Say("C�n b�n c�a ng��i c�n k�m l�m! H�y �i luy�n t�p th�m, bao gi� ��n <color=Red>c�p 10<color> l�i ��n t�m ta", 0)
		end
	end
end;

function go()
gianhapmonphai(8)
end;

function thing()
	Talk(1,"",10394)
end;