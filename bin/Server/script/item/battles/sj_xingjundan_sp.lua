Include("\\script\\header\\forbidmap.lua")

function main(nItemIdx)
	local W,X,Y = GetWorldPos();
	local nMapId = W;	
	if ( checkSJMaps(nMapId) ~= 1 ) then
		Msg2Player("L�c n�y b�n kh�ng th� s� d�ng v�t ph�m n�y");
		return 1;
	end
	RemoveItem(nItemIdx,1);
	AddSkillState(472, 5, 1, 54 )
	Msg2Player("S� d�ng r�i 'H�nh Qu�n ��n ��c bi�t'.")	
end

