Include("\\script\\header\\forbidmap.lua")

function add463()
		level = random(2,10);
		AddSkillState(463, level, 1, 12 )
		Msg2Player("B�n nh�n ���c<color=cyan> h�i ph�c n�i l�c trong n�a gi�y "..(level*500).." �i�m")	
end

function add465()
		level = random(1,10);
		AddSkillState(465, level, 1, 540 )
		Msg2Player("B�n nh�n ���c<color=cyan> 30 gi�y h�i ph�c n�i l�c, h�i ph�c m�i n�a gi�y "..(level*100).." �i�m")	
end

function add489()
		level = random(10,20);
		AddSkillState(489, level, 1, 540 )
		Msg2Player("B�n nh�n ���c<color=cyan> 30 gi�y m�c n�i l�c t�ng:: "..(level*100).." �i�m")	
end

Tab={add463,add465,add489}

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

