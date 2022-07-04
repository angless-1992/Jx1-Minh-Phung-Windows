Include("\\script\\lib\\worldlibrary.lua")
Include("\\script\\header\\taskid.lua")

function main()
dofile("script/npcthon/giangtan/nguyetlao.lua");
	Say(12958,2,
	"Ta �� c� � trung nh�n, mu�n c�u h�n c� �y/kethon",
	--"Ch�ng t�i kh�ng h�p nhau, mu�n ly h�n/lyhon",
	--"Phu th� ch�ng t�i c�i v� su�t ng�y, xin Nguy�t L�o gi�p cho v�i l�i khuy�n/khuyen",
	"K�t th�c ��i tho�i/no")
end

function kethon()
	if(GetTaskTemp(3) > 0) then
		Talk(1,"",12955)
	return end
	if(GetMateName() ~= "") then
		if(GetSex() == 0) then
			Talk(1,"",12963)
		else
			Talk(1,"",12969)
		end
	return end
	if(GetSex() == 1) then
		Talk(1,"",12960)
	return end
	if(GetLevel() < 50) then
		Talk(1,"",12964)
		Msg2Player("B�n ch�a �� 50 c�p!")
	return end
	local nSize = GetTeamSize()
	if(nSize < 2) then
		Talk(1,"",12970)
	return end
	if(nSize > 2) then
		Talk(1,"",10287)
	return end
	local tempid = PlayerIndex
	local nTeamId = GetTeam()
	for i=0,7 do
		local MemId = GetTeamMem(nTeamId, i)
		if(MemId > 0 and MemId ~= tempid) then
			PlayerIndex = MemId
			local nNpcIdx = GetNpcIdx()
			local sex = GetSex()
			PlayerIndex = tempid
			nNpcIdx = FindAroundNpc(GetNpcID(nNpcIdx))
			if(nNpcIdx <= 0) then
			Talk(1,"",12970)
			return end
			if(sex == 0) then
			Talk(1,"",12961)
			return end
		end
	end
	PlayerIndex = tempid
	Say(12965,2,
	"��ng, ta mu�n c�u h�n c� �y/cauhon",
	"�� ta suy ngh� l�i/no")
end

function cauhon()
	if(GetMateName() ~= "") then
	return end
	if(GetCamp() ~= 4 and GetFactionNo() == 0 and GetTongName() == "") then
		Talk(1,"",12959)
	return end
	local nSize = GetTeamSize()
	if(nSize < 2) then
		Talk(1,"",12966)
	return end
	if(nSize > 2) then
		Talk(1,"",10287)
	return end
	local tempid = PlayerIndex
	local nTeamId = GetTeam()
	local DesId = 0
	for i=0,7 do
		local MemId = GetTeamMem(nTeamId, i)
		if(MemId > 0 and MemId ~= tempid) then
			PlayerIndex = MemId
			local nNpcIdx = GetNpcIdx()
			local sex = GetSex()
			local love = GetMateName()
			local level = GetLevel()
			local camp = GetCamp()
			local facno = GetFactionNo()
			local tong = GetTongName()
			PlayerIndex = tempid
			nNpcIdx = FindAroundNpc(GetNpcID(nNpcIdx))
			if(nNpcIdx <= 0) then
			Talk(1,"",12966)
			return end
			if(sex == 0) then
			Talk(1,"",12961)
			return end
			if(love ~= "") then
			Talk(1,"",10290)
			return end
			if(level < 50) then
			Talk(1,"",10291)
			return end
			if(camp ~= 4 and facno == 4 and tong == "") then
			Talk(1,"",12962)
			return end
			DesId = MemId
		end
	end
	PlayerIndex = tempid
	SetTaskTemp(3, 1)
	Talk(1,"",10292)
	PlayerIndex = DesId
	SetTaskTemp(4, tempid)
	TeamDoScript("\\script\\npcthon\\giangtan\\nguyetlao.lua", "hoichuyen")
end

function hoichuyen(tempid)
	Say(12956,2,
	"Ta ch�p nh�n/chapnhan",
	"Ta c�n ph�i suy ngh� th�m/tuchoi")
end

