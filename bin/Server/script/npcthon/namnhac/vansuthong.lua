FIND_MONEY = {2500000,1000000,250000};
ENDTALK = "Kh�ng h�i tr��c/khonghoi"
function main(NpcIndex)
	Say(11439,4,
	format("T�n %d v�n l��ng b�c �� bi�t tin t�c v� m�t ng��i/timnguoi",FIND_MONEY[1]/10000),
	format("T�n %d v�n l��ng b�c �� bi�t tin t�c v� m�t ng��i/timnguoi",FIND_MONEY[2]/10000),
	format("T�n %d v�n l��ng b�c �� bi�t tin t�c v� m�t ng��i/timnguoi",FIND_MONEY[3]/10000),
	ENDTALK)
end;

function timnguoi(sel)
	local nSel = sel+1;
	Input("timten("..nSel..")")
end;

function timten(sel)
	if(sel< 1 or sel > 3) then
	Talk(1,"",11441);
	return end;
	local name = GetInput();
	if(name==GetName() or GetCash() < FIND_MONEY[sel]) then
	Talk(1,"",11441);
	return end;
	local nPlayer = FindPlayer(name);
	if(nPlayer <= 0) then
	Say("Xin l�i "..name.." hi�n gi�i kh�ng tr�n m�ng, kh�ng th� bi�t n�i � c�a h�n, ph� ta ch� l�y m�t n�a th�i",0)
	Pay(FIND_MONEY[sel]/2);
	return end
	local tempid = PlayerIndex;
	PlayerIndex = nPlayer;
	local w,x,y = GetWorldPos();
	local pk = GetPK();
	PlayerIndex = tempid;
	Pay(FIND_MONEY[sel]);
	if(sel==1) then
	Say(name.." v� tr� hi�n t�i l� <color=red>"..GetWorldName(w).."("..floor(x/8).."/"..floor(y/16)..")<color> �i�m PK <color=red>"..pk.."<color>. N�u ng��i mu�n t�m h�n th� �i nhanh l�n",1,
	"�a t�/no");
	elseif(sel==2) then
	Say(name.." v� tr� hi�n t�i l� <color=red>"..GetWorldName(w).."("..floor(x/8).."/"..floor(y/16)..")<color>. N�u ng��i mu�n t�m h�n th� �i nhanh l�n",1,
	"�a t�/no");
	elseif(sel==3) then
	Say(name.." b�y gi� � t�i <color=red>"..GetWorldName(w).."<color> ng��i �i nhanh �i, n�u h�n �i n�i kh�c ta kh�ng qu�n ���c ��u",1,
	"�a t�/no");
	end;
end;

function khonghoi()
Talk(1,"",11441);
end;

function no()
end;