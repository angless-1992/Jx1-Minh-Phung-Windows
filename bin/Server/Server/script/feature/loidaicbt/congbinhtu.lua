Include("\\script\\header\\loidai.lua");

CAPTAINNAME = {};
function main()
	if(SERVER_MODE==1) then
		Talk(1, "", "L�i ��i t�m th�i ch�a m�.") 
	return end;

	local w,x,y = GetWorldPos();
	SetTask(BW_SIGNPOSWORLD, w);
	SetTask(BW_SIGNPOSX, x);
	SetTask(BW_SIGNPOSY, y);
	
	CAPTAINNAME = joinname();

	local nMapIndex = SubWorldID2Idx(BW_COMPETEMAP[1]);
	if (nMapIndex == -1) then
		Talk(1,"","B�o danh b� l�i, xin m�i li�n h� GM!");
	return end;
	
	OldSubWorld = SubWorld;
	SubWorld = nMapIndex;
	local nMemberCount =GetMissionV(MS_MAXMEMBERCOUNT)
	local nMSS = GetMissionV(MS_STATE);

	if (nMSS == 0) then 
		Say("��y l� ��u tr��ng thi ��u l�i ��i, n�i c�c nh�n s� tr�n giang h� ��n ��u ho�c t� ch�c thi ��u ��i. Hi�n t�i ch�a c� ai b�o danh thi ��u, c�c h� c� mu�n b�o danh kh�ng? <color=yellow>Hi�n t�i m� mi�n ph� l�i ��i<color>", 3, "���c th�i/Dangky", "Quy t�c thi ��u ra sao?/Hotro", "�� suy ngh� c�i ��!/no");
	elseif (nMSS == 1) then
		Say("��y l� di�n v� tr��ng, ��i <color=yellow>"..CAPTAINNAME[1].."<color>c�ng ��i <color=yellow>"..CAPTAINNAME[2].."<color> tranh t�i <color=yellow>"..nMemberCount.." vs "..nMemberCount.."<color>, Ng��i c� y�u c�u g�?",4,"Ta l� ��i tr��ng, mu�n bi�t s� th� t� v�o ��u tr��ng./joinkey", "Ta l� tuy�n th�, mu�n th��ng l�i ��i./gamerjoin", "Ta mu�n xem thi ��u./audiencejoin", "Ta kh�ng c� h�ng th�./no")
	elseif (nMSS == 2) then 
		Say("Hi�n th�i ��i "..CAPTAINNAME[1].." v� ��i "..CAPTAINNAME[2].." �ang thi ��u", 1, "Quay l�i sau./no");
	else
		Say("Tham gia thi ��u ph�i mang �� ng�n l��ng",0)
	end;
	SubWorld = OldSubWorld;
end;

function Dangky()
	if (GetTeamSize()  ~= 2) then
		Say("Mu�n ghi danh ph�i l� <color=yellow>��i tr��ng<color>. ��i c�a c�c h� kh�ng �� <color=yellow>2<color> ng��i.", 0);
		return end;

	if (IsCaptain() ~= 1) then 
		Say("Ng��i b�o danh ph�i l� ��i tr��ng",0);
		return end;

	Say("C�c h� mu�n ��u l�i ��i, s� ng��i nhi�u nh�t m�i b�n l� bao nhi�u", 9, "R�i kh�i!/no", "1 ��u 1/Hoantatdangky", "2 ��u 2/Hoantatdangky", "3 ��u 3/Hoantatdangky","4 ��u 4/Hoantatdangky","5 ��u 5/Hoantatdangky","6 ��u 6/Hoantatdangky","7 ��u 7/Hoantatdangky","8 ��u 8/Hoantatdangky");
end;

