--hoangnhk
Include("\\script\\header\\taskid.lua");
function main(nItemIdx)
	local str={
		"B�n c�m quy�n V� L�m M�t T�ch nghi�n c�u c� n�a ng�y, k�t qu� c�ng kh�ng l�nh ng� ���c g�. ",
		"B�n c�m quy�n V� L�m M�t T�ch nghi�n c�u c� n�a ng�y, k�t qu� l�nh ng� ���c ch�t �t. ",
		"B�n c�m quy�n V� L�m M�t T�ch nghi�n c�u c� n�a ng�y, k�t qu� c�ng thu ���c m�t v�i �i�u t�m ��c li�n quan ��n v� c�ng ",
		"B�n �� nghi�n ng�m k� quy�n V� L�m M�t T�ch, nh�ng kh�ng thu ���c �i�u g� t�m ��c "
		}
	local nValue = GetTask(TASK_BOOKS)
	local nTimes = GetNumber(2,nValue,2);
	if (nTimes >= 15) then
		Msg2Player(str[4]);
	elseif(GetLevel() < 80) then
		Msg2Player(str[2]);
	else
		SetTask(TASK_BOOKS, SetNumber(2,nValue,2,nTimes+1))
		AddMagicPoint(1);
		RemoveItem(nItemIdx, 1);
		Msg2Player(str[3]);
	end
end;