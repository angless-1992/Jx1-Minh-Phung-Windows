Include("\\script\\header\\forbidmap.lua")

function add483()
		level = random(10,20);
		AddSkillState(483, level, 1, 1080 )
		Msg2Player("B�n nh�n ���c<color=cyan> L�i s�t n�i c�ng trong 1 ph�t t�ng: "..(level*10).." �i�m")	
end

function add499()
		level = random(10,30);
		AddSkillState(499, level, 1, 1080 )
		Msg2Player("B�n nh�n ���c<color=cyan> L�i s�t ngo�i c�ng trong 1 ph�t t�ng: "..(level*10).." �i�m")	
end

Tab={add483,add499}

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


