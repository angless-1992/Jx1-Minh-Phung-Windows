#ifndef _SERVER

class KSellItem
{
private:
	DWORD		m_dwSellID;				// �Է���ҵ� npc �� id
	int			m_nSellCount;
public:
	PlayerItem	m_sItem[MAX_EQUIPMENT_ITEM];	// �Է���Ҵ������ϵ�װ���ڿͻ��� Item �����е�λ����Ϣ
	int			m_nSellItem[MAX_EQUIPMENT_ITEM];
public:
	KSellItem();						// ����
	void		Init();					// ��ʼ��
	int			GetCount();
	void		Release();
	void		GetData(BYTE* pMsg);
	void		ViewTrade(DWORD dwID);
	void		CancelTrade();
	void		Update( BOOL bFirstView, DWORD dwID, int nCount = 0 );
	int			FindIdx(int uId);
	DWORD		GetSellId() {return m_dwSellID;};
};

extern	KSellItem	g_cSellItem;

#endif


