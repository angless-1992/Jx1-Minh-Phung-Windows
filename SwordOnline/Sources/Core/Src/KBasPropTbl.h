//---------------------------------------------------------------------------
// Sword3 Core (c) 2002 by Kingsoft
//
// File:	KBasPropTbl.h
// Date:	2002.08.14
// Code:	DongBo
// Desc:    header file. ���ļ�����������ڴ�tab file�ж������ߵĳ�ʼ����,
//			�����ɶ�Ӧ�����Ա�
//---------------------------------------------------------------------------

#ifndef	KBasPropTblH
#define	KBasPropTblH

#define		SZBUFLEN_0	80		// ���͵��ַ�������������
#define		SZBUFLEN_1	1024		// ���͵��ַ�������������

#define		MAX_MAGIC_PREFIX	20
#define		MAX_MAGIC_SUFFIX	20
// ���½ṹ����������ʯ�Ļ�������. ��������������ļ�(tab file)�ṩ
typedef struct
{
	char		m_szName[SZBUFLEN_0];		// ����
	int			m_nItemGenre;				// ��������
	int			m_nDetailType;				// �������
	char		m_szImageName[SZBUFLEN_0];	// �����еĶ����ļ���
	int			m_nObjIdx;					// ��Ӧ�������
	int			m_nWidth;					// ����������ռ���
	int			m_nHeight;					// ����������ռ�߶�
	char		m_szIntro[SZBUFLEN_1];		// ˵������
	char		m_szScript[SZBUFLEN_1];		// ˵������
	int			m_nPrice;					// �۸�
	BOOL		m_bShortKey;
	int			m_nMaxStack;
} KBASICPROP_EVENTITEM;

// ���½ṹ��������ҩƷ���Ե����ԣ���ֵ��ʱ��
typedef struct
{
	int			nAttrib;
	int			nValue;
	int			nTime;
} KMEDATTRIB;

// ���½ṹ��������ҩƷ�Ļ�������. ��������������ļ�(tab file)�ṩ
// ����������ҩƷ: ����������,����������,����������,��ҩ��,�ⶾ��,
//					��ȼ����,�������
typedef struct
{
	char		m_szName[SZBUFLEN_0];		// ����
	int			m_nItemGenre;				// ��������
	int			m_nDetailType;				// �������
	int			m_nParticularType;			// ��ϸ���
	char		m_szImageName[SZBUFLEN_0];	// �����еĶ����ļ���
	int			m_nObjIdx;					// ��Ӧ�������
	int			m_nWidth;					// ����������ռ���
	int			m_nHeight;					// ����������ռ�߶�
	char		m_szIntro[SZBUFLEN_1];		// ˵������
	int			m_nSeries;					// ��������
	int			m_nPrice;					// �۸�
	int			m_nLevel;					// �ȼ�
	int			m_nMaxStack;
	KMEDATTRIB	m_aryAttrib[2];				// ҩƷ������
} KBASICPROP_MEDICINE;

// ���½ṹ��������һ�����,��Сֵ
typedef struct
{
	int			nMin;
	int			nMax;
} KMINMAXPAIR;

// ���½ṹ���ڸ���װ���ĺ��Ĳ���: ��������
typedef struct
{
	int			nType;						// ��������
	KMINMAXPAIR	sRange;						// ȡֵ��Χ
} KEQCP_BASIC;	// Equipment_CorePara_Basic

// ���½ṹ���ڸ���װ���ĺ��Ĳ���: ��������
typedef struct
{
	int			nType;						// ��������
	int			nPara;						// ��ֵ
} KEQCP_REQ;	// Equipment_CorePara_Requirment

// ���½ṹ���ڸ���ħ���ĺ��Ĳ���
typedef struct
{
	int			nPropKind;					// �޸ĵ��������ͣ���ͬһ����ֵ�ӰٷֱȺͼӵ�������Ϊ���������ԣ�
	KMINMAXPAIR	aryRange[3];				// �޸���������ļ�������
} KMACP;	// MagicAttrib_CorePara

// ���½ṹ�������������ļ��и�����ħ������. ��������������ļ�(tab file)�ṩ
// Add by Freeway Chen in 2003.5.30
#define			MATF_CBDR		    11      // ��Ʒ���� type(���ڵ�ֵΪ equip_detailnum)
#define         MATF_PREFIXPOSFIX   2       // ǰ׺��׺
#define         MATF_SERIES         5       // ����
#define         MATF_LEVEL          10      // �����10������

