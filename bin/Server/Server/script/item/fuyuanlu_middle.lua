-- Phuc Duyen Lo Trung
Include("\\script\\header\\fuyuan.lua");
function main(nItemIdx)
	if( FuYuan_Add( 20 ) ~= 1 ) then
		Msg2Player( "B�n t�m th�i ch�a th� s� d�ng Ph�c Duy�n, tr��c ti�n h�y �i t�m V� L�m Minh Ch� Truy�n Nh�n � c�c th�nh th� l�n �� m� c�ng n�ng n�y. " );
		return 1;
	end	
	RemoveItem(nItemIdx,1)
end