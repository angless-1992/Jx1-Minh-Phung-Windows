--hoangnhk
Include("\\script\\header\\taskid.lua");
function main(nItemIdx)
	local str ={
		"B�n �� xem k� quy�n 'T�y T�y Kinh' nh�ng kh�ng th� hi�u",
		"B�n �� ��c 'T�y T�y Kinh', nh�n ���c 5 �i�m ti�m n�ng",
	}
	local nValue = GetTask(TASK_BOOKS)
	local nTimes = GetNumber(2,nValue,1);
	if (nTimes >= 15 or GetLevel() < 80) then
		Msg2Player(str[1]);
	else
		SetTask(TASK_BOOKS, SetNumber(2,nValue,1,nTimes+1))
		AddProp(5);
		RemoveItem(nItemIdx, 1);
		Msg2Player(str[2]);
	end
end;
