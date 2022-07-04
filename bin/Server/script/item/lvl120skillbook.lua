LV120SKILL_LIST =
{
	[0] = {709, 1, 0, 120, "K� n�ng c�p 120", "��i Th�a Nh� Lai Ch� "},
	[1] = {708, 1, 1, 120, "K� n�ng c�p 120",	"��o H� Thi�n"},
	[2] = {710, 1, 2, 120, "K� n�ng c�p 120",	"M� �nh Tung"},
	[3] = {711, 1, 3, 120, "K� n�ng c�p 120",	"H�p Tinh Y�m"},
	[4] = {712, 1, 4, 120, "K� n�ng c�p 120",	"B� Nguy�t Ph�t Tr�n"},
	[5] = {713, 1, 5, 120, "K� n�ng c�p 120",	"Ng� Tuy�t �n"},
	[6] = {714, 1, 6, 120, "K� n�ng c�p 120",	"H�n Thi�n Kh� C�ng"},
	[7] = {715, 1, 7, 120, "K� n�ng c�p 120",	"Ma �m Ph� Ph�ch"},
	[8] = {716, 1, 8, 120, "K� n�ng c�p 120",	"Xu�t � B�t Nhi�m"},
	[9] = {717, 1, 9, 120, "K� n�ng c�p 120",	"L��ng Nghi Ch�n Kh� "},
}

Include("\\script\\item\\skillbook.lua")

function main(sel)
	
	if GetFactionNo()==-1 then	
		Msg2Player("<color=yellow>Ch�a gia nh�p m�n ph�i, kh�ng th� h�c k� n�ng n�y!<color>");
		return 1;
	end;
	
	if GetLevel()<120 then
		Msg2Player("<color=yellow>��ng c�p ch�a �� 120, kh�ng th� h�c k� n�ng n�y!<color>");
		return 1;
	end;
	
	if (LearnSkillByBook(GetFactionNo(), LV120SKILL_LIST) == 0) then
		RemoveItem(sel,1);
		return 0
	end
	return 1
end
