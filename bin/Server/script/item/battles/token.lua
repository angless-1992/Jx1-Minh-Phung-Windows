Include("\\script\\header\\forbidmap.lua")

function main(nItemIdx)
	local W,X,Y = GetWorldPos();
	local nMapId = W;	
	if ( checkSJMaps(nMapId) ~= 1 ) then
		Msg2Player("L�c n�y b�n kh�ng th� s� d�ng v�t ph�m n�y");
		return 1;
	end
	RemoveItem(nItemIdx,1);
	CastSkill( 492, 1);
	Msg2Player("B�n �� s� d�ng 1 l�nh b�i");
end