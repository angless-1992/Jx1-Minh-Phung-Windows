Include("\\script\\header\\forbidmap.lua");

function use_heart()
	local W,X,Y = GetWorldPos();
	local nSubWorldID = W;
	
	if checkYDBZMaps(nSubWorldID) == 1 then
		Msg2Player("L�c n�y b�n kh�ng th� s� d�ng v�t ph�m n�y");
		return 0
	end

	if (nSubWorldID >= 375 and nSubWorldID <= 386) then
		Msg2Player("Xin l�i! B�n hi�n � khu v�c ��c bi�t, kh�ng th� s� d�ngT�m T�m T��ng �nh Ph�!");
		return 0
	end
	
	if (nSubWorldID >= 416 and nSubWorldID <= 511) then
		Msg2Player("Xin l�i! B�n hi�n � khu v�c ��c bi�t, kh�ng th� s� d�ngT�m T�m T��ng �nh Ph�!");
		return 0
	end
	
	if (nSubWorldID == 44 or nSubWorldID == 197 or nSubWorldID == 208 or nSubWorldID == 209 or nSubWorldID == 210 or nSubWorldID == 211 or nSubWorldID == 212 or (nSubWorldID >= 213 and nSubWorldID <= 223)	or nSubWorldID == 336 or nSubWorldID == 341 or nSubWorldID == 342	or nSubWorldID == 175	or nSubWorldID == 337	or nSubWorldID == 338	or nSubWorldID == 339 or ( nSubWorldID >= 387 and  nSubWorldID <= 395 ) )then 
		Msg2Player("Xin l�i! B�n hi�n � khu v�c ��c bi�t, kh�ng th� s� d�ngT�m T�m T��ng �nh Ph�!");
		return 0
	end;

	if (checkHFMaps(nSubWorldID) == 1) then
		Msg2Player("Xin l�i! B�n hi�n � khu v�c ��c bi�t, kh�ng th� s� d�ngT�m T�m T��ng �nh Ph�!");
		return 0
	end;

	if (checkBWMaps(nSubWorldID) == 1) then
		Msg2Player("Xin l�i! B�n hi�n � khu v�c ��c bi�t, kh�ng th� s� d�ngT�m T�m T��ng �nh Ph�!");
		return 0
	end;
	
	if checkActMaps(nSubWorldID) == 1 then
		Msg2Player("Xin l�i! B�n hi�n � khu v�c ��c bi�t, kh�ng th� s� d�ngT�m T�m T��ng �nh Ph�!");
		return 0
	end
	
	if (checkZQMaps(nSubWorldID) == 1) then
		Msg2Player("Xin l�i! B�n hi�n � khu v�c ��c bi�t, kh�ng th� s� d�ngT�m T�m T��ng �nh Ph�!");
		return 0
	end;
	
	if (checkNEWPRACTICEMaps(nSubWorldID) == 1) then
		Msg2Player("Xin l�i! B�n hi�n � khu v�c ��c bi�t, kh�ng th� s� d�ngT�m T�m T��ng �nh Ph�!");
		return 0
	end;

	Lover = GetMateName();
	if (Lover == "") then 
		Msg2Player("Ng��i ch�a k�t h�n kh�ng th� s� d�ng!");
		return 0
	end;
	local nPlayer = FindPlayer(Lover);
	if(nPlayer <= 0) then
		Say("Xin l�i! "..Lover.." t�m th�i kh�ng Online",0)
		return 0
	end;
	local tempid = PlayerIndex;
	PlayerIndex = nPlayer;
	W,X,Y = GetWorldPos();
	nSubWorldID = W;	
	local nFightMode = GetFightState();
	PlayerIndex = tempid;
	if (nSubWorldID > 70000) then
		Msg2Player("Xin l�i! Ph�i ng�u c�a b�n �ang � khu v�c ��c bi�t kh�ng th� d�n v�o.");
		return 0;
	end
	
	if (nSubWorldID >= 375 and nSubWorldID <= 386) then
		Msg2Player("Xin l�i! Ph�i ng�u c�a b�n �ang � khu v�c ��c bi�t kh�ng th� d�n v�o.");
		return 0
	end
	
	if (nSubWorldID >= 416 and nSubWorldID <= 511) then
		Msg2Player("Xin l�i! Ph�i ng�u c�a b�n �ang � khu v�c ��c bi�t kh�ng th� d�n v�o.");
		return 0
	end
	
	if (nSubWorldID == 44 or  nSubWorldID == 197 or nSubWorldID == 208 or nSubWorldID == 209 or nSubWorldID == 210 or nSubWorldID == 211 or nSubWorldID == 212 or (nSubWorldID >= 213 and nSubWorldID <= 223) or nSubWorldID == 336 or nSubWorldID == 341 or nSubWorldID == 342	or nSubWorldID == 175	or nSubWorldID == 337	or nSubWorldID == 338	or nSubWorldID == 339 or ( nSubWorldID >= 387 and  nSubWorldID <= 395 )) then 
		Msg2Player("Xin l�i! Ph�i ng�u c�a b�n �ang � khu v�c ��c bi�t kh�ng th� d�n v�o.");
		return 0
	end;

	if checkActMaps(nSubWorldID) == 1 then
		Msg2Player("Xin l�i! Ph�i ng�u c�a b�n �ang � khu v�c ��c bi�t kh�ng th� s� d�ng T�m T�m T��ng �nh Ph�.");
		return 0
	end
	
	if (checkBWMaps(nSubWorldID) == 1) then
		Msg2Player("Xin l�i! Ph�i ng�u c�a b�n �ang � khu v�c ��c bi�t kh�ng th� s� d�ng T�m T�m T��ng �nh Ph�.");
		return 0
	end;
	
	if (checkZQMaps(nSubWorldID) == 1) then
		Msg2Player("Xin l�i! Ph�i ng�u c�a b�n �ang � khu v�c ��c bi�t kh�ng th� s� d�ng T�m T�m T��ng �nh Ph�.");
		return 0
	end;	
	if (checkTONGMaps(SubWorld) == 1) then
		Msg2Player("Xin l�i! Ph�i ng�u c�a b�n �ang � khu v�c ��c bi�t kh�ng th� s� d�ng T�m T�m T��ng �nh Ph�.");
		return 0
	end;	
	if (checkNEWPRACTICEMaps(nSubWorldID) == 1) then
		Msg2Player("Xin l�i! Ph�i ng�u c�a b�n �ang � khu v�c ��c bi�t kh�ng th� s� d�ng T�m T�m T��ng �nh Ph�.");
		return 0
	end;		

	if checkYDBZMaps(nSubWorldID) == 1 then
		Msg2Player("Xin l�i! Ph�i ng�u c�a b�n �ang � khu v�c ��c bi�t kh�ng th� s� d�ng T�m T�m T��ng �nh Ph�.");
		return 0
	end
	
	if (checkHFMaps(nSubWorldID) == 1) then
		Msg2Player("Xin l�i! Ph�i ng�u c�a b�n �ang � khu v�c ��c bi�t kh�ng th� s� d�ng T�m T�m T��ng �nh Ph�.");
		return 0
	end;
	NewWorld(nSubWorldID,X,Y);
	SetFightState(nFightMode);
	return 1
end;
