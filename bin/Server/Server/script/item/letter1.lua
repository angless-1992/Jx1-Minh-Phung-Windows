Include("\\script\\feature\\nvhoangkim\\hkhead.lua");
function main(nItemIdx)
	Say("LINK:\\spr\\item\\questkey\\taskobj075_b.spr",0,10371,1,"Nh�n h�m th�/nhanthu");
	RemoveItem(nItemIdx,1);
end;

function nhanthu()
	AddNote(2,0,"C�u chuy�n L�m Uy�n Nhai\nLong Ng� gi�i thi�u b�n ��n Bi�n Kinh g�p Ph� Nam B�ng <color=Red>(212,197)<color>, l� 1 ng��i trong t� ch�c L�m Uy�n Nhai. Xem ra b�n kh�ng th� an nh�n n�a r�i!");
	AddNote(2,1,"Long Ng� b�o b�n ��n Bi�n Kinh t�m g�p Ph� Nam Bang (212,197)");
end;