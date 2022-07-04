// KTongControl.h: interface for the CTongControl class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_KTONGCONTROL_H__62D04F9A_67CD_419B_B475_BF0F8727A91E__INCLUDED_)
#define AFX_KTONGCONTROL_H__62D04F9A_67CD_419B_B475_BF0F8727A91E__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000


struct STONG_MEMBER
{
	DWORD	m_dwNameID;
	char	m_szName[defTONG_NAME_LENGTH_32];
	int		m_nSex;
	int 	m_nMemberJoinTm;
	int 	m_nMemberSaveEff;
};

typedef struct
{
	char		szName[defTONG_NAME_LENGTH_32];			// �����
	int			MemberCount;						//һ�������
}TTongList;	//��������б�

class CTongControl
{
	friend class CTongSet;
	friend class CTongDB;
public:
	// ���ڴ������
	CTongControl(int nCamp, BYTE btLevel, char *lpszPlayerName, char *lpszTongName, int nMasterSex, int nMasterJoinTm, int nMasterSaveEff, int nTongJiyuParam, char *szTongJiyuNotify);
	// �������ݿ�����������
	CTongControl(TTongList sList);
	virtual ~CTongControl();

private:

	int			m_nCamp;								// �����Ӫ
	DWORD		m_dwMoney;								// ����ʽ�
	int			m_nCredit;								// �������
	BYTE		m_btLevel;								// ���ȼ�
	int			m_nDirectorNum;							// ��������
	int			m_nManagerNum;							// �ӳ�����
	int			m_nMemberNum;							// ��������
	DWORD		m_dwTotalEff;
	int			m_nTongJiyuParam;
	char 		m_szTongJiyuNotify[defTONG_NOTIFY_LENGTH];
	int 		m_nSaveEff;
	BOOL		m_bRecruit;
	int 		m_nTongParam;

	DWORD		m_dwNameID;								// �����ID
	char		m_szName[defTONG_NAME_LENGTH_32];			// �����

	char		m_szMasterAgname[defTONG_NAME_LENGTH_32];	// �����ƺ�
	char		m_szDirectorAgname[defTONG_MAX_DIRECTOR][defTONG_NAME_LENGTH_32];// �����ϳƺ�
	char		m_szManagerAgname[defTONG_MAX_MANAGER][defTONG_NAME_LENGTH_32];	// ���ӳ��ƺ�
	char		m_szNormalAgname[defTONG_NAME_LENGTH_32];	// �����ڳƺ�

	DWORD		m_dwMasterID;							// ������ID
	char		m_szMasterName[defTONG_NAME_LENGTH_32];		// ������
	int			m_nMasterSex;
	int			m_nMasterJoinTm;
	int 		m_nMasterSaveEff;

	DWORD		m_dwDirectorID[defTONG_MAX_DIRECTOR];	// ��������ID
	char		m_szDirectorName[defTONG_MAX_DIRECTOR][defTONG_NAME_LENGTH_32];	// ��������
	int			m_nDirectorSex[defTONG_MAX_DIRECTOR];
	int 		m_nDirectorJoinTm[defTONG_MAX_DIRECTOR];
	int 		m_nDirectorSaveEff[defTONG_MAX_DIRECTOR];

	DWORD		m_dwManagerID[defTONG_MAX_MANAGER];		// ���ӳ���ID
	char		m_szManagerName[defTONG_MAX_MANAGER][defTONG_NAME_LENGTH_32];	// ���ӳ���
	int			m_nManagerSex[defTONG_MAX_DIRECTOR];
	int 		m_nManagerJoinTm[defTONG_MAX_MANAGER];
	int 		m_nManagerSaveEff[defTONG_MAX_MANAGER];

	STONG_MEMBER	*m_psMember;
	int				m_nMemberPointSize;
	char		m_szMaleAgname[defTONG_NAME_LENGTH_32];
	char		m_szFemaleAgname[defTONG_NAME_LENGTH_32];

public:
	BOOL		SearchOne(char *lpszName, STONG_ONE_LEADER_INFO *pInfo);