function chapnhan()
	local szName1 = GetName()
	local ManId = GetTaskTemp(4)
	local FemaleId = PlayerIndex
	PlayerIndex = ManId
	local szName2 = GetName()
	local mandwid = GetNpcID(GetNpcIdx())
	PlayerIndex = FemaleId
	if(FindAroundNpc(mandwid) <= 0) then
	return end
	if(GetMateName() ~= "") then
	return end
	SetTaskTemp(4,0)
	PlayerIndex = ManId
	SetTaskTemp(3,0)
	MakeMate(szName1)
	SetTask(TASK_MARRIED, GetTask(TASK_MARRIED)+1)
	local str = "Nguy�t L�o n�i 2 b�n c� th� ��n <color=Yellow>Th� May<color> (L�m An 185,184) �� mua trang ph�c h�n l�!"
	Msg2Player(str)
	PlayerIndex = FemaleId
	MakeMate(szName2)
	SetTask(TASK_MARRIED, GetTask(TASK_MARRIED)+1)
	Msg2Player(str)
	CastSkill(251,1)
	for i=284,290 do
	CastSkill(i,1)
	end
	AddNews(format("%s s�nh duy�n c�ng %s. Xin ch�c cho ��i t�n lang v� t�n giai nh�n b�ch ni�n giai l�o!",szName1, szName2),3)
end

function tuchoi()
	local ManId = GetTaskTemp(4)
	local FemaleId = PlayerIndex
	PlayerIndex = ManId
	local mandwid = GetNpcID(GetNpcIdx())
	PlayerIndex = FemaleId
	if(FindAroundNpc(mandwid) <= 0) then
	return end
	SetTaskTemp(4,0)
	Talk(1,"",12968)
	
	PlayerIndex = ManId
	SetTaskTemp(3,0)
	Talk(1,"",12967)
end

function lyhon()
	if(GetMateName() == "") then
		if(GetSex() == 0) then
			Talk(1,"",10314)
		else
			Talk(1,"",10315)
		end
	return end
	if(GetSex() == 1) then
		Talk(1,"",10316)
	return end
	local nSize = GetTeamSize()
	if(nSize < 2) then
		Talk(1,"",12979)
	return end
	Say(12977,2,"Ta mu�n ly h�n ngay l�p t�c/xacnhanhuy","�� ta c�n nh�c l�i/no")
	
end

function xacnhanhuy()
	local szLove1 = GetMateName()
	if(szLove1 == "") then
	return end
	local nSize = GetTeamSize()
	if(nSize < 2) then
		Talk(1,"",12979)
	return end
	if(nSize > 2) then
		Talk(1,"",10317)
	return end
	if(GetCash() < 50000) then
		Talk(1,"",12981)
	return end
	local Name1 = GetName()
	local Name2
	local tempid = PlayerIndex
	local desid
	local nTeamId = GetTeam()
	for i=0,7 do
		local nMemId = GetTeamMem(nTeamId, i)
		if(nMemId > 0 and nMemId ~= tempid) then
			desid = nMemId
			PlayerIndex = desid
			Name2 = GetName()
			local szLove2 = GetMateName()
			local nNpcIdx = GetNpcIdx()
			PlayerIndex = tempid
			nNpcIdx = FindAroundNpc(GetNpcID(nNpcIdx))
			if(nNpcIdx <= 0) then
			Talk(1,"",12979)
			return end
			if(szLove1 ~= Name2 or szLove2 ~= Name1) then
			Talk(1,"",12978)
			return end
		end
	end
	PlayerIndex = desid
	MakeMate("")
	PlayerIndex = tempid
	MakeMate("")
	Pay(50000)
end

function khuyen()
	local nSize = GetTeamSize()
	if(nSize < 2) then
		if(GetSex() == 0) then
			Talk(1,"",12973)
		else
			Talk(1,"",12974)
		end
	return end
	if(nSize > 2) then
		if(GetSex() == 0) then
			Talk(1,"",12975)
		else
			Talk(1,"",12976)
		end
	return end
	local nTeamId = GetTeam()
	local tempid = PlayerIndex
	local desid
	for i=0,7 do
		local nMemId = GetTeamMem(nTeamId, i)
		if(nMemId > 0 and nMemId ~= tempid) then
		desid = nMemId
		end
	end
	PlayerIndex = desid
	local Name2 = GetName()
	local Love2 = GetMateName()
	local nDesNpcId = GetNpcIdx()
	PlayerIndex = tempid
	local Name1 = GetName()
	local Love1 = GetMateName()
	if(FindAroundNpc(GetNpcID(nDesNpcId)) <= 0) then
		if(GetSex() == 0) then
			Talk(1,"",12973)
		else
			Talk(1,"",12974)
		end
	return end
	
	if(Love1 == "" or Name1 ~= Love2 or Name2 ~= Love1) then
		PlayerIndex = tempid
		if(GetSex() == 0) then
			Talk(1,"",12975)
		else
			Talk(1,"",12976)
		end
	return end
	Talk(1,"",12972)
	PlayerIndex = desid
	Talk(1,"",12972)
end

function no()
end