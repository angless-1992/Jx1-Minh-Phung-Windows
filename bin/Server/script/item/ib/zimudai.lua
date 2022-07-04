Include("\\script\\header\\taskid.lua")
function main(nItemIdx)
	Say("T�i t� m�u c� th�i h�n s� d�ng l�: <color=yellow>"..get_expire_date().."<color>",2,
	"N�p 1 tu�n/recharge("..nItemIdx..")",
	"H�y b�/no");
end

function get_expire_date()
	local nExpireTime = GetEquipItemEx();
	if (nExpireTime ~= 0) then
		return GetTimeDate("%Y-%m-%d %H:%M", nExpireTime);
	else
		return "Ch�a kh�i ��ng";
	end
end;

function recharge(nItemIdx)
	SetTask(TASK_DUNGCHUNG3,SetNumber(1,GetTask(TASK_DUNGCHUNG3),1,1));
	RemoveItem(nItemIdx,1);
	local nExpireTime = GetEquipItemEx();
	if(nExpireTime<=0) then
		SetEquipItemEx(GetCurServerSec()+7*24*60*60);
	else
		SetEquipItemEx(GetEquipItemEx()+7*24*60*60);
	end;
	OpenEquipEx();
	Say("N�p th�nh c�ng, t�i t� m�u c�a ��i hi�p c� th�i h�n s� d�ng l�: <color=yellow>"..get_expire_date().."<color>", 0);
end

function no()
end;