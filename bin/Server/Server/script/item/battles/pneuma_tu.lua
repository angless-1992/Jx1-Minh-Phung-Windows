Include("\\script\\header\\forbidmap.lua")

function add466()
		level = random(1,4);
		AddSkillState(466,level,1,1080)
		Msg2Player("B�n nh�n ���c<color=cyan> 1 ph�t gi�m th� th��ng "..(level*10).."%")	
end

function add467()
		level = random(1,4);
		AddSkillState(467,level,1,1080)
		Msg2Player("B�n nh�n ���c<color=cyan> 1 ph�t gi�m th�i gian tr�ng ��c: "..(level*10).."%")	
end

Tab={add466,add467}

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
