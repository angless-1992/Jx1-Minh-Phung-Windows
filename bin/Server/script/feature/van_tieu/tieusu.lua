Include("\\script\\lib\\worldlibrary.lua")
Include("\\script\\header\\taskid.lua")

function main(nIndex)
dofile("script/feature/van_tieu/tieusu.lua");
	Say("Ta l� ng��i c�a Long M�n ti�u c�c. Ta ti�p nh�n trung chuy�n nh�ng chuy�n ti�u � n�i n�y! Ng��i c� vi�c g�?",2,
	"Giao ti�u/giaotieu",
	"H�i th�m th�i/no")
end

function giaotieu()
	SubWorld = SubWorldID2Idx(21)
	if (SubWorld < 0) then
	return end
	local nTaskValue = GetTask(TASK_VANTIEU)
	local nTask = GetNumber(1,nTaskValue,1)
	if(nTask == 0) then
		Talk(1,"","H�! Ng��i ��u ph�i l� ng��i do Long M�n ti�u c�c ph�i t�i!")
	elseif(nTask < 4) then
		local nNpcIdx = FindAroundNpc(GetTask(TASK_NPCVANTIEU))
		if(nNpcIdx > 0) then
			local nKilled = GetNumber(1,nTaskValue,2)
			if (nKilled > 0) then
				Talk(1,"","Tr�n ���ng ng��i kh�ng h� g�p chuy�n g� b�t tr�c sao?")
			return end		
			DelNpc(nNpcIdx)
			SetTask(TASK_VANTIEU, SetNumber(1,nTaskValue,1,nTask+3))
		else
			Talk(1,"","Ti�u xa c�a ng��i ��u? Ta kh�ng nh�n th�y!")
		end
	else	-- = 4.5.6
		Talk(1,"","H�y v� g�p �ng ch� �� nh�n lao ph� �i b�n tr�!")
	end
end

function no()
end