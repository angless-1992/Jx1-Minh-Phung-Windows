function main(NpcIndex)
	local NOT_TRADE = "K�t th�c ��i tho�i/no";
	Say(10093,3,
		"Ta mu�n xem qua/giaodich",
		"Mua th� t�n g�u[50 v�n l��ng]/thetangau",
		NOT_TRADE)
end;

function thetangau()
	if(GetCash() >= 500000) then
		Pay(500000);
		AddItemID(AddItem(0,6,1063,0,0,5,0,0));
	else
		MsgPlayer("<sex> �� qu�n ti�n trong r��ng ch�a r�i sao?");
	end;
end;

function giaodich()
	Sale(96);
end;

function no()
end;
