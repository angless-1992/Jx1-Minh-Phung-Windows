--hoangnhk
Include("\\script\\header\\taskid.lua");
function main(nItemIdx) 
	str ={ 
	"B�n th� c�n m�t mi�ng 'C�ng Nguy�t Ph� Dung', k�t qu� kh�ng c� g� x�y ra", 
	"B�n �n m�t c�i 'C�ng Nguy�t Ph� Dung', c�m th�y th� tr�ng nh� nh� tho�t t�c, h�i th� v� c�ng s�ng kho�i", 
	"B�n �� �n 3 c�i 'C�ng Nguy�t Ph� Dung' r�i, b�y gi� kh�ng �n ���c" 
	} 
	if (GetLevel() < 80) then
		Msg2Player(str[1]);
	return end;
	local nValue = GetTask(TASK_TAYTUYKINH)
	local nTimes = GetNumber(1,nValue,6);
	if (nTimes >= 3) then
		Msg2Player(str[3]);
	else
		SetTask(TASK_TAYTUYKINH, SetNumber(1,nValue,6,nTimes+1))
		AddProp(5);
		RemoveItem(nItemIdx, 1);
		Msg2Player(str[2]);
	end
end
