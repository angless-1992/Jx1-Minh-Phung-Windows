Include("\\script\\header\\taskid.lua");
OK_ENCHASE = "V�t ph�m ��c/duc";
NOT_TRADE = "K�t th�c ��i tho�i/no";
OK_TREMBLE = "V�t ph�m kh�m n�m/thuytinh";
NEED_ROOM_EMPTY = "H�nh trang ph�i c� �� 2x4 � tr�ng.";
SAME_5HANH = "Trang b� �� c� ng� h�nh th�ch h�p. Xin l�a ch�n ng� h�nh kh�c.";
function main(NpcIndex)
	local OK_TRADE = format("Giao d�ch/giaodich(%d)",NpcIndex);
	SetTaskTemp(NPCINDEX, NpcIndex)
	local NOT_TRADE1 = "Nh�n ti�n gh� qua th�i/no";
	local w,x,y = GetWorldPos();
	if (w == 53) then--ba lang
	Say(11304,2,
		OK_TRADE,
		--OK_TREMBLE,
		--OK_ENCHASE,
		NOT_TRADE1)
	return end
	if (w == 20) then--giang tan
	if(nvgiangtan() == 1) then
	return end;
	Say(12950,2,
		OK_TRADE,
		--OK_TREMBLE,
		--OK_ENCHASE,
		NOT_TRADE1)
	return end
	if (w == 99) then--vinh lac
	Say(12407,2,
		OK_TRADE,
		--OK_TREMBLE,
		--OK_ENCHASE,
		NOT_TRADE1)
	return end
	if (w == 100) then--chu tien
	Say(14571,2,
		OK_TRADE,
		--OK_TREMBLE,
		--OK_ENCHASE,
		NOT_TRADE1)
	return end
	if (w == 101) then--dao huong
	Say(14865,2,
		OK_TRADE,
		--OK_TREMBLE,
		--OK_ENCHASE,
		NOT_TRADE1)
	return end
	if (w == 121) then--long mon
	Say(12101,2,
		OK_TRADE,
		--OK_TREMBLE,
		--OK_ENCHASE,
		NOT_TRADE1)
	return end
	if (w == 153) then--thach co
	Say(13979,2,
		OK_TRADE,
		--OK_TREMBLE,
		--OK_ENCHASE,
		NOT_TRADE1)
	return end
	if (w == 174) then--long tuyen thon
	Say(10944,2,
		OK_TRADE,
		--OK_TREMBLE,
		--OK_ENCHASE,
		NOT_TRADE1)
	return end
	if (w == 1) then--phuong tuong
	Say(12236,2,
		OK_TRADE,
		--OK_TREMBLE,
		--OK_ENCHASE,
		NOT_TRADE)
	return end
	if (w == 11) then--thanh do
	Say(12236,2,
		OK_TRADE,
		--OK_TREMBLE,
		--OK_ENCHASE,
		NOT_TRADE)
	return end
	if (w == 162) then--dai ly
	Say(13901,2,
		OK_TRADE,
		--OK_TREMBLE,
		--OK_ENCHASE,
		NOT_TRADE)
	return end
	if (w == 78) then--tuong duong
	Say(15275,2,
		OK_TRADE,
		--OK_TREMBLE,
		--OK_ENCHASE,
		NOT_TRADE)
	return end
	if (w == 37) then--bien kinh
	Say(14803,2,
		OK_TRADE,
		--OK_TREMBLE,
		--OK_ENCHASE,
		NOT_TRADE)
	return end
	if (w == 80) then--duong chau
	Say(15454,2,
		OK_TRADE,
		--OK_TREMBLE,
		--OK_ENCHASE,
		NOT_TRADE)
	return end
	if (w == 176) then--lam an
	Say(12236,2,
		OK_TRADE,
		--OK_TREMBLE,
		--OK_ENCHASE,
		NOT_TRADE)
	return end
	Say(15454,2,
		OK_TRADE,
		--OK_TREMBLE,
		--OK_ENCHASE,
		NOT_TRADE)
end;

