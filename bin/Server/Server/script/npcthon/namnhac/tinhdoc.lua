function main(NpcIndex)
	if (GetTeamSize() > 1) and (IsCaptain() == 1) then
	Talk(1,"Wswear_select", 11374) 
	else 
	Talk(1,"", 11375) 
	end 
end;

function Wswear_select() 
	if (GetSex() == 0) then 
		P_sex = "thi�u hi�p" 
	else 
		P_sex = "n� hi�p" 
	end 
	Say("<npc>: Hay th�t, hay th�t ch� c�n "..P_sex.." c�ng d��ng 3000 l��ng �� tu s�a t��ng Ph�t th� ta b�n ti�p chuy�n n�y.",2,"Quy�n 3000 l��ng./Wswear_yes","Th�i b� �i!/Wswear_no") 
end; 

function Wswear_yes() 
	if (GetCash() >= 3000) then 
		--if(SwearBrother(GetTeam()) == 1)then 
		--	SwearBrother(GetTeam());
		--	Pay(3000) 
		--	Msg2Team("Ch�c m�ng c�c v� k�t ngh�a kim lan.") 
		-- else 
			-- Msg2Team("Trong nh�m c� quan h� phu th�, k�t b�i th�t b�i") 
		-- end 
	else 
		Talk(1,"", 11376) 
	end 
end; 

function Wswear_no() 
end; 

