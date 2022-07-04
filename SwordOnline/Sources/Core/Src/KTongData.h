#ifndef KTongDataH
#define	KTongDataH

struct KTongMap
{
	char szName[80];
	char szPath[MAX_PATH];
};

class KTongLevelAdd
{
private:
	int		m_nExpVal[MAX_TONG_LEVEL];				// ��������
	int		m_nEffVal[MAX_TONG_LEVEL];			// ÿ��ϵ������������
	int		m_nMemberNum[MAX_TONG_LEVEL];			// ÿ��ϵ������������
public:
	KTongLevelAdd();
	BOOL		Init();
	int			GetExp(int nLevel);	
	int			GetEff(int nLevel);			// ����ȼ���ÿɴ���Ա��
	int			GetMemNum(int nLevel);			// ���뾭���ÿɴ���Ա��
};

class KOneTong
{
private:
	DWORD		m_dwNameID;
	KTongMap	m_sMap;

public:
	KOneTong();
	BOOL		Init();
	BOOL		AddTong();
};


class KTongData
{
private:
#ifdef	_SERVER
	int						m_nNumTong;
public:
	KOneTong				m_sTong[MAX_TONG_COUNT];
#endif

public:
	KTongParam				m_sTongParam;
	KTongLevelAdd			m_sTongLevel;

	KTongData();
	BOOL	Init();
};

extern KTongData TongData;
#endif //KTongDataH
