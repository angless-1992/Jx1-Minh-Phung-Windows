// -------------------------------------------------------------------------
//	�ļ���		��	UiTrade.h
//	������		��	Wooy(Wu yue)
//	����ʱ��	��	2002-12-21
//	��������	��	npc����ϵͳ����
// -------------------------------------------------------------------------
#pragma once

#include "../Elem/WndShowAnimate.h"
#include "../elem/wndbutton.h"
#include "../Elem/WndText.h"
#include "../elem/wndObjContainer.h"
#include "../../../core/src/gamedatadef.h"

struct KUiObjAtContRegion;

class KUiPlayerShop : protected KWndShowAnimate
{
public:
	//----�������ͳһ�Ľӿں���----
	static KUiPlayerShop*		OpenWindow(KUiPlayerItem* pDest);				//�򿪴��ڣ�����Ψһ��һ�������ʵ��
	static KUiPlayerShop*		GetIfVisible();				//�������������ʾ���򷵻�ʵ��ָ��
	static void			CloseWindow();				//�رմ��ڣ�ͬʱ����ѡ���Ƿ�ɾ������ʵ��
	static void			LoadScheme(const char* pScheme);	//������淽��
	static void			CancelTrade();
	void				UpdateData(KUiPlayerItem* pDest);	
	int		WndProc(unsigned int uMsg, unsigned int uParam, int nParam);//���ں���
	void			UpdateItem();

private:
	KUiPlayerShop();
	~KUiPlayerShop() {}
	void	Clear();
	void	OnClickButton(KWndButton* pWnd, int bCheck);
	void	OnBuyItem(KUiDraggedObject* pItem);
	void	Initialize();						//��ʼ��
private:
	static KUiPlayerShop*		m_pSelf;
private:
	KUiObjAtContRegion*		m_pObjsList;
	int					m_nObjCount;
	int					m_nPageCount;
	int					m_nCurrentPage;
	KWndObjectMatrix	m_ItemsBox;		//��Ʒ��
	KWndButton			m_CloseBtn;
	KUiPlayerItem		m_Dest;
	KWndText32			m_Name;
	int					m_nCount;
};