typedef struct
{
	int			m_nPos;						// ǰ׺���Ǻ�׺
	char		m_szName[SZBUFLEN_0];		// ����
	int			m_nClass;					// ����Ҫ��
	int			m_nLevel;					// �ȼ�Ҫ��
	char		m_szIntro[SZBUFLEN_1];		// ˵������
	KMACP		m_MagicAttrib;				// ���Ĳ���
	int			m_DropRate[MATF_CBDR];		// ���ָ���
    //add by Freeway Chen in 2003.5.30
    int         m_nUseFlag;                 // ��ħ���Ƿ�ʹ�ù�
} KMAGICATTRIB_TABFILE;

// ���½ṹ��������ħ������. ��������������ļ�(tab file)�ṩ
/*
typedef struct
{
	int			m_nPos;						// ǰ׺���Ǻ�׺
	char		m_szName[SZBUFLEN_0];		// ����
	int			m_nClass;					// ����Ҫ��
	int			m_nLevel;					// �ȼ�Ҫ��
	char		m_szIntro[SZBUFLEN_1];		// ˵������
	KMACP		m_MagicAttrib;				// ���Ĳ���
	int			m_DropRate;					// ���ָ���
} KMAGICATTRIB;
*/
// ���½ṹ��������װ���ĳ�ʼ����. ��������������ļ�(tab file)�ṩ
typedef struct
{
	char			m_szName[SZBUFLEN_0];		// ����
	int				m_nItemGenre;				// �������� (����? ҩƷ? ��ʯ?)
	int				m_nDetailType;				// �������
	int				m_nParticularType;			// ��ϸ���
	char			m_szImageName[SZBUFLEN_0];	// �����еĶ����ļ���
	int				m_nObjIdx;					// ��Ӧ�������
	int				m_nWidth;					// ����������ռ���
	int				m_nHeight;					// ����������ռ�߶�
	char			m_szIntro[SZBUFLEN_1];		// ˵������
	int				m_nSeries;					// ��������
	int				m_nPrice;					// �۸�
	int				m_nLevel;					// �ȼ�
	KEQCP_BASIC		m_aryPropBasic[7];			// ��������
	KEQCP_REQ		m_aryPropReq[6];			// ��������
} KBASICPROP_EQUIPMENT;


// ���½ṹ��������Ψһװ���ĳ�ʼ����. ��������������ļ�(tab file)�ṩ
typedef struct
{
	char		m_szName[SZBUFLEN_0];		// ����
	int			m_nItemGenre;				// �������� (����? ҩƷ? ��ʯ?)
	int			m_nDetailType;				// �������
	int			m_nParticularType;			// ��ϸ���
	char		m_szImageName[SZBUFLEN_0];	// �����еĶ����ļ���
	int			m_nObjIdx;					// ��Ӧ�������
	int			m_nWidth;					// ��Ʒ�����
	int			m_nHeight;					// ��Ʒ���߶�
	char		m_szIntro[SZBUFLEN_1];		// ˵������
	int			m_nSeries;					// ��������
	int			m_nPrice;					// �۸�
	int			m_nLevel;					// �ȼ�	
	KEQCP_BASIC	m_aryPropBasic[7];			// ��������
	KEQCP_REQ	m_aryPropReq[6];			// ��������
	int			m_aryMagicAttribs_0[MAX_ITEM_MAGICATTRIB];		// ħ������
	int			m_aryMagicAttribs_10[MAX_ITEM_MAGICATTRIB];		// ħ������
	int			m_nGroup;						// ������װ
	int			m_nSetID;					// �������
	int			m_nNeedToActive1;					// ��չ��װ
	int			m_nNeedToActive2;					// ��չ��װ
} KBASICPROP_EQUIPMENT_PLATINA;
// ���½ṹ���������ƽ�װ���ĳ�ʼ����. ��������������ļ�(tab file)�ṩ
// flying ���ݲ߻������޸���KBASICPROP_EQUIPMENT_PLATINA����
// Fix By Minh Kiem
typedef struct
{
	char		m_szName[SZBUFLEN_0];		// ����
	int			m_nItemGenre;				// �������� (����? ҩƷ? ��ʯ?)
	int			m_nDetailType;				// �������
	int			m_nParticularType;			// ��ϸ���
	char		m_szImageName[SZBUFLEN_0];	// �����еĶ����ļ���
	int			m_nObjIdx;					// ��Ӧ�������
	int			m_nWidth;					// ��Ʒ�����
	int			m_nHeight;					// ��Ʒ���߶�
	char		m_szIntro[SZBUFLEN_1];		// ˵������
	int			m_nSeries;					// ��������
	int			m_nPrice;					// �۸�
	int			m_nLevel;					// �ȼ�	
	KEQCP_BASIC	m_aryPropBasic[7];			// ��������
	KEQCP_REQ	m_aryPropReq[6];			// ��������
	int			m_aryMagicAttribs[MAX_ITEM_MAGICATTRIB];		// ħ������
	int			m_nGroup;						// ������װ
	int			m_nSetID;					// �������
	int			m_nNeedToActive1;					// ��չ��װ
	int			m_nNeedToActive2;					// ��չ��װ
} KBASICPROP_EQUIPMENT_GOLD;

