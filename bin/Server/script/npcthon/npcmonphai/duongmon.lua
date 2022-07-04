Include("\\script\\header\\factionhead.lua")

function main(nNpcIndex)
	if(nvthegioi(nNpcIndex) == 1) then
	return end;
local player_Faction = GetFaction();
	if (player_Faction == "") then
		Talk(2, "enroll_select", "���ng m�n h�ng c� Xuy�n Th�c, �m kh� v� h�a kh� �� l�ng danh thi�n h�. Ng��i trong giang h� nghe ��n ���ng m�n th�y ��u bi�n s�c, �� th�y s� l�i h�i c�a b�n m�n", "C�i g� l� V� l�m ch�nh ��o, d�n t�c ��i ngh�a? To�n l� b�n l�o to�t. B�n m�n kh�ng �a b�n ch�nh ��o, c�ng ch�ng k�t giao v�i t� ��o. Mu�n gia nh�p b�n m�n kh�ng ph�i l� chuy�n ��n gi�n!")
	elseif (player_Faction == "tangmen") then
			if (GetNumber(1,GetTask(TASK_DUNGCHUNG2),9) == 0) then
				if GetLevel() >= 60 then
				Say("<npc>: L�u qu� kh�ng g�p! Sau khi xu�t s� �� l�p n�n k� t�ch g� ch�a? K� nghe th�!",4,"Xu�t s� xu�ng n�i/xuatsu","T�m hi�u khu v�c luy�n c�ng/map_help","T�m hi�u v� ngh� b�n m�n/skill_help","Xin chuy�n d�m l�i h�i th�m s� ph� /no")
				else
				Say("<npc>: L�u qu� kh�ng g�p! Sau khi xu�t s� �� l�p n�n k� t�ch g� ch�a? K� nghe th�!",3,"T�m hi�u khu v�c luy�n c�ng/map_help","T�m hi�u v� ngh� b�n m�n/skill_help","Xin chuy�n d�m l�i h�i th�m s� ph� /no")
				end
			else
				Say("<npc>: L�u qu� kh�ng g�p! Sau khi xu�t s� �� l�p n�n k� t�ch g� ch�a? K� nghe th�!",4,"Tr�ng ph�n m�n ph�i/trungphansumon","T�m hi�u khu v�c luy�n c�ng/map_help","T�m hi�u v� ngh� b�n m�n/skill_help","Xin chuy�n d�m l�i h�i th�m s� ph� /no")
			end
	elseif (player_Faction == "emei") then				
		Talk(1,"","Qu� ph�i ��i v� b�n m�n tr��c t�i nay ch�a h� qua l�i! Kh�ng bi�t c� g� ch� gi�o!")
	elseif (player_Faction == "cuiyan") then
		Talk(1,"","B�n m�n h�nh s� tuy kh�ng theo lu�t l�, nh�ng c�ng kh�ng bao gi� b�t n�t nh�ng ph� n� y�u �u�i!")
	elseif (player_Faction == "wudu") then
		Talk(1,"","��c d��c c�a Ng� ��c gi�o tuy l�i h�i nh�ng c�ng ch�a ch�c �� th�ng ���c �m kh� c�a ���ng m�n! L�c n�o r�nh r�i ta xin th�nh gi�o v�i chi�u!")
	elseif (player_Faction == "tianwang") then
		Talk(1,"","Qu� bang xa t�n ��ng ��nh H�, tr��c gi� h�nh nh� ch�a qua l�i v�i b�n bang! Xin h�i c� g� ch� gi�o?!")
	elseif (player_Faction == "shaolin") then
		Talk(1,"","B�n m�n x�a nay v�n ch�ng �a g� c�i b�n t� x�ng l� danh m�n ch�nh ph�i c�c ng��i")
	elseif (player_Faction == "wudang") then
		Talk(1,"","B�n m�n x�a nay v�n ch�ng �a g� c�i b�n t� x�ng l� danh m�n ch�nh ph�i c�c ng��i")
	elseif (player_Faction == "kunlun") then
		Talk(1,"","C� g� ch� gi�o?")
	elseif (player_Faction == "tianren") then
		Talk(1,"","Ta ng��i v�n kh�ng ��ch th�, c�ng ch�a k�t qua b�ng h�u! Kh�ng bi�t ph�i ��i ��i th� n�o cho ti�n ��y!")
	elseif (player_Faction == "gaibang") then
		Talk(1,"","Kh�ng ng� c�i b�n �n m�y �� m� c�ng c� th� vang danh thi�n h�! T�i h� th�t mu�n ph�n b�i ph�c")
	end
end


function enroll_select()
if (GetSeries() == 1) and (GetCamp() == 0) then
		if (GetLevel() >= 10) then
			Say("B�n m�n tinh th�ng ��o ch� ki�m thu�t. B�n V� �ang  l� c�i th� g� ch�!  C� mu�n gia nh�p b�n ph�i kh�ng?", 2, "Gia nh�p ���ng M�n/go", "�� ta suy ngh� k� l�i xem/thing")
		else
			Talk(1,"","C�n b�n c�a ng��i c�n k�m l�m! H�y �i luy�n t�p th�m, bao gi� ��n c�p 10 l�i ��n t�m ta!")
		end
	end
end;

function go()
gianhapmonphai(2)
end;

function no()
	Talk(1,"",10310)
end;