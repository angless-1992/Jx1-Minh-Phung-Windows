function main( nItemIndex )
    
    local nPLev = GetLevel()
    if nPLev > 90  or nPLev < 50 then
        Say("Ch� c� nh�n v�t c�p �� t� 50 ��n 90 (bao g�m c�p 50 v� 90) m�i c� th� s� d�ng.", 0)
        return 0
    end
	
	RemoveItem(nItemIndex,1);
    AddStackExp(1433042000)
	nPLev = GetLevel()
	Msg2Player(format("Ch�c m�ng b�n, ��ng c�p hi�n t�i c�a b�n l� %d.",nPLev))
end
