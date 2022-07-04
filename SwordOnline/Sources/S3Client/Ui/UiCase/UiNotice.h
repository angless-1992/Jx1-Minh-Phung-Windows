/*****************************************************************************************
//	����--ѡ����Ϸ����������
//	Copyright : Kingsoft 2002
//	Author	:   Wooy(Wu yue)
//	CreateTime:	2002-8-12
------------------------------------------------------------------------------------------
*****************************************************************************************/
#pragma once
#include "../Elem/WndScrollBar.h"
#include "../Elem/WndMessageListBox.h"
#include "../Elem/WndShowAnimate.h"

class KUiNotice : protected KWndShowAnimate
{
public:
	static KUiNotice* OpenWindow();				//�򿪴��ڣ�����Ψһ��һ�������ʵ��
	static void			 CloseWindow(bool bDestroy);//�رմ���
private:
	KUiNotice();
	~KUiNotice();
	void	Initialize();						//��ʼ��
	void	LoadScheme(const char* pScheme);	//������淽��
	int		WndProc(unsigned int uMsg, unsigned int uParam, int nParam);	//���ں���
	void	OnLogin();
	void	OnCancel();
	int		OnKeyDown(unsigned int uKey);
	void	OnClickButton(KWndButton* pBtn);
	void	GetList();

private:
	static KUiNotice* m_pSelf;
	void	UpdateNotice();
private:
	KWndText256		m_List;
	KWndButton		m_Close;
	KWndText256		m_Notice;
	KWndMessageListBox			m_MessageList;
	KWndScrollBar				m_MessageScroll;
	char			m_szNotice[MAX_SENTENCE_LENGTH];
	char			m_szMessage[MAX_MESSAGE_LENGTH];
};
