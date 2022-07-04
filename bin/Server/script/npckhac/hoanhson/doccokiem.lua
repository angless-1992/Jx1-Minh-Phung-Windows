--hoangnhk
Include("\\script\\header\\taskid.lua");
Include("\\script\\header\\repute_head.lua");

function main(sel)
	local nTaskValue = GetTask(TASK_NVDANHVONG2);
	local nCurMin = GetNumber(7,nTaskValue,1);
	if (GetNumber(1,GetTask(TASK_NVDANHVONG3),5) == 1) then
	if (GetNumber(4,GetTask(TASK_NVDANHVONG3),1) == 1023) then
		hoanthanhnv()
	else
		Talk(1,"Tientrinhnv", 11332)
	end
	elseif (GetNumber(1,GetTask(TASK_NVDANHVONG3),5) == 0) then
		if(nCurMin < GetCurServerSec()) then
			if (GetLevel() >= 20) and (GetReputeLevel(GetRepute()) >= 2) then
				Say(11333,2,"Kh�ng th�nh v�n ��, ta xin g�p s�c/nhannv","Ta b�y gi� b� b�n nhi�u vi�c, l�c kh�c h�y n�i./out")
			else
				Talk(3,"",11334,11335,11336)
			end
		else
			Talk(2,"",11337,11338)
		end;
	--else
		--Talk(1,"",11339)
	end
end; 

function nhannv() 
	Talk(1,"",11340) 
	SetTask(TASK_NVDANHVONG3,SetNumber(1,GetTask(TASK_NVDANHVONG3),5,1)); 
	SetTask(TASK_NVDANHVONG3,SetNumber(4,GetTask(TASK_NVDANHVONG3),1,0));
	Earn(10000) 
	Msg2Player("Ti�p nh�n nhi�m v� Th�i �� V� L�m: thay ��c C� Ki�m �i th�m d� th�i �� c�c m�n ph�i, c� nguy�n ��ng t�m di�t Kim hay kh�ng.") 
	AddNote(13,1,"Thay ��c C� Ki�m �i th�m d� th�i �� c�c m�n ph�i, c� nguy�n ��ng t�m di�t Kim hay kh�ng.")
end 

function hoanthanhnv() 
	Talk(2,"",11341,11342) 
	local nTaskValue = GetTask(TASK_NVDANHVONG2);
	SetTask(TASK_NVDANHVONG2,SetNumber(7,nTaskValue,1,GetCurServerSec()+24*60));
	SetTask(TASK_NVDANHVONG3,SetNumber(1,GetTask(TASK_NVDANHVONG3),5,0)); 
	i = 10+random(1,10)
	AddRepute(i) 
	Msg2Player("Ho�n th�nh nhi�m v� Th�i �� V� L�m c�a ��c C� Ki�m, danh v�ng giang h� gia t�ng "..i.." �i�m.") 
	AddNote(13,1,"Tr� l�i Ho�nh S�n ��i �i�n, ho�n th�nh nhi�m v� Th�i �� V� L�m c�a ��c C� Ki�m") 
end 

function tientrinhnv() 
	local nTaskValue = GetTask(TASK_NVDANHVONG3) 
	faction_list = {
	"Ph�i Thi�u L�m",
	"Thi�n V��ng Bang",
	"���ng M�n",
	"Ng� ��c gi�o",
	"Ph�i Nga Mi",
	"Th�y Y�n",
	"C�i Bang",
	"Thi�n Nh�n gi�o",
	"Ph�i V� �ang",
	"C�n L�n ph�i",
	}
	str = ""
	for i = 1,10 do
		if (GetBit(GetNumber(4,nTaskValue,1),i) == 1) then
			if (str == "") then
			str = faction_list[i]
			else
			str = str..", "..faction_list[i]
			end
		end
	end 
	if (str == "") then
		Talk(1,"",11343) 
	else 
		Talk(1,"","Ng��i b�y gi� �� qua �i�u tra c�c m�n ph�i: "..str..", hy v�ng c� th� nhanh m�t ch�t.") 
	end
end 

