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
	
	if(UseTownPortal()) then	
		RemoveItem(nItemIdx,1);
	end
end