function main(nItemIdx)
	p = random(0,99)
	if (p < 50) then
		AddItemID(AddItem(0,0,2,28,2,0,0,0))
		Msg2Player("Gi�ng Sinh vui v�! Ch�c m�ng b�n nh�n ���c 'Giang h� t�nh l�' Kinh Thi�n Gi�p!")
		RemoveItem(nItemIdx,1);
	else
		AddItemID(AddItem(0,0,2,28,5,0,0,0))
		Msg2Player("Gi�ng Sinh vui v�! Ch�c m�ng b�n nh�n ���c 'Giang h� t�nh l�' Kh�p ��a Qu�n")
		RemoveItem(nItemIdx,1);
	end
	
end