function Hoantatdangky(MemberCount)
	if (GetTeamSize()  ~= 2) then
		Say("Mu�n ghi danh ph�i l� <color=yellow>��i tr��ng<color> ��i c�a c�c h� kh�ng ��<color=yellow>2<color> ng��i.", 0);
		return end;
	
	if (MemberCount <= 0 or MemberCount > 8) then
		return end
	
	local OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(BW_COMPETEMAP[1]);
	nMSS = GetMissionV(MS_STATE);

	if (nMSS ~= 0) then 
		Say("�Kh�ng ���c, �� c� ng��i ghi danh thi ��u!",0);
		return
	end
	OpenMission(BW_MISSIONID);
	StartMissionTimer(BW_MISSIONID, BW_SMALLTIME_ID, TIMER_1);

	SetMission(MS_STATE, 1);
	local x = GetTask(BW_SIGNPOSWORLD);
	SetMission(CITYID,GetWorldName(x))

	local key = {};
	key = Randkey();
	SetMission(MS_TEAMKEY[1], key[1]);
	SetMission(MS_TEAMKEY[2], key[2]);
	
	OldPlayerIndex = PlayerIndex;
	for i = 0,1 do 
		PlayerIndex = GetTeamMem(i);
		SetMission(MSS_CAPTAIN[i+1], GetName());
		CAPTAINNAME = joinname();
		if (MemberCount > 1) then
			Msg2Team("S� th� t� v�o ��u tr��ng c�a ��i b�n l�: <color=Yellow>"..key[i+1]);
		end;
	end;
	
	PlayerIndex = OldPlayerIndex;
	SetMission(MS_MAXMEMBERCOUNT, MemberCount)
	str = "B�y gi� "..GetMissionS(CITYID).." ��i <color=yellow>"..CAPTAINNAME[1].."<color> tranh t�i c�ng ��i <color=yellow>"..CAPTAINNAME[2].."<color>. L�i ��i chu�n b� b�t ��u, hai ��i tr��ng l� "..CAPTAINNAME[1].." c�ng "..CAPTAINNAME[2]..". L�i ��i m� c�a mi�n ph�, xin m�i c�c v� h�o h�u ��n xem.";
	Msg2SubWorld(str);
	local szMsg = format("C�c th�nh vi�n �� ghi danh � %d c�ng %d tranh t�i, nhanh ch�ng v�o l�i ��i, %d ph�t sau tranh t�i ch�nh th�c b�t ��u.",MemberCount, MemberCount, floor(GO_TIME/3))
	Msg2Team(szMsg);
end;

function Randkey()
	local key = {};
	key[1] = random(1, 9999)
	key[2] = random(1, 9999)
	
	if (key[2] == key[1]) then
		if (key[1] < 9996) then
			key[2] = key[1] + 3
		else
			key[2] = key[1] - 3;
		end
	end
	return key;
end;



function Hotro()
	Talk(5, "",	"L�i ��i l� n�i �� h�c h�i kinh nghi�m l�n nhau.","Mu�n tham gia l�i ��i, tr��c h�t ph�i ��n ch� ta ghi danh.","Ghi danh tham gia l�i ��i tranh t�i li�n ho�n th�nh, b�i v� cu�c so t�i c� gi�i h�n, �ang c� ng��i thi ��u, c�c h� kh�ng th� ghi danh!",format("Ghi danh sau th�nh c�ng, c� th� ��n chu�n b� khu , chu�n b� th�i gian l� <color=yellow>%d<color> ph�t. N�u kh�ng v�o �� th�nh vi�n tr�n ��u s� b� h�y b�!", floor(GO_TIME/3)), format("Th�i gian thi ��u l� <color=yellow>%d<color> ph�t, c� th� k�t th�c tr��c th�i gian khi th�nh vi�n 1 b�n ng� xu�ng h�t.", floor(TIMER_SEC*(END_TIME-GO_TIME)/60)));
end;

