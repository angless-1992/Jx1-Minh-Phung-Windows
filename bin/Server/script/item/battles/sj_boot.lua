Include("\\script\\header\\forbidmap.lua")

function add493()
		level = random(1,3);
		AddSkillState(493,level,1,1080)
		Msg2Player("B�n nh�n ���c<color=cyan> t�ng t�c �� di chuy�n trong 1 ph�t "..(level*10).."%")	
end

Tab={add493}

function main( nItemIndex)
	local W,X,Y = GetWorldPos();
	local nMapId = W;	
	if ( checkSJMaps(nMapId) ~= 1 ) then
		Msg2Player("L�c n�y b�n kh�ng th� s� d�ng v�t ph�m n�y");
		return 1;
	end
	if( IsMyItem( nItemIndex ) ) then
		i = random(getn(Tab))
		Tab[i]();
		RemoveItem(nItemIndex,1);
	end
end

