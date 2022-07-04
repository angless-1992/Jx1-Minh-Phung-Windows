Include("\\script\\header\\factionhead.lua")

function main(nNpcIndex)
	if(nvthegioi(nNpcIndex) == 1) then
	return end;
local player_Faction = GetFaction();
	if (player_Faction == "") then
		Talk(1,"enroll_select","B�n bang �� c� danh x�ng Thi�n h� �� nh�t bang, danh ch�n giang h�.Nh�n t�i ng�a H� t�ng Long, th�i n�o c�ng c� ")
	elseif (player_Faction == "gaibang") then
			if (GetNumber(1,GetTask(TASK_DUNGCHUNG2),9) == 0) then
				if GetLevel() >= 60 then
				Say("<npc>: �� l�u kh�ng g�p! M�i ng��i ��u r�t mong nh�! ��i hi�p d�o n�y c� kh�e kh�ng?",4,"Xu�t s� xu�ng n�i/xuatsu","T�m hi�u khu v�c luy�n c�ng/map_help","T�m hi�u v� ngh� b�n m�n/skill_help","Xin chuy�n d�m l�i h�i th�m s� ph� /no")
				else
				Say("<npc>: �� l�u kh�ng g�p! M�i ng��i ��u r�t mong nh�! ��i hi�p d�o n�y c� kh�e kh�ng?",3,"T�m hi�u khu v�c luy�n c�ng/map_help","T�m hi�u v� ngh� b�n m�n/skill_help","Xin chuy�n d�m l�i h�i th�m s� ph� /no")
				end
			else
				Say("<npc>: �� l�u kh�ng g�p! M�i ng��i ��u r�t mong nh�! ��i hi�p d�o n�y c� kh�e kh�ng?",4,"Tr�ng ph�n m�n ph�i/trungphansumon","T�m hi�u khu v�c luy�n c�ng/map_help","T�m hi�u v� ngh� b�n m�n/skill_help","Xin chuy�n d�m l�i h�i th�m s� ph� /no")
			end
	elseif (player_Faction == "cuiyan") then
		Talk(1,"","T� l�u nghe ti�ng c�c c� n��ng Th�y Y�n ��p nh� ti�n n�, v� c� n��ng n�y cho �n m�y ta �t ti�n u�ng r��u ���c ch�ng?")
	elseif (player_Faction == "emei") then				
		Talk(1,"","K� �n m�y n�y v�n t� l�u ng��ng m� Nga My ki�m thu�t. H�m nay ���c g�p n� hi�p ��y, th�t th�a l�ng mong ��c!")
	elseif (player_Faction == "tangmen") then
		Talk(1,"","�m kh� ���ng m�n khi�n nhi�u k� v�a nghe danh �� bi�n s�c. �ao ph�p c�a qu� m�n c�ng l�i h�i kh�ng k�m!")
	elseif (player_Faction == "wudu") then
		Talk(1,"","X�a nay T� ch�nh ph�n minh, b�n ti�u nh�n d�ng ��c nh� c�c ng��i c�ng d�m khoe danh �?")
	elseif (player_Faction == "tianwang") then
		Talk(1,"","B�n bang v� qu� bang h�p th�nh Thi�n h� l��ng ��i ph�i, ch�ng ta n�n gi�p �� nhau nhi�u h�n �� th�ng l�nh v� l�m! Ha! Ha! Ha!")
	elseif (player_Faction == "shaolin") then
		Talk(1,"","Qu� ph�i v� s� t�n vong c�a V� l�m Trung nguy�n, d�m ���ng ��u v�i Kim qu�c h�ng m�nh! K� �n m�y n�y mu�n ph�n b�i ph�c")
	elseif (player_Faction == "wudang") then
		Talk(1,"","V� �ang hi�p kh�ch l�ng danh thi�n h�, x�ng l� Danh m�n ch�nh ph�i! Xin cho k� �n m�y n�y g�i l�i h�i th�m ��n ��o Nh�t Ch�n Nh�n v� c�c v� ��o tr��ng!")
	elseif (player_Faction == "kunlun") then
		Talk(1,"","Th� ra l� �� t� c�a C�n L�n ph�i. Th�o n�o c�t c�ch b�t ph�m! R� m�t anh t�i!")
	elseif (player_Faction == "tianren") then
		Talk(1,"","M�c d� qu� ph�i l� ch�, nh�ng C�i bang v� Thi�n Nh�n x�a nay v�n kh�ng ��i tr�i chung. Ch�ng ta kh�ng c�n ph�i nhi�u l�i. H�n g�p nhau tr�n sa tr��ng!")
	end
end


function enroll_select()
if (GetSeries() == 3) and (GetCamp() == 0) then
		if (GetLevel() >= 10) then
			Say("C� h�ng th� gia nh�p C�i bang kh�ng? M�i ng��i c� c�m c�ng �n, c� r��u c�ng u�ng!", 2, "Gia Nh�p C�i bang/go", "�� ta suy ngh� k� l�i xem/thing")
		else
			Talk(1,"","C�n b�n c�a ng��i c�n k�m l�m! H�y �i luy�n t�p th�m, bao gi� ��n c�p 10 l�i ��n t�m ta!")
		end
	end
end;

function go()
gianhapmonphai(6)
end;

function thing()
	Talk(1,"",10452)
end;