Include("\\script\\header\\forbidmap.lua")

function add479()
		level = random(10,20);
		AddSkillState(479, level, 1, 1080 )
		Msg2Player("B�n nh�n ���c<color=cyan> s�t th��ng v�t l� n�i c�ng trong 1 ph�t t�ng: "..(level*10).." �i�m")	
end

function add487()
		level = random(5,10);
		AddSkillState(487, level, 1, 1080 )
		Msg2Player("B�n nh�n ���c<color=cyan> s�t th��ng v�t l� ngo�i c�ng trong 1 ph�t t�ng "..(level*10).."%")	
end

Tab={add479,add487}

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

