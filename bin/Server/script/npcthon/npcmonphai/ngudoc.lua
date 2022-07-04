Include("\\script\\header\\factionhead.lua")

function main(nNpcIndex)
	if(nvthegioi(nNpcIndex) == 1) then
	return end;
local player_Faction = GetFaction();
	if (player_Faction == "") then
		Talk(1,"enroll_select","Ng� ��c gi�o hi�n nay �ang l�c h�ng th�nh, l�i li�n k�t v�i Thi�n Nh�n gi�o h� tr� ��i Kim nam h�! Ng�y sau vinh hoa ph� qu� s� c�ng h��ng!")
	elseif (player_Faction == "wudu") then
			if (GetNumber(1,GetTask(TASK_DUNGCHUNG2),9) == 0) then
				if GetLevel() >= 60 then
				Say("<npc>: L�u l�m kh�ng g�p! Xem ra d�o n�y ng��i �� kh� h�n tr��c nhi�u",4,"Xu�t s� xu�ng n�i/xuatsu","T�m hi�u khu v�c luy�n c�ng/map_help","T�m hi�u v� ngh� b�n m�n/skill_help","Xin chuy�n d�m l�i h�i th�m s� ph� /no")
				else
				Say("<npc>: L�u l�m kh�ng g�p! Xem ra d�o n�y ng��i �� kh� h�n tr��c nhi�u",3,"T�m hi�u khu v�c luy�n c�ng/map_help","T�m hi�u v� ngh� b�n m�n/skill_help","Xin chuy�n d�m l�i h�i th�m s� ph� /no")
				end
			else
				Say("<npc>: L�u l�m kh�ng g�p! Xem ra d�o n�y ng��i �� kh� h�n tr��c nhi�u",4,"Tr�ng ph�n m�n ph�i/trungphansumon","T�m hi�u khu v�c luy�n c�ng/map_help","T�m hi�u v� ngh� b�n m�n/skill_help","Xin chuy�n d�m l�i h�i th�m s� ph� /no")
			end
	elseif (player_Faction == "cuiyan") then
		Talk(1,"","Ti�u m� n�! ��n th�m ca ca n�y �? Cho ta th�m m�t c�i n�o! Hi hi!")
	elseif (player_Faction == "emei") then				
		Talk(1,"","Ni c� th�i! Th�t l� xui x�o! C� �i �i l�i l�i! Ph� ph� ph�!��i c�t ��i l�i!")
	elseif (player_Faction == "tangmen") then
		Talk(1,"","��ng t��ng Phi �ao c�a c�c ng��i l� �� nh�t thi�n h�,��c thu�t c�a b�n bang v� h�nh v� �nh, gi�t ng��i trong nh�y m�t")
	elseif (player_Faction == "tianwang") then
		Talk(1,"","��i ��u v�i ��i Kim s� ch�ng �ch l�i g� ��u! S�m mu�n g� Kim qu�c c�ng b�nh ��nh Trung Nguy�n, l�c �� c�c ng��i h�i h�n c�ng mu�n r�i!")
	elseif (player_Faction == "shaolin") then
		Talk(1,"","B�n ��u tr�c c�c ng��i th�n � Kim Qu�c nh�ng h�n l�i h��ng v� Nam tri�u! N�u �� l�t v�o tay ta th� c�c ng��i m�t manh gi�p c�ng kh�ng c�n! Ha! Ha! Ha!")
	elseif (player_Faction == "wudang") then
		Talk(1,"","V� �ang ��i hi�p l�i mu�n ch� gi�o cho t�i h� �? Th�t l� n�c c��i!")
	elseif (player_Faction == "kunlun") then
		Talk(1,"","B�n c�c ng��i qu� l� kh�ng bi�t nh�n th�i th�! D�a v�o s�c c�c ng��i m� c�ng ��i ch�ng ��i v�i ��i kim �?")
	elseif (player_Faction == "tianren") then
		Talk(1,"","Ch�ng ta l��ng ph�i li�n minh, Nam c�ng B�c k�ch, sang s�n hoa l� n�y s�m mu�n g� c�ng thu�c v� ch�ng ta th�i! Ha! Ha! Ha!")
	elseif (player_Faction == "gaibang") then
		Talk(1,"","�n m�y th�i! �i �i! ��ng c� l�m b�n �o c�a ��i gia!")
	end
end


function enroll_select()
if (GetSeries() == 1) and (GetCamp() == 0) then
		if (GetLevel() >= 10) then
			Say("Sao h�? C� mu�n gia nh�p b�n gi�o kh�ng?", 2, "Gia nh�p Ng� ��c Gi�o/go", "�� ta suy ngh� k� l�i xem/thing")
		else
			Talk(1,"","C�n b�n c�a ng��i c�n k�m l�m! H�y �i luy�n t�p th�m, bao gi� ��n c�p 10 l�i ��n t�m ta!")
		end
	end
end;

function go()
gianhapmonphai(3)
end;

function thing()
end;