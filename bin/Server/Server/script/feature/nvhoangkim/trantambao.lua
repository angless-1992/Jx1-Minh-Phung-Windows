Include("\\script\\header\\taskid.lua");
Include("\\script\\feature\\nvhoangkim\\hkhead.lua");
--npc Tran Tam bao
function main(NpcIndex)
	local nTaskValue = GetTask(TASK_NVST);
	local nValue = GetNumber(2,nTaskValue,4);
	if(nValue == 19) then
		Say(10971,1,
		END_TALK.."/nv_502");
	return end
	if(nValue == 20 and GetLevel() >= 50) then
		Talk(1,"nv_503","B�y gi� ng��i �� s�c gi�p ta r�i ch�?");
	return end
	if(nValue == 22) then
		Say(11019,1,
		END_TALK.."/nv_504");
	return end
	Talk(1,"",14735);
end;

function nv_502()
	SetTask(TASK_NVST, SetNumber(2,GetTask(TASK_NVST),4,20));
	if(GetLevel() >= 50) then
		nv_503();
	else
		Talk(1,"",11014);
	end
end

function nv_503()
	SetTask(TASK_NVST, SetNumber(2,GetTask(TASK_NVST),4,21));
	Say(11018,1,
		END_TALK.."/no");
	Msg2Player("��n Tr��ng Giang Nguy�n ��u t�m ��o t�c L�c Phi.");
	AddNote(3,1,"��n Tr��ng Giang Nguy�n ��u t�m ��o t�c L�c Phi (301,365)");
end

function nv_504()
	SetTask(TASK_NVST, SetNumber(2,GetTask(TASK_NVST),4,23));
	Msg2Player("��n Ho�nh S�n Ph�i t�m t��ng Kim �� �an.");
	AddNote(3,1,"Truy s�t �� �an Ho�nh S�n Ph�i (206,203)");
end

function no()
end;