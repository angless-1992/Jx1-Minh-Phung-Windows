Include("\\script\\header\\taskid.lua");
Include("\\script\\header\\repute_head.lua");

USELESS_LETTER=242
THANH_DICHTRAM={
{1,		{176,11,162,37,78,80},	{252,254,255,256,257,258}},--pt->la/tdo/dl/bk/td/dc
{11,	{176,1,162,37,78,80},	{262,263,265,266,267,268}},--tdo->la/pt/dl/bk/td/dc
{162,	{176,1,11,37,78,80},	{272,273,274,276,277,278}},--dl->la/pt/tdo/bk/td/dc
{37,	{176,1,11,162,78,80},	{282,283,284,285,287,288}},--bk->la/pt/tdo/dl/td/dc
{78,	{176,1,37,162,37,80},	{292,293,294,295,296,298}},--td->la/pt/tdo/dl/bk/dc
{80,	{176,1,11,162,37,78},	{302,303,304,305,306,307}},--dc->la/pt/tdo/dl/bk/td
{176,	{1,11,162,37,78,80},	{243,244,245,246,247,248}}--la->pt/tdo/dl/bk/td/dc
};

THANHTHI_DICHUYEN = {
{1,"Th�nh ��","��i L�",11,162,1674,3132},
{2,"��i L�","Th�nh ��",162,11,3021,5090},
}

MAX_RESTTIME = 60*60	--60 phut lam 1 lan
function main(NpcIndex)
	Say("<npc>: �� l�u ta kh�ng m�ng ��n chuy�n tr�n giang h�, th�i cu�c l�c n�y qu� h�n lo�n, �t h�n tri�u ��nh s� c� nhi�u vi�c ph�i l�m",3,
	"Ta mu�n gi�p ng�i ��a th�/duathu",
	"Li�n quan T�n s�/nvtinsu",
	"Ta ch� ti�n ���ng gh� qua/no");
end;

function nvtinsu()
	local _,_,nMapIndex = GetPos()
	local MapId = SubWorldIdx2ID(nMapIndex)
	if MapId ~= 11 and MapId ~= 162 then
		Talk(1,"","Tham gia nhi�m v� T�n S� h�y �i t�m D�ch Quan <color=red>Th�nh ��<color>ho�c <color=red>��i L�<color>!")
		return
	end
	
	Say("LINK:<npc>",0,"Vi�c qu�n c� c�a Tri�u ��nh g�n ��y lu�n b� gi�c Kim bi�t tr��c, ta nghi ng� c� n�i gi�n. Nh�ng tr��c khi m�y t�n b�i lo�i n�y b� ph�t hi�n, ta mu�n r�ng tin n�y kh�p n�i ��u bi�t, ng��i c� mu�n g�p m�t ph�n s�c cho Qu�c gia kh�ng?",7,
	"Ta b�ng l�ng!/nhannvtinsu",
	"Ta ��n �� giao nhi�m v� T�n s� /giaonvtinsu",
	"Ta mu�n x�a b� nhi�m v� T�n s� /huynvtinsu",
	"Ta mu�n bi�t v� nhi�m v� T�n s�!/timhieunvtinsu",
	"G�n ��y ta c� nhi�u chuy�n c�n l�m!/no")
end;

function giaonvtinsu()
	local nTaskValue = GetTask(TASK_TINHNANG);
	local nTask =GetNumber(1,nTaskValue,1);
	local nNum =GetNumber(1,nTaskValue,1);
	if (nTask == 2 or nTask == 1) then
		SetTask(TASK_TINHNANG,SetNumber(1,nTaskValue,2,nNum+1));
		Say("LINK:<npc>",0,"Ch�c m�ng b�n �� ho�n th�nh nhi�m v�!",1,"Nh�n l�nh ph�n th��ng/messenger_treasureprize")
	elseif nTask ~= 0 then
		Say("LINK:<npc>",0,"Xin h�y l��ng th�, ng��i v�n ch�a ho�n th�nh nhi�m v� hi�n t�i. L�o Xa Phu b�n c�nh ta c� th� ��a ng��i ��n b�n �� nhi�m v� !",1,"K�t th�c ��i tho�i/no")
	else
		Say("LINK:<npc>",0,"Ch�a ti�p nh�n nhi�m v� n�o ng��i c�n l�i tr� nhi�m v�! Ng��i ��u? B�m c�i t�n n�y l�m nh�n b�nh bao cho ta!",1,"K�t th�c ��i tho�i/no")
	end
