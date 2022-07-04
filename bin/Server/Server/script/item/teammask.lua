Include("\\script\\lib\\worldlibrary.lua");
function  main(nItem)
	local nNpcSettingIdx = GetParamItem(nItem);
	Say("LINK:"..GetNpcTempTypeName(nNpcSettingIdx).."",random(0,13),"M�t n� t� ��i gi�p cho t�t c� th�nh vi�n trong ��i tr� n�n gi�ng nhau, mu�n s� d�ng kh�ng?", 2, "T� ��i ta s� c�i trang gi�ng nhau./yes("..nItem..")", "T�m th�i kh�ng/no");
end

function yes(nItem)
	local size=GetTeamSize();
	if(size <= 0) then
		Msg2Player("Kh�ng c� trong ��i ng�, kh�ng th� s� d�ng ��o c� n�y");
		return 1
	end

	local name = GetName()
	local nNpcSettingIdx = GetParamItem(nItem);
	if RemoveItem(nItem,1) ~= 1 then
		return
	end	
	for i=0,7 do
	local nMemId = GetTeamMem(i);
	if(nMemId > 0) then
		CallPlayerFunction(nMemId,SetMask,nNpcSettingIdx);
	end;
	end
	Msg2Team(name.." s� d�ng m�t n� ��i ng�, ��i vi�n c�i trang gi�ng nhau.");
end

function no()
end