Include("\\script\\header\\forbidmap.lua");
function main(nItemIdx)
	local W,X,Y = GetWorldPos();
	local nMapId = W;	
	if ( checkSJMaps(nMapId) ~= 1 ) then
		Msg2Player("L�c n�y b�n kh�ng th� s� d�ng v�t ph�m n�y");
		return 1;
	end
	if(DelItem(1,0,6,215)==1) then
	ModifyAttrib(153,1000,100,0);
	ModifyAttrib(154,1000,100,0);
	end;
end