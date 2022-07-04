--hoangnhk
Include("\\script\\header\\taskid.lua");
Include("\\script\\header\\fuyuan.lua")
Include("\\script\\header\\timerhead.lua")

function main(sel)
	local nTaskValue = GetTask(TASK_DUNGCHUNG3)
	local nTask = GetNumber(3,nTaskValue, 3);
	local PK_value = GetPK(); 
	if (nTask == 1) then
		Say("Th�m xong ch�a, �i nhanh m�t ch�t",2,"C�m �n v� ��i ca n�y, ta �i ��y/visit_leave","Xin ��i ca th� th� cho ch�t ��, ta �i ngay th�i/no") 
	elseif (PK_value <= 0) then
		Talk(2,"PKclear", 10106,10107) 
	else 
		local n_timerid = GetTimerId(); 
		if (n_timerid ~= 9) then 
						SetTask(TASK_DUNGCHUNG3,SetNumber(3,GetTask(TASK_DUNGCHUNG3),3,100 + PK_value));
		SetTimer(2*60*60*18,9) 
		return 
	end 
		Say(10108,3,
		"H�i th�i gian/ask_timer",
		"N�p ti�n t�i ngo�i/pay_money",
		"D�! D�! N�u v�y ta s� tr� v�o trong ��/no") 
	end 
end 

function ask_timer() 
	if (GetCash() >= 1000) then
		Pay(1000) 
		Talk(2,"","V� ��i ca n�y! ��y l� 1000 l��ng b�c xin m�i u�ng ch�n tr�, ta ch� l� mu�n h�i m�t ch�t b�y gi� l� m�y gi�?.","<npc>: T�i nghi�t c�a ng��i mu�n gi�m c�n s�m l�m <color=255,0,0>"..GetRestCTime().."<color>, nhanh v� ch� ng�i �i") 
	else 
		Talk(2,"","V� ��i ca n�y! Ta ch� mu�n h�i b�y gi� l� m�y gi� th�i!","H�i g� m� h�i! Mu�n �n ��n h�! C�n kh�ng mau quay v� ch� ng�i!") 
	end 
end 

function pay_money() 
	PK_PayMoney = GetPK()*GetPK()*10000 
	Talk(1,"pay_money2","Lao ��u ��i ca, � ��y c� "..PK_PayMoney.." l��ng, xem nh� �t l�ng th�nh. Ch� v� ta � trong n�y �� sinh tr�ng b�nh kh�ng th� kh�ng c� ���c n�a. Xin ��i ca h�y khai �n cho ra ngo�i t�m ��i phu") 
end 

function pay_money2() 
	Say("Xem ng��i r�ch r��i v�y, sao l�i c� nhi�u ti�n v�y th�!",2,
	"��t ti�n v�o tay h�n/pay_yes",
	"Ti�p t�c th�nh c�u/pay_no") 
end 

function pay_yes() 
	local PK_PayMoney = GetPK()*GetPK()*10000 
	if(GetCash() >= PK_PayMoney) then 
		Pay(PK_PayMoney) 
		Msg2Player("Lao ��u cho ph�p ng��i ra ngo�i t�m th�y thu�c, ng��i c� th� r�i kh�i ��i lao.") 
		Talk(1,"leave_prison",10112) 
	else 
		pay_no();
	end
end

function pay_no() 
Talk(1,"","Qu� ��i! C�t ngay! Kh�ng ta qu�t cho 1 roi b�y gi�!") 
end

function PKclear() 
	Msg2Player("Sau m�t h�i xem x�t th� ng��i b� �u�i ra kh�i ��i lao") 
	leave_prison() 
end 

function leave_prison() 
	StopTimer()
	FuYuan_Resume(); 
	leave2() 
end 

function visit_leave() 
	leave2();
end 

function leave2() 
	SetTask(TASK_DUNGCHUNG3, SetNumber(3,GetTask(TASK_DUNGCHUNG3),3,0));
	local leave_pos = GetNumber(1,GetTask(TASK_DUNGCHUNG),9);
	SetCreateTeam(1); 
	if (leave_pos == 1) then
		NewWorld(176,1473,3245) 
	else
		NewWorld(37,1781,3044) 
	end
end 

function no() 
end 
