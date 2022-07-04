/*****************************************************************************************
//	����--���������
//	Copyright : Kingsoft 2003
//	Author	:   Wooy(Wu yue)
//	CreateTime:	2003-4-21
------------------------------------------------------------------------------------------
*****************************************************************************************/
#pragma once

#include "../elem/WndButton.h"
#include "../elem/WndText.h"
#include "../elem/WndObjContainer.h"
#include "../Elem/WndShowAnimate.h"

struct KUiObjAtRegion;

class KUiExpandItem : protected KWndShowAnimate
{
public:
	static KUiExpandItem* OpenWindow();		//�򿪴��ڣ�����Ψһ��һ�������ʵ��
	static KUiExpandItem* GetIfVisible();		//�������������ʾ���򷵻�ʵ��ָ��
	static void			CloseWindow();		//�رմ���
	static void			LoadScheme(const char* pScheme);//������淽��
	void			UpdateItem(KUiObjAtRegion* pItem, int bAdd);//��Ʒ�仯����
	static void		OnNpcTradeMode(bool bTrue);
private:
	KUiExpandItem() {}
	~KUiExpandItem() {}
	void	Initialize();							//��ʼ��
	int		WndProc(unsigned int uMsg, unsigned int uParam, int nParam);//���ں���
	void	UpdateData();
	void	OnClickItem(KUiDraggedObject* pItem, bool bDoImmed);
	void	OnRepairItem(KUiDraggedObject* pItem);
	void	OnItemPickDrop(ITEM_PICKDROP_PLACE* pPickPos, ITEM_PICKDROP_PLACE* pDropPos);
	void	OnBreakItem(KUiDraggedObject* pItem, bool bDoImmed);
	void	PaintWindow();
private:
	static KUiExpandItem*		m_pSelf;
private:
	
	KWndButton			m_CloseBtn;
	KWndObjectMatrix	m_ItemBox;

};