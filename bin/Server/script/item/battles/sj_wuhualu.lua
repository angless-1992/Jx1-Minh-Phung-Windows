Include("\\script\\header\\forbidmap.lua")

function add471()
		level = random(2,10);
		AddSkillState(471, level, 1, 12 )
		Msg2Player("B�n nh�n ���c<color=cyan> h�i ph�c sinh l�c trong n�a gi�y "..(level*500).." �i�m v� h�i ph�c n�i l�c trong n�a gi�y "..(level*500).." �i�m")	
end

function add472()
		level = random(1,10);
		AddSkillState(472, level, 1, 540 )
		Msg2Player("B�n nh�n ���c<color=cyan> 30 gi�y h�i ph�c sinh l�c, h�i ph�c m�i n�a gi�y "..(level*100).." �i�m v� 30 gi�y h�i ph�c n�i l�c, h�i ph�c m�i n�a gi�y "..(level*100).." �i�m")	
end

function add490()
		level = random(10,20);
		AddSkillState(490, level,1, 540 )
		Msg2Player("B�n nh�n ���c<color=cyan> m�c sinh l�c 30 gi�y t�ng: "..(level*100).." �i�m v� trong 30 gi�y m�c n�i l�c t�ng: "..(level*100).." �i�m")	
end

Tab={add471,add472,add490}

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

