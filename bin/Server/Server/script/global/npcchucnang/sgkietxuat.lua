Include("\\script\\header\\taskid.lua");
Include("\\script\\header\\liendau.lua");
Include("\\script\\lib\\worldlibrary.lua");
--hoangnhk
LIENDAU_TOURNO = 1	--giai dau thu 1
function main(NpcIndex)
	if(SERVER_MODE == 1) then
	Talk(1,"",SERVER_NOTICE)
	return end
	if(GetTask(TASK_LIENDAU_TIME) ~= LIENDAU_TOURNO) then
		SetTask(TASK_LIENDAU_TIME,LIENDAU_TOURNO)
		SetTask(TASK_LIENDAU, 0);
	end
	Say("LINK:<npc>",0,14807,4,
		"V�o v� l�m li�n ��u h�i tr��ng/htruong",
		--"V� l�m li�n ��u nh�m/nhom",
		--"Ki�m tra t�nh h�nh thi ��u/kiemtra",
		"Ta mu�n l�nh ph�n th��ng li�n ��u/doidiem",
		"V� l�m li�n ��u h� tr� /hotro",
		"Ta ch� ti�n gh� qua/no")
end;

function htruong()
	local nTaskValue = GetTask(TASK_LIENDAU)
	if(nTaskValue < 1) then
		Say(10045,2,
		"Tham gia li�n ��u/lapnhom",
		"Ta kh�ng mu�n thi ��u/no")
	return end;
	gohoitruong()
end;

function lapnhom()
	if(GetLevel() < 80) then
		Talk(1,"",10047)
	return end
	if(GetFactionNo() < 0) then
		Talk(1,"",10039)
	return end
	local nAdd = AddDataGr(GetName());
	if(nAdd >= 0) then
		SetTask(TASK_LIENDAU, nAdd+1);
		gohoitruong()
	end
end;

function gohoitruong()
	local w,x,y = GetWorldPos();
	local nMapNo = 1;
	if(w == 11) then
	nMapNo = 2;
	elseif(w == 162) then
	nMapNo = 3;
	elseif(w == 37) then
	nMapNo = 4;
	elseif(w == 78) then
	nMapNo = 5;
	elseif(w == 80) then
	nMapNo = 6;
	elseif(w == 176) then
	nMapNo = 7;
	end
	SetTask(TASK_NVST, SetNumber(1,GetTask(TASK_NVST),9,nMapNo));
	NewWorld(396,1465,3009);
end;

function doidiem()
	Say("LINK:<npc>",0,"B�t k� tham gia V� l�m li�n ��u hay v� l�m ki�t xu�t ��u ���c nh�n ph�n th��ng. Ph�n th��ng bao g�m <color=red>Ph�n th��ng x�p h�ng<color> v� <color=red>�i�m Vinh d�<color>. Sau m�i giai ��an thi ��u k�t th�c, s� c�n c� v�o <color=red>�i�m tich l�y, t� l� th�ng, t�ng th�i gian thi ��u<color> �� x�p h�ng. <color=red>10 ��i x�p cao nh�t<color> s� nh�n ���c <color=red>ph�n th��ng ��c bi�t<color>. Ng��i ch�i trong qu� tr�nh thi ��u c� th� d�ng �i�m vinh d� �� ��i ph�n th��ng danh d�. Ng��i mu�n nh�n ph�n th��ng g�?",3,
	"Ta mu�n ��i ph�n th��ng danh d�/giaodich",
	"Ta mu�n mua ph�n th��ng uy danh/giaodich",
	"Ta ch� ti�n gh� qua/no");
end;

function giaodich(sel)
	if(sel == 0) then
		Talk(1,"",format("Hi�n t�i %s c� �i�m vinh d� l� <color=yellow>%d<color>",GetSex()==0 and "��i hi�p" or "n� hi�p",GetHonor()));
		Sale(92,5)
	else
		Talk(1,"",format("Hi�n t�i %s c� �i�m uy danh l� <color=yellow>%d<color>",GetSex()==0 and "��i hi�p" or "n� hi�p",GetRespect()));
		Sale(95,6)
	end;
end;

function no()
end;
