Include("\\script\\header\\taskid.lua");

function main()
	local nTaskValue = GetNumber(1,GetTask(TASK_DAOTAYTUY),9);
	if(nTaskValue == 0) then
	Say(11275,2,
	"Gi�p/giup",
	"Kh�ng gi�p/kogiup"
	)
	elseif(nTaskValue == 3) then
		if(GetItemCount(0,4,180) > 0) then
		SetTask(TASK_DAOTAYTUY,SetNumber(1,GetTask(TASK_DAOTAYTUY),9,4));
		if(GetSex() == 0) then
		AddItemID(AddItem(0,0,5,0,1,1,0,0))
		Msg2Player("L�y ���c ��i gi�y c�.")
		else
		AddItemID(AddItem(0,0,5,2,1,1,0,0))
		Msg2Player("L�y ���c ��i gi�y th�u.")
		end
		DelItem(1,0,4,180)
		AddRepute(5)
		Msg2Player("��a T� B� ho�n cho Ti�u Ng� ho�n th�nh nhi�m v�.")
		Msg2Player("Danh v�ng b�n t�ng th�m 5 �i�m.")
		Talk(1,"",11276)
		else
		Talk(1,"",11277)
		end
	else
		Talk(1,"",11278)
	end
end;

function giup()
	SetTask(TASK_DAOTAYTUY,SetNumber(1,GetTask(TASK_DAOTAYTUY),9,1));
	Talk(1,"",11280)
	Msg2Player("Nh�n nhi�m v�: �i t�m thu�c cho cha Ti�u Ng�   ")
end

function kogiup()
	Talk(1,"",11281)
end