function giaodich(NpcIndex)
	local nParam = GetNpcValue(NpcIndex)
	if(nParam ~= nil and nParam > 0) then
	Sale(nParam)
	end
end;

function nvgiangtan()
	local nTaskValue = GetTask(TASK_NVDANHVONG2);
	local nTask = GetNumber(1,nTaskValue,9);
	if(nTask == 1) then
	SetTask(TASK_NVDANHVONG2, SetNumber(1,nTaskValue,9,2));
	Talk(1,"",12946)
	Msg2Player("Th� r�n b�o b�n ra ngo�i th�n t�m ch�c c�y v� da tr�u �� l�m c�y n�.")
	return 1	end
	if(nTask == 2) then
		if(GetItemCount(0,4,176) > 0) then
		return 0 end
		if(GetItemCount(0,4,177) < 1 or GetItemCount(0,4,178) < 1) then
		Say(12949,2,
		OK_TRADE,
		--OK_ENCHASE,
		NOT_TRADE)
		else
		AddItemID(AddItem(0,4,176,0,0,5,0,0))
		DelItem(1,0,4,177)
		DelItem(1,0,4,178)
		Msg2Player("Nh�n ���c 1 gi�n n�.")
		Talk(2,"",12947,12948)
		end
	return 1	end
	return 0
end;

function thuytinh()
	--Talk(1,"thuytinh2",10853)
	Say("LINK:<npc>",0,"Th�y tinh kh�m n�m li�n quan ��n s� c�n b�ng ng� h�nh, ph��ng ph�p chuy�n linh kh� tuy�t nhi�n kh�ng th� d�ng s�c ng��i ���c, kh�ng h�n nh� ��i hi�p hi v�ng th�nh v�t ph�m tuy�t th� nh�n gian, m� v� kh� �� ph� v� v�c ngo�i k� tr�n ch� gi�p chuy�n ��i ��ng c�p c�a trang b�. C�c h� mu�n kh�m n�m trang b� n�y kh�ng?",4,
	"B�t ��u kh�m n�m/thuytinh2",
	"Li�n quan kh�m n�m/help",
	"�� ta suy ngh� k� l�i xem/no");
end

function thuytinh2()
	PutTremble("okkham")
end

