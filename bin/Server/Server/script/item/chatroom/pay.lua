function main()
	Say("Th� cho ph�ng t�n g�u!", 3, 
	"T�o ph�ng m�i/tao_chatroom",
	"Gia h�n ph�ng/giahan_chatroom",
	"K�t th�c ��i tho�i/no");
end

function tao_chatroom()
	Msg2Player("Xin nh�p v�o t�n ph�ng");
	Input("nhapten"); 
end

function nhapten(name)
	SetTaskTemp(10,name);
	Msg2Player("Xin nh�p v�o m�t kh�u ph�ng");
	Input("nhapmatkhau",9999);
end;

function nhapmatkhau(pw)
	if(ChatRoom_Create(GetTaskTempS(10),pw,GetCurServerSec()+8*60*60)== 1)then
		DelItem(1,0,6,1063);
	end;
end;

function giahan_chatroom()
	Input("pay_chatroom_time"); 
end

function pay_chatroom_time(roomname)
	if (ChatRoom_AddTime(roomname,8*60*60) == 0) then
		Msg2Player("Ph�ng "..roomname.." kh�ng t�n t�i")
	else
		DelItem(1,0,6,1063);
		Msg2Player("Ph�ng "..roomname.." ���c gia h�n th�m 8 ti�ng")
	end
end


function no()
end
