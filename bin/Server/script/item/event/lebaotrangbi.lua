BOTRANGBI = {
[1] = {{167,175},6,5,"B�n nh�n ���c b� trang b� Thi�n Ho�ng"},
[2] = {{185,188},6,3,"B�n nh�n ���c b� trang b� Hi�p C�t"},
[3] = {{189,192},6,3,"B�n nh�n ���c b� trang b� Nhu T�nh"},
};

function main(nItemIdx)
	local _,DT = FindItemEx(nItemIdx);
	if(BOTRANGBI[DT]) then
	if (CheckRoom(BOTRANGBI[DT][2],BOTRANGBI[DT][3]) == 0) then
		PutMessage("Kho�ng tr�ng trong t�i kh�ng ��",7,1)
		return end;
	for i = BOTRANGBI[DT][1][1],BOTRANGBI[DT][1][2] do
		AddItemID(AddItem(2,0,i,0,0,0,RANDOM(1,10)))
	end
	Msg2Player(BOTRANGBI[DT][4])
	RemoveItem(nItemIdx,1);
	end;
end