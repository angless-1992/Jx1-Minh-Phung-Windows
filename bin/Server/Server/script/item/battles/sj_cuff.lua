Include("\\script\\header\\forbidmap.lua")

function add496()
		level = random(1,2);
		AddSkillState(496,level,1,1080)
		Msg2Player("B�n nh�n ���c<color=cyan> t�ng ��ng t�c xu�t chi�u trong 1 ph�t "..(level*10).."%")	
end

Tab={add496}

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

