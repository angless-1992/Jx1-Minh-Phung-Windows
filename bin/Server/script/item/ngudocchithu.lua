SB_PAGE_INFO = {
"Thu h�i m�t t�ch",
"Xem ph�n th� 1 [Th�ng tin c� b�n c�a Ng� ��c th�t �i] ",
"Xem ph�n th� 2 [Th�ng tin nh�n v�t][V� �i�m t�ch l�y] ",
"Xem ph�n th� 3 [Th�ng tin v��t �i][Tin t�c �i] ",
"Xem ph�n th� 4 [S� ki�n v��t �i]",
"Xem ph�n b�n tr�n",
"Xem ph�n b�n d��i"}

-- ͨ���Ƿ����¼��󼤻���ʾ��Щ��Ϣ����Ҳ�и���ϡ����Ϣ��ͨ��ĳ��;�������Żᷴӳ����Ϸ�С�
SB_EVENT_CRUSTG = 60		-- ��¼��ǰ������Nҳ�ı����� Task
SB_EVENT_STAGE = {61, 62, 63, 64, 65,  66, 67, 68, 69, 70}		-- ��¼�ؿ��¼��ı����� Task
SB_STAGE_RECORD = {}
SB_EVENT_TITLE = {
{"  .  ", "  S�n  ", "      ", "  M�n  ", "      "},
{"  .  ", "  ��i  ", "      ", "  vi�n  ", "      "},
{"  .  ", "  H�u  ", "  Hoa  ", "  Vi�n  ", "      "},
{"  .  ", "  Li�n  ", "  Ho�n   ", "  s�o  ", "      "},
{"  .  ", "  T�ng  ", "  Ki�m  ", "  c�c  ", "      "},
{"  .  ", "  ?  ", "  ?  ", "  ?  ", "      "},
{"  .  ", "  ?  ", "  ?  ", "  ?  ", "      "},
{"  .  ", "  T�  ", "  Tr�c  ", "  L�m  ", "      "},
{"  .  ", "  Ki�m  ", "      ", "  Tr�ng  ", "      "},
{"  .  ", "  th�ng  ", "      ", "  Th��ng  ", "      "}}
SB_EVENT_CONT = {
	{"  [Ch�a gi�t ���c <color=metal>Ch� canh c�a<color> n�o ]",
	 "  [Gi�t nhi�u <color=metal>Ch� canh c�a<color> c� th� ch�c t�c <color=metal>Gia �inh ph�n n�<color>]",
	 "  [Qua c�a s� g�p r�t nhi�u <color=metal>Gia �inh h� vi�n<color> mai ph�c ]",
	 "  [��nh b�i nhi�u <color=metal>Gia �inh h� vi�n<color> c� th� ch�c t�c <color=metal>T�ng qu�n Ngo�i vi�n<color>]",
	 "  ??????",
	 "  ??????",
	 "S�n M�n"},
	{"  [C� th� ��i tho�i v�i <color=metal>T�ng qu�n N�i vi�n<color>, ch�n tr�c ti�p chi�n ��u!]",
	 "  [Gi�p <color=metal>T�ng qu�n N�i vi�n<color> t�m Du Long ki�m v�, c� th� c�ng h�n luy�n t�p v� ngh�.]",
	 "  [Khi gi�p <color=metal>T�ng qu�n N�i vi�n<color> t�m Du Long ki�m c� th� th�y ���c B�ch T�m ki�m.]",
	 "  ??????",
	 "  ??????",
	 "  ??????",
	 "��i Vi�n"},
	{"  [N�u <color=metal>N� l�o b�c<color> � H�u Hoa Vi�n qu� nhi�u c� th� l�m kinh ��ng <color=metal>H�u Hoa Vi�n nghi tr��ng<color> ]",
	 "  [�i qua v��n hoa, s� khi�n <color=metal>��i ti�u th�<color> c�ng ph�n n�.]",
	 "  [N�u t�m ���c <color=metal>Gia �inh<color> b� <color=metal>��i ti�u th�<color> b�c hi�p, gi�p h�n tr� ti�n chu�c th�n.]",							-- �ɽ������Կ��
	 "  [<color=metal>��i ti�u th�<color> s� kh�ng qu� l�m kh� (n�u ��i ng� ��u l� n�)]",
	 "  ??????",
	 "  ??????",
	 "H�u hoa vi�n"},
	{"  [L�y ���c 3 vi�n k� th�ch <color=metal>Ng� h�nh ki�m linh<color> s� xu�t hi�n]",
	 "  [L�y ���c<color=metal>Kim Ng�c Th�<color>, m�i c� th� v�o <color=metal>T�ng Ki�m C�c<color> ]",
	 "  [L�y ���c<color=metal>M�c Ng�c Th�<color>, m�i c� th� v�o <color=metal>!<color> ]",
	 "  [L�y ���c<color=metal>H�a Ng�c Th�<color>, m�i c� th� v�o <color=metal>!<color> ]",
	 "  ??????",
	 "  ??????",
	 "Li�n Ho�n S�o"},
	{"  [Kim quy Kim, M�c quy M�c, Th�y quy Th�y, H�a quy H�a, Th� quy Th�, ��u l� <color=metal>T��ng Th�<color> ]",	-- 70������ ֻ��������� ؤ�͵�컻�վ�Ҫ		���ҡ���ˮ�ķ���Ҫ
	 "  [Kim sinh Th�y, Th�y sinh M�c, M�c sinh H�a, H�a sinh Th�, Th� sinh Kim, ��u l� <color=metal>T��ng Sinh<color> ]",	-- 70������ ֻ��������� ���ҡ���ȴ����Ҫ	���֡���������ķ���Ҫ
	 "  [Kim kh�c M�c, M�c kh�c Th�, Th� kh�c Th�y, Th�y kh�c H�a, H�a kh�c Kim, ��u l� <color=metal>T��ng T�<color> ]",	-- 70������ ֻ��������� ���š������滨���Ҫ	�䵱����Ӱ���ķ�
	 "  [Kim t�ng H�a, H�a t�ng Th�y, Th�y t�ng Th�, Th� t�ng M�c, M�c t�ng Kim,��u l� <color=metal>T��ng Tr�<color> ]",	-- 60������ ֻ��������� �䵱�����佣���Ҫ		���֡��޺����Ҫ
	 "  [Kim ph� Th�, Th� ph� H�a, H�a ph� M�c, M�c ph� Th�y, Th�y ph� Kim, ��u l� <color=metal>T��ng Ph�<color> ]",	-- 60������ ֻ��������� ���֡������񹦾�Ҫ		ؤ������Ҫ
	 "  ??????",
	 "T�ng Ki�m c�c"},
	{"  ??????",
	 "  ??????",
	 "  ??????",
	 "  ??????",
	 "  ??????",
	 "  ??????",
	 "???"},
	{"  ??????",
	 "  ??????",
	 "  ??????",
	 "  ??????",
	 "  ??????",
	 "  ??????",
	 "???"},
	{"  ??????",
	 "  ??????",
	 "  ??????",
	 "  ??????",
	 "  ??????",
	 "  ??????",
	 "T� Tr�c l�m"},
	{"  ??????",
	 "  ??????",
	 "  ??????",
	 "  ??????",
	 "  ??????",
	 "  ??????",
	 "Ki�m Ch�ng"},
	{"  ??????",
	 "  [�� h�o h�u c�ng cao, c� th� ��n g�p S� gi� T�ng Ki�m k�ch ho�t r��ng, kh�ng ti�u hao Anh H�ng thi�p]",
	 "  [Khi gi�t qu�i � m�i �i ��u c� th� nh�n ���c ch�a kh�a m� R��ng tinh ch� ]",
	 "  ??????",
	 "  ??????",
	 "  ??????",
	 "Th�ng th��ng"}}
