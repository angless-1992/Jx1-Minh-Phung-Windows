--hoangnhk
Include("\\script\\header\\tongkim.lua");
Include("\\script\\header\\taskid.lua")

END_TALK="K�t th�c ��i tho�i/no"
NEEDMONEY = 3000
NEEDLEVEL = 60
function main(NpcIndex)
	local nSubWorldId = SubWorldID2Idx(380)
	if nSubWorldId < 0 then	--chua mo map, ngung ham`
	return end
	SubWorld = nSubWorldId;--thang nay dang dung o map 325 (khac 380), nen phai dat bien toan` cau` SubWorld khac cho no' de su dung mission cua 380

	if(IsMission(1) == 0) then
		Say(10635,1,	--dai chien chua bat dau, ngung ham`
			END_TALK)
		return
	end
	local bTong = GetNpcValue(NpcIndex)
	if(bTong == nil) then
	return end
	
	local nPlayerDataIdx, nGroup, nTongMem, nKimMem = 0,0,0,0;
	if(bTong > 0) then	--------------------------------------------------ben Tong
	nPlayerDataIdx = PIdx2MSDIdx(1,PlayerIndex);
	if(nPlayerDataIdx > 0) then	--neu da gia nhap roi
		nGroup = GetMSIdxGroup(1, nPlayerDataIdx)
		if(nGroup == 1) then	--nhom 1 da gia nhap phe Kim roi, ngung ham`
			Talk(1,"",10645)
		return end
		----da gia nhap phe tong, cho vao` trong
		Say("Qu�c gia h�ng vong, th�t phu h�u tr�ch! B�y gi� l� l�c ta v� c�c ng��i b�o �n ��t n��c!\n\n"..
		"Hi�n t�i qu�n s� 2 b�n l�: "..nTongMem.." --- "..nKimMem.."",2,
		"Gia nh�p T�ng qu�n/gianhaptong",
		"R�i kh�i/out")
	return end
	if (GetMSRestTime(1,1) <= 0) then
		Say(10641,1,	--ngung gia nhap
			END_TALK)
		return
	end
	nTongMem = GetMSPlayerCount(1,0);
	nKimMem  = GetMSPlayerCount(1,1);
	if((nTongMem > nKimMem + 5) or nTongMem > 100) then --so luong da du~
		Talk(1,"",10648)
	return end
		local nTaskValue=GetTask(TASK_DUNGCHUNG3);
		local nCamp=GetNumber(1,nTaskValue,5);
		Say("Qu�c gia h�ng vong, th�t phu h�u tr�ch! B�y gi� l� l�c ta v� c�c ng��i b�o �n ��t n��c!\n\n"..
		"Hi�n t�i qu�n s� 2 b�n l�: "..nTongMem.." --- "..nKimMem.."",2,
		format("Gia nh�p T�ng qu�n%s/gianhaptong",nCamp==1 and "" or "(�i�m c�ng tr�ng tr� v� 0)"),
		"R�i kh�i/out")
	return end-------------------------------------------------

	
	nPlayerDataIdx = PIdx2MSDIdx(1,PlayerIndex);
	if(nPlayerDataIdx > 0) then	--neu da gia nhap roi
		nGroup = GetMSIdxGroup(1, nPlayerDataIdx)
		if(nGroup == 0) then	--nhom 0 da gia nhap phe Tong roi
			Talk(1,"",10636)
		return end
		----da gia nhap phe kim, cho vao` trong
		Say("Th� ch�t c�ng trung th�nh v�i ��i Kim! �i n�o! H�i c�c d�ng s� Kim qu�c!\n\n"..
		"Hi�n t�i qu�n s� 2 b�n l�: "..nTongMem.." --- "..nKimMem.."",2,
		"Gia nh�p Kim qu�n/gianhapkim",
		"R�i kh�i/out")
	return end
	if (GetMSRestTime(1,1) <= 0) then
		Say(10641,1,	--ngung gia nhap
			END_TALK)
		return
	end
	nTongMem = GetMSPlayerCount(1,0);
	nKimMem  = GetMSPlayerCount(1,1);
	if((nKimMem > nTongMem + 5) or nKimMem > 100) then --so luong da du~
		Talk(1,"",10639)
	return end
		local nTaskValue=GetTask(TASK_DUNGCHUNG3);
		local nCamp=GetNumber(1,nTaskValue,5);
		Say("Th� ch�t c�ng trung th�nh v�i ��i Kim! �i n�o! H�i c�c d�ng s� Kim qu�c!\n\n"..
		"Hi�n t�i qu�n s� 2 b�n l�: "..nTongMem.." --- "..nKimMem.."",2,
		format("Gia nh�p Kim qu�n%s/gianhapkim",nCamp==2 and "" or "(�i�m c�ng tr�ng tr� v� 0)"),
		"R�i kh�i/out")
		-------------------------------------------------
end;

function gianhaptong()
	local nSubWorldId = SubWorldID2Idx(380)
	if nSubWorldId < 0 then
	return end
	SubWorld = nSubWorldId;
	local nPlayerDataIdx = PIdx2MSDIdx(1,PlayerIndex);
	if(nPlayerDataIdx > 0) then	--neu da gia nhap roi
		SetPMParam(1,nPlayerDataIdx,0,1) --set online
		tongcommon(nPlayerDataIdx) --xu ly chi tiet
		return
	end
	
	--du cap, du tien moi duoc vao
	if(GetCash() < NEEDMONEY or GetLevel() < NEEDLEVEL) then
		Talk(1,"",format("B�n kh�ng �� <color=yellow>%d<color> c�p ho�c kh�ng �� <color=yellow>%d<color> l��ng.", NEEDLEVEL, NEEDMONEY))
	return end
	
	nPlayerDataIdx = AddMSPlayer(1,0); --chua gia nhap, add vao` nhom' 0
	if( nPlayerDataIdx > 0) then
		Pay(NEEDMONEY)
		--Talk(1,"",10655) --hoan nghenh
		tongcommon(nPlayerDataIdx) --xu ly chi tiet
		AddMissionNote("D�ng th�c: B�o v� Nguy�n So�i","B�i c�nh: N�m 1160 C�ng nguy�n, Kim ch� Ho�n Nhan L��ng t�p h�p qu�n l�c, quy�t ��nh Nam h�, ti�u di�t T�ng tri�u. T��ng D��ng l� tr� ng�i ��u ti�n c�a qu�n Kim, T��ng D��ng chu�n b� ng�p ch�m trong kh�i l�a binh �ao. <enter><enter><color=yellow>B�o v� Nguy�n so�i: sau khi khai chi�n 30 ph�t, nguy�n so�i 2 b�n s� l�n lu�t xu�t hi�n.<enter> M�c ti�u: b�o v� Nguy�n So�i phe m�nh, ti�u di�t Nguy�n So�i phe ��ch")
	end
