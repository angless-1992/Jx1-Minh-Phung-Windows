Include("\\script\\header\\taskid.lua")

function main(nIndex)
	if(GetTask(TASK_NPCVANTIEU) == GetNpcID(nIndex)) then
	AddItemID(AddItem(0,6,4771,0,0,5,0,0))
	DelNpc(nIndex)
	Msg2Player("B�n �� �o�t l�i Ti�u K�. H�y mang v� Long M�n ti�u c�c nh�n lao ph�")
	return end
	Msg2Player("Ti�u xa n�y kh�ng c� � ngh�a g� v�i b�n")
end

function Timeout(nIndex)
	DelNpc(nIndex)
end