Include("\\script\\header\\factionhead.lua")

function main(nNpcIndex)
	if(nvthegioi(nNpcIndex) == 1) then
	return end;
local player_Faction = GetFaction();
	if (player_Faction == "") then
		Talk(1,"enroll_select","Thi�u l�m ph�i lu�n ���c xem l� V� l�m �� nh�t m�n ph�i, m�nh danh 'Th�i s�n b�c ��u' c�a Trung nguy�n v� l�m")
	elseif (player_Faction == "shaolin") then
			if (GetNumber(1,GetTask(TASK_DUNGCHUNG2),9) == 0) then
				if GetLevel() >= 60 then
				Say("<npc>: S� ��! S� ph� l�i ph�i �� xu�ng n�i �?",4,"Xu�t s� xu�ng n�i/xuatsu","T�m hi�u khu v�c luy�n c�ng/map_help","T�m hi�u v� ngh� b�n m�n/skill_help","Xin thay ta v�n an s� ph� /no")
				else
				Say("<npc>: S� ��! S� ph� l�i ph�i �� xu�ng n�i �?",3,"T�m hi�u khu v�c luy�n c�ng/map_help","T�m hi�u v� ngh� b�n m�n/skill_help","Xin thay ta v�n an s� ph� /no")
				end
			else
				Say("<npc>: S� ��! S� ph� l�i ph�i �� xu�ng n�i �?",4,"Tr�ng ph�n m�n ph�i/trungphansumon","T�m hi�u khu v�c luy�n c�ng/map_help","T�m hi�u v� ngh� b�n m�n/skill_help","Xin thay ta v�n an s� ph� /no")
			end
	elseif (player_Faction == "cuiyan") then
		Talk(1,"","Qu� m�n l�y v� luy�n v�! Uy�n chuy�n m� tinh di�u! Ti�u t�ng v� c�ng b�i ph�c!")
	elseif (player_Faction == "emei") then				
		Talk(1,"","Thanh Hi�u S� Th�i c�a qu� ph�i tinh th�ng ph�t h�c, v� ngh� cao c��ng, ti�u t�ng ng��ng m� �� l�u!")
	elseif (player_Faction == "tangmen") then
		Talk(1,"","Nghe n�i t� ���ng m�n ��i �m kh� th�nh minh kh�, h� th� xu�t th�n! T�i h� r�t kh�m ph�c!")
	elseif (player_Faction == "wudu") then
		Talk(1,"","��c M�n c�a qu� ph�i thi�n h� ��u o�n gh�t! B�n t�ng m�o mu�i khuy�n c�c ng��i n�n tu s�a Ph�t t�p! Quay ��u l� b�!")
	elseif (player_Faction == "tianwang") then
		Talk(1,"","Nghe n�i Kim qu�c �ang mu�n ti�u di�t qu� bang t�n g�c! Xin c�c v� v� c�ng th�n tr�ng!")
	elseif (player_Faction == "wudang") then
		Talk(1,"","Xin chuy�n l�i h�i th�m cu� b�n t�ng ��n ��o Nh�t Ch�n Nh�n! C� d�p s� ��n �� th�nh gi�o ng��i!")
	elseif (player_Faction == "kunlun") then
		Talk(1,"","Ng��i luy�n v� k� nh�t l� h�m danh v� �� k�! A Di �� Ph�t!")
	elseif (player_Faction == "tianren") then
		Talk(1,"","Qu� gi�o tuy ���c Kim qu�c b�o h�, nh�ng giang h� c� quy t�c c�a giang h�. Kh�ng ph�i mu�n l�m g� th� l�m.")
	elseif (player_Faction == "gaibang") then
		Talk(1,"","D��i s� l�nh ��o c�a qu� bang, d�n ch�ng �� c� nh�ng ng�y y�n b�nh h�nh ph�c! V�n l�n b�i ph�c! B�i ph�c!")
	end
end


function enroll_select()
	if (GetSeries() == 0) and (GetCamp() == 0) then
		if (GetLevel() >= 10) then
			Say("Thi�u L�m kh�ng h� danh l� danh m�n ch�nh ph�i! Huynh �� c� mu�n gia nh�p kh�ng?", 2, "Gia nh�p Thi�u L�m ph�i/go", "�� ta suy ngh� k� l�i xem/thing")
		else
			Talk(1,"","C�n b�n c�a ng��i c�n k�m l�m! H�y �i luy�n t�p th�m, bao gi� ��n c�p 10 l�i ��n t�m ta!")
		end
	end
end

function go()
gianhapmonphai(0)
end;

function thing()
	Talk(1,"",10283)
end;
