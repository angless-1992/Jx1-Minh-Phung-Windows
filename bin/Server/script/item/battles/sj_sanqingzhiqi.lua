Include("\\script\\header\\forbidmap.lua")

function add505()
		CastSkill(505, 1 )
		Msg2Player("B�n s� d�ng 1<color=cyan> Tam Thanh Kh�, khi�n k� ��ch quanh b�n b� cho�ng.")	
end

function add506()
		CastSkill(506, 1 )
		Msg2Player("B�n s� d�ng 1<color=cyan> Tam Thanh Kh�, khi�n k� ��ch quanh b�n b� ��ng b�ng.")	
end

function add507()
		CastSkill(507, 1 )
		Msg2Player("B�n s� d�ng 1<color=cyan> Tam Thanh Kh�, khi�n k� ��ch quanh b�n b� tr�ng ��c.")	
end

function add508()
		CastSkill(508, 1 )
		Msg2Player("B�n s� d�ng 1<color=cyan> Tam Thanh Kh�, khi�n k� ��ch quanh b�n b� gi�m t�c.")	
end

Tab={add505,add506,add507,add508}

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

