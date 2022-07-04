--hoangnhk
Include("\\script\\lib\\worldlibrary.lua");
Include("\\script\\header\\repute_head.lua");
Include("\\script\\header\\taskid.lua");
Include("\\script\\header\\thongthuong.lua");

function tnduongchau()
	Say(10949,3,
		"Nhi�m v� Th�ng Th��ng/nvthongthuong",
		"Ta mu�n ��i B�o r��ng/baoruong",
		"R�i kh�i/no")
end;

function nvthongthuong()
	if(SERVER_MODE > 0 and SERVER_MODE < 3) then
		Talk(1,"","Hi�n gi� kh�ng ph�i th�i gian nhi�m v�");
	return end;
	local nTaskValue=GetTask(TASK_NVTHONGTHUONG);
	local nMap = GetNumber(2,nTaskValue,1);
	Say("LINK:<npc>",0,"<npc>: Ng��i c� mu�n th� s�c v�i nhi�m v� c�a ta kh�ng?",4,
	format("%s nhi�m v�/%s",nMap<=0 and "Nh�n" or "Giao",nMap<=0 and "nhannvtt" or "giaolbtt"),
	"H�y nhi�m vu/huynvtt",
	"Tr� l�i/main",
	"K�t th�c ��i tho�i/no");
end;

function nhannvtt()
	if(GetLevel() < LEVEL_NORMAL or GetReputeLevel(GetRepute()) < 5) then
	Talk(1,"","Nhi�m v� n�y c�n ng��i c� th�c l�c v� thanh th� tr�n giang h�. ��ng c�p <color=Red>"..LEVEL_NORMAL.."<color> tr� l�n. Danh v�ng c�p <color=Red>5");
	return end;
	local bInTeam=GetTeamSize()>0 and 1 or 0;
	if(bInTeam==1 and IsCaptain()==0) then
	Talk(1,"","B�n kh�ng ph�i ��i Tr��ng, kh�ng th� ti�p nh�n nhi�m v�");
	return end;
	local nMyIndex=PlayerIndex;
	local nFacbonus =0;
	if(bInTeam==1) then
		for i=0,7 do
			local nMemId=GetTeamMem(i);
			if(nMemId>0) then
			PlayerIndex = nMemId;
			if(GetFactionNo()==1 or GetFactionNo()==3 or GetFactionNo() == 5) then
				bFacbonus=10;
				i=7;
			end;
			end;
		end;
	end;
	PlayerIndex=nMyIndex;
	if(bInTeam == 1)then
		for i=0,7 do
			local nMemId=GetTeamMem(i);
			if(nMemId>0) then
			PlayerIndex = nMemId;
			local nMap = random(getn(THONGTHUONG_MONTER));
			local nTaskValue=GetTask(TASK_RESET3);
			local nNum = GetNumber(1,nTaskValue,8);
			if(nNum >= MAX_NVTN) then
				Msg2Team(GetName.." nh�n nhi�m v� th�t b�i: �� s� nhi�m v� trong ng�y");
			elseif(nMap >0) then
				Msg2Team(GetName.." nh�n nhi�m v� th�t b�i: hi�n �ang c� nhi�m v� ch�a ho�n th�nh");
			else
			local nNpcTempID = THONGTHUONG_MONTER[nMap][2][random(getn(THONGTHUONG_MONTER[nMap][2]))];
			local nFNum = RANDOM(1,3)+(floor((200-GetLevel())/10))+GetTeamSize()+floor(nFNum*bFacbonus/100);
			local nIdx=AddItemID(AddItem(0,6,4811,0,0,5,0,0));
			SetParamItem(nIdx,nFNum);
			LockItem(nIdx,1,1,1);
			Msg2Player("Nh�n ���c m�t "..GetNameItem(nIdx).."");
			SetTask(TASK_RESET3,SetNumber(1,nTaskValue,8,nNum+1));
			SetTask(TASK_NVTHONGTHUONG,SetNumber(2,GetTask(TASK_NVTHONGTHUONG),1,nMap));
			SetTask(TASK_NVTHONGTHUONG,SetNumber(3,GetTask(TASK_NVTHONGTHUONG),3,nNpcTempID));
			SetTask(TASK_NVTHONGTHUONG,SetNumber(2,GetTask(TASK_NVTHONGTHUONG),2,THONGTHUONG_MONTER[nMap][3]));
			SetTask(TASK_NVTHONGTHUONG,SetNumber(2,GetTask(TASK_NVTHONGTHUONG),3,0));
			local str="Nh�n nhi�m v� <color=Yellow><Ti�u di�t "..THONGTHUONG_MONTER[nMap][3].." "..GetNpcTempName(nNpcTempID).."><color> t�i <"..GetWorldName(THONGTHUONG_MONTER[nMap][1])..">";
			Msg2Player(str);
			AddNote(13,1,1,str);
			end
			end
		end;
	else
		local nTaskValue=GetTask(TASK_RESET3);
		local nNum = GetNumber(1,nTaskValue,8);
		if(nNum >= MAX_NVTN) then
		Msg2Player("B�n �� ��t gi�i h�n trong ng�y, mai h�y l�m ti�p");
		return end;
		local nMap = random(getn(THONGTHUONG_MONTER));
		local nNpcTempID = THONGTHUONG_MONTER[nMap][2][random(getn(THONGTHUONG_MONTER[nMap][2]))];
		local nFNum = RANDOM(1,3)+(floor((200-GetLevel())/10));
		local nNewItem=AddItemID(AddItem(0,6,4811,0,0,5,0,0));
		SetParamItem(nNewItem,nFNum);
		LockItem(nNewItem,1,1,1);
		Msg2Player("Nh�n ���c m�t "..GetNameItem(nNewItem).."");
		SetTask(TASK_RESET3,SetNumber(1,nTaskValue,8,nNum+1));
		SetTask(TASK_NVTHONGTHUONG,SetNumber(2,GetTask(TASK_NVTHONGTHUONG),1,nMap));
		SetTask(TASK_NVTHONGTHUONG,SetNumber(3,GetTask(TASK_NVTHONGTHUONG),3,nNpcTempID));
		SetTask(TASK_NVTHONGTHUONG,SetNumber(2,GetTask(TASK_NVTHONGTHUONG),2,THONGTHUONG_MONTER[nMap][3]));
		SetTask(TASK_NVTHONGTHUONG,SetNumber(2,GetTask(TASK_NVTHONGTHUONG),3,0));
		local str="Nh�n nhi�m v� <color=Yellow><Ti�u di�t "..THONGTHUONG_MONTER[nMap][3].." "..GetNpcTempName(nNpcTempID).."><color> t�i <"..GetWorldName(THONGTHUONG_MONTER[nMap][1])..">";
		Msg2Player(str);
		AddNote(13,1,str);
	end;
