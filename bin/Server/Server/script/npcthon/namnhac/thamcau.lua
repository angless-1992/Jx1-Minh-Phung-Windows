Include("\\script\\lib\\worldlibrary.lua");
Include("\\script\\header\\taskid.lua");

function main(NpcIndex)
	if(GetTongFigure() == 3) then
		if(GetNumber(1,GetTongParam(),9)<1) then
		Talk(4,"sel_color","V� <sex> n�y xin d�ng b��c ��. ","Huynh ��i, c� chuy�n g� c�n ch� gi�o? ","T�i h� Th�m C�u, hi�n c� 1 con thi�n l� m� mu�n b�n, xem v� huynh ��i n�y nh�t ��nh l� m�t ��i t�ng s� c�a ch�nh ph�i. Ng�a t�t c�a t�i h� th�t kh�ng x�u h� khi ph�c v� anh h�ng. ","�� ta xem th� ng�a qu� c�a huynh...")
		else
			Talk(1,"giaodich","Ng��i nh�t ��nh ph�i ��i ��i t�t v�i ng�a, h�ng ng�y ph�i t�m cho n�, b�nh ��u ph�i gi� b�t cho nhuy�n... ")
		end;
	else
		giaodich();
	end;
end;

function giaodich()
	Say(10062,2,
	"Mua ng�a/giaodich1",
	"Ta ch� gh� qua th�i/no")
end;

function sel_color()
	Say("<sex> h�y xem! ",6,
	"��y kh�ng ph�i l� � V�n ��p Tuy�t sao!/buy_color",
	"��y kh�ng ph�i l� X�ch Th� B�o M� sao!/buy_color",
	"��y kh�ng ph�i l� Tuy�t �nh sao!/buy_color",
	"��y kh�ng ph�i l� ��ch L� sao!/buy_color",
	"��y ch�ng ph�i l� Chi�u D� Ng�c S� T� sao!/buy_color",
	"��y l� ng�a g� v�y? T�i h� hi�u bi�t c�n k�m/buy_none")
end

function buy_color(sel)
	local nSel =sel+1;
	Say("Kh�ng sai, <sex> qu� nhi�n bi�t nh�n! T�i h� ��y c�ng kh�ng mu�n ph�i b�n n�, nh�ng hi�n gi� t�i h� c�n 300 v�n l��ng b�c! Hy v�ng <sex> ��i ��i t�t v�i n�!",2,
	"Kh�ng sao ��u, ta nh�t ��nh s� ��i x� t�t v�i n� m�/buy_yes("..nSel..")",
	"Nh�t th�i l�m sao t�m ra ���c s� ti�n n�y/buy_no")
end;

function buy_none()
	Talk(1,"","Nh�t bang chi ch�, l� m�t nh�n v�t b�c th�y l�m sao kh�ng bi�t ��y r�t cu�c l� ng�a g� ch�? Th� l�i, xem ra t�i h� �� nh�n l�m ng��i!")
end

function buy_yes(nSel)
	if (GetCash() >= 3000000) then
		Pay(3000000)
		SetTongParam(SetNumber(1,GetTongParam(),9,1));
		AddItemID(AddItem(0,0,10,5,nSel,0,0,0))
		Talk(1,"","Ng�a �i ng�a! T� ��y v� sau ng��i h�y �i theo v� <sex> n�y nh�, nh�t ��nh ph�i ngoan ngo�n ��!")
	else
		Talk(1,"","Ta hi�n gi� trong ng��i kh�ng mang theo �� ng�n l��ng, huynh t�m th�i c�m �� s� ti�n n�y v�y!")
	end
end

function buy_no()
	Talk(1,"","Kh�ng l� s� ti�n n�y l�i l�m kh� <sex> sao")
end

function giaodich1()
	Sale(91)
end;


function no()
	--Talk(1,"",10064)
	Talk(1,"","Thi�n L� m� kh�ng thi�u, nh�ng ng��i bi�t d�ng ng�a h�i c� m�y ai!")
end;