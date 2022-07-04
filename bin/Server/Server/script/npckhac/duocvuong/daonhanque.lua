--hoangnhk
Include("\\script\\header\\factionhead.lua")
Include("\\script\\header\\taskid.lua")
MONEY_FIRST = 200000;
MAX_TIMES=5;
function main(NpcIndex)
	local nTaskValue = GetTask(TASK_DUNGCHUNG2);
	local nTask = GetNumber(1,nTaskValue,5);
	if(nTask >=MAX_TIMES) then
		Say(12140,2,
		"T�m hi�u c�ch luy�n k� n�ng 120/timhieu120",
		"K�t th�c ��i tho�i/no")
	else
		Say(nTask >0 and 12138 or 12139,3,
		"C�i t�o kinh m�ch/ctkinhmach",
		"T�m hi�u c�ch luy�n k� n�ng 120/timhieu120",
		"K�t th�c ��i tho�i/no")
	end;
	--Say(12138,2,
	--"T�m hi�u c�ch luy�n k� n�ng 120/timhieu120",
	--"��ng/no")
end;

function ctkinhmach()
	local nTaskValue = GetTask(TASK_DUNGCHUNG2);
	local nTask = GetNumber(1,nTaskValue,5);
	local nNMoney=MONEY_FIRST+(MONEY_FIRST*nTask);
	Say(format("Th�nh th�t, s� ti�n �t �i n�y �� k�nh l�o ��o tr��ng m�i ���c %d l��ng. �� kh�ng ph�i l� con s� nh�, ta ph�i �i ki�m m�i ���c",nNMoney),2,
	"Coi nh� ng��i c�ng c� t�m l�ng ��, th�i ���c, ng��i mu�n tr� kh�i ph�n n�o?/sel",
	"K�t th�c ��i tho�i/no");
end;

function sel()
	Say(12145,5,
	"S�c m�nh/bdcaitao",
	"Th�n ph�p/bdcaitao",
	"Sinh kh�/bdcaitao",
	"N�i c�ng/bdcaitao",
	"Vi�c n�y. Ta c�n ph�i suy ngh� l�i/no");
end;

function bdcaitao(nSel)
	local nTaskValue = GetTask(TASK_DUNGCHUNG2);
	local nTask = GetNumber(1,nTaskValue,5);
	local nNMoney=MONEY_FIRST+(MONEY_FIRST*nTask);
	if(GetCash()<nNMoney) then
	Talk(1,"",12146);
	return end;
	local nTSer=GetSeries();
	if(nTSer < 0 or nTSer>4) then
	return end;
	if(nSel==0) then
		if(GetStrg()-FACTION_PROP[nTSer+1][1]<5) then
		Talk(1,"",12147);
		return end;
	AddStrg(-5);
	Talk(1,"",12148);
	elseif(nSel==1) then
		if(GetDex()-FACTION_PROP[nTSer+1][2]<5) then
		Talk(1,"",12149);
		return end;
	AddDex(-5);
	Talk(1,"",12150);
	elseif(nSel==2) then
		if(GetVit()-FACTION_PROP[nTSer+1][3]<5) then
		Talk(1,"",12151);
		return end;
	AddVit(-5);
	Talk(1,"",12152);
	elseif(nSel==3) then
		if(GetEng()-FACTION_PROP[nTSer+1][4]<5) then
		Talk(1,"",12153);
		return end;
	AddEng(-5);
	Talk(1,"",12154);
	else
		return end;
	Pay(nNMoney);
	SetTask(TASK_DUNGCHUNG2,SetNumber(1,nTaskValue,5,nTask+1));
end;

function timhieu120()
	Talk(1,"",10341)
end;

function no()
end;
