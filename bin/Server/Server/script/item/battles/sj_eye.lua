Include("\\script\\header\\forbidmap.lua")

function add495()
		level = random(10,20);
		AddSkillState(495, level, 1,1080)
		Msg2Player("B�n nh�n ���c<color=cyan> t�ng s�c m�nh t�n c�ng trong 1 ph�t "..(level*10).."%")	
end

Tab={add495}

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
