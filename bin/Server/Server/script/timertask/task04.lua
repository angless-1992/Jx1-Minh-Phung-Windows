Include("\\script\\lib\\worldlibrary.lua")
Include("\\script\\header\\loidai.lua");
function OnTimer()
	StopTimer();
end;

function OnMissionTimer(nIndex)
	local msstate = GetMissionV(MS_STATE);
	local times = GetMissionV(MS_NEWSVALUE) + 1;
	if(times == END_TIME) then
		SetMission(MS_STATE, 3);
	end;
	SetMission(MS_NEWSVALUE, times);
	
	CAPTAINNAME = joinname();

	if (msstate == 1) then
		local str1 = ReportMemberState(times);
		bw_noticecaptainkey(str1);
	elseif (msstate == 2) then
		ReportBattle(times);
	elseif (msstate == 3) then
		Msg2MSAll(BW_MISSIONID, "Thi ��u k�t th�c!");
		bw_lose_time();
	end;
end;

function ReportMemberState(times)
	if (times == GO_TIME) then
		bw_begin_compete();
	end;
	
	RestMin = floor((GO_TIME - times) / 3);
	RestSec = mod((GO_TIME - times),3) * 20;
	local str1;

	if (RestMin > 0) and (RestSec == 0) then
		str1 = "Th��ng l�i ��i, th�i gian b�t ��u thi ��u c�n: <color=yellow>"..RestMin.."<color> ph�t xin h�y chu�n b�."
		Msg2MSAll(BW_MISSIONID, str1);
		if ((GO_TIME - times) == 3) then 
			str1 = GetMissionS(CITYID).."Th��ng l�i ��i, th�i gian b�t ��u thi ��u ch� c�n<color=yellow>1<color> ph�t xin h�y chu�n b� s�n s�ng."
		end
	elseif (RestMin == 0) then
		str1 = "Th��ng l�i ��i tranh t�i c�n: <color=yellow>"..RestSec.."<color> gi�y."
		Msg2MSAll(BW_MISSIONID, str1);
	end;
	return str1;
end;

function bw_noticecaptainkey(str1)
	local nCount = GetMissionV(MS_MAXMEMBERCOUNT);
	if (nCount <= 1) then
		return
	end;
	local i;
	local nOldPlayer = PlayerIndex;
	local nOldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(BW_COMPETEMAP[1]);
	local masteridx, szName, nKey, str;
	for i = 1, 2 do
		masteridx = FindPlayer(GetMissionS(i));
		if (masteridx > 0) then
			PlayerIndex = masteridx;
			if (PIdx2MSDIdx(BW_MISSIONID, masteridx) <= 0 and nil ~= str1) then
				Msg2Player(str1);
			end
			szName = GetMissionS(MSS_CAPTAIN[i]);
			nKey = GetMissionV(MS_TEAMKEY[i]);
			nCount = GetMissionV(MS_MAXMEMBERCOUNT);
			str = "C�c tuy�n th� l�i ��i <color=yellow> "..GetMissionS(CITYID).."<color> <color=yellow> "..nCount.."<color> thi ��u v�i <color=yellow> "..nCount.."<color>, v�o l�i ��i s� <color=yellow>["..nKey.."]<color>. Xin h�y d�n ��i v�o l�i ��i.";
			Msg2Player(str);
		end
	end;
	SubWorld = nOldSubWorld;
	PlayerIndex = nOldPlayer;
end;

function bw_begin_compete()
	local nMemNum1 = GetMSPlayerCount(BW_MISSIONID, 0);
	local nMemNum2 = GetMSPlayerCount(BW_MISSIONID, 1);
	if (nMemNum1 <= 0  and nMemNum2 <= 0 ) then 
		str1 = GetMissionS(CITYID).." L�i ��i tranh t�i �� ��n gi�, ��i<color=yellow>"..CAPTAINNAME[1].."<color> c�ng ��i <color=yellow>"..CAPTAINNAME[2].."<color> �� kh�ng v�o l�i ��i ��ng gi�, h�y b� thi ��u";
		Msg2SubWorld(BW_MISSIONID,str1)
		GameOver();
		StopMissionTimer(BW_MISSIONID, BW_SMALLTIME_ID);
		
		for i = 1,10 do 
			SetMission(i,0);
		end;
		CloseMission(BW_MISSIONID);
		return
	end;

	if (nMemNum1 <= 0 ) then 
		str1 = GetMissionS(CITYID).."L�i ��i tranh t�i �� ��n gi�, ��i <color=yellow>"..CAPTAINNAME[1].."<color> v�o l�i ��i kh�ng ��ng gi�, ��i <color=yellow>"..CAPTAINNAME[2].."<color> ���c xem l� chi�n th�ng!"
		Msg2MSAll(BW_MISSIONID, str1);
		GameOver();
		StopMissionTimer(BW_MISSIONID, BW_SMALLTIME_ID);
		
		for i = 1,10 do 
			SetMission(i,0);
		end;
		CloseMission(BW_MISSIONID);
		return
	end;

	if (nMemNum2 <= 0 ) then 
		str1 = GetMissionS(CITYID).." L�i ��i tranh t�i �� ��n gi�, ��i <color=yellow>"..CAPTAINNAME[2].."<color> v�o l�i ��i kh�ng ��ng gi�, ��i <color=yellow>"..CAPTAINNAME[1].."<color> ���c xem l� chi�n th�ng!";
		Msg2MSAll(BW_MISSIONID, str1);
		GameOver();
		StopMissionTimer(BW_MISSIONID, BW_SMALLTIME_ID);
		
		for i = 1,10 do 
			SetMission(i,0);
		end;
		CloseMission(BW_MISSIONID);
		return
	end;
		
	Msg2MSAll(BW_MISSIONID, "�� v�o l�i ��i, tranh t�i ch�nh th�c b�t ��u!");
	str = GetMissionS(CITYID).." L�i ��i <color=yellow>"..CAPTAINNAME[1].."<color> c�ng <color=yellow>"..CAPTAINNAME[2].."<color> �� v�o l�i ��i, tranh t�i ch�nh th�c b�t ��u!";
	local nCount = GetMSPlayerCount(BW_MISSIONID);
	for i=1,nCount do
	if(GetPMParam(BW_MISSIONID, i, 0) == 1) then --dang online
		PlayerIndex = MSDIdx2PIdx(BW_MISSIONID, i);
		SetFightState(1);
	end
	end;
	SetMission(MS_STATE, 2);
	return
end;

function ReportBattle(times)
	bw_checkwinner();
	gametime = (END_TIME-times)*TIMER_SEC;
	RestMin = floor(gametime / 60);
	RestSec = mod(gametime,60);
	if (RestMin == 0) then
		Msg2MSAll(BW_MISSIONID, "Th�i gian l�i ��i: Th�i gian c�n <color=yellow>"..RestSec.."<color> gi�y.");
	elseif (RestSec == 0) then
		Msg2MSAll(BW_MISSIONID, "Th�i gian l�i ��i: Th�i gian c�n <color=yellow>"..RestMin.."<color> ph�t.");
	else
		Msg2MSAll(BW_MISSIONID, "Th�i gian l�i ��i: Th�i gian c�n <color=yellow>"..RestMin.."<color> ph�t <color=yellow>"..RestSec.."<color> gi�y.");
	end;
end;

function bw_checkwinner()
	msstate = GetMissionV(MS_STATE) ;
	if (msstate == 0) then
		return
	end;
	
	local str1 = "";
	local CAPTAINNAME = {};
	local CAPTAINNAME = joinname();
	local nMemNum1 = GetMSPlayerCount(BW_MISSIONID, 0);
	local nMemNum2 = GetMSPlayerCount(BW_MISSIONID, 1);
	
	if (nMemNum1 <= 0 ) and (nMemNum2 <= 0 ) then 
		str1 = GetMissionS(CITYID).." L�i ��i Hai b�n ��ng th�i r�i l�i ��i, ��i <color=yellow>"..CAPTAINNAME[1].."<color> c�ng <color=yellow>"..CAPTAINNAME[2].."<color> ngang t�i ngang s�c";
		bw_all_gone(str1)
		return
	end;

	if (nMemNum1 <= 0 ) then 
		str1 = GetMissionS(CITYID).." L�i ��i ��i <color=yellow>"..CAPTAINNAME[2].."<color> ��nh b�i ��i <color=yellow>"..CAPTAINNAME[1].."<color>, gi�nh ���c th�ng l�i cu�i c�ng!"
		bw_all_gone(str1)
		return
	end;
	
	if (nMemNum2 <= 0 ) then 
		str1 = GetMissionS(CITYID).." L�i ��i ��i <color=yellow>"..CAPTAINNAME[1].."<color> ��nh b�i ��i <color=yellow>"..CAPTAINNAME[2].."<color>, gi�nh ���c th�ng l�i cu�i c�ng!"
		bw_all_gone(str1)
		return
	end;

end;

function bw_lose_time()
	msstate = GetMissionV(MS_STATE) ;
	if (msstate == 0) then
		return
	end;
	
	local str1 = "";
	local CAPTAINNAME = {};
	local CAPTAINNAME = joinname();
	local nMemNum1 = GetMSPlayerCount(BW_MISSIONID, 0);
	local nMemNum2 = GetMSPlayerCount(BW_MISSIONID, 1);
	
	if (nMemNum1 <= 0 ) and (nMemNum2 <= 0 ) then 
		str1 = GetMissionS(CITYID).."Hai b�n ��ng th�i r�i l�i ��i, ��i <color=yellow>"..CAPTAINNAME[1].."<color> c�ng <color=yellow>"..CAPTAINNAME[2].."<color> ngang t�i ngang s�c";
	end;

	if (nMemNum1 == nMemNum2) then 
		str1 = GetMissionS(CITYID).." L�i ��i Hai b�n ��ng th�i r�i l�i ��i, ��i <color=yellow>"..CAPTAINNAME[1].."<color> c�ng <color=yellow>"..CAPTAINNAME[2].."<color> ngang t�i ngang s�c"
	elseif (nMemNum2 > nMemNum1) then
		str1 = GetMissionS(CITYID).." L�i ��i ��i <color=yellow>"..CAPTAINNAME[2].."<color> c�n nhi�u ng��i h�n ��i <color=yellow>"..CAPTAINNAME[1].."<color>, gi�nh ���c th�ng l�i cu�i c�ng!"
	elseif (nMemNum1 > nMemNum2) then 
		str1 = GetMissionS(CITYID).." L�i ��i ��i <color=yellow>"..CAPTAINNAME[2].."<color> c�n nhi�u ng��i h�n ��i <color=yellow>"..CAPTAINNAME[1].."<color>, gi�nh ���c th�ng l�i cu�i c�ng!"
	end;
	bw_all_gone(str1);
end;

function bw_all_gone(str1)
	Msg2SubWorld(str1);
	GameOver();
	StopMissionTimer(BW_MISSIONID, BW_SMALLTIME_ID);
	for i = 1,10 do 
		SetMission(i,0);
	end;
	CloseMission(BW_MISSIONID);
	return
end;