Include("\\script\\header\\forbidmap.lua")

function main(nItemIdx)
	local W,X,Y = GetWorldPos();
	local nMapId = W;	
	if ( checkSJMaps(nMapId) ~= 1 ) then
		Msg2Player("L�c n�y b�n kh�ng th� s� d�ng v�t ph�m n�y");
		return 1;
	end
	RemoveItem(nItemIdx,1);
	AddSkillState( 483, 10, 1, 3240);
	Msg2Player("B�n ���c 1 vi�n N�i L�i ho�n");
end