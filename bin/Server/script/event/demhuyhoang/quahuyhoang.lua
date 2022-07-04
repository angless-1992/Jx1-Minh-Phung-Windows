Include("\\script\\header\\taskid.lua");
function main(nNpcIdx)
	
	if (0 == GetCamp()) then
		Msg2Player("B�n ch�a gia nh�p m�n ph�i, kh�ng th� h�i qu�.")
		return
	end
	if (0 == GetFightState() or GetLife(0) <= 0) then
		Msg2Player("Kh�ng th� h�i qu�.")
		return
	end
	local nValue = GetTask(TASK_RESET);
	local nNum = GetNumber(1,nValue,2);
	if (nNum >= 5) then
		Msg2Player("B�n ch� c� th� h�i ���c t�i �a 5 qu� huy ho�ng trong m�t ng�y.")
	return end
	local nPlayerLevel = GetLevel();
	local nGetSeedLevel;

	if (1 == GetNpcParam(nNpcIdx, 1)) then
		if (nPlayerLevel >= 90) then
		Msg2Player("Lo�i qu� n�y ng��i ch�i t� c�p 90 tr� xu�ng c� th� h�i!")
		return end;
	elseif (2 == GetNpcParam(nNpcIdx, 1)) then
		if (nPlayerLevel < 90 or nPlayerLevel >= 120) then
		Msg2Player("Lo�i qu� n�y ng��i ch�i t� c�p 90 ��n c�p 119 m�i c� th� h�i.")
		return end;
	else
		if (nPlayerLevel < 120) then
			Msg2Player("Lo�i qu� n�y ng��i ch�i t� c�p 120 tr� l�n m�i c� th� h�i!")
		return end;
	end;
	Msg2Player("�ang thu th�p...");
	PaceBar("thuthap("..nNpcIdx..")",180)
end;

function thuthap(nNpcIdx)
	if(nNpcIdx <= 0) then return end;
	if(GetNpcParam(nNpcIdx, 1) >= 1 and GetNpcParam(nNpcIdx, 1) <= 3) then
		if(GetNpcParam(nNpcIdx,4) >= 5) then
			return
		end;	
		local nValue = GetTask(TASK_RESET);
		local nNum = GetNumber(1,nValue,2);		
		SetTask(TASK_RESET,SetNumber(1,nValue,2,nNum+1))
		local nItemIdx = AddItemID(AddItem(0,6,904+GetNpcParam(nNpcIdx, 1),0,0,5,0,0));
		AddTimeItem(nItemIdx, 604800);
		Msg2Player(format("B�n nh�n ���c m�t %s ",GetNameItem(nItemIdx)));
		SetNpcParam(nNpcIdx, 4, GetNpcParam(nNpcIdx,4)+1)		
		if(GetNpcParam(nNpcIdx,4) >= 5) then
			DelNpc(nNpcIdx)
		end
	elseif(GetNpcParam(nNpcIdx, 1) == 4) then
		if(GetNpcParam(nNpcIdx,4) >= 1) then
			return
		end;	
		local nItemIdx = AddItemID(AddItem(0,6,908,0,0,5,0,0));
		AddTimeItem(nItemIdx, 604800);
		AddNews(format("��i hi�p %s �� h�i ���c qu� Ho�ng Kim!!!",GetName()));
		SetNpcParam(nNpcIdx, 4, GetNpcParam(nNpcIdx,4)+1)		
		DelNpc(nNpcIdx)
	end
end;

function Timeout(nNpcIdx)
	DelNpc(nNpcIdx);
end;