end;

function gianhapkim()
	local nSubWorldId = SubWorldID2Idx(380)
		if nSubWorldId < 0 then
		return end
		SubWorld = nSubWorldId;
	local nPlayerDataIdx = PIdx2MSDIdx(1,PlayerIndex);
	if(nPlayerDataIdx > 0) then	--neu da gia nhap roi
		SetPMParam(1,nPlayerDataIdx,0,1) --set online
		kimcommon(nPlayerDataIdx)
		return
	end
	--du cap, du tien moi duoc vao
	if(GetCash() < NEEDMONEY or GetLevel() < NEEDLEVEL) then
		Talk(1,"",format("B�n kh�ng �� <color=yellow>%d<color> c�p ho�c kh�ng �� <color=yellow>%d<color> l��ng.", NEEDLEVEL, NEEDMONEY))
	return end
	
	nPlayerDataIdx = AddMSPlayer(1,1); --chua gia nhap, add vao` nhom' 1
	if( nPlayerDataIdx > 0) then
		Pay(NEEDMONEY)
		--Talk(1,"",10655)
		kimcommon(nPlayerDataIdx)
		AddMissionNote("D�ng th�c: B�o v� Nguy�n So�i","B�i c�nh: N�m 1160 C�ng nguy�n, Kim ch� Ho�n Nhan L��ng t�p h�p qu�n l�c, quy�t ��nh Nam h�, ti�u di�t T�ng tri�u. T��ng D��ng l� tr� ng�i ��u ti�n c�a qu�n Kim, T��ng D��ng chu�n b� ng�p ch�m trong kh�i l�a binh �ao. <enter><enter><color=yellow>B�o v� Nguy�n so�i: sau khi khai chi�n 30 ph�t, nguy�n so�i 2 b�n s� l�n lu�t xu�t hi�n.<enter> M�c ti�u: b�o v� Nguy�n So�i phe m�nh, ti�u di�t Nguy�n So�i phe ��ch")
	end
end;

function tongcommon(nPlayerDataIdx)
	local nTaskValue=GetTask(TASK_DUNGCHUNG3);
	local nCamp=GetNumber(1,nTaskValue,5);
	if(nCamp ~= 1) then
		SetValue(4,0);
		SetTask(TASK_DUNGCHUNG3, SetNumber(1,nTaskValue,5,1));
	end;
	StopTimer()	--ngung hen gio dang chay bat ky
	LeaveTeam()	--roi nhom, giai tan nhom
	SetRevPos(325,1) -- set phuc sinh ngay diem bao danh
	SetTempRevPos(380,1242*32,3549*32) --set ve thanh duong suc ngay doanh trai.
	SetLogoutRV(1)--dung diem phuc sinh dang nhap
	NewWorld(380,1242,3549) --di chuyen vao doanh trai
	SetCurCamp(1) --set phe phai'
	SetDeathScript("\\script\\player\\death_tongkim.lua") --set script khi chet
	SetReviveNow(1)
	local nTotalAccum = GetPMParam(1,nPlayerDataIdx,2);--tong so tich luy
	SetPMParam(1,nPlayerDataIdx,2,nTotalAccum);
	local nGroup = GetMSIdxGroup(1, nPlayerDataIdx);
	local i;
	for i=1,getn(EXPAND_RANK) do
		if(nTotalAccum >= EXPAND_RANK[i][1]) then
		SetPMParam(1,nPlayerDataIdx,15,EXPAND_RANK[i][2])
		SetRankEx(EXPAND_RANK[i][nGroup+3],"255,0,255")
		end
	end

	SetPunish(1)	--bat tinh nang chet khong mat' gi`
	local RestTK = GetMSRestTime(1,1);
	if (RestTK > 0) then
	SetPKMode(0,1)--ep kieu luyen cong
	else
	SetTimer(180*18,2)
	SetPKMode(1,1)--ep kieu chien dau
	SetPMParam(1,nPlayerDataIdx,1,1) --set param 1 (dang trong giai doan chien dau)
	end
	Msg2MSAll(1, GetName().." gia nh�p phe T�ng!"); --thong bao gia nhap
	PutMessage(format("B�n gia nh�p t�n s� %s[%d]",GetMissionName(1),nGroup));
