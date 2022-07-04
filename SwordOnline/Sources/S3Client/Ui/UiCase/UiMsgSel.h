#ifndef __UiMsgSel_H__
#define __UiMsgSel_H__

#include "../Elem/WndMessageListBox.h"
#include "../Elem/WndShowAnimate.h"
#include "../Elem/WndScrollBar.h"
#include "../Elem/WndText.h"

struct KUiQuestionAndAnswer;
struct KUiImage;

class KUiMsgSel : protected KWndShowAnimate
{
public:
	//----�������ͳһ�Ľӿں���----
	static KUiMsgSel*	OpenWindow(KUiQuestionAndAnswer* pQAA, KUiImage *pPic = NULL);		//�򿪴��ڣ�����Ψһ��һ�������ʵ��
	static KUiMsgSel*	GetIfVisible();
	static void			LoadScheme(const char* pScheme);	//������淽��
	static void			CloseWindow(bool bDestroy);		//�رմ���
	static void			OnClickMsg(int nMsg);			//��Ӧ�����Ϣ
private:
	KUiMsgSel();
	~KUiMsgSel();
	void	Show(KUiQuestionAndAnswer* pQAA);
	int		Initialize(KUiImage *pPic);								//��ʼ��
	int		WndProc(unsigned int uMsg, unsigned int uParam, int nParam);
	void	ChangeCurSel(bool bNext);
	virtual void	Breathe();


private:
	static KUiMsgSel*	m_pSelf;

	KScrollMessageListBox	m_MsgScrollList;	//��ѡ���ֺ͹�����
	KWndScrollBar			m_MessageScroll;	//��ѡ���ֺ͹�����
	KWndMessageListBox		m_MessageList;	//˵������
	KWndImage				m_Image;

	//Ϊ�Զ������ӵı���
	unsigned int	m_uLeftTime;
	bool m_bAutoUp;
	bool m_bAutoDown;
	unsigned int	m_uLastScrollTime;
	KUiImage		m_pPic;
	char m_szPic[MAX_ANSWERNUM][MAX_PATH];
};


#endif // __UiMsgSel_H__
