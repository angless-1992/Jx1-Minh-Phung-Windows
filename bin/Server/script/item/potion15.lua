SKILLLIST = {256,257,258,259,260,261,262,263,264,265};

function main(nItemIdx)
	local _,detail=FindItemEx(nItemIdx);
	AddSkillState(SKILLLIST[detail], 1, 1 , 5*60*18);
	Msg2Player(format("B�n s� d�ng 1 vi�n %s",GetNameItem(nItemIdx)));
	RemoveItem(nItemIdx,1);
end