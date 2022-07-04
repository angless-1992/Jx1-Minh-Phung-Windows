Include("\\script\\lib\\worldlibrary.lua")
Include("\\script\\header\\taskid.lua")
Include("\\script\\feature\\van_tieu\\lib.lua")

function main(nIndex)	
dofile("script/feature/van_tieu/tieudau.lua");
	SubWorld = SubWorldID2Idx(21)
	if (SubWorld < 0) then
		Talk(1,"","Ai c�ng t��ng ngh� B�o ti�u l� sung s��ng! Th�t s� m�i l�n ra �i ��u kh�ng d�m h�a h�n tr��c ng�y v�!")
	return end
	Say("Th�nh �� ti�u c�c c�a ch�ng ta lu�n ���c s� t�n nhi�m c�a giang h�",4,
	"V�n ti�u/vantieu",
	"��i h� ti�u l�nh/cuahang",
	"T�m hi�u v�n ti�u/timhieu",
	"Ta ch� gh� qua/no")
end

function vantieu()
	local nTaskValue = GetTask(TASK_VANTIEU)
	local nTask = GetNumber(1,nTaskValue,1)
	if(nTask == 0) then
		Say("G�n ��y c�ng vi�c nhi�u, ��o t�c ho�nh h�nh kh�p n�i, m� nh�n l�c l�i thi�u. V� ��y c� mu�n gi�p ta m�t chuy�n kh�ng? S� c� lao ph� x�ng ��ng cho ng��i!",2,
		"Ta ��ng � �p ti�u/batdau",
		"Ta �ang r�t b�n/no")
	elseif(nTask < 4) then
		if(GetItemCount(0,6,4771) > 0) then
		bicuop()
		return end
		Say("Kh�ng ph�i ng��i �ang �p ti�u sao? Sao l�i ��n ��y t�m ta?",3,
		"Ta b� th�t l�c, gi�p ta t�m ti�u xa/timxe",
		"Ta kh�ng mu�n l�m n�a/huybo",
		"Ta ch� gh� qua/no")
	else
		hoanthanh()
	end
end

function batdau()
	if(GetFightState() == 1) then
		Talk(1,"","Tr�ng th�i chi�n ��u kh�ng th� nh�n nhi�m v�")
	return end
	if(GetLevel() < 120) then
		Talk(1,"","H�y c� g�ng luy�n t�p ��t c�p 120 r�i ��n g�p ta")
	return end
	local nTask = GetTask(TASK_RESET5)
	local nLan = GetNumber(1,nTask, 6)
	if(nLan > 1) then
		if(GetItemCount(0,6,4772) < 1) then
		Talk(1,"","H�m nay ng��i �� �p ti�u nhi�u l�n r�i. H�y ngh� ng�i mai l�i ��n g�p ta.")
		return end
	end
	if(GetCash() < 10000) then
		Talk(1,"","Ng��i c�n n�p 1 v�n l��ng ph� hao t�n ti�u xa!")
	return end
	if(nLan > 1) then
		DelItem(1,0,6,4772)
	else
	SetTask(TASK_RESET5, SetNumber(1,nTask,6,nLan+1))
	end
	local w,x,y = GetWorldPos()
--	local nCamp = GetCurCamp();
	local n = RANDOM(2)
	local nId = AddNpcNew(TIEUXA_TEMPLET[nRand][1],1,w,x*32,y*32,"\\script\\feature\\van_tieu\\tieuxa.lua",GetCurCamp(),nil,nil,5,0,500000)
	SetNpcOwner(nId,GetName(),1)
	SetNpcBoss(nId,3);
	SetNpcName(nId,nName..TIEUXA_TEMPLET[nRand][2]);
	SetNpcTimeout(nId,32400)
	SetNpcValue(nId,GetUUID());
	SetTask(TASK_NPCVANTIEU, GetNpcID(nId))
	AddNote(5,1,"H�y mau h� t�ng ti�u xa ��n Long M�n ti�u s� � Thanh Th�nh S�n <color=Red>(243/219)<color>")
	n = n+1
	SetTask(TASK_VANTIEU, SetNumber(1,GetTask(TASK_VANTIEU),1,n))
	SetTask(TASK_VANTIEU, SetNumber(1,GetTask(TASK_VANTIEU),2,RANDOM(1,3)))
	Pay(10000)
end

function cuahang()
	Say("Ng��i hi�n c�: <color=red>"..GetItemCount(0,6,4774).."<color> H� Ti�u l�nh. H�y l�a ch�n v�t ph�m c�n thi�t cho ti�u xa:",5,
	"T�ng t�c (4 h� ti�u l�nh)/Input('ok_buy(4775,4)',50)",
	"H�i m�u (3 h� ti�u l�nh)/Input('ok_buy(4776,3)',50)",
	--"Ph�n ��n (4 h� ti�u l�nh)/Input('ok_buy(4777,4)',50)",
	"D�ch chuy�n (3 h� ti�u l�nh)/Input('ok_buy(4778,3)',50)",
	"Ta ch�a mu�n ��i/no")
end

function ok_buy(nRow, nItem)
	if(CheckRoom(1,1) == 0) then
	Talk(1,"","H�nh trang c�a ng��i kh�ng c�n ch� tr�ng")
	return end
	local nNum = tonumber(GetInput())
	if (nNum == 0) then
	return end
	local nHave = GetItemCount(0,6,4774)
	local nNeed = nNum*nItem
	if(nNeed > nHave) then
	Talk(1,"","Ng��i kh�ng mang �� h� ti�u l�nh r�i")
	return end
	AddItemID(AddItem(0,6,nRow,0,0,5,0,0),nNum)
	DelItem(nNeed,0,6,4774)