end;

function giaolbtt()
	local nTaskValue = GetTask(TASK_NVTHONGTHUONG);
	if(GetNumber(2,nTaskValue,1)<=0) then
	return end;
	
	local nMap = GetNumber(2,nTaskValue,1);
	local nNpcTempID = GetNumber(3,GetTask(TASK_NVTHONGTHUONG),3);		
	local nNpcNum = GetNumber(2,GetTask(TASK_NVTHONGTHUONG),2);
	local nCurNum = GetNumber(2,GetTask(TASK_NVTHONGTHUONG),3);
	if(nCurNum >= nNpcNum) then
		Say("��i hi�p h�y ch�n ph�n th��ng",3,
		"Nh�n th��ng �i�m kinh nghi�m/selthuong",
		"Nh�n th��ng ng�n l��ng/selthuong",
		"�� ta suy ngh� k� xem/no");
	else
		Talk(1,"","Ng��i hi�n �ang c� nhi�m v� ti�u di�t <color=Red>"..nNpcNum.." "..GetNpcTempName(nNpcTempID).."<color> t�i "..GetWorldName(THONGTHUONG_MONTER[nMap][1])..". Hi�n t�i �� ti�u di�t <color=Yellow>"..nCurNum.."<color> t�n! H�y nhanh ch�ng ho�n th�nh");
	end;
end;

function selthuong(sel)
	SetTaskTemp(TEMP_TASK,sel);
	GiveItemUI("Giao nhi�m v�","Xin h�y ��t v�o Th�ng Th��ng l�nh","giaonvtt");
end;

