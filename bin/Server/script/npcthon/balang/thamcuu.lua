Include("\\script\\lib\\worldlibrary.lua");
Include("\\script\\header\\taskid.lua");

function main()
	local nTask = GetNumber(1,GetTask(TASK_NVDANHVONG),6);
	if(nTask == 1 and GetItemCount(0,4,181) < 1) then
	Say(11255,2,"Mua/muabong","T�n g�u/tangau")
	return end
	tangau()
end

function muabong()
	if(GetCash() < 200) then
	Talk(1,"",11261)
	else
	AddItemID(AddItem(0,4,181,0,0,5,0,0))
	Pay(200)
	Msg2Player("Mua ���c 1 ��i b�ng tay.")
	Talk(1,"",11260)
	end
end

function tangau()
Talk(3,"morongruong",11257,11258,11259)
end

function morongruong()
if(GetExpandBox() == 0) then
Say(11256,2,"Mua r��ng m� r�ng/muaruong","Kh�ng mua/no")
else
	if(GetSavePw()=="") then
	Say(11256,2,"T�o m� kh�a b�o v�/taoma","K�t th�c ��i tho�i/no")
	else
	Say(11256,2,"��i m� kh�a b�o v�/doima","K�t th�c ��i tho�i/no")
	end;
end
end

function taoma()
	Input("taoma2")
end;

function taoma2(x)
	SetSavePw(x);
end;

function doima()
	Msg2Player("<sex> h�y nh�p l�n l��t m�t kh�u c� v� m�t kh�u m�i ph�n bi�t b�ng k� t� <color=yellow><SPACE> <color>");
	Input("doima2");
end;

function doima2(x)
	if(GetSavePw()==GetParam(x,1," ")) then
		SetSavePw(GetParam(x,2," "));
	end
end;

function muaruong()
	if(GetItemCount(0,4,343) >= 2) then	--2 hoang kim bao
	DelItem(2,0,4,343)
	SetExpandBox(1)
	OpenBox(1)
	Talk(1,"morongruong",11263)
	else 
	Talk(1,"",11261)
	end
end

function no()
end