function okkham()
	--ton ngan luong
	--if(GetCash() < xxx) then
	--Msg2Player("Ng��i kh�ng mang �� xxx l��ng.")
	--return end;
	if(CheckRoom(2,4) == 0) then
		Msg2Player(NEED_ROOM_EMPTY)
	return end
	local i,j, nIndex,genre,detail,parti,level,series;

	local count = 0;
	nIndex,genre,detail,parti,level,series = FindItemEx(15,1);
	local nKim = nIndex;
	if(nKim > 0) then
		count = count + 1;
		if(genre ~= 4 or detail ~= 238)	then	--khong cho dat sai cho~
		return end
	end
	nIndex,genre,detail,parti,level,series = FindItemEx(15,2);
	local nMoc = nIndex;
	if(nMoc > 0) then
		count = count + 1;
		if(genre ~= 4 or detail ~= 238)	then	--khong cho dat sai cho~
		return end
	end
	nIndex,genre,detail,parti,level,series = FindItemEx(15,3);
	local nThuy = nIndex;
	if(nThuy > 0) then
		count = count + 1;
		if(genre ~= 4 or detail ~= 238)	then	--khong cho dat sai cho~
		return end
	end
	nIndex,genre,detail,parti,level,series = FindItemEx(15,4);
	local nHoa = nIndex;
	if(nHoa > 0) then
		count = count + 1;
		if(genre ~= 4 or detail ~= 238)	then	--khong cho dat sai cho~
		return end
	end
	nIndex,genre,detail,parti,level,series = FindItemEx(15,5);
	local nTho = nIndex;
	if(nTho > 0) then
		count = count + 1;
		if(genre ~= 4 or detail ~= 238)	then	--khong cho dat sai cho~
		return end
	end
	nIndex,genre,detail,parti,level,series = FindItemEx(15,6);
	local nTu = nIndex;
	if(nTu > 0) then
		count = count + 1;
		if(genre ~= 4 or detail ~= 239)	then	--khong cho dat sai cho~
		return end
	end
	nIndex,genre,detail,parti,level,series = FindItemEx(15,7);
	local nLuc = nIndex;
	if(nLuc > 0) then
		count = count + 1;
		if(genre ~= 4 or detail ~= 240)	then	--khong cho dat sai cho~
		return end
	end
	
	local Rgenre,Rdetail,Rparti,Rlevel,Rseries;
	local doxanhid = 0;
	nIndex,genre,detail,parti,level,series = FindItemEx(15,0);
	if (nIndex > 0) then
		count = count + 1;
		doxanhid,Rgenre,Rdetail,Rparti,Rlevel,Rseries = nIndex,genre,detail,parti,level,series;
	end
	if(doxanhid == 0 or Rgenre ~= 0 or Rdetail > 9) then
	Msg2Player("Xin ��t trang b� xanh ho�c tr�ng v�o m�i c� th� ti�n h�nh.");
	return end
	if(count < 2) then
	Msg2Player("Xin ��t 1 Th�y Tinh � v� tr� c�n kh�m n�m.");
	return end
	if(count > 2) then
	Msg2Player("M�i l�n kh�m ch� ���c ��t v�o 1 Th�y Tinh v� 1 trang b� xanh ho�c tr�ng!");
	return end
	if(nKim > 0) then	--doi sang he Kim
		if(Rseries == 0) then
		Msg2Player(SAME_5HANH);
		return end
	doihe(doxanhid,Rdetail,Rparti,Rlevel,0)
	RemoveItem(nKim,1)
	return end
	if(nMoc > 0) then	--doi sang he Moc
		if(Rseries == 1) then
		Msg2Player(SAME_5HANH);
		return end
	doihe(doxanhid,Rdetail,Rparti,Rlevel,1)
	RemoveItem(nMoc,1)
	return end
	if(nThuy > 0) then	--doi sang he Thuy
		if(Rseries == 2) then
		Msg2Player(SAME_5HANH);
		return end
	doihe(doxanhid,Rdetail,Rparti,Rlevel,2)
	RemoveItem(nThuy,1)
	return end
	if(nHoa > 0) then	--doi sang he Hoa
		if(Rseries == 3) then
		Msg2Player(SAME_5HANH);
		return end
	doihe(doxanhid,Rdetail,Rparti,Rlevel,3)
	RemoveItem(nHoa,1)
	return end
	if(nTho > 0) then	--doi sang he Tho
		if(Rseries == 4) then
		Msg2Player(SAME_5HANH);
		return end
	doihe(doxanhid,Rdetail,Rparti,Rlevel,4)
	RemoveItem(nTho,1)
	return end
	if(nTu > 0) then	--nang 1 cap
		if(Rlevel > 9) then
		Msg2Player("Trang b� �� ��t ��ng c�p t�i �a, kh�ng th� n�ng c�p!")
		return end
		if(random(10) == 9) then
		nangcap(doxanhid,Rdetail,Rparti,Rlevel,Rseries);
		else
		Msg2Player("N�ng c�p trang b� th�t b�i! B�n b� t�n th�t 1 Th�y Tinh.");
		end
	RemoveItem(nTu,1)
	return end
	if(nLuc > 0) then	--doi thuoc tinh random
	AddItemID(AddItem(0,0,Rdetail,Rparti,Rlevel,Rseries,350,10,10,10,10,RANDOM(10),RANDOM(10)));
	RemoveItem(doxanhid,1);
	RemoveItem(nLuc,1);
	Msg2Player("Thay ��i thu�c t�nh trang b� th�nh c�ng!");
	return end
end;

function doihe(doxanhid,Rdetail,Rparti,Rlevel,Rseries)
	AddItemID(AddItem(0,0,Rdetail,Rparti,Rlevel,Rseries,80,10,RANDOM(7,10),RANDOM(6,10),RANDOM(10),RANDOM(10),RANDOM(10)));
	RemoveItem(doxanhid,1);
	Msg2Player("��i ng� h�nh trang b� th�nh c�ng!");