function giaonvtt(sel)
	local nTaskValue = GetTask(TASK_NVTHONGTHUONG);
	if(GetNumber(2,nTaskValue,1)<=0) then
		return 1;
	end;
	
	local index,genre,detail = 0,0,0,0;
	local TIndex = 0;
	for i = 0,5 do
		for j = 0, 9 do
		index,genre,detail = FindItemEx(14,i,j);
		if (index>0 and genre==6 and detail==4811) then
			TIndex=index;
		end
		end
	end	
	if(TIndex<= 0) then
		Talk(1,"","V�t ph�m ��t v�o kh�ng ��ng, xin <sex> ki�m tra l�i!");
		return 0;
	end;
	local nFacIndex =GetParamItem(TIndex);
	RemoveItem(TIndex,1);
	local nMap = GetNumber(2,nTaskValue,1);
	local nNpcTempID = GetNumber(3,GetTask(TASK_NVTHONGTHUONG),3);		
	local nNpcNum = GetNumber(2,GetTask(TASK_NVTHONGTHUONG),2);
	local nCurNum = GetNumber(2,GetTask(TASK_NVTHONGTHUONG),3);
	if(nCurNum >= nNpcNum) then
	if(GetTaskTemp(TEMP_TASK)==0) then
		AddOwnExp(EXP_NORMAL+(123456*(200-GetLevel()))*nFacIndex);
	else
		Earn(MONEY_NORMAL+(123*(200-GetLevel()))*nFacIndex);
	end;
	SetTask(TASK_NVTHONGTHUONG,0);
	end;
	return 1;
end;

function huynvtt()
	local nTaskValue = GetTask(TASK_NVTHONGTHUONG);
	if(GetNumber(2,nTaskValue,1)<=0) then
		Talk(1,"","Hi�n t�i ng��i kh�ng c� nhi�m v� n�o �� h�y!");
		return 1;
	end;
	Say("M�i ng�y ch� c� v�i c� h�i l�m nhi�m v�, ng��i ch�c ch�n mu�n h�y nhi�m v� n�y ch�?",2,
	"Ta th�t t�nh kh�ng mu�n l�m nhi�m v� n�y!/xnhuynv",
	"�� ta suy ngh� l�i/no")
end;

function xnhuynv()
	SetTask(TASK_NVTHONGTHUONG,0);
	Talk(1,"","B�n �� h�y nhi�m v� th�nh c�ng");
end;

function baoruong()
	if(GetExpandBox()>=2) then
		Talk(1,"","<npc>: ��i hi�p �� m� r��ng th� hai r�i.");
		return
	elseif(GetExpandBox()<1) then
		Talk(1,"","<npc>: ��i hi�p v�n ch�a m� r��ng th� nh�t, ta kh�ng th� trao ��i B�ch b�o r��ng ���c. ��n Ba L�ng huy�n m� r��ng th� nh�t r�i h�y ��n t�m ta.");
		return end;
	GiveItemUI("B�ch b�o r��ng","�i�u ki�n ��i B�ch b�o r��ng l� ph�i m� r�ng r��ng th� nh�t, c�ng v�i m�t con ng�a c�p 80 b�t k� v� m�t b� T�ng b�o �� t� 1 ��n 12.","ktvatpham");
end;

function ktvatpham()
	local index,genre,detail,parti = 0,0,0,0,0;
	local TIndex = 0;
	for i = 0,5 do
		for j = 0, 9 do
		index,genre,detail,parti = FindItemEx(14,i,j);
		if (index>0 and genre==0 and detail==10 and parti==5) then
			TIndex=index;
		end
		end
	end
	if(TIndex <=0) then
		Talk(1,"","<npc>: Kh�ng ���c r�i, v�t ph�m ta y�u c�u v�n ch�a ��.");
		return 0;
	end
	for i=490,501 do
		if(GetItemCount(0,4,i,-1,-1,12)<=0) then
			Talk(1,"","<npc>: Kh�ng ���c r�i, v�t ph�m ta y�u c�u v�n ch�a ��.");
			return 0;
		end
	end
	RemoveItem(TIndex,1);
	for i=490,501 do
		ConsumeItem(1,0,4,i,-1,-1,12);
	end
	SetExpandBox(2)
	OpenBox(2)	
	Talk(1,"",11263)
	return 1;
end;