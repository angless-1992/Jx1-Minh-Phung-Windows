--hoangnhk
Include("\\script\\lib\\worldlibrary.lua")
Include("\\script\\header\\taskid.lua");

function main(nItemIdx)
	if(RemoveItem(nItemIdx,1)==1)then
	CallTeamFunction(PlayerIndex,getcommon);
	end;
end;

function getcommon()
	local nTaskValue = GetTask(TASK_DATAU_ACCEPT);
	local nKind = GetNumber(2,nTaskValue, 4); --� [7][8] lo�i update
	local nType = GetNumber(1,nTaskValue, 2); --loai ko giao
	local w,x,y = GetWorldPos();
	if(nType == 0 and nKind == 7) then
			nTaskValue = GetTask(TASK_DIADOCHI);
			local nNum = GetNumber(3,nTaskValue,1);
			local nGotNum = GetNumber(3,nTaskValue,2);
			nGotNum = nGotNum + 1;
			if(nNum == w) then
				nNum = SetNumber(3,nTaskValue,2,nGotNum);
				SetTask(TASK_DIADOCHI, nNum);
				Msg2Player("B�n nh�n ���c m�t t�m "..GetWorldName(w).." ��a �� ch�! Hi�n t�i b�n c� t�ng c�ng "..nGotNum.." t�m.");
			return end
	end
	nTaskValue = GetTask(TASK_SHXT);
	nTaskValue = nTaskValue + 1;
	SetTask(TASK_SHXT, nTaskValue);
	local strMain = format("Hi�n t�i b�n c� %d m�nh b�n �� S�n H� X� T�c.", nTaskValue);
	Msg2Player(strMain);
	
end;
		