SB_UNKNOWN_INFO = "  [?????? ]"
-- ------------------------------------------------------------------------------------------------ <Function> ----
function SB_Page_0()
end
function SB_Page_1()
	local sL1 = "<color=gold>Li�n quan ��n S�n trang<color>: <color=gray>X n�m Y Ng� ��c th�t �i thi�t l�p ��n nay ch�ng nh�ng �� thu nh�n nhi�u danh ki�m trong thi�n h�, m� c�n c� c�ng ngh� ��c t�o v� kh� ph�ng v� l� tuy�t k� b� truy�n �� nh�t trong giang h�. Nhi�u nh�n s� t�m ��n mong t�m cho m�nh Th�n Binh B�o Gi�p.<color>".."\n"
	local sL2 = ""..""
	local sL3 = ""..""
	local sL4 = "<color=gold>Li�n quan ��n Khi�u chi�n<color>: <color=gray>Hi�n nay trang ch� m�i c�c nh�n s� ��n Ng� ��c th�t �i. Nh�ng ai c� th�nh � xin ��n g�p s� gi� � T��ng D��ng<color>.".."\n"
	local sL5 = ""..""
	local sL6 = ""..""
	
	local nStage = GetTask(SB_EVENT_CRUSTG)
	if nStage == 0 then
		nStage = 10
	end
	local sP0 = SB_PAGE_INFO[1].."/SB_Page_0"
	local sP1 = SB_PAGE_INFO[2].."/SB_Page_1"
	local sP2 = SB_PAGE_INFO[3].."/SB_Page_2"
	local sP3 = SB_PAGE_INFO[4].."/SB_Page_3"
	local sP4 = SB_PAGE_INFO[5].."["..SB_EVENT_CONT[nStage][7].."] /SB_Page_Event"
	
	Say("LINK:\\spr\\item\\questkey\\treasuremap_big.spr",0,sL1..sL2..sL3..sL4..sL5..sL6, 5, sP1, sP2, sP3, sP4, sP0)