end

function huynvtinsu()
	SetTask(TASK_TINHNANG,0)
	Msg2Player("Ng��i �� h�y b� th�nh c�ng nhi�m v� T�n S�.")
end

function nhannvtinsu()
	local _,_,nMapIndex = GetPos()
	local nTaskValue = GetTask(TASK_TINHNANG);
	local nIsDoing = GetNumber(1,nTaskValue,1)
	local MapId = SubWorldIdx2ID(nMapIndex)
	if (GetLevel() < 120) then
		Say("LINK:<npc>",0,"Xin l��ng th�, ��ng c�p c�a ng��i hi�n t�i ch�a �� 120. h�y ti�p t�c t�i luy�n r�i ��n g�p ta.",1,"K�t th�c ��i tho�i/no")	
	elseif (nIsDoing ~= 0)  then
		Say("LINK:<npc>",0,"Xin l�i! Nhi�m v� T�n s� c�a b�n ch�a ho�n th�nh, kh�ng th� ti�p nh�n nhi�m v� gi�ng nhau, xin ho�n th�nh nhi�m v� n�y tr��c, c�m �n!",1,"K�t th�c ��i tho�i/no")
	else
    	local nTaskFlag = nvtrangthai()
    	if nTaskFlag == 0 then
    		Say("LINK:<npc>",0,"Xin l��ng th�, H�m nay ng��i �� v�t v� r�i. Ng�y mai h�y quay l�i nh�.",1,"K�t th�c ��i tho�i/no")
    		return
    	elseif nTaskFlag == -1 then
    		Say("LINK:<npc>",0,"H�m nay ng��i �� m�t m�i r�i. N�u ng��i c� <color=yellow>Thi�n Kh� B�o L�nh<color>, ta s� ph� l� cho ng��i tham gia th�m m�t l�n n�a.",1,"K�t th�c ��i tho�i/no")
    		return
    	elseif nTaskFlag == 2 then
    		Msg2Player("Ng��i c� c�m Thi�n Kh� B�o L�nh tham gia nhi�m v�, <color=yellow>nhi�m v� ho�n th�nh<color> ta s� thu h�i L�nh B�i")
    	end
		if (MapId == 11) then
			if (luachonnv(1,1) ~= 10) then
					print("messenger_choice error:1")
			end
		elseif (MapId == 162) then
			if (luachonnv(2,2) ~= 10) then
					print("messenger_choice error:2")
			end
		else
			Msg2Player("Xin l�i! Kh�ng bi�t t�i sao b�n l�i kh�ng th� nh�n nhi�m v� T�n s�? Xin li�n h� v�i GM!")
		end
	end
end

function nvtrangthai()
	local nNormalTaskLimit = 2
	local nIBTaskLimit = 1
	local nTaskValue = GetTask(TASK_TINHNANG);
	local nTodayCnt = GetNumber(1,nTaskValue,2)
	if nTodayCnt < nNormalTaskLimit then
		return 1
	elseif  nTodayCnt < (nNormalTaskLimit + nIBTaskLimit) then
		local nCountIb = GetItemCount(0,6,2813)
		if nCountIb >= 1 then
			return 2
		else
			return -1
		end
	end
	return 0
end

function luachonnv(i,j)
	if (i == THANHTHI_DICHUYEN[j][2]) then	
		SetTask(TASK_TINHNANG,SetNumber(2,GetTask(TASK_TINHNANG),2,THANHTHI_DICHUYEN[j][2]));
		SetTask(TASK_TINHNANG,SetNumber(2,GetTask(TASK_TINHNANG),3,10));
		local name = GetName()
		Talk(1,"","B�n nh�n ���c t� "..THANHTHI_DICHUYEN[j][3].."��n"..THANHTHI_DICHUYEN[j][4].."c�a nhi�m v� T�n s� ��c bi�t,"..THANHTHI_DICHUYEN[j][3].."D�ch tr�m D�ch quan cung t�ng"..name.."��i nh�n!")
		return 10
	end
