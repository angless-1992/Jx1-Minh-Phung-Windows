Include("\\script\\header\\factionhead.lua")

function main(nNpcIndex)
	if(nvthegioi(nNpcIndex) == 1) then
	return end;
local player_Faction = GetFaction();
	if (player_Faction == "") then
		Talk(1,"enroll_select","C�n L�n ph�i � T�y V�c xa x�i, r�t �t giao h�o v�i Trung Nguy�n. Tr�i qua m�y ��i ch��ng m�n �� d�n tr� th�nh m�t trong Nh�t ��i m�n ph�i. ")
	elseif (player_Faction == "kunlun") then
			if (GetNumber(1,GetTask(TASK_DUNGCHUNG2),9) == 0) then
				if GetLevel() >= 60 then
				Say("<npc>: Nghe n�i sau khi ng��i xu�ng n�i �� l�p ch�t c�ng danh, c� nh� ��n s� �� s� mu�i ch�ng ta kh�ng?",4,"Xu�t s� xu�ng n�i/xuatsu","T�m hi�u khu v�c luy�n c�ng/map_help","T�m hi�u v� ngh� b�n m�n/skill_help","Xin chuy�n d�m l�i h�i th�m s� ph� /no")
				else
				Say("<npc>: Nghe n�i sau khi ng��i xu�ng n�i �� l�p ch�t c�ng danh, c� nh� ��n s� �� s� mu�i ch�ng ta kh�ng?",3,"T�m hi�u khu v�c luy�n c�ng/map_help","T�m hi�u v� ngh� b�n m�n/skill_help","Xin chuy�n d�m l�i h�i th�m s� ph� /no")
				end
			else
				Say("<npc>: Nghe n�i sau khi ng��i xu�ng n�i �� l�p ch�t c�ng danh, c� nh� ��n s� �� s� mu�i ch�ng ta kh�ng?",4,"Tr�ng ph�n m�n ph�i/trungphansumon","T�m hi�u khu v�c luy�n c�ng/map_help","T�m hi�u v� ngh� b�n m�n/skill_help","Xin chuy�n d�m l�i h�i th�m s� ph� /no")
			end
	elseif (player_Faction == "cuiyan") then
		Talk(1,"","Qu� ��ng l� m� n�! Ng��i x� T�y B�c kh� h�n kh� m� s�nh ���c! ")
	elseif (player_Faction == "emei") then				
		Talk(1,"","N� l�u th� n�n h�c c�ch ch�m s�c ch�ng con! Vung g��m m�a ki�m ch�ng ra th� th�ng g�!  ��ng l� th�i th� ��o lo�n! ")
	elseif (player_Faction == "tangmen") then
		Talk(1,"","���ng m�n �m kh� l�m sao c� th� so s�nh v�i ch� thu�t ��o ph�p thi�n t�n c�a b�n ta! ")
	elseif (player_Faction == "wudu") then
		Talk(1,"","A! T� ma ngo�i ��o l�i d�m xu�t hi�n � ��y! H�y xem thanh ki�m c�a l�o gia ��y! ")
	elseif (player_Faction == "tianwang") then
		Talk(1,"","Thi�n v��ng bang tuy hi�n nay kh� m�nh, nh�ng do m�t n� l�u l�nh ��o!  R�i c�ng c� ng�y l�m ti�u tan c� nghi�p")
	elseif (player_Faction == "shaolin") then
		Talk(1,"","Ai c�ng b�o Thi�u l�m l� v� h�c ch�nh t�ng nh�ng s�nh sao ���c v�i Thi�n s� ��o thu�t c�a C�n L�n ta?")
	elseif (player_Faction == "wudang") then
		Talk(1,"","Hai ph�i ch�ng ta c�ng thu�c ��o gia!  Vi�c g� c� ph�i ph�n tranh cao th�p! ")
	elseif (player_Faction == "tianren") then
		Talk(1,"","Di�t s�ch c�u Kim ch�nh l� b�n ph�n c� ��i ta!  L�i ��y n�m th� m�t ki�m c�a l�o gia n�o! ")
	elseif (player_Faction == "gaibang") then
		Talk(1,"","C�i bang anh h�ng!  H�!  Th�c ch�t ch� l� m�t b�n � h�p ch� ra g�! ")
	end
end


function enroll_select()
if (GetSeries() == 4) and (GetCamp() == 0) then
		if (GetLevel() >= 10) then
			Say("B�n m�n tinh th�ng ��o ch� ki�m thu�t. B�n V� �ang  l� c�i th� g� ch�!  C� mu�n gia nh�p b�n ph�i kh�ng?", 2, "Gia nh�p C�n L�n/go", "�� ta suy ngh� k� l�i xem/thing")
		else
			Talk(1,"","C�n b�n c�a ng��i c�n k�m l�m! H�y �i luy�n t�p th�m, bao gi� ��n c�p 10 l�i ��n t�m ta!")
		end
	end
end;

function go()
gianhapmonphai(9)
end;

function thing()
	Talk(1,"",10239)
end;