end
function SB_Page_2()
	local nName = "<color=wood>"..GetName().."<color>"
	local nScore = "<color=wood>"..GetTask(TB_BONUS_SCORE).."<color>"
	local nTime = GetTask(TB_BONUS_TIME)
	local nDataS, nDataM, nDataH = 0, 0, 0
	nDataS = mod(nTime/18,60)
	nDataM = mod(nTime/60/18,60)
	nDataH = nTime/60/60/18
	local nData = "<color=green>"..nDataH.."<color><color=water>:<color><color=green>"..nDataM.."<color><color=water>:<color><color=green>"..nDataS.."<color><color=water>'<color>"
	local nRelation = "<color=wood>"..GetTask(TB_BONUS_RELATION)
	
	local sL1 = "<color=gold>Th�ng tin nh�n v�t<color>: <color=gray>Bao g�m �i�m danh v�ng v� n�ng l�c chi�n ��u.<color>".."\n"
	local sL2 = "  T�n: "..nName.." \tDanh v�ng: ".." \tChi�n ��u: ".."\n"
	local sL3 = "".."\n"
	local sL4 = "<color=gold>�i�m t�ch l�y<color>: <color=gray>Tr�nh �� h�o h�u bi�u th� tr�nh �� quan h� th� l�c trong Ng� ��c th�t �i.<color>".."\n"
	local sL5 = "  T�ch l�y: "..nScore.."  Th�i gian: "..nData.."  Quan h� S�n trang: "..nRelation.."\n"
	local sL6 = "".."\n"	

	local nStage = GetTask(SB_EVENT_CRUSTG)
	if nStage == 0 then
		nStage = 10
	end	
	local sP0 = SB_PAGE_INFO[1].."/SB_Page_0"
	local sP1 = SB_PAGE_INFO[2].."/SB_Page_1"
	local sP2 = SB_PAGE_INFO[3].."/SB_Page_2"
	local sP3 = SB_PAGE_INFO[4].."/SB_Page_3"
	local sP4 = SB_PAGE_INFO[5].."["..SB_EVENT_CONT[nStage][7].."] /SB_Page_Event"
	
	Say("LINK:\\spr\\item\\questkey\\treasuremap_big.spr",0,sL1..sL2..sL4..sL5, 5, sP1, sP2, sP3, sP4, sP0)	
