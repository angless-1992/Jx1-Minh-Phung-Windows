Include("\\script\\header\\taskid.lua");
NPCLIFE = 200
NPCEXP = 300
--nguoi choi danh quai' cuoi cung` khi chet
function LastDamage(NpcIndex)
	local nW = GetWorldPos();
	if(nW == 11 and (GetNpcTemplateID(NpcIndex) == 11)) then
	if(GetNumber(1,GetTask(TASK_DUNGCHUNG1),8) == 1) then
		if(GetNumber(2,GetTask(TASK_DUNGCHUNG2,2) < 10)) then
		local nRand = RANDOM(1,20);
		if(nRand<=5) then
		local nTask = GetNumber(2,GetTask(TASK_DUNGCHUNG2),2);
		nTask = nTask+1;
		SetTask(TASK_DUNGCHUNG2,SetNumber(2,GetTask(TASK_DUNGCHUNG2),2,nTask));
		if(nTask<10) then
			Msg2Player(format("Ta �� gi�t ch�t 1 con heo r�ng chuy�n qu�y nhi�u d�n l�ng, tr��c m�t t�ng c�ng �� gi�t ch�t %d con",nTask));
		else
			Msg2Player("Ta �� gi�t ch�t 10 con heo r�ng, c� th� tr� v� ph�c m�nh ���c r�i.");
		end;
		end;
		end;
	end;
	end;
end;

--khi phuc sinh
function Revive(NpcIndex)

	local bBlueBoss = 0;
	if RANDOM(100) < 2 then		--xac suat 2% ra boss xanh
		bBlueBoss = 1;
	end
	if bBlueBoss == 1 then	--thiet lap thuoc tinh cho boss xanh
		SetNpcBoss(NpcIndex,1)
		local nLife = floor(NPCLIFE/4);
		if(nLife <= 0) then
			nLife = 1
		end
		SetNpcLife(NpcIndex, nLife);
		SetNpcExp(NpcIndex, NPCEXP*4);--kinh nghiem
		SetNpcHitRecover(NpcIndex,12);
		SetNpcSpeed(NpcIndex, 8);
		SetNpcResist(NpcIndex, 75, 75, 75, 75, 75);
		SetNpcDmgEx(NpcIndex,25,0,0,0,0,1);--sat thuong ngoai cong
	else	--thiet lap sat thuong cho npc thuong`
		SetNpcLife(NpcIndex, NPCLIFE);
		SetNpcBoss(NpcIndex,0)
		SetNpcExp(NpcIndex, NPCEXP);--set kinh nghiem lai nhu cu
		SetNpcHitRecover(NpcIndex,6);
	end
end

--Khi chet
function DeathSelf(NpcIndex)
end
