Include("\\script\\header\\taskid.lua")
Include("\\script\\lib\\worldlibrary.lua")

PLANT_TOOL = {
[1] = {"T�i Ph�n B�n",{6,2304},2,10000},
[2] = {"Th�ng N��c",{6,2305},2,10000},
[3] = {"Thu�c Tr� S�u",{6,2306},2,10000},
}

EVENT_START_DATE = 20150101
EVENT_END_DATE 	= 20160101
USE_MINLEVEL 	= 50
USE_DAILY_LIMIT = 8
TREE_TIME_LIMIT = 15*60*18
SCRIPT_TREEDLG = "\\script\\event\\uommamhp\\thientue.lua"
DAILY_TIME_LIMIT ={
{1300,1600},
{1830,2130},
}

THIENTUE_TEMPLET = {
{1552, "Thi�n Tu� An L�nh"},
{1551, "Thi�n Tu� H�a B�nh"},
{1550, "Thi�n Tu� ��c L�p"},
{1555, "Thi�n Tu� T� Do"},
{1554, "Thi�n Tu� H�nh Ph�c"},
{1553, "Thi�n Tu� Th�nh V��ng"},
}

THIENTUE_RATE = {
{1,2,3,4,5,6},
{20,20,20,20,10,10},
}

THIENTUE_EXP = {
[1]	= 5000000,
[2]	= 10000000,
[3]	= 20000000,
[4]	= 30000000,
[5]	= 40000000,
[6]	= 300000000,
}

BASE_SCORE_RATE = 34