Include("\\script\\header\\factionhead.lua")

function main(nNpcIndex)
	if(nvthegioi(nNpcIndex) == 1) then
	return end;
local player_Faction = GetFaction();
	if (player_Faction == "") then
		Talk(1,"enroll_select","Gi�o ch� c�a b�n gi�o l� Ho�n Nhan H�ng Li�t. Danh ch�n thi�n h�! Ho�ng �� Kim qu�c c�ng ph�i nh��ng 3 ph�n. Cao th� c�a b�n gi�o nhi�u v� s�! Nh�n t�i ng�a h� t�ng long")
	elseif (player_Faction == "tianren") then
			if (GetNumber(1,GetTask(TASK_DUNGCHUNG2),9) == 0) then
				if GetLevel() >= 60 then
				Say("<npc>: Nghe n�i ng��i sau khi xu�t s� �� l�p n�n nhi�u c�ng danh! Qu� kh�ng h� danh l� �� t� c�a b�n ph�i",4,"Xu�t s� xu�ng n�i/xuatsu","T�m hi�u khu v�c luy�n c�ng/map_help","T�m hi�u v� ngh� b�n m�n/skill_help","Xin chuy�n d�m l�i h�i th�m s� ph� /no")
				else
				Say("<npc>: Nghe n�i ng��i sau khi xu�t s� �� l�p n�n nhi�u c�ng danh! Qu� kh�ng h� danh l� �� t� c�a b�n ph�i",3,"T�m hi�u khu v�c luy�n c�ng/map_help","T�m hi�u v� ngh� b�n m�n/skill_help","Xin chuy�n d�m l�i h�i th�m s� ph� /no")
				end
			else
				Say("<npc>: Nghe n�i ng��i sau khi xu�t s� �� l�p n�n nhi�u c�ng danh! Qu� kh�ng h� danh l� �� t� c�a b�n ph�i",4,"Tr�ng ph�n m�n ph�i/trungphansumon","T�m hi�u khu v�c luy�n c�ng/map_help","T�m hi�u v� ngh� b�n m�n/skill_help","Xin chuy�n d�m l�i h�i th�m s� ph� /no")
			end
	elseif (player_Faction == "emei") then
		Talk(1,"","N�u Nga My ph�i ch�u gia nh�p b�n gi�o, v�y th� b�n ta su�t ng�y ��u ���c ng�m nh�n ng��i ��p! �i! Sung s��ng ch�t �i th�i!")
	elseif (player_Faction == "cuiyan") then
		Talk(1,"","S�m �� nghe con g�i ph��ng Nam s�c ��p nghi�ng th�nh, h�m nay ���c g�p ��y, qu� l� ti�ng ��n kh�ng ngoa")
	elseif (player_Faction == "tangmen") then
		Talk(1,"","Gi�o ch� c�a b�n gi�o lu�n c� l�ng mong m�i qu� gi�o c�ng gia nh�p, vinh hoa ph� qu�, cao quan b�ng l�c, h��ng c� ��i kh�ng h�t!")
	elseif (player_Faction == "wudu") then
		Talk(1,"","Thi�n Nh�n v� Ng� ��c gi�o m� h�p th�nh Nam c�ng B�c k�ch, Trung Nguy�n s�m mu�n c�ng r�i v�o tay ch�ng ta")
	elseif (player_Faction == "tianwang") then
		Talk(1,"","Kh�ng ai c� th� ng�n c�n ���c s� nghi�p h�ng b� Trung nguy�n c�a Thi�n Nh�n gi�o")
	elseif (player_Faction == "shaolin") then
		Talk(1,"","Cao th� Thi�u L�m ph�i c�a c�c ng��i �� s�p quy ti�n h�t r�i!Nh�n t�i tr� tu�i l�i ch�ng c� m�y ng��i! Xem ra Thi�u L�m c�ng �� s�p ��n ng�y t�n nghi�p! Ha! Ha! Ha!")
	elseif (player_Faction == "wudang") then
		Talk(1,"","Ta �� nghe N�i c�ng, ki�m thu�t c�a V� �ang l�ng danh Trung nguy�n! C� c� h�i nh�t ��nh ph�i th�nh gi�o!")
	elseif (player_Faction == "kunlun") then
		Talk(1,"","C�n L�n ph�i c�c ng��i h�ng c� T�y V�c,c� d� t�m d�m ng� Trung nguy�n �� l�u. S� c�  m�t ng�y b�n gi�o v� c�c ng��i ph�n chia cao th�p t�i Trung Nguy�n")
	elseif (player_Faction == "gaibang") then
		Talk(1,"","T�n �n m�y n�y mu�n tr� tr�n v�o ��y l�m gian t� �?")
	end
end


function enroll_select()
if (GetSeries() == 3) and (GetCamp() == 0) then
		if (GetLevel() >= 10) then
			Say("C� mu�n gia nh�p b�n gi�o kh�ng?", 2, "Gia nh�p Thi�n Nh�n gi�o/go", "Kh�ng gia nh�p/thing")
		else
			Talk(1,"","C�n b�n c�a ng��i c�n k�m l�m! H�y �i luy�n t�p th�m, bao gi� ��n c�p 10 l�i ��n t�m ta!")
		end
	end
end;

function go()
gianhapmonphai(7)
end;

function thing()
	Talk(1,"",10424)
end;