function gamerjoin()
	local nIdx,nGr = FindItemEx(1,0,0);
	if(nIdx >0 and nGr ~= 1) then
		Talk(1,"","B�n mang v�t ph�m kh�ng h�p l�, l�n thi ��u l�i ��i n�y ch� c� th� mang theo <color=Yellow>d��c ph�m h�i ph�c v� gi�i ��c");
	return end;
	for i=0,5 do
		for j=0,8 do
			nIdx,nGr = FindItemEx(3,i,j);
			if(nIdx >0 and nGr ~= 1) then
				Talk(1,"","B�n mang v�t ph�m kh�ng h�p l�, l�n thi ��u l�i ��i n�y ch� c� th� mang theo <color=Yellow>d��c ph�m h�i ph�c v� gi�i ��c");
			return end;
			nIdx,nGr = FindItemEx(10,i,j);
			if(nIdx >0 and nGr ~= 1) then
				Talk(1,"","B�n mang v�t ph�m kh�ng h�p l�, l�n thi ��u l�i ��i n�y ch� c� th� mang theo <color=Yellow>d��c ph�m h�i ph�c v� gi�i ��c");
			return end;
		end
	end;
	for i=0,2 do
		nIdx,nGr = FindItemEx(13,i);
		if(nIdx >0 and nGr ~= 1) then
			Talk(1,"","B�n mang v�t ph�m kh�ng h�p l�, l�n thi ��u l�i ��i n�y ch� c� th� mang theo <color=Yellow>d��c ph�m h�i ph�c v� gi�i ��c");
		return end;
	end;
	local OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(BW_COMPETEMAP[1]);
	if (SubWorld < 0) then
		return
	end;
	
	if ((GetName() == CAPTAINNAME[1]) or (GetName() == CAPTAINNAME[2])) then 
		joinmap(0)
	else
		Say("Xin m�i nh�p s� l�n thi ��u",2, "H�y khoan, cho ta l�n/Nhapkey", "Ta kh�ng nh�, ch� m�t ch�t �� ta h�i ��i tr��ng/no")
	end;
	SubWorld = OldSubWorld;
end

function Nhapkey()
	Input("commomkey",9999);
end

function commomkey(Key)
	local OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(BW_COMPETEMAP[1]);
	if (SubWorld < 0) then
		SubWorld = OldSubWorld;
		return
	end;
	if (Key == GetMissionV(MS_TEAMKEY[1])) then
		joinmap(0)
	elseif (Key == GetMissionV(MS_TEAMKEY[2])) then
		joinmap(1)
	else
		Say("C�c h� �� nh�p sai, ho�c h�i ��i tr��ng �� x�c ��nh l�i, xin c�m �n!",0)
	end
	SubWorld = OldSubWorld;
end

function audiencejoin()
	if(GetName() == CAPTAINNAME[1] or GetName() == CAPTAINNAME[2]) then
	Talk(1,"","��i tr��ng kh�ng th� tr�c ti�p quan chi�n");
	return end;
	idx = SubWorldID2Idx(BW_COMPETEMAP[1]);
	OldSubWorld = SubWorld;
	SubWorld = idx;
	Say("��i "..CAPTAINNAME[1].." v� ��i "..CAPTAINNAME[2].." �� s�n s�ng thi ��u, bi�t ��i n�o s� chi�n th�ng cu�i c�ng kh�ng?", 2,
	"Ta mu�n v�o l�i ��i xem/commonaudience",
	"Kh�ng ph�i l��t c�a ta,ta kh�ng v�o/no");
	SubWorld = OldSubWorld;
end;

function commonaudience()
	OldSubWorld = SubWorld;
	local idx = SubWorldID2Idx(BW_COMPETEMAP[1]);
	if (idx == -1) then
		return
	end;
	SubWorld = idx;
	if (GetName() == CAPTAINNAME[1]) then
		joinmap(0)
	elseif(GetName() == CAPTAINNAME[2]) then 
		joinmap(1)
	else
		joinmap(2);
	end;
	SubWorld = OldSubWorld
end

function joinmap(group)
	idx = SubWorldID2Idx(BW_COMPETEMAP[1]);
	if (idx < 0) then
		return
	end;
	OldSubWorld = SubWorld;
	SubWorld = idx;
	if (GetName() == CAPTAINNAME[1]) then 
		commonjoin(0)
	elseif (GetName() == CAPTAINNAME[2]) then 
		commonjoin(1)
	elseif (group == 0 or group == 1) then
		local masteridx = FindPlayer(GetMissionS(group))
		local masternum = 0
		if (masteridx > 0) then
			if (PIdx2MSDIdx(BW_MISSIONID, masteridx) > 0) then
				masternum = 1
			end
		end
		if (GetMSPlayerCount(BW_MISSIONID, group) - masternum < GetMissionV(MS_MAXMEMBERCOUNT) - 1) then
			commonjoin(group)
		else
			Say("S� ng��i thi ��u �� ��!",0);
		end;
	elseif (group == 2) then
		commonjoin(2);
	else
		Say("C�c h� kh�ng ph�i l� tuy�n th� �� b�o danh v� v�y kh�ng th� v�o l�i ��i, xin h�y ��ng ngo�i xem", 0);
	end;
	SubWorld=OldSubWorld;
end;

function no()
end;