end
function SB_Page_3()
	local nPlayed = GetTask(TB_BONUS_PLAYED)
	local nFinished = GetTask(TB_BONUS_FINISHED)
	local nSRate = "<color=wood>0%<color>"
	if nPlayed ~= 0 then
		nSRate = "<color=wood>"..(nFinished/nPlayed*100).."<color>%"
	end
	local nPlayed = "<color=wood>"..nPlayed.."<color>"
	local nFinished = "<color=wood>"..nFinished.."<color>"
	local nStage = "<color=wood>"..GetTask(TB_BONUS_STAGE).."<color>"
	local nKilled = "<color=wood>"..GetTask(TB_BONUS_KILLED).."<color>"
	local nBecaptain = "<color=wood>"..GetTask(TB_BONUS_BECAPTAIN).."<color>"
	
	local sL1 = "<color=gold>Tin t�c v��t �i<color>: <color=gray>Th�ng qua s� l�n tham d� v� s� l�n �� th�ng qua �� t�nh t� l�.<color>".."\n"
	local sL2 = "  S� l�n tham d�: "..nPlayed.."  S� l�n v��t �i: "..nFinished.."  T� l� th�ng qua: "..nSRate.."\n"
	local sL3 = "".."\n"
	local sL4 = "<color=gold>Th�ng tin �i<color>: <color=gray>Ghi nh� v�i th�ng tin vu�t �i ��n gi�n.<color>".."\n"
	local sL5 = "  T�ng s� v��t �i: "..nStage.."  T�ng s� s�t qu�i: "..nKilled.."  S� l�n ��i tr��ng: "..nBecaptain.."\n"
	local sL6 = "".."\n"

	local nStage = GetTask(SB_EVENT_CRUSTG)
	if nStage == 0 then
		nStage = 10
	end
	local sP0 = SB_PAGE_INFO[1].."/SB_Page_0"
	local sP1 = SB_PAGE_INFO[2].."/SB_Page_1"
	local sP2 = SB_PAGE_INFO[3].."/SB_Page_2"
	local sP3 = SB_PAGE_INFO[4].."/SB_Page_3"
	local sP4 = SB_PAGE_INFO[5].."["..SB_EVENT_CONT[nStage][7].."] /SB_Page_Event"
	
	Say("LINK:\\spr\\item\\questkey\\treasuremap_big.spr",0,sL1..sL2..sL4..sL5, 5, sP1, sP2, sP3, sP4, sP0)
end
function SB_Page_Event(nStage)
	if nStage == nil then
		nStage = GetTask(SB_EVENT_CRUSTG)
	end
	if (nStage < 1) or (nStage > 9) then
		nStage = 10
	end
	SetTask(SB_EVENT_CRUSTG, nStage)
	--local sLine = "  [<color=green>----"..SB_EVENT_CONT[nStage][7].."----<color>]".."\n"
	local sLine = ""
	for i=1,5 do
		sLine = sLine.."<color=green>"..SB_EVENT_TITLE[nStage][i].."<color>"
		if GetBit(GetTask(SB_EVENT_STAGE[nStage]), i) == 1 then
			sLine = sLine..SB_EVENT_CONT[nStage][i].."\n"
		else
			sLine = sLine..SB_UNKNOWN_INFO.."\n"
		end
	end
	local nStagePre = GetTask(SB_EVENT_CRUSTG)-1;
	local nStageNext = GetTask(SB_EVENT_CRUSTG)+1;
	local sP0 = SB_PAGE_INFO[6].." ["..SB_EVENT_CONT[nStagePre][7].."]/SB_Page_Event_Pre"
	local sP1 = SB_PAGE_INFO[7].." ["..SB_EVENT_CONT[nStageNext][7].."]/SB_Page_Event_Next"
	local sP2 = SB_PAGE_INFO[3].."/SB_Page_2"
	local sP3 = SB_PAGE_INFO[1].."/SB_Page_0"
	Say("LINK:\\spr\\item\\questkey\\treasuremap_big.spr",0,sLine, 4, sP0, sP1, sP2, sP3)
end
function SB_Page_Event_Pre()
	local nStagePre = GetTask(SB_EVENT_CRUSTG)-1;
	local nStageNext = GetTask(SB_EVENT_CRUSTG)+1;
	SB_Page_Event(nStagePre)
end
function SB_Page_Event_Next()
	local nStagePre = GetTask(SB_EVENT_CRUSTG)-1;
	local nStageNext = GetTask(SB_EVENT_CRUSTG)+1;
	SB_Page_Event(nStageNext)
end

function  main(nItem)
	dofile("script/item/tangkiemchi.lua")
	SB_Page_2()
end

function no()
end