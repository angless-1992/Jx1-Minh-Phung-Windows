function main(nItemIndex)
	
	if (CalcFreeItemCellCount() < 12)  then
		Say("Xin h�y s�p x�p l�i h�nh trang tr��c ��!");
		return 1;
	end;
	RemoveItem(nItemIndex,1);
	for i = 490, 501 do
		AddItemID(AddItem(0,4,i,0,0,5,0,0));
	end;
	
	Msg2Player("Nh�n ���c 12 m�nh t�ng b�o ��.");
end;