function main(nItemIdx)
	Say("Xin l�a ch�n n�i ��n chi�n tr��ng T�ng Kim:",3,
	format("V�o �i�m b�o danh b�n T�ng/gotong(%d)", nItemIdx),
	format("V�o �i�m b�o danh b�n Kim/gokim(%d)", nItemIdx),
	"Ch�a mu�n �i/no")
end;

function gotong(nItemIdx)
	if (NewWorld(325,floor(48928/32), floor(102272/32)) == 1) then--bao danh tong kim cao cap--phe Tong
		RemoveItem(nItemIdx,1);
	end
end;

function gokim(nItemIdx)
	if (NewWorld(325,floor(50944/32), floor(98400/32)) == 1) then--bao danh tong kim cao cap--phe Kim
		RemoveItem(nItemIdx,1);
	end
end;

function no()
end;

