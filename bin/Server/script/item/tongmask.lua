function  main(nItem)
	local nNpcSettingIdx = GetParamItem(nItem);
	Say("LINK:"..GetNpcTempTypeName(nNpcSettingIdx).."",random(0,13),"M�t n� bang h�i c� th� gi�p cho to�n th� th�nh vi�n c�i trang gi�ng nhau, c� mu�n s� d�ng kh�ng?", 2, "Bang h�i ta s� c�i trang gi�ng nhau./yes("..nItem..")", "T�m th�i kh�ng/no");
end

function yes(nItem)
	local a,b = GetTongName();
	if(b == 0) then
		Msg2Player("Kh�ng � trong bang h�i, kh�ng th� s� d�ng ��o c� n�y.");
		return 1
	end
	local nTongFigure = GetTongFigure();
	if (nTongFigure == 3 or nTongFigure == 2)then
		Msg2Player("Ch� c� bang ch� ho�c tr��ng l�o m�i c� th� s� d�ng ��o c� n�y.");
		return 1
	end	
	local name = GetName();
	local nNpcSettingIdx = GetParamItem(nItem);
	if RemoveItemByIndex(nItem,1) ~= 1 then
		return
	end
	Msg2Tong(name.." s� d�ng m�t n� bang h�i, th�nh vi�n tr�n m�ng c�i trang gi�ng nhau.");
	RemoveItem(nItem,1);
	for i=1,1199 do
		PlayerIndex = i;
		_,nTongID =GetTongName();
		if(GetPlayerNpcIdx() > 0 and nTongID==b) then
		SetMask(nNpcSettingIdx);
		end
	end
end

function no()
end