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
#include "../Elem/WndImage.h"
#include "../Elem/WndButton.h"
#include "../Elem/WndText.h"
#include "../../../Core/Src/GameDatadef.h"

class KUiPlayerLock : protected KWndShowAnimate
{
public:
	static KUiPlayerLock* OpenWindow();				//�򿪴��ڣ�����Ψһ��һ�������ʵ��
	static void			 CloseWindow();//�رմ���
	static KUiPlayerLock*	GetIfVisible();		//�������������ʾ���򷵻�ʵ��ָ��
private:
	KUiPlayerLock();
	~KUiPlayerLock();
	void	Initialize();						//��ʼ��
	void	LoadScheme(const char* pScheme);	//������淽��
	int		WndProc(unsigned int uMsg, unsigned int uParam, int nParam);	//���ں���
	void	Breathe();									//�����
	void	GetList();

private:
	static KUiPlayerLock* m_pSelf;
	void	UpdateNotice();
private:
    void	OnClickButton(KWndWindow* pBtn);	
	KWndText256		m_List;
	KWndButton		m_Close;
	KWndButton	m_UnlockBtn;
	KWndText256		m_Notice;
	KWndText256		m_ListMS;
	KWndMessageListBox			m_MessageList;
//	KWndScrollBar				m_MessageScroll;
	char			m_szNotice[MAX_SENTENCE_LENGTH];
	char			m_szMessage[MAX_MESSAGE_LENGTH];
};
