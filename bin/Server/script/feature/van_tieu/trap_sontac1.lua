Include("\\script\\header\\taskid.lua")
function main()
	local nTask = GetTask(TASK_VANTIEU)
	if(GetNumber(1,nTask,1) == 0) then
	return end
	if(GetNumber(1,nTask,2) == 1) then
		Msg2Player("B�n �� b� S�n t�c h� mai ph�c. H�y ��nh b�i h�n m�i c� th� �i ti�p!")
		SetPos(2464,3874)
	end
end