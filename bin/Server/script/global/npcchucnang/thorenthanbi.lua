--hoangnhk
NEED_ROOM_EMPTY = "H�nh trang ph�i c� �� 2x4 � tr�ng."
function main()
	Say(14808,3,
        "Ph�c h�i trang b� t�n h�i/tonhai",
		"Kh�m b�ng v�t qu� T�y v�c/kham",
		"K�t th�c ��i tho�i!/no")
end

function tonhai()
	GiveItemUI("Ph�c h�i trang b� t�n h�i","H�y ��t trang b� t�n h�i c�a ng��i v�o ��y. M�i l�n ch� ���c 1 c�i th�i. Chi ph� c�n c� 5 ti�n ��ng.","checkdoi")
end;

function kham()
	Say(15459,3,
        "N�ng c�p trang b� /nangcap",
		"Gi�m ��ng c�p trang b�/giamcap",
		"Tho�t/no")
end

function nangcap()
	PutTremble("��t trang b� xanh ho�c tr�ng v�o ��y, trang b� t�o ra s� t�ng 1 c�p v�i ma ph�p kh�ng thay ��i.","y/checknangcap","n/no")
end;

function giamcap()
	PutTremble("��t trang b� xanh ho�c tr�ng v�o ��y, ��ng c�p trang b� s� gi�m 1. Thu�c t�nh ma ph�p kh�ng ��i.","y/checkgiamcap","n/no")
end;

function no()
end
