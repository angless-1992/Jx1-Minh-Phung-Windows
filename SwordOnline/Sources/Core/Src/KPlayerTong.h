//---------------------------------------------------------------------------
// Sword3 Engine (c) 2003 by Kingsoft
//
// File:	KPlayerTong.h
// Date:	2003.08.12
// Code:	�߳�����
// Desc:	KPlayerTong Class
//---------------------------------------------------------------------------


#ifndef KPLAYERTONG_H
#define KPLAYERTONG_H

class KPlayerTong
{
	friend class KPlayer;
private:
	int			m_nPlayerIndex;		// ָ���Ӧ��player�����λ��
	int			m_nApplyTo;			// ����Ѿ���ĳ�����������룬������ playerindex

public:
	DWORD		m_dwTongNameID;		// ������ַ���ת���ɵ� dword
	int			m_nFlag;			// �Ƿ������
	int			m_nFigure;			// ����е����
	int			m_nCamp;			// �����Ӫ
	BYTE		m_btDirectorNum;
	BYTE		m_btManagerNum;
	DWORD		m_dwMemberNum;
	DWORD		m_dwLeaveTime;
	BYTE		m_btLevel;
	char		m_szName[defTONG_NAME_LENGTH_32];		// �������
	char		m_szMasterName[defTONG_NAME_LENGTH_32];	// ��������
	char		m_szAgname[defTONG_NAME_LENGTH_32];		// ��ǰ�ƺ�
	int			m_nTongJiyuParam;
	char 		m_szTongJiyuNotify[defTONG_NOTIFY_LENGTH];
	DWORD		m_dwMoney;
	DWORD		m_dwTotalEff;
	int 		m_nSaveEff;
	BOOL		m_bRecruit;
	int 		m_nTongParam;
	int			m_nJoinTm;
#ifdef _SERVER
	int			m_nTongNationalEmblem;
#endif
private:
	BOOL		CheckAcceptAddApplyCondition();	// �ж��Ƿ����ת�����˵ļ���������

public:
	// ��ʼ��
	void		Init(int nPlayerIdx);
	void		Clear();

	void		GetTongName(char *lpszGetName);
	void		GetTongAgname(char *lpszGetAgname);
	DWORD		GetTongNameID();
	void		SetTongNameID(DWORD dwID) { m_dwTongNameID = dwID; };
	int			CheckIn() {return m_nFlag;};
	// �Ƿ���Ȩ����ѯ�ӳ���Ϣ
	BOOL		CanGetManagerInfo(DWORD dwTongNameID);
	// �Ƿ���Ȩ����ѯ������Ϣ
	BOOL		CanGetMemberInfo(DWORD dwTongNameID);

#ifndef _SERVER
	// ���봴�����
	int			ApplyCreateTong(int nCamp, char *lpszTongName);
	void		ForceCreateTong(BYTE* pMsg);
	// �õ�������֪ͨ�������
	void		Create(TONG_CREATE_SYNC *psCreate);
	// ���������
	BOOL		ApplyAddTong(DWORD dwNpcID);
	// �Ƿ���ܳ�Ա bFlag == TRUE ���� == FALSE ������
	void		JoinTongReply(int nNpcIdx);

	void		s2cJoinTong(BYTE* pMsg);
	void		s2cJoinTongReply(BYTE* pMsg);

	void		AcceptMember(int nPlayerIdx, DWORD dwNameID, BOOL bFlag);
	void		ReplyMember(int nPlayerIdx, DWORD dwNameID, BOOL bFlag);
	// �����ᣬ��Ϊ��ͨ����
	BOOL		AddTong(int nCamp, char *lpszTongName, char *lpszAgname, char *lpszMaster);
	// ��������
	BOOL		ApplyInstate(int nCurFigure, int nCurPos, int nNewFigure, int nNewPos, char *lpszName);
	// ��������
	BOOL		ApplyKick(int nCurFigure, int nCurPos, char *lpszName);
	// ���봫λ
	BOOL		ApplyChangeMaster(int nCurFigure, int nPos, char *lpszName);
	// �����뿪���
	BOOL		ApplyLeave();