end

function timhieunvtinsu()
	Say("LINK:<npc>",0,"Nhi�m v� T�n S� l� nhi�m v� gi�p Tri�u ��nh ��a th� cho c�c D�ch Quan � c�c Th�nh Th�, v� g�n ��y n�i c�c trong Tri�u ��nh xu�t hi�n ph�n t�c, cho n�n trong l�c ��a th� ng��i s� g�p kh�ng �t nguy hi�m. Kh�ng c� nh�ng ng��i d�ng c�m tr� tu� si�u ph�m nh�t ��ng v� tinh th�n h�p t�c �o�n k�t th� s� r�t kh� ho�n th�nh nhi�m v�. Ch� c� ��t ��n <color=red> c�p 120 tr� l�n<color> m�i c� th� tham gia. Tr��c m�t ng��i s� g�p nh�ng tr� ng�i c�a �i sau ��y: <color=red> Thi�n B�o kh�<color>. Trong nh�ng c�a �i n�y c� v� s� k� th� kh�ng gi�ng nhau v� nh�ng c� quan k� qu�i,  ng��i ph�i d�a v�o tr� tu� c�a m�nh �� c� l�a ch�n c�c k� ch�n x�c. Ta ch� c� ��i l�i nh� v�y choc ng��i th�nh c�ng, c� l�n chi�n h�u!",4,
	"Gi�i thi�u ��ng c�p ��a ��/dangcapdiado",
	"Gi�i thi�u Thi�n B�o kh�/gtthienbaokho",
	"K�t th�c ��i tho�i/no")
end

function dangcapdiado()
	Say("LINK:<npc>",0,"Tr��c m�t ch� c� <color=red> c�p 120 tr� l�n<color> m�t m�c �� nhi�m v�",2,"Quay l�i/timhieunvtinsu","K�t th�c ��i tho�i/no")
end

function gtthienbaokho()
	Say("LINK:<npc>",0,"Ng��i ho�c ��i tr��ng c�a ng��i khi ti�p nh�n nhi�m v� v��t �i Thi�n B�o Kh�, h� th�ng s� ph�n ph�i cho ng��i ng�u nhi�n  nh�n ���c 5 ch� s�, c�n c� v�o <color=red> d�a theo th� t�<color> c�a ch� s� m� ra <color=red> B�o R��ng<color> c�a s� th� t� ��i �ng trong c�a �i Thi�n B�o Kh�, th� c� th� qua �i. ���ng nhi�n, ph�i m� B�o R��ng, ng��i ph�i ��nh b�i <color=red> boss B�o Kh� Th� H� Gi�<color> b�n c�nh B�o R��ng. <color=red> Ng� H�nh Ph�<color> c� b�n trong K� Tr�n C�c m� ra c� th� nh�n ���c Tri�t Kim Ph�, Tri�t M�c Ph�, Tri�t Th�y Ph�, Tri�t H�a Ph�, Tri�t Th� Ph�, sau khi s� d�ng c� th� gi�p ng��i d� d�ng ��nh b�i boss B�o Kh� Th� H� Gi�.",2,"Quay l�i/timhieunvtinsu","K�t th�c ��i tho�i/no")
end

