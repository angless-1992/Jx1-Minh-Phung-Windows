Include("\\script\\event\\uommamhp\\lib.lua")

function main(nNpcIndex)
	local DOITHOAI = "";
	local DIALOG={};
	if (GetNpcOwner(nNpcIndex) ~= GetName()) then
		DOITHOAI = GetNpcOwner(nNpcIndex).." tr�ng <color=green><npc><color>: Ch�o m�ng ng�y ��t n��c ���c gi�i ph�ng!";
	else
		if (GetNpcValue(nNpcIndex) > 0) then
			DOITHOAI = format("Ng��i �� tr�ng <color=green>%s<color> v� �� nh�n ���c <color=green>%d<color> �i�m. Khi n�o �i�m t�ch l�y b�ng <color=green>%d<color> th� c� th� nh�n th��ng ���c r�i!",
												GetNpcName(nNpcIndex), GetNpcValue(nNpcIndex), GetNpcParam(nNpcIndex,1));
			if (GetNpcValue(nNpcIndex) ~= GetNpcParam(nNpcIndex,1)) then
				tinsert(DIALOG, format("B�n ph�n (�i�m t�ch l�y hi�n t�i g�p 2 l�n)/congcu(%d,%d)",nNpcIndex, 1))
				tinsert(DIALOG, format("T��i n��c (�i�m t�ch l�y hi�n t�i c�ng 2 l�n)/congcu(%d,%d)",nNpcIndex, 2))
				tinsert(DIALOG, format("Gi�t s�u b� (�i�m t�ch l�y hi�n t�i tr� 2 l�n)/congcu(%d,%d)",nNpcIndex, 3))
			else
				tinsert(DIALOG, format("Ta mu�n nh�n th��ng/nhanthuong(%d)",nNpcIndex))
			end
		else
			DOITHOAI = GetNpcOwner(nNpcIndex).." tr�ng <color=green><npc><color>: Ch�o m�ng ng�y ��t n��c ���c gi�i ph�ng!";
		end;
	end
	tinsert(DIALOG, "R�i kh�i/no");
	Say("LINK:<npc>",0,DOITHOAI,getn(DIALOG),DIALOG);
end

function congcu(nNpcIndex,nToolID)
	if (PLANT_TOOL[nToolID]) then
		if(DelItem(1,0,PLANT_TOOL[nToolID][2][1],PLANT_TOOL[nToolID][2][2])) == 1 then
			if(nToolID==1) then
			SetNpcValue(nNpcIndex,GetNpcValue(nNpcIndex)*PLANT_TOOL[nToolID][3]);
			elseif(nToolID==2) then
			SetNpcValue(nNpcIndex,GetNpcValue(nNpcIndex)+PLANT_TOOL[nToolID][3]);
			elseif(nToolID==3) then
			SetNpcValue(nNpcIndex,GetNpcValue(nNpcIndex)-PLANT_TOOL[nToolID][3]);
			end
			main(nNpcIndex);
		else
			Talk(1, "", format("H�nh nh� c�c h� qu�n �em <color=yellow>%s<color>!",PLANT_TOOL[nToolID][1]));
		end
	end
end

function nhanthuong(nNpcIndex)
	if (nNpcIndex <= 0 )  then
		return
	end
	PIdx = NpcIdx2PIdx(nNpcIndex);
	if (PIdx > 0) then 
		return
	end;
	
	for i=1,getn(THIENTUE_TEMPLET) do
		if(THIENTUE_TEMPLET[i][2]==GetNpcName(nNpcIndex)) then
			AddOwnExp(THIENTUE_EXP[i]);
		end
	end
	SetNpcValue(nNpcIndex,0);
end

function Timeout(nNpcIndex)
end

function no()
end