typedef struct
{
	char		m_szName[SZBUFLEN_0];		// ����
	int			m_nItemGenre;				// ��������
	int			m_nDetailType;				// �������
	char		m_szImageName[SZBUFLEN_0];	// �����еĶ����ļ���
	int			m_nObjIdx;					// ��Ӧ�������
	int			m_nWidth;					// ����������ռ���
	int			m_nHeight;					// ����������ռ�߶�
	char		m_szIntro[SZBUFLEN_1];		// ˵������
	int			m_nPrice;
	BOOL		m_bShortKey;
	int			m_nMaxStack;					// �Ƿ�ɵ���
} KBASICPROP_QUEST;

typedef struct
{
	char		m_szName[SZBUFLEN_0];		// ����
	int			m_nItemGenre;				// ��������
	int			m_nDetailType;				// �������
	char		m_szImageName[SZBUFLEN_0];	// �����еĶ����ļ���
	int			m_nObjIdx;					// ��Ӧ�������
	int			m_nWidth;					// ����������ռ���
	int			m_nHeight;					// ����������ռ�߶�
	char		m_szIntro[SZBUFLEN_1];		// ˵������
	char		m_szScript[SZBUFLEN_1];		// ˵������
	int			m_nPrice;
	BOOL		m_bShortKey;
	int			m_nMaxStack;					// �Ƿ�ɵ���
} KBASICPROP_TOWNPORTAL;

typedef struct
{
	char		m_szName[SZBUFLEN_0];		// ����
	int			m_nItemGenre;				// ��������
	int			m_nDetailType;				// �������
	char		m_szImageName[SZBUFLEN_0];	// �����еĶ����ļ���
	int			m_nObjIdx;					// ��Ӧ�������
	int			m_nWidth;					// ����������ռ���
	int			m_nHeight;					// ����������ռ�߶�
	char		m_szIntro[SZBUFLEN_1];		// ˵������
	char		m_szScript[SZBUFLEN_1];		// ˵������s
	int			m_nPrice;					// �۸�
	BOOL		m_bShortKey;
	int			m_nMaxStack;
} KBASICPROP_MAGICSCRIPT;
//=============================================================================

class KBasicPropertyTable			// ��д: BPT,����������
{
public:
	KBasicPropertyTable();
	~KBasicPropertyTable();

// �����Ǻ��ĳ�Ա����
protected:
	void*		m_pBuf;						// ָ�����Ա�������ָ��
											// ���Ա���һ���ṹ����,
											// ��������������������
	int			m_nNumOfEntries;			// ���Ա��ж���������

// �����Ǹ����Եĳ�Ա����
    int         m_nSizeOfEntry;				// ÿ�����ݵĴ�С(���ṹ�Ĵ�С)
	char		m_szTabFile[MAX_PATH];		// tabfile���ļ���

// �����Ƕ���ӿ�
public:
	virtual BOOL Load();					// ��tabfile�ж�����ʼ����ֵ, �������Ա�
	int NumOfEntries() const { return m_nNumOfEntries; }

// �����Ǹ�������
protected:
	BOOL GetMemory();
	void ReleaseMemory();
	void SetCount(int);
	virtual BOOL LoadRecord(int i, KTabFile* pTF) = 0;
};