	BOOL		ApplySaveMoney(DWORD nMoney);

	BOOL		ApplyGetMoney(DWORD nMoney);

	BOOL		ApplyChangeJiyu(char* szMasterName, int nParam, char* szNotify);
	BOOL		ApplyRecruit(BOOL bRecruit);
	
	/* �����ð����Ϣ
	if nInfoID == enumTONG_APPLY_INFO_ID_SELF ���ò���
	if nInfoID == enumTONG_APPLY_INFO_ID_MASTER nParam1 �����id
	if nInfoID == enumTONG_APPLY_INFO_ID_DIRECTOR nParam1 �����id
	if nInfoID == enumTONG_APPLY_INFO_ID_MANAGER nParam1 �����id nParam2 �ӿ�ʼ��Ч�ڼ��� nParam3 ��������
	if nInfoID == enumTONG_APPLY_INFO_ID_MEMBER nParam1 �����id nParam2 �ӿ�ʼ��Ч�ڼ��� nParam3 ��������
	if nInfoID == enumTONG_APPLY_INFO_ID_ONE lpszName ����
	if nInfoID == enumTONG_APPLY_INFO_ID_TONG_HEAD nParam1 NpcIndex
	*/
	BOOL		ApplyInfo(int nInfoID, int nParam1, int nParam2, int nParam3, char *lpszName = NULL);
	// �趨��������Ϣ
	void		SetSelfInfo(TONG_SELF_INFO_SYNC *pInfo);
	
	void        OpenCreateInterface();

	void		ChangeMoney(DWORD dwMoney) {m_dwMoney = dwMoney;};
	
	void		ChangeTongEff(DWORD dwTotalEff) {m_dwTotalEff = dwTotalEff;};
	
	BOOL		ApplyChangeAgname(int nCurFigure, int nCurPos, char *lpszName, char *lpszAgname);
	
	BOOL		ApplyChangeSexAgname(char *lpszAgname, int nSex);
	
	BOOL		ApplyTongChangeCamp(int nCamp);
	
	BOOL		ChangeCamp(int nCamp);
	BOOL		ChangeLevel(BYTE btLevel);
	BOOL		ChangeRecruit(BOOL bRecruit);
	BOOL		ChangeTongParam(int nTongParam);
	BOOL		ChangeJiyu(int nParam, char* szNotify);
	BOOL		ChangeEff(int nSaveEff, DWORD dwTotalEff);
#endif

#ifdef _SERVER
	// �жϴ�����������Ƿ���� if �ɹ� return == 0 else return error id
	int			CheckCreateCondition(int nCamp, char *lpszTongName);
	// �õ�relay֪ͨ����ᴴ���ɹ���������Ӧ����
	BOOL		Create(int nCamp, char *lpszTongName);
	// ͷ���Ƿ���Ҫ�����˱�־
	// ת��������������Է��ͻ���
	BOOL		TransferAddApply(DWORD dwNpcID);
	// ����Ϣ֪ͨ�ܾ�ĳ������
	void		SendRefuseMessage(int nPlayerIdx, DWORD dwNameID);
	
