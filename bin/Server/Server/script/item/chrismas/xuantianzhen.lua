Include( "\\script\\header\\forbidmap.lua" )
--Ma Tuy Hieu Giac
function main(nItemIdx)
	local W,X,Y = GetWorldPos();
	local nMapId = W;	
	if ( checkSJMaps(nMapId) ~= 1 ) then
		Msg2Player("L�c n�y b�n kh�ng th� s� d�ng v�t ph�m n�y");
		return 1;
	end
	CastSkill(505,1)
	RemoveItem(nItemIdx,1,1);
end