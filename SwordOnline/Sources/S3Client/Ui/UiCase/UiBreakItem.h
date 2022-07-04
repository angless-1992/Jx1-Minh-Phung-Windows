// -------------------------------------------------------------------------
//	�ļ���		��	����ȷ�Ͽ�
//	������		��	Wooy(Wu yue)
//	����ʱ��	��	2003-5-28
// -------------------------------------------------------------------------
#ifndef __UiBreakItem_H__
#define __UiBreakItem_H__

#include "../Elem/WndButton.h"
#include "../Elem/WndText.h"
#include "../Elem/WndEdit.h"
#include "../../../core/src/gamedatadef.h"

class KUiBreakItem : protected KWndImage
{
public:
	//----�������ͳһ�Ľӿں���----
	static KUiBreakItem*	OpenWindow(KUiObjAtContRegion* pObj, KUiItemBuySelInfo* pPriceInfo, int nStackNum);	//�򿪴��ڣ�����Ψһ��һ�������ʵ��
	static KUiBreakItem*	GetIfVisible();				//�������������ʾ���򷵻�ʵ��ָ��
	static void			CloseWindow(bool bDestroy);		//�رմ���
private:
	KUiBreakItem();
	~KUiBreakItem() {}
	int		Initialize();								//��ʼ��
	void	Show();
	void	Hide();
	void	LoadScheme(const char* pScheme);			//������淽��
	int		WndProc(unsigned int uMsg, unsigned int uParam, int nParam);
	void	OnCancel();
	void	OnOk();
	void	OnCheckInput();
	void	OnIncrease();
	void	OnDecrease();
private:
	static KUiBreakItem*	m_pSelf;
	KWndText32			m_Title;
	KWndText32			m_ItemName;
	KWndEdit32			m_Number;
	KWndButton			m_Increase;
	KWndButton			m_Decrease;
	int					m_nMaxNum;
	KWndButton			m_OkBtn;
	KWndButton			m_CancelBtn;
	KWndButton			m_Button;
	KWndButton			m_CheckButton;
	KUiObjAtContRegion	m_ItemInfo;
	KUiItemBuySelInfo	m_PriceInfo;
};


#endif // __UiTradeConfirm_H__