	void		JoinTong(char* cTongName);
	void		JoinTongReply(BYTE* pProtocol);
	// �жϱ��˼����Լ���������Ƿ����
	BOOL		CheckJoinTong();
	BOOL		CheckAddCondition(int nPlayerIdx);
	BOOL		CheckAddConditionReply(int nPlayerIdx);
	// �����ᣬ��Ϊ��ͨ����
	BOOL		AddTong(int nCamp, int nMemberNum, DWORD dwMoney, int nLevel, DWORD dwTotalEff, BOOL bRecruit, int nTongParam, int nTongJiyuParam, char *lpszTongName, char *lpszMasterName, char *lpszAgname);
	// ���ͻ��˷����Լ��ڰ���е���Ϣ
	void		SendSelfInfo();
	// ����Ƿ�������Ȩ��
	BOOL		CheckInstatePower(TONG_APPLY_INSTATE_COMMAND *pApply);
	// ������
	void		BeInstated(STONG_SERVER_TO_CORE_BE_INSTATED *pSync);
	// ����Ƿ�������Ȩ��
	BOOL		CheckKickPower(TONG_APPLY_KICK_COMMAND *pKick);
	// ���߳����
	void		BeKicked(STONG_SERVER_TO_CORE_BE_KICKED *pSync);
	// ����Ƿ����뿪Ȩ��
	BOOL		CheckLeavePower(TONG_APPLY_LEAVE_COMMAND *pLeave);

	BOOL		CheckMoneyPower(TONG_APPLY_SAVE_COMMAND *pSave);

	BOOL		CheckSaveEffPower(TONG_APPLY_SAVE_EFF_COMMAND *pSave);
	// �뿪���
	void		Leave(STONG_SERVER_TO_CORE_LEAVE *pLeave);
	// ����Ƿ���Ȩ��������
	BOOL		CheckChangeMasterPower(TONG_APPLY_CHANGE_MASTER_COMMAND *pChange);
	// ����Ƿ����������ܴ�λ
	BOOL		CheckGetMasterPower();
	// ��λ������ݸı�
	BOOL		CheckGetMasterPower(STONG_SERVER_TO_CORE_CHECK_GET_MASTER_POWER *pCheck);

	void		ChangeAs(STONG_SERVER_TO_CORE_CHANGE_AS *pAs);
	// ������
	void		ChangeMaster(char *lpszMaster);
	// ��½ʱ���ð����Ϣ
	void		Login(STONG_SERVER_TO_CORE_LOGIN *pLogin);

	void		DBSetTongNameID(DWORD dwID) { m_dwTongNameID = dwID; if (dwID) m_nFlag = 1;};

	void		ChangeMoney(DWORD dwMoney);

	void		ChangeTongEff(DWORD dwTotalEff);
	
	BOOL		CheckChangeAgnamePower(TONG_APPLY_CHANGE_AGNAME_COMMAND *pChange);

	BOOL		CheckGetAgnamePower(STONG_SERVER_TO_CORE_CHECK_GET_AGNAME_POWER *pCheck);	
	
	void		BeChangedAgname(STONG_SERVER_TO_CORE_BE_CHANGED_AGNAME *pSync);
	
	BOOL		CheckChangeSexAgnamePower(TONG_APPLY_CHANGE_SEX_AGNAME_COMMAND *pChange);
	
	int			CheckChangeCampCondition(TONG_APPLY_CHANGE_CAMP_COMMAND *pChange);
	
	BOOL		CheckChangeRecruit(TONG_CHANGE_RECRUIT_COMMAND *pChange);
	
	BOOL		CheckChangeInfo(TONG_APPLY_CHANGE_INFO_COMMAND *pChange);
	
	void		BeChangedCamp(STONG_SERVER_TO_CORE_BE_CHANGED_CAMP *pSync);	
	void		BeChangedLevel(STONG_SERVER_TO_CORE_BE_CHANGED_LEVEL *pSync);
	void		BeChangedRecruit(STONG_SERVER_TO_CORE_BE_CHANGED_RECRUIT *pSync);
	void		BeChangedTongParam(STONG_SERVER_TO_CORE_BE_CHANGED_TONGPARAM *pSync);
	void		BeChangedJiyu(STONG_SERVER_TO_CORE_BE_CHANGED_JIYU *pSync);
	void		BeChangedEff(STONG_SERVER_TO_CORE_BE_CHANGED_EFF *pSync);
#endif
};
#endif