class KBPT_Event : public KBasicPropertyTable
{
public:
	KBPT_Event();
	~KBPT_Event();

public:
	const KBASICPROP_EVENTITEM* GetRecord(IN int) const;
	const KBASICPROP_EVENTITEM* FindRecord(IN int) const;
protected:
	virtual BOOL LoadRecord(int i, KTabFile* pTF);
};

class KBPT_TownPortal : public KBasicPropertyTable
{
public:
	KBPT_TownPortal();
	~KBPT_TownPortal();

// �����Ƕ���ӿ�
public:
	const KBASICPROP_TOWNPORTAL* GetRecord(IN int) const;

protected:
	virtual BOOL LoadRecord(int i, KTabFile* pTF);
};

// =====>ҩ��<=====
// =====>ҩƷ<=====
class KBPT_Medicine : public KBasicPropertyTable
{
public:
	KBPT_Medicine();
	~KBPT_Medicine();

// �����Ƕ���ӿ�
public:
	const KBASICPROP_MEDICINE* GetRecord(IN int) const;
	const KBASICPROP_MEDICINE* FindRecord(IN int, IN int) const;

// �����Ǹ�������
protected:
	virtual BOOL LoadRecord(int i, KTabFile* pTF);
};

// =====>������Ʒ<=====
class KBPT_Quest : public KBasicPropertyTable
{
public:
	KBPT_Quest();
	~KBPT_Quest();

// �����Ƕ���ӿ�
public:
	const KBASICPROP_QUEST* GetRecord(IN int) const;
	const KBASICPROP_QUEST* FindRecord(IN int) const;

protected:
	virtual BOOL LoadRecord(int i, KTabFile* pTF);
};

class KBPT_MagicScript : public KBasicPropertyTable
{
public:
	KBPT_MagicScript();
	~KBPT_MagicScript();

// �����Ƕ���ӿ�
public:
	const KBASICPROP_MAGICSCRIPT* GetRecord(IN int) const;
	const KBASICPROP_MAGICSCRIPT* FindRecord(IN int) const;

protected:
	virtual BOOL LoadRecord(int i, KTabFile* pTF);
};

class KBPT_Equipment : public KBasicPropertyTable
{
public:
	KBPT_Equipment();
	~KBPT_Equipment();

// �����Ƕ���ӿ�
public:
	const KBASICPROP_EQUIPMENT* GetRecord(IN int) const;
	const KBASICPROP_EQUIPMENT* FindRecord(IN int, IN int, IN int) const;
	void Init(IN int);
// �����Ǹ�������
protected:
	virtual BOOL LoadRecord(int i, KTabFile* pTF);
};

class KBPT_Equipment_Platina : public KBasicPropertyTable
{
public:
	KBPT_Equipment_Platina();
	virtual ~KBPT_Equipment_Platina();

// �����Ƕ���ӿ�
public:
	const KBASICPROP_EQUIPMENT_PLATINA* GetRecord(IN int) const;
	const KBASICPROP_EQUIPMENT_PLATINA* FindRecord(IN int, IN int, IN int) const;
	int GetRecordCount() const {return KBasicPropertyTable::NumOfEntries();};
	void Init();
// �����Ǹ�������
protected:
	virtual BOOL LoadRecord(int i, KTabFile* pTF);
};

// �ƽ�װ��
class KBPT_Equipment_Gold : public KBasicPropertyTable
{
public:
	KBPT_Equipment_Gold();
	virtual ~KBPT_Equipment_Gold();

// �����Ƕ���ӿ�
public:
	const KBASICPROP_EQUIPMENT_GOLD* GetRecord(IN int) const;
	const KBASICPROP_EQUIPMENT_GOLD* FindRecord(IN int, IN int, IN int) const;
	int GetRecordCount() const {return KBasicPropertyTable::NumOfEntries();};
	void Init();
// �����Ǹ�������
protected:
	virtual BOOL LoadRecord(int i, KTabFile* pTF);
};