function duathu()
	local nValue = GetTask(TASK_NVDANHVONG);
	local nEnd = GetNumber(1,nValue, 4);
	local nBegin = GetNumber(1,nValue, 5);
	local w,x,y = GetWorldPos();
	if(nEnd == 0) then --chua co nhan
		local nTaskTime = GetTask(TASK_THOIGIAN2);
		if(GetCurServerSec() - nTaskTime < MAX_RESTTIME) then
		Talk(1,"",10092)
		return end
		Say(10094,2,
		"Nh�n giao c�ng v�n/nhannv",
		"Hi�n ta �ang b�n/no")
	return end
	if(w == THANH_DICHTRAM[nBegin][1]) then
		local nItemIdx,Pos,X,Y=FindItem(4,THANH_DICHTRAM[nBegin][3][nEnd]);
		if(nItemIdx) then
			Talk(1,"",10097);
		else
			nItemIdx,Pos,X,Y=FindItem(4,USELESS_LETTER);
			if(nItemIdx) then
				if(Pos==3) then
				Say(10096,2,
				"N�p ti�n/noptienvahuy",
				"Ta kh�ng c� ti�n/kotien")
				else
					Talk(1,"","Ng��i ph�i mang theo h�m th� ta m�i c� th� gi�p ng��i h�y ���c");
				end
			else
				Say(10096,2,
				"N�p ti�n/noptien",
				"Ta kh�ng c� ti�n/kotien")
			end;
		end;
	elseif(w == THANH_DICHTRAM[nBegin][2][nEnd]) then
		if(GetItemCount(0,4,THANH_DICHTRAM[nBegin][3][nEnd]) > 0) then
		DelItem(1,0,4,THANH_DICHTRAM[nBegin][3][nEnd]);
		SetTask(TASK_THOIGIAN2,GetCurServerSec());
		SetTask(TASK_NVDANHVONG, SetNumber(1,GetTask(TASK_NVDANHVONG),4,0));
		AddRepute(5);
		Earn(500);
		Msg2Player("Giao c�ng v�n ho�n th�nh, b�n nh�n ���c 5 �i�m danh v�ng");
		Talk(1,"",10318);
		else
		Talk(1,"",10319);
		end
	else
		Talk(1,"",10092);
	end
end

function nhannv()
	local nTaskValue = GetTask(TASK_NVDANHVONG);
	local w,x,y = GetWorldPos();
	for i=1,getn(THANH_DICHTRAM) do
		if(THANH_DICHTRAM[i][1] == w) then
			local nRand = RANDOM(1,getn(THANH_DICHTRAM[i][2]));
			AddItemID(AddItem(0,4,THANH_DICHTRAM[i][3][nRand],0,0,5,0,0));
			nTaskValue = SetNumber(1,nTaskValue,4,nRand);
			nTaskValue = SetNumber(1,nTaskValue,5,i);
			SetTask(TASK_NVDANHVONG,nTaskValue);
			Msg2Player("Nh�n nhi�m v� giao h�m th� t� "..GetWorldName(w).." ��n "..GetWorldName(THANH_DICHTRAM[i][2][nRand])..".");
			AddNote(13,1,"Nh�n nhi�m v� giao h�m th� t� "..GetWorldName(w).." ��n "..GetWorldName(THANH_DICHTRAM[i][2][nRand])..".");
			Talk(1,"",10097);			
		end
	end
end;

function noptien()
	if(GetCash() >= 2000) then
	Pay(2000);
	Repute_Reduce(1);
	SetTask(TASK_THOIGIAN2,GetCurServerSec());
	SetTask(TASK_NVDANHVONG, SetNumber(1,GetTask(TASK_NVDANHVONG),4,0));
	Talk(1,"",10098);
	return end
	kotien();
end;

function noptienvahuy()
	if(DelItem(1,0,4,USELESS_LETTER)==1) then
	if(GetCash() >= 2000) then
	Pay(2000);
	Repute_Reduce(1);
	SetTask(TASK_THOIGIAN2,GetCurServerSec());
	SetTask(TASK_NVDANHVONG, SetNumber(1,GetTask(TASK_NVDANHVONG),4,0));
	Talk(1,"",10098);
	return end
	kotien();
	else
	Msg2Player("Kh�u tr� ��o c� th�t b�i");
	end;
end;

function kotien()
	Talk(1,"",10099);
end;

function huyhamthu()
	local nValue = GetTask(TASK_NVDANHVONG);
	local nEnd = GetNumber(1,nValue, 4);
	local nBegin = GetNumber(1,nValue, 5);
	if(nEnd~= 0) then
	local nTaskValue = GetTask(TASK_NVDANHVONG);
	local nItemIdx,Pos,X,Y=FindItem(4,THANH_DICHTRAM[nBegin][3][nEnd]);
	if(nItemIdx)then
		RemoveItem(nItemIdx,1);
		AddItemID(AddItem(0,4,USELESS_LETTER,0,0,5,0,0),Pos,X,Y);
	end;
	end;
end;

function no()
end;
