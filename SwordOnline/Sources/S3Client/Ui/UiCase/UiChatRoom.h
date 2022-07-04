/*****************************************************************************************
//	����--����������
//	Author	:   
//	CreateTime:	2015-7-29
------------------------------------------------------------------------------------------
*****************************************************************************************/
#pragma once
#include "../Elem/WndShowAnimate.h"
#include "../Elem/WndLabeledButton.h"
#include "../Elem/WndMessageListBox.h"
#include "../Elem/WndList.h"


struct OneRoomInfo
{
	char	szName[10];
	int		nPass;
};

class KUiChatRoom : public KWndShowAnimate
{
public:
	//----�������ͳһ�Ľӿں���----
	static KUiChatRoom*	OpenWindow();		//�򿪴��ڣ�����Ψһ��һ�������ʵ��
	static KUiChatRoom*	GetIfVisible();		//�������������ʾ���򷵻�ʵ��ָ��
	static void				CloseWindow(bool bDestroy);	//�رմ��ڣ�ͬʱ����ѡ���Ƿ�ɾ������ʵ��
	static void				LoadScheme(const char* pScheme);//������淽��	
	static void				ServerRequestRoomList(KOneRoom *pRoom);
	static void				ServerRequestMemberList(KOneMem *pMem);
	static void				ServerRequestBlackList(KOneMem *pMem);
	static void				UpdateInterface();
	static void				Join(const char* lpszName, int nFigure);
	static void				Leave();
private:

	KUiChatRoom();
	~KUiChatRoom();
	void	Initialize();							//��ʼ��
	int		WndProc(unsigned int uMsg, unsigned int uParam, int nParam);//���ں���
	void	Breathe();
private:
	static KUiChatRoom* m_pSelf;
	
	void	OnClickButton(KWndWindow* pBtn);	
	
	KWndButton	m_BtnClose;
	KWndButton	m_BtnExitRoom;
	KWndButton	m_BtnEnterRoom;
	KWndButton	m_BtnDelRoom;
	KWndButton	m_BtnOpenDice;
	KWndButton	m_BtnHightDice;
	KWndButton	m_BtnLowDice;
	KWndButton	m_BtnPassword;
	KWndText80	m_TxtCurRoomTitle;

	KScrollMessageListBox	m_RoomList;	//˵������
	KScrollMessageListBox	m_MemberList;	//˵������
	KScrollMessageListBox	m_BlackList;	//˵������
	
	OneRoomInfo	Room;
	int			m_nRoomNameLen;
	int			m_nCreaterLen;
	int			m_nTimeLen;
	int			m_nMemNumLen;
	int			m_nMemNameLen;
	int			m_nRoomFigure;
	int			m_nRoomDiceTime;
	int			m_nRoomDiceRet;
	BOOL		m_bIsInRoom;
	unsigned int	m_uLastUpdateTime;
	char		m_szRoomName[32];
	unsigned int		m_uKeyPicIndex, m_uDicePicIndex;
};
