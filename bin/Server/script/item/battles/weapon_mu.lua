Include("\\script\\header\\forbidmap.lua")

function add480()
		level = random(1,5);
		AddSkillState(480, level, 1, 1080 )
		Msg2Player("B�n nh�n ���c<color=cyan> ��c s�t n�i c�ng trong 1 ph�t t�ng: "..(level*10).." �i�m")	
end

function add485()
		level = random(1,5);
		AddSkillState(485, level, 1, 1080 )
		Msg2Player("B�n nh�n ���c<color=cyan> ��c s�t ngo�i c�ng trong 1 ph�t t�ng: "..(level*10).." �i�m")	
end

Tab={add480,add485}

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