class KBPT_MagicAttrib_TF : public KBasicPropertyTable
{
public:
	KBPT_MagicAttrib_TF();
	~KBPT_MagicAttrib_TF();

// �����Ǹ�����Ա����
protected:
	int m_naryMACount[2][MATF_CBDR];	// ÿ��װ�������õ�ħ����Ŀ,��ǰ��׺����ͳ��
										// ����MATF_CBDR��װ�����Ծ߱�ħ��
// �����Ƕ���ӿ�
public:
	void GetMACount(int*) const;
	const KMAGICATTRIB_TABFILE* GetRecord(IN int) const;

// �����Ǹ�������
protected:
	virtual BOOL LoadRecord(int i, KTabFile* pTF);
	void Init();
};
/*
class KBPT_MagicAttrib : public KBasicPropertyTable
{
public:
	KBPT_MagicAttrib();
	~KBPT_MagicAttrib();

// �����Ǹ�������
protected:
};
*/

//============================================================================

// Add by Freeway Chen in 2003.5.30
class KBPT_ClassMAIT    // Magic Item Index Table
{
public:
	KBPT_ClassMAIT();
	~KBPT_ClassMAIT();

// �����Ǻ��ĳ�Ա����
protected:
	int*	m_pnTable;				// ������ָ��, ��������Ϊ
									// KBPT_MagicAttrib_TF::m_pBuf������±�
	int		m_nSize;				// �������ں�����������(�����ֽ���)

// �����Ǹ�����Ա����
	int		m_nNumOfValidData;		// ����������Ч���ݵĸ���
									// ��ʼ��������ɺ�m_nNumOfValidData < m_nSize
// �����Ƕ���ӿ�
public:
    BOOL Clear();
	BOOL Insert(int nItemIndex);
	int  Get(int i) const;
    int  GetCount() const { return m_nNumOfValidData; }
};

//============================================================================

class KBPT_ClassifiedMAT
{
public:
	KBPT_ClassifiedMAT();
	~KBPT_ClassifiedMAT();

// �����Ǻ��ĳ�Ա����
protected:
	int*	m_pnTable;				// ������ָ��, ��������Ϊ
									// KBPT_MagicAttrib_TF::m_pBuf������±�
	int		m_nSize;				// �������ں�����������(�����ֽ���)

// �����Ǹ�����Ա����
	int		m_nNumOfValidData;		// ����������Ч���ݵĸ���
									// ��ʼ��������ɺ�m_nNumOfValidData==m_nSize
// �����Ƕ���ӿ�
public:
	BOOL GetMemory(int);
	BOOL Set(int);
	int Get(int) const;
	BOOL GetAll(int*, int*) const;

// �����Ǹ�������
protected:
	void ReleaseMemory();
};

class KLibOfBPT
{
public:
	KLibOfBPT();
	~KLibOfBPT();

// �����Ǻ��ĳ�Ա����
protected:
	KBPT_Medicine			m_BPTMedicine;
	KBPT_MagicScript		m_BPTMagicScript;
	KBPT_Event				m_BPTEvent;
	KBPT_Quest				m_BPTQuest;
	KBPT_TownPortal			m_BPTTownPortal;
	KBPT_Equipment			m_BPTHorse;
	KBPT_Equipment			m_BPTMeleeWeapon;
	KBPT_Equipment			m_BPTRangeWeapon;
	KBPT_Equipment			m_BPTArmor;
	KBPT_Equipment			m_BPTHelm;
	KBPT_Equipment			m_BPTBoot;
	KBPT_Equipment			m_BPTBelt;
	KBPT_Equipment			m_BPTAmulet;
	KBPT_Equipment			m_BPTRing;
	KBPT_Equipment			m_BPTCuff;
	KBPT_Equipment			m_BPTPendant;
	KBPT_Equipment			m_BPTMask;
	KBPT_Equipment			m_BPTMantle;
	KBPT_Equipment			m_BPTSignet;
	KBPT_Equipment			m_BPTShipin;
	KBPT_Equipment			m_BPTHoods;
	KBPT_Equipment			m_BPTCloak;
	
    KBPT_MagicAttrib_TF		m_BPTMagicAttrib;
	// Add By Minh Kiem
	KBPT_Equipment_Gold		m_BPTGoldEquip;
	KBPT_Equipment_Platina	m_BPTPlatinaEquip;
    // Add by Freeway Chen in 2003.5.30
	// ��ά�ֱ�Ϊǰ��׺����Ʒ���͡����С�����
    KBPT_ClassMAIT          m_CMAIT[MATF_PREFIXPOSFIX][MATF_CBDR][MATF_SERIES][MATF_LEVEL];

	KBPT_ClassifiedMAT		m_CMAT[2][MATF_CBDR];

// �����Ƕ���ӿ�
public:
	BOOL Init();

