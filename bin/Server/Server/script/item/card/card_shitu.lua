Include ("\\script\\header\\shitu.lua")

function main()
dofile("script/item/card/card_shitu.lua");
main1();
end

function main1()
	if (GetTranslife() > 0 and GetLevel() < 80) then
		Say("L�nh h�i B�c ��u Tr��ng Sinh Thu�t - T�m Ph�p Thi�n xong, � c�p 80 v� tr��c kh�ng th� s� d�ng S� �� Thi�p.", 0);
	return end;
	
	local tb = {

	};
	if(GetLevel()>= 80) then
		local nNum = GetApprenticeNum()
		if(FindApprentice() and nNum<GetApplyApprentice(GetNumber(2,GetTask(TASK_SHITU_XSU),1))) then
			tinsert(tb,"Thu nh�n �� t�/CallBack_ShoutuList")
		end;
	end;
	if(GetEnableChushiApps()) then
		tinsert(tb,"�� �� xu�t s�/ChushiList")
	end
	--if(GetHaveNewLilianApps(masterName)) then
	--	tinsert(tb,"Tra xem r�n luy�n giang h� c�a �� ��/LilianList")
	--end
	if(num > 0 ) then
		tinsert(tb,"Tra tin t�c �� ��/TudiInfoList")
		tinsert(tb,"H�y b� quan h� �� ��/BreakTuList")
	end
	tinsert(tb,"Xem th�ng tin c� nh�n/SfChaShifu")
	tinsert(tb,"T�m hi�u S� �� thi�p/AboutShituCard")
	tinsert(tb,"��ng/Quit")

	local str = "S� �� thi�p d�ng �� g�n k�t quan h� s� ��, h�n n�a c� th� s� d�ng ch�c n�ng s� �� t��ng quan. N�u b�n ch�a c� quan h� s� ��, h�y l�p ��i nh�m v�i ng��i ch�i kh�c r�i m�i s� d�ng S� �� thi�p!"
	Say(str,getn(tb),tb)
	return
end

function FindApprentice()
	local nMemNum=GetTeamSize();
	local nCnt=0;
	if(nMemNum>0) then
	TIndex = PlayerIndex;
	for i = 0,nMemNum do 
		PlayerIndex = GetTeamMem(i);
		if(GetLevel()<80 and GetTaskS(TASK_SHITU_NAME)=="") then
		nCnt=nCnt+1;
		end;
	end;
	end;
	PlayerIndex = TIndex;	
	return nCnt;
end;

function timhieu()
	local str =
		"Trong th� gi�i ki�m hi�p, ng��i ch�i t� c�p 80 tr� xu�ng (kh�ng g�m c�p 80) , s� d�ng <color=green>S� �� thi�p<color> c� th� b�i ng��i ch�i c�p 80 tr� l�n (g�m c� c�p 80) l�m s� ph�.<enter>"..
		"M�t khi s� d�ng quan h� s� �� gi�a ng��i ch�i, s� ph� c�n c� ch�c tr�ch nh�t ��nh, ch� ��o ho�c gi�p �� �� t� ho�n th�nh h� th�ng nhi�m v� <color=yellow>th� luy�n giang h�<color>, v� cho �� �� sau khi d�t ���c c�p 80 xu�t s�, s� ph� �� ���c xem nh� d�n d�t 1 �� �� th�nh c�ng.<enter>"..
		"Trong th� gi�i ki�m hi�p, 1 �� �� ��ng th�i ch� c� 1 s� ph� v� 1 s� ph� c� th� ��ng th�i thu nh�n nhi�u �� ��. N�u ng��i ch�i t� c�p 25 tr� xu�ng (bao g�m c�p 25) v� ch�a bao gi� b�i s�, sau khi b�i nh�p th�nh c�ng 1 s� ph�, ng��i ch�i �� ch�nh l� <color=yellow>��ch truy�n �� t�<color> c�a s� ph�;N�u ng��i ch�i t� c�p 25 tr� l�n (kh�ng bao g�m c�p 25) b�i nh�p 1 s� ph�, ng��i ch�i l� <color=yellow>�� t� tr�c h�<color> c�a s� ph�;N�u ng��i ch�i tr��c kia �� b�i s� nh�ng �� ch�m d�t quan h� s� �� v�i ti�n s�, b�i nh�n 1 s� ph�, ng��i ch�i s� l� <color=yellow>ph� th�ng �� t�<color> c�a s� ph�.<enter>"..
		"<enter>�i�u ki�n tr� th�nh �� ��:<enter>"..
		"1, Ng��i ch�i t� c�p 80 tr� xu�ng (kh�ng g�m c�p 80)<enter>"..
		"2, Kh�ng l� �� �� c�a m�t s� ph� n�o ��<enter>"..
		"<enter>�i�u ki�n tr� th�nh s� ph�:<enter>"..
		"1, Ng��i ch�i t� c�p 80 tr� l�n (bao g�m c�p 80)<enter>"..
		"2, Kh�ng l� �� �� c�a m�t s� ph� n�o ��<enter>"..
		"<enter>C�ch nh�n ���c S� �� thi�p:<enter>"..
		"1, Nh�n v�t ���c t�o m�i: c� s�n S� �� thi�p trong h�nh trang<enter>"..
		"2, Nh�n v�t �� t�o: mua S� �� thi�p � c�c ti�m t�p h�a, gi� b�n l� 100 l��ng<enter>"
	Say("LINK:<npc>",0,str,2,"Tr� l�i/main","��ng/no")
end
