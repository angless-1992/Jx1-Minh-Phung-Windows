--hoangnhk
function main(nItemIdx)
	if (GetTongFlag() ~= 0) then
		Msg2Player("��i hi�p �� c� Bang H�i kh�ng th� ti�n h�nh thao t�c n�y!");
		return
	end
	Input("on_change_rolename");
end

function on_change_rolename(new_name)
	if (GetName() == new_name) then
		Talk(1, "", "B�n mu�n ��i t�n g�?")
	else
		if(RenameRole(new_name, "on_rename_rolename") ==0)then
			Talk(1, "", "T�n b�n nh�p v�o kh�ng h�p l�!");
		elseif(RenameRole(new_name, "on_rename_rolename") ==1)then
			Talk(1, "", "�� d�i t�n ch� t� 6 ��n 12 k� t�!");
		return end;
	end
end

function on_rename_rolename(f)
	if(f==1) then
		OfflineLive();
	else
		Talk(1, "", "T�n b�n nh�p v�o �� t�n t�i!");
	end;
end;