Include("\\script\\lib\\worldlibrary.lua");
Include("\\script\\header\\forbidmap.lua");

function main(nItemIdx)
	local nSubWorldID = GetWorldPos();
	if(checkTRAINMaps(nSubWorldID) == 0 or GetFightState()==0) then
		Msg2Player("Ch� nh�n d��c ph�m h� tr� t�i b�n �� luy�n c�ng");
	return end;
	local nLfTime = GetParamItem(nItemIdx) - GetCurServerSec();
	if(nLfTime > 0) then
		Msg2Player(format("Sau <color=Red>%d gi�y<color> m�i c� th� nh�n ti�p",nLfTime));
	return end;
	--if(GetNormalPKState()~= 0) then
	--Msg2Player("Tr�ng th�i h�a b�nh m�i c� th� nh�n");
	--return end;
	local nFreeCell=CalcFreeItemCellCount();
	if(nFreeCell <= 0) then
		Msg2Player("Xin s�p x�p �t nh�t 1 � tr�ng m�i c� th� nh�n");
	return
	elseif(nFreeCell > 20) then
		nFreeCell = 20;
	end;
	local nPayMoney = 0;
	if(GetLevel()>= 130 or GetTranslife() >=1) then
		local nMoney = 0;
		if(SERVER_MODE == 0) then
			nMoney = 4500;
		else
			nMoney = 78;
		end;
		nPayMoney=nFreeCell*nMoney;
		if(GetCash(2) <nPayMoney) then
			nFreeCell = floor(GetCash(2)/nMoney);
			if(nFreeCell <= 0) then
			Msg2Player("H�nh trang kh�ng �� ng�n l��ng kh�ng th� nh�n");
			return end;
			nPayMoney = nFreeCell*nMoney;
		end;
		nPayMoney = nPayMoney+nPayMoney*10/100;
		Pay(nPayMoney,2);
	end;
	local nNewIdx;
	for i = 1,nFreeCell do
		if(SERVER_MODE == 0) then
			nNewIdx=LockItem(AddItemID(AddItem(0,1,2,0,5,0,0,0)),-2) -- ngu hoa ngoc lo hoan
		else
			nNewIdx=LockItem(AddItemID(AddItem(0,1,2,0,4,0,0,0)),-2) -- that khieu bo tam dan
		end;
	end
	Msg2Player("B�n nh�n ���c "..nFreeCell.." "..GetNameItem(nNewIdx)..", kh�u tr� "..nPayMoney.." l��ng");
	SetParamItem(nItemIdx,GetCurServerSec()+3*nFreeCell);
end