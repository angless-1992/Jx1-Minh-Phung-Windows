// -------------------------------------------------------------------------
//	�ļ���		��	����ȷ�Ͽ�
//	������		��	Wooy(Wu yue)
//	����ʱ��	��	2003-5-28
// -------------------------------------------------------------------------
#ifndef __UiSetPrice_H__
#define __UiSetPrice_H__

#include "../Elem/WndButton.h"
#include "../Elem/WndText.h"
#include "../Elem/WndEdit.h"
#include "../../../core/src/gamedatadef.h"


class KUiSetPrice : protected KWndImage
{
public:
	//----�������ͳһ�Ľӿں���----
	static KUiSetPrice*	OpenWindow(int nMoney, KUiObjAtContRegion* pObj, KUiItemBuySelInfo* pPriceInfo);	//�򿪴��ڣ�����Ψһ��һ�������ʵ��
	static KUiSetPrice*	GetIfVisible();				//�������������ʾ���򷵻�ʵ��ָ��
	static void			CloseWindow(bool bDestroy);		//�رմ���
private:
	KUiSetPrice();
	~KUiSetPrice() {}
	int		Initialize();								//��ʼ��
	void	Show();
	void	Hide();
	void	LoadScheme(const char* pScheme);			//������淽��
	int		WndProc(unsigned int uMsg, unsigned int uParam, int nParam);
	void	OnCancel();
	void	OnSetPrice();
	void	OnCheckInput();
private:
	static KUiSetPrice*	m_pSelf;
	KWndText32			m_ItemName;
	KWndEdit32			m_Number;
	KWndButton			m_OkBtn;
	KWndButton			m_CancelBtn;
	KUiObjAtContRegion	m_ItemInfo;
	KUiItemBuySelInfo	m_PriceInfo;
};


#endif // __UiSetPrice_H__