function main(index)
	Say("Thi�p ph�o hoa n�y c� th� b�n ph�o hoa xung quanh ng��i m�nh ch�c ph�c.", 2, format("B�t ��u ch�c ph�c/want2fireworks(%d)",index), "H�y b� /OnCancel")
end
	
function want2fireworks(index)
	Input(format("guiloichuc(%d)",index));
end

function guiloichuc(index)
	local name = GetInput();
	local nTIndex = FindPlayer(name)
	if (nTIndex > 0) then
	if (RemoveItem(index,1) == 1) then
	local nMyIdx = PlayerIndex;
	PlayerIndex = nTIndex;
	CastSkill(251,1);
	PlayerIndex = nMyIdx;
	Msg2Player("L�i ch�c ph�c c�a b�n �� g�i �i th�nh c�ng!")
	else
		Msg2Player("Kh�ng t�m ���c th�! Xin th� l�i 1 l�n!.")
	end
	else
	Say("Xin l�i! "..name.." hi�n t�i kh�ng c� tr�n m�ng.",0)
	end
end