	const KMAGICATTRIB_TABFILE* GetMARecord(IN int) const;
	const int					GetMARecordNumber() const;
    
    // Add by Freeway Chen in 2003.5.30
    const KBPT_ClassMAIT*       GetCMIT(IN int nPrefixPostfix, IN int nType, IN int nSeries, int nLevel) const;

	const KBPT_ClassifiedMAT*	GetCMAT(IN int, int) const;
	// Add By Minh Kiem
	const KBASICPROP_EQUIPMENT_GOLD*	GetGoldEquipRecord(IN int nIndex) const;
	const int							GetGoldEquipNumber() const;

	const KBASICPROP_EQUIPMENT_PLATINA*	GetPlatinaEquipRecord(IN int nIndex) const;
	const int							GetPlatinaEquipNumber() const;

	const KBASICPROP_EQUIPMENT*	GetMeleeWeaponRecord(IN int) const;
	const int					GetMeleeWeaponRecordNumber() const;
	const KBASICPROP_EQUIPMENT*	GetRangeWeaponRecord(IN int) const;
	const int					GetRangeWeaponRecordNumber() const;
	const KBASICPROP_EQUIPMENT*	GetArmorRecord(IN int) const;
	const int					GetArmorRecordNumber() const;
	const KBASICPROP_EQUIPMENT*	GetHelmRecord(IN int) const;
	const int					GetHelmRecordNumber() const;
	const KBASICPROP_EQUIPMENT* GetBootRecord(IN int) const;
	const int					GetBootRecordNumber() const;
	const KBASICPROP_EQUIPMENT*	GetBeltRecord(IN int) const;
	const int					GetBeltRecordNumber() const;
	const KBASICPROP_EQUIPMENT*	GetAmuletRecord(IN int) const;
	const int					GetAmuletRecordNumber() const;
	const KBASICPROP_EQUIPMENT*	GetRingRecord(IN int) const;
	const int					GetRingRecordNumber() const;
	const KBASICPROP_EQUIPMENT*	GetCuffRecord(IN int) const;
	const int					GetCuffRecordNumber() const;
	const KBASICPROP_EQUIPMENT*	GetPendantRecord(IN int) const;
	const int					GetPendantRecordNumber() const;
	const KBASICPROP_EQUIPMENT* GetHorseRecord(IN int) const;
	const int					GetHorseRecordNumber() const;
	const KBASICPROP_EQUIPMENT* GetMaskRecord(IN int) const;
	const int					GetMaskRecordNumber() const;
	const KBASICPROP_EQUIPMENT*	GetMantleRecord(IN int) const;
	const int					GetMantleRecordNumber() const;
	const KBASICPROP_EQUIPMENT*	GetSignetRecord(IN int) const;
	const int					GetSignetRecordNumber() const;
	const KBASICPROP_EQUIPMENT*	GetShipinRecord(IN int) const;
	const int					GetShipinRecordNumber() const;
	const KBASICPROP_EQUIPMENT*	GetHoodsRecord(IN int) const;
	const int					GetHoodsRecordNumber() const;
	const KBASICPROP_EQUIPMENT*	GetCloakRecord(IN int) const;
	const int					GetCloakRecordNumber() const;
	const KBASICPROP_EQUIPMENT_PLATINA* FindEquipmentUnique(IN int, IN int, IN int) const;
	const KBASICPROP_MEDICINE*	GetMedicineRecord(IN int) const;
	const int					GetMedicineRecordNumber() const;
	const KBASICPROP_MEDICINE*	FindMedicine(IN int, IN int) const;
	const KBASICPROP_QUEST*		GetQuestRecord(IN int) const;
	const int					GetQuestRecordNumber() const;
	const KBASICPROP_TOWNPORTAL*	GetTownPortalRecord(IN int) const;
	const int					GetTownPortalRecordNumber() const;
	const KBASICPROP_MAGICSCRIPT*	GetMagicScript(IN int) const;
	const int					GetMagicScriptRecordNumber() const;
	const KBASICPROP_EVENTITEM*	GetEvent(IN int) const;
	const int					GetEventRecordNumber() const;
// �����Ǹ�������
protected:
	BOOL InitMALib();
    
    // Add by Freeway Chen in 2003.5.30
    BOOL InitMAIT();
};
#endif		// #ifndef KBasPropTblH