end;

function nangcap(nRealIndex,Rdetail,Rparti,Rlevel,Rseries)
	local nNewItem;
	local bLock,nMin = GetLockItem(nRealIndex);
	
	nNewItem = AddItemIdx(nRealIndex);
	SetLevelItem(nNewItem,Rlevel+1);
	if(nNewItem > 0) then
		local	type1 , value1_1, value1_3,
		type2 , value2_1, value2_3,
		type3 , value3_1, value3_3,
		type4 , value4_1, value4_3,
		type5 , value5_1, value5_3,
		type6 , value6_1, value6_3,
		type7 , value7_1, value7_3,
		type8 , value8_1, value8_3
		= GetMagicAttrib(nRealIndex);
		SetMagicAttrib(nNewItem,
						type1 , value1_1, value1_3,
						type2 , value2_1, value2_3,
						type3 , value3_1, value3_3,
						type4 , value4_1, value4_3,
						type5 , value5_1, value5_3,
						type6 , value6_1, value6_3,
						type7 , value7_1, value7_3,
						type8 , value8_1, value8_3
						);
		AddItemID(nNewItem);
		RemoveItem(nRealIndex, 1);
	Msg2Player("N�ng c�p trang b� th�nh c�ng!");
	end
end;

function help()
	str = 
	{
		"Qu� tr�nh kh�m n�m: ��t trang b� v�o giao di�n ch�nh gi�a, sau �� �em v�t ph�m kh�m n�m ��t v�o ch� t��ng �ng. V�t ph�m kh�m n�m t�ng v� gi�m ��ng c�p ��t v�o thanh ��ng c�p; thay ��i thu�c t�nh ma ph�p ��t v�o thanh linh l�c; thay ��i thu�c t�nh ng� h�nh ��t v�o thanh ng� h�nh. Nh�n 'Kh�m n�m' �� ho�n th�nh. M�t n� kh�ng th� kh�m n�m.",
		"Li�n quan kh�m n�m th�y tinh/crystalhelp",
		"Li�n quan kh�m n�m v� kh� /weaponhelp",
		"Li�n quan kh�m n�m y ph�c/armorhelp",
		"Li�n quan kh�m n�m n�n/helmhelp",
		"Ta �� bi�t r�i /no",
	};
	Say(str[1], 5, str[2], str[3], str[4], str[5],str[6])
end

function crystalhelp()
	Talk(1,"","Mu�n kh�m nh�ng v�t n�y kh�ng ��n gi�n ch�t n�o, ti�n c�ng r�t cao, l�m xong c�ng ch�a ch�c l� �� v�a �, th� n�o c� nu�n kh�m kh�ng? ��ng �? V�y kh�m nh�ng th� g�? ")
end

function weaponhelp()
	str = {
		"G�n ��y giang h� xu�t hi�n �� ph� c� th� t�ng ��ng c�p v� kh�. Ng��i c� mu�n nghe kh�ng?",
		"Qu� tr�nh th�ng c�p �� ph� v� kh� /onweaponhelp",
		"L�ng V��ng Th��ng �o�n T�o T�n Bi�n/onweaponhelp",
		"Huy�n V� Ch�y Chi ��c T�o Thu�t/onweaponhelp",
		"Long Ng�m Ki�m �o�n T�o ��/onweaponhelp",
		"Gia C�t C� Qu�t M�t Y�u/onweaponhelp",
		"Li�u Di�p To�i Phong �ao. T�y Th� Bi�n/onweaponhelp",
		"Huy�n Nguy�t �ao T� Kinh b�o l�c/onweaponhelp",
		"Thi�n C� C�n �� ph� /onweaponhelp",
		"�m Kh� T�ng ph�. Quy�n 1/onweaponhelp",
		"Uy�n ��ng �ao. Khai Quang bi�n/onweaponhelp",
		"Kh�ng quan t�m!/no",
	};
    Say(str[1],11,str[2], str[3], str[4], str[5],str[6], str[7], str[8], str[9],str[10], str[11], str[12])