	BOOL		AddMember(char *lpszPlayerName, int nSex = 0, int nJoinTm = 0, int nSaveEff = 0);		// ���һ����Ա

	BOOL		GetTongHeadInfo(STONG_HEAD_INFO_SYNC *pInfo);	// �����Ϣ

	BOOL		GetTongManagerInfo(STONG_GET_MANAGER_INFO_COMMAND *pApply, STONG_MANAGER_INFO_SYNC *pInfo);

	BOOL		GetTongMemberInfo(STONG_GET_MEMBER_INFO_COMMAND *pApply, STONG_MEMBER_INFO_SYNC *pInfo);

	BOOL		Instate(STONG_INSTATE_COMMAND *pInstate, STONG_INSTATE_SYNC *pSync);

	BOOL		Kick(STONG_KICK_COMMAND *pKick, STONG_KICK_SYNC *pSync);

	BOOL		Leave(STONG_LEAVE_COMMAND *pLeave, STONG_LEAVE_SYNC *pSync);

	BOOL		AcceptMaster(STONG_ACCEPT_MASTER_COMMAND *pAccept);

	BOOL		GetLoginData(STONG_GET_LOGIN_DATA_COMMAND *pLogin, STONG_LOGIN_DATA_SYNC *pSync);
	
	BOOL		DBInstate(char *lpszPlayerName, BYTE nSite);

	BOOL		ChangeMoney(STONG_MONEY_COMMAND* pMoney,STONG_MONEY_SYNC *Sync);
	BOOL		DBChangeAgname(STONG_ACCEPT_AGNAME_COMMAND *pAccept);
	BOOL		DBChangeTongLevel(STONG_CHANGE_TONG_INFO_COMMAND *pInfo, STONG_CHANGE_TONG_INFO_SYNC *sInfo);
	BOOL		DBChangeTongMoney(STONG_CHANGE_TONG_INFO_COMMAND *pInfo, STONG_CHANGE_TONG_INFO_SYNC *sInfo);
	BOOL		DBChangeTongEff(STONG_CHANGE_TONG_INFO_COMMAND *pInfo, STONG_CHANGE_TONG_INFO_SYNC *sInfo);
	BOOL		DBChangeTongRecruit(STONG_CHANGE_TONG_INFO_COMMAND *pInfo, STONG_CHANGE_TONG_INFO_SYNC *sInfo);
	BOOL		DBChangeTongParam(STONG_CHANGE_TONG_INFO_COMMAND *pInfo, STONG_CHANGE_TONG_INFO_SYNC *sInfo);
	BOOL		DBChangeJiyu(STONG_CHANGE_TONG_INFO_COMMAND *pInfo, STONG_CHANGE_TONG_INFO_SYNC *sInfo);
	BOOL		DBChangeMemberEff(STONG_CHANGE_TONG_MEMBEREFF_COMMAND *pInfo, STONG_CHANGE_TONG_MEMBEREFF_SYNC *sInfo);

	BOOL		DBChangeMoney(DWORD dwMoney) { m_dwMoney = dwMoney;};
	
	BOOL		GetMasterAgname(char *lpszAgname);
	BOOL		GetDirectorAgname(char *lpszAgname, int nPos);
	BOOL		GetManagerAgname(char *lpszAgname, int nPos);
	BOOL		GetMemberAgname(char *lpszAgname, int nSex);	
	BOOL		DBChangeSexAgname(STONG_ACCEPT_SEX_AGNAME_COMMAND *pAccept);
	BOOL		DBChangeCamp(STONG_CHANGE_CAMP_COMMAND *pInfo, STONG_BE_CHANGED_CAMP_SYNC *sInfo);
	BOOL		MessageToTong(STONG_MESSAGE_INFO_COMMAND *pInfo);
};

#endif // !defined(AFX_KTONGCONTROL_H__62D04F9A_67CD_419B_B475_BF0F8727A91E__INCLUDED_)