function nvthegioi(nNpcIdx)
	local nFacId=GetNpcValue(nNpcIdx);
	if(nFacId<0 or nFacId >9) then return 0 end;
	local nTaskValue=GetTask(TASK_NVDANHVONG3);
	if(GetNumber(1,nTaskValue,5) == 0) then
	return 0 end;
	local nTask=GetNumber(4,nTaskValue,1);	
	if(GetBit(nTask,nFacId+1)== 1) then
	 return 0 end;
	if(nFacId==0 ) then
	Talk(1,"","��c C� Minh Ch� c� l�i, l�o n�p nh�t ��nh kh�ng t�, ch�ng qua v�n t� � trong tay ng��i Kim, l�o n�p kh�ng th� kh�ng c�n nh�c nguy h�i ��n t�nh m�ng ch�ng �� t�, kh�ng d�m ���ng ��t h�nh s�. L�m phi�n ng��i tr� v� b�m b�o ��c C� Minh Ch� l�o n�p kh�ng gi�p ���c") 
	elseif(nFacId==1 ) then
	Talk(1,"", 11524) 
	elseif(nFacId==2 ) then
	Talk(1,"",format("���ng m�n t� s� d�y d� �� t� kh�ng th� xen v�o chuy�n b�n ngo�i. Phi�n %s chuy�n l�i ta ��i v�i ��c C� Minh Ch� v� c�ng �y n�y",GetSex()==0 and "thi�u hi�p" or "n� hi�p")) 
	elseif(nFacId==3 ) then
	Talk(1,"","��c C� Ki�m mu�n li�n T�ng kh�ng Kim? n�i kh�ng u�ng? B�n gi�o c�ng Kim qu�c nguy�n l� li�n minh m�t thi�t. Nh�ng th� th� c� l�c m�ng c� h�i g� sao?") 
	elseif(nFacId==4 ) then
	Talk(1,"","B�n m�n tuy l� n� l�u t�m th��ng, nh�ng vi�c qu�c gia h�ng vong ch� tr�ch k� th�t phu. H�i b�m ��c C� Minh Ch�, Nga Mi nghe t� ng��i ph� th�c!") 
	elseif(nFacId==5 ) then
	Talk(1,"","��c C� Minh Ch� c� l�nh, ta l�m sao d�m kh�ng theo. Nh�ng l� b�n m�n ��u l� n� l�u b�nh th��ng, s� r�ng kh�ng ���c. Xin h�i b�o ��c C� Minh Ch�, b�n m�n nh�t ��nh �ng h� c�c v� anh h�ng, ch�c c�c v� k� khai ��c th�ng!") 
	elseif(nFacId==6 ) then
	Talk(1,"","��c C� Minh Ch� c� l�nh, �� t� tr�n d��i C�i Bang nh�t m�c tu�n theo, xin v� h�i b�m ��c C� Minh Ch�, C�i Bang nghe t� ng��i ph� th�c!") 
	elseif(nFacId==7 ) then
	Talk(1,"","��c c� ki�m m�t �i l� tr� ch�ng? B�n gi�o v�n l� ��i Kim qu�c, ��y , ��c c� ki�m ph�i ng��i ��n h�i l�o ph� chuy�n n�y. T�t, ng��i v� n�i ��c C� Ki�m n�i , c�c ng��i ch�ng qua l� m�t ��m ng��i � h�p ,d�m c�ng ch�ng ��i ��i Kim, c�n nh�c tr��c k�o ��i sau l�i n�i, ha ha ha!") 
	elseif(nFacId==8 ) then
	Talk(1,"","B�y gi� giang h� r�t lo�n, �� t� tr�n d��i V� �ang ph�i c�n th�n.")
	elseif(nFacId==9 ) then
	Talk(1,"","B�n ph�i l� th�n d�n ��i T�ng, ch�ng gi�c ngo�i x�m l� �i�u ���ng nhi�n, nh�ng ��c C� Ki�m nh�c ph� ph�c v� v�i ng��i Kim, ch� s� l� kh� c� th� h�ng ph�c") 
	else
		return 0;
	end;
	SetTask(TASK_NVDANHVONG3,SetNumber(4,GetTask(TASK_NVDANHVONG3),1,SetBit(nTask,nFacId+1,1)));	
	return 1;
end;

function out() 
end 