end

function onweaponhelp(nSel)
	strHelp = 
	{
		"��t v� kh� c�n th�ng c�p gi�a giao di�n kh�m n�m, �� ph� ��t v�o thanh ��ng c�p. N�u ph� h�p �i�u ki�n s� th�ng ��ng c�p",
		"L�ng V��ng Th��ng �o�n T�o T�n Bi�n l� �� ph� d�ng �� t�ng ��ng c�p th��ng. Nghe n�i �ang trong tay c�a Th�n B� Th��ng Nh�n � D��ng Ch�u v� L�m An.",
		"Huy�n V� Ch�y Chi ��c T�o Thu�t l� �� ph� d�ng �� t�ng ��ng c�p ch�y. Nghe n�i �ang � trong tay Th�n B� Th��ng Nh�n � D��ng Ch�u v� L�m An.",
		"Long Ng�m Ki�m �o�n T�o �� l� �� ph� d�ng �� t�ng ��ng c�p ki�m. Nghe n�i �ang � trong tay Th�n B� Th��ng Nh�n � D��ng Ch�u v� L�m An.",
		"Gia C�t C� Qu�t M�t Y�u l� �� ph� d�ng �� t�ng ��ng c�p n�. Nghe n�i �ang � trong tay Th�n B� Th��ng Nh�n � D��ng Ch�u v� L�m An.",
		"Li�u Di�p To�i Phong �ao. T�y Th� Bi�n l� �� ph� d�ng �� t�ng ��ng c�p phi �ao. Nghe n�i �ang trong tay c�a Th�n B� Th��ng Nh�n � D��ng Ch�u v� L�m An.",
		"Huy�n Nguy�t �ao T� Kinh B�o L�c l� �� ph� d�ng �� t�ng ��ng c�p �ao. Nghe n�i �ang � trong tay Th�n B� Th��ng Nh�n � D��ng Ch�u v� L�m An.",
		"Thi�n C� C�n �� ph� l� �� ph� d�ng �� t�ng ��ng c�p c�n. Nghe n�i �ang trong tay c�a Th�n B� Th��ng Nh�n � D��ng Ch�u v� L�m An.",
		"�m Kh� T�ng ph�. Quy�n 1 l� �� ph� d�ng �� t�ng ��ng c�p phi ti�u. Nghe n�i �ang trong tay c�a Th�n B� Th��ng Nh�n � D��ng Ch�u v� L�m An.",
		"Uy�n ��ng �ao. Khai Quang bi�n l� �� ph� v� kh� lo�i song �ao, s� d�ng c� th� t�ng c�p song �ao. Nghe n�i �ang trong tay c�a Th�n B� Th��ng Nh�n � D��ng Ch�u v� L�m An.",
	};
	Talk(1,"",strHelp[nSel + 1]);   
end

function armorhelp()
	Talk(1,"","Ta gi�i th�ch ph��ng ph�p kh�m n�m y ph�c. D�a v�o B�ng T�m V� C�c T� c�a Thi�n s�n Tuy�t Linh ph�i h�p v�i ph��ng ph�p b� truy�n c�a ta qua bao l�n ��c luy�n s� th�nh c�ng th�ng c�p ���c ��ng c�p y ph�c. D�a v�o Nam Minh Chi Tinh c�a Tam Mi�u Hoang Nguy�n k�t h�p v�i ph��ng ph�p b� truy�n c�a ta qua c�c giai �o�n ��c luy�n s� th�nh c�ng gi�m ���c ��ng c�p y ph�c.")
end

function helmhelp()
	Talk(1,"","Nh�ng th� c�n l�i n�y s� gi�p ng��i t�ng ���c ��ng c�p m�, nh�ng ng��i ph�i th�c hi�n ��ng theo c�c b��c tr�nh t� c�a n�, n�u kh�ng th� s� �i�m c�a ng��i s� l�i b� gi�m xu�ng ")
end

function no()
end;