end;

function kimcommon(nPlayerDataIdx)
	local nTaskValue=GetTask(TASK_DUNGCHUNG3);
	local nCamp=GetNumber(1,nTaskValue,5);
	if(nCamp ~= 2) then
		SetValue(5,0);
		SetTask(TASK_DUNGCHUNG3, SetNumber(1,nTaskValue,5,2));
	end;
	StopTimer()
	LeaveTeam()
	SetRevPos(325,2)
	SetTempRevPos(380,1688*32,3072*32)
	SetLogoutRV(1)
	NewWorld(380,1688,3072)
	SetCurCamp(2)
	SetDeathScript("\\script\\player\\death_tongkim.lua")
	SetReviveNow(1)
	local nTotalAccum = GetPMParam(1,nPlayerDataIdx,2);--tong so tich luy
	SetPMParam(1,nPlayerDataIdx,2,nTotalAccum);
	local nGroup = GetMSIdxGroup(1, nPlayerDataIdx);
	local i;
	for i=1,getn(EXPAND_RANK) do
		if(nTotalAccum >= EXPAND_RANK[i][1]) then
		SetPMParam(1,nPlayerDataIdx,15,EXPAND_RANK[i][2])
		SetRankEx(EXPAND_RANK[i][nGroup+3],"255,0,255")
		end
	end
	SetPunish(1)
	local RestTK = GetMSRestTime(1,1);
	if (RestTK > 0) then
	SetPKMode(0,1)
	else
	SetTimer(180*18,2)
	SetPKMode(1,1)
	SetPMParam(1,nPlayerDataIdx,1,1) --set param 1 dang chien dau
	end
	Msg2MSAll(1, GetName().." gia nh�p phe Kim!"); --thong bao gia nhap
	PutMessage(format("B�n gia nh�p t�n s� %s[%d]",GetMissionName(1),nGroup));
end;

function out()
	Talk(1,"",10643)
end;

function no()
end;