end

function hoanthanh()
	local nTaskValue = GetTask(TASK_VANTIEU)
	local nTask = GetNumber(1,nTaskValue,1)
	SetTask(TASK_VANTIEU, 0)
	SetTask(TASK_NPCVANTIEU, 0)
	phanthuong(nTask)
	Talk(1,"","L�m t�t l�m! ��y l� ph� lao v� c�a ng��i!")
end

function bicuop()
	SubWorld = SubWorldID2Idx(21)
	if (SubWorld < 0) then
	return end
	local nNpcIdx = FindNearNpc(GetTask(TASK_NPCVANTIEU))
	if(nNpcIdx > 0) then
		DelNpc(nNpcIdx)
	end
	local nKind = GetNumber(1,GetTask(TASK_VANTIEU),1)
	phanthuong(nKind)
	SetTask(TASK_VANTIEU, 0)
	SetTask(TASK_NPCVANTIEU, 0)
	DelItem(1,0,6,4771)
	Talk(1,"","Ng��i b� c��p ti�u r�i sao? C�ng may ng��i �� �o�t l�i Ti�u K� danh d� c�a Th�nh �� ti�u c�c. V�t v� cho ng��i r�i! ��y l� m�t n�a ph� lao v�")
end

function huybo()
	SubWorld = SubWorldID2Idx(21)
	if (SubWorld < 0) then
	return end
	local nNpcIdx = FindNearNpc(GetTask(TASK_NPCVANTIEU))
	if(nNpcIdx > 0) then
		DelNpc(nNpcIdx)
	end
	SetTask(TASK_VANTIEU, 0)
	SetTask(TASK_NPCVANTIEU, 0)
	Talk(1,"","C�ng vi�c �p ti�u kh�ng ph�i l� ��n gi�n. Ng��i ch�n ��t ch�n r�o b��c v�o n�n c�ng kh� tr�ch! Sau n�y h�y c� g�ng l�n!")
	AddNote(5,2,"Kh�ng ho�n th�nh nhi�m v�")
end

function timxe()
	if(GetCash() < 100000) then
	Talk(1,"","Ng��i c�n n�p ph� 10 v�n l��ng �� ta cho ng��i �i t�m ti�u xa!")
	return end
	local nTask = GetTask(TASK_NPCVANTIEU)
	local nNpcIdx = FindAroundNpc(nTask)
	if (nNpcIdx > 0) then
		Talk(1,"","Kh�ng ph�i ti�u xa c�a ng��i �ang � ngay ��y sao!")
	return end
	nNpcIdx = FindNearNpc(nTask)
	if(nNpcIdx > 0) then
		local w,x,y = GetNpcPos(nNpcIdx)
		NewWorld(w,x,y)
		SetTimer(54,3)
		Pay(100000)
		Talk(1,"","�� c� tin t�c ti�u xa! Ta s� cho ng��i ��a ng��i ��n ��!")
	else
		Talk(1,"","Kh�ng th�y tin t�c! Ti�u xa c�a ng��i c� l� �� m�t!")
	end
end

function timhieu()
	Talk(2,"","Con ���ng hi�m tr� nh�t l� b�ng qua Thanh Th�nh S�n. N�i �� ��y r�y th� d� v� ��o t�c ho�nh h�nh. Ng��i ph�i h� ti�u an to�n ��n n�i giao cho ti�u s� trung chuy�n ��ng th�i gian!","H�ng h�a c�n v�n chuy�n c� 3 ch�ng lo�i: v�ng, b�c, ��ng. Ti�u c�ng gi� tr� th� b�n ��o t�c c�ng �� m�t t�i n�n c�ng kh� kh�n nh�ng lao ph� ng��i nh�n ���c c�ng t��ng x�ng!")
end

KINH_NGHIEM = 1000000
function phanthuong(nFinish)
	if(nFinish == 4) then	--hoan thanh dong tieu xa
		AddItemID(AddItem(0,6,4774,0,0,5,0,0),2)
		AddOwnExp(3*KINH_NGHIEM)
		AddNote(5,0,"Ho�n th�nh b�o k� ��ng Ti�u Xa, ng�i nh�n ���c ph�n th��ng x�ng ��ng")
	elseif(nFinish == 5) then	--hoan thanh bac tieu xa
		AddItemID(AddItem(0,6,4774,0,0,5,0,0),4)
		AddOwnExp(6*KINH_NGHIEM)
		AddNote(5,0,"Ho�n th�nh b�o k� B�c Ti�u Xa, ng�i nh�n ���c ph�n th��ng x�ng ��ng")
	elseif(nFinish == 6) then	--hoan thanh vang tieu xa
		AddItemID(AddItem(0,6,4774,0,0,5,0,0),6)
		AddOwnExp(9*KINH_NGHIEM)
		AddNote(5,0,"Ho�n th�nh b�o k� V�ng Ti�u Xa, ng�i nh�n ���c ph�n th��ng x�ng ��ng")
	else	--bi cuop, chi nhan 1/2 thuong
		AddItemID(AddItem(0,6,4774,0,0,5,0,0),1)
		AddOwnExp(KINH_NGHIEM)
		AddNote(5,2,"Kh�ng ho�n th�nh nhi�m v�")
	end
end

function no()
end