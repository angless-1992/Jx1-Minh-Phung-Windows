-- Created by tsh 2004-12-09
-- õ�忨
-- ���������ſ�

szTitle="H�y ch�n c�u ch�c:"
Message=
{
	{"Ng��i c� nh� ta nh� ta nh� ng��i kh�ng?","B�t c� l�c n�o ng��i nh� ��n ta th� c�ng l� l�c ta �ang nh� ��n ng��i!"},
	{"Ng��i l� l� s�ng c�a ta","Khi ta n�i ng��i l� linh h�n v� l� s�ng c�a ta, xin ��ng kinh ng�c, v� ng��i kh�ng th� thi�u trong cu�c ��i ta."},
    {"Ng��i �� th�p s�ng ng�n ��n trong ��m tuy�t r�i","B�i khi th�y ng��i, c�m gi�c �m �p nh� trong ��m t�i b�ng nh�n th�y ng�n h�a ��ng. Ch�nh ng��i �� th�p l�n ng�n l�a �m �p trong ��m!"},
    {"Kh�ng th� r�i xa ng��i trong cu�c ��i n�y.","500 n�m ta �� nguy�n c�u tr��c ��c Ph�t, mong ��c ���c k�t duy�n tr�n, c�ng ng��i tr�n ��i n�y m�i kh�ng r�i xa."},
    {"Nguy�n c�ng ng��i m�i m�i b�n nhau","��ng n�i nh�ng l�i ���ng m�t, ��ng t�ng nhau nh�ng m�n ��t ti�n! C�i em c�n ch�nh l� tr�i tim th�t l�ng c�a anh!"},
    {"Ng��i v� ta m�i kh�ng kh�t b�n nhau, xin ��ng ph� r�y m�i l��ng duy�n!","M�c cho th�i gian y�u nhau bao l�u, mong ng��i lu�n �u y�m b�n ta, xin ��ng ph� r�y m�i l��ng duy�n!"},
    {"Tr��ng T��ng T� ","Thi�n tr��ng l� vi�n h�n phi kh�, m�ng h�n b�t ��o quan s�n nan. Tr��ng t��ng t� x� n�t t�m can."},
    {"T� Thanh B�o Ki�m c�a ta","T� Thanh B�o Ki�m c�a ta ph�t ra t�n hi�u tu..tu. H�a ra � trung nh�n l� ng��i, c�n b� �i ��u?"},
    {"Ng��i �� c��p m�t h�n ta","Ng��i sao c��p m�t h�n ta �� ng�y ��m ta mang m�i h�nh b�ng ng��i!"},
}

FuncBless={}

function main(index)
dofile("script/item/item_magicscript/1967.lua")
main1(index)
end
function main1(index)
	Input(format("chonloichuc(%d)",index))
end

function chonloichuc(index)
	local name = GetInput();
	local nTIdx = FindPlayer(name)
	if (nTIdx > 0) then
	local nSelectCount = getn(Message);
	for i=1, nSelectCount do
		FuncBless[i] = format(Message[i][1].."/BlessPlayerOnline[%d, %d,%d]",index, nTIdx, i)
	end

	nSelectCount = nSelectCount + 1;
	FuncBless[nSelectCount] = "H�y b� /QueryWiseManCancel"

	Say(szTitle, getn(FuncBless), FuncBless);
	else
	Msg2Player("Ng��i m� b�n mu�n ch�c ph�c hi�n kh�ng c� tr�n m�ng! ��i l�c sau th� l�i!.");
	end
--�Ȳ�ɾ����ҵĿ�Ƭ����ʵ�ʷ�����ף��ʱ��ɾ����ʱ��¼����װ����ţ�
	return 1;

end


function BlessPlayerOnline(index, nTargetIdx, nSelect)
	local nMyIdx = PlayerIndex;
	PlayerIndex = nTargetIdx;
	local TargetName = GetName();
	PlayerIndex = nMyIdx;
	if (RemoveItem(index,1) == 1) then
		local szMsg
		szMsg = GetName().." n�i v�i "..TargetName..""..Message[nSelect][2]
		AddCountNews(szMsg,1);
	else
		Msg2Player("Kh�ng t�m ���c th�! Xin th� l�i 1 l�n!.")
	end
end

function QueryWiseManCancel()
end