Include( "\\script\\header\\forbidmap.lua" );
function main(nItemIdx)
	if (GetFightState() == 0 or GetTaskTemp(99) == 1 ) or ( SubWorldIdx2ID( SubWorld ) >= 387 and SubWorldIdx2ID( SubWorld ) <= 395)then
		Msg2Player("Hi�n t�i b�n kh�ng th� s� d�ng b�a v� th�nh!");
		return 1
	end
	
	local W,X,Y = GetWorldPos();
	local nMapId = W;	
	if ( checkSJMaps(nMapId) == 1 ) then
		Msg2Player("L�c n�y b�n kh�ng th� s� d�ng v�t ph�m n�y");
		return 1;
	end
	--if(GetCash() <500) then
	--	Msg2Player("Kh�u tr� 500 l��ng th�t b�i");
	--return end;
	--Pay(500);
	local itemname = GetNameItem(nItemIdx);
	local n_param = GetParamItem(nItemIdx);
	n_param = n_param - 1;
	if (n_param <= 0) then
		RemoveItem(nItemIdx,1)
		Msg2Player(""..itemname.." �� s� d�ng h�t s� l�n, kh�ng th� d�ng ���c n�a!")
	else
		SetParamItem(nItemIdx,n_param);
		Msg2Player(""..itemname.." c�n c� th� s� d�ng "..n_param.." l�n")
	end
	UseTownPortal();
end