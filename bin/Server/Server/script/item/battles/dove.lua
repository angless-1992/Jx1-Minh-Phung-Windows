Include( "\\script\\header\\forbidmap.lua" )

--Bo cau tong kim
function main(nItemIdx)
	local W,X,Y = GetWorldPos();
	local nMapId = W;	
	if ( checkSJMaps(nMapId) ~= 1 ) then
		Msg2Player("L�c n�y b�n kh�ng th� s� d�ng v�t ph�m n�y");
		return 1;
	end
	local nowmissionid = 1;
	local curcamp = GetCurCamp();
	X = floor( X /32/ 8 );
	Y = floor( Y /32/ 16 );
	string = "<color=yellow>"..GetName().."<color><color=pink>: 'T�a �� hi�n t�i c�a ta l� <color=yellow> ("..X..", "..Y..")<color>. H�y ��n gi�p ta m�t tay.'";
	Msg2MSGroup( nowmissionid, string, curcamp-1 );
	Msg2Player("B�n s� d�ng b� c�u th�ng b�o cho chi�n h�u t�a �� hi�n t�i c�a b�n.");
	RemoveItem(nItemIdx,1);
end
