Include("\\script\\feature\\nvhoangkim\\hkhead.lua");
function main(nItemIdx)
	Say("LINK:\\spr\\item\\questkey\\taskobj075_b.spr",0,10370,1,"Nh�n h�m th�/nhanthu");
	RemoveItem(nItemIdx,1);
end;

function nhanthu()
	AddNote(1,0,"B� m�t T�m Long h�i\nHi�m nguy �ang b�t ��u ch� b�n! Nh�ng ti�n �� c�ng c� th� t� ��y m� ra!");
	AddNote(1,1,"Long Ng� b�o b�n �i t�m M�c S�u <color=Red>(182,198)<color> � <color=Red>��i L�<color>. ��ng sau c� g�i n�y h�nh nh� c� 1 t� ch�c th�n b� g�i l� B�ch ��o");
end;