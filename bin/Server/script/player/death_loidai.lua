Include("\\script\\header\\loidai.lua");

function OnDeath(nDesNpcIndex)
	local nDesPlayerIdx = NpcIdx2PIdx(nDesNpcIndex);
	local szDieName = GetName();
	SetDeathScript("")
    SetLogoutRV(0);	
	LeaveGame();
	
	if (nDesPlayerIdx > 0) then
		PlayerIndex = nDesPlayerIdx;
		local szName = GetName();
		local nDestCamp = GetCurCamp();
		if (nDestCamp == 2 or nDestCamp == 3) then
			Msg2MSAll(BW_MISSIONID, GetMissionS(CITYID).." L�i ��i tranh t�i �ang di�n ra, <color=yellow>"..szName.."<color> � l�i ��i ��nh b�i <color=yellow>"..szDieName.."<color>.");
		end
	end;
end;