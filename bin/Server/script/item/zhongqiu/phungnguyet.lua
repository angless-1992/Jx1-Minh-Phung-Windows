--hoangnhk
Include("\\script\\header\\taskid.lua");
function main(nItemIdx) 
	str ={ 
	"B�n th� c�n m�t mi�ng 'Ph�ng Nguy�t Qu� Dung', k�t qu� kh�ng c� g� x�y ra", 
	"B�n �n m�t c�i 'Ph�ng Nguy�t Qu� Dung', c�m th�y c� m�t lu�ng ch�n kh� lu�n chuy�n, nh�t th�i v� c�ng ti�n b� v��t b�c", 
	"B�n �� �n 2 c�i 'Ph�ng Nguy�t Qu� Dung' r�i, b�y gi� kh�ng �n ���c" 
	} 
	if (GetLevel() < 80) then
		Msg2Player(str[1]);
	return end;
	local nValue = GetTask(TASK_TAYTUYKINH)
	local nTimes = GetNumber(1,nValue,5);
	if (nTimes >= 2) then
		Msg2Player(str[3]);
	else
		SetTask(TASK_TAYTUYKINH, SetNumber(1,nValue,5,nTimes+1))
		AddMagicPoint(1);
		RemoveItem(nItemIdx, 1);
		Msg2Player(str[2]);
	end
end
