Include("\\script\\header\\loidai.lua");

function main()
	Say("C�c h� mu�n r�i l�i ��i ph�i kh�ng",3,"��ng v�y, ta mu�n r�i kh�i ��y!/yes","Ta l� ��i tr��ng, ta mu�n bi�t th� t� thi ��u./joinkey","Kh�ng c�n/no")
end;

function yes()
	LeaveGame();
	local w,x,y = Rev2Pos(BW_COMPETEMAP[1],GetCurRevID());
	NewWorld(w,floor(x/32),floor(y/32));
end

function no()
end
