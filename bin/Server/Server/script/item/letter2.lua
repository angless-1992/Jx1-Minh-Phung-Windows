Include("\\script\\feature\\nvhoangkim\\hkhead.lua");
function main(nItemIdx)
	Say("LINK:\\spr\\item\\questkey\\taskobj075_b.spr",0,10372,1,"Nh�n h�m th�/nhanthu");
	RemoveItem(nItemIdx,1);
end;

function nhanthu()
	AddNote(3,0,"Long Kh� chi h�a\nThi�n Ho�ng Long Kh� th�c s� �� l�m cho giang h� d�y s�ng! B�n c�ng kh� m� tho�t kh�i s�c h�t h�p d�n c�a n�!")
	AddNote(3,1,"Trong th� Long Ng� b�o b�n ��n Long M�n Tr�n t�m g�p V�n Nhi");
end;