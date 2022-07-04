#ifndef KPLAYERCHATROOM_H
#define KPLAYERCHATROOM_H

#include	"KPlayerDef.h"

#define		MAX_CHATROOM			20
#define		MAX_CHATROOM_MEMBER		50		// ����Ա����(�������ӳ�)

#ifdef _SERVER
class KPlayerChatRoom	// ����������ҵ������Ϣ
{
	friend class KPlayer;
public:
	int		m_nID;				// ����Ѿ���ӣ������ id
	int		m_nFlag;
	int		m_nFigure;			// ����Ѿ���ӣ�player ����ݣ�TEAM_CAPTAIN TEAM_MEMBER

private:
	int		m_nPlayerIndex;
public:
	KPlayerChatRoom() {m_nPlayerIndex = 0;};
	void	Active();
	void	Init(int nPlayerIdx);
	void	Release();
	BOOL	CreateChatRoom(char* szRoomName, int nRoomPw, int nLefttime, BOOL bIsGmRoom);
	BOOL	AddTime(const char* lpszName, int nLefttime);
	BOOL	RequestList();
	BOOL	JoinRoom(int nRoomIndex, int nRoomPw);
	BOOL	LeaveRoom();
	BOOL	DeleteRoom();
	BOOL	ForceLeaveRoom();
	BOOL	Roomcommand(int n);
};
#endif

#ifndef _SERVER
class KPlayerChatRoom	// �ͻ�����ҵ������Ϣ
{
public:
	char	m_szRoomName[10];
	int		m_nID;
	int		m_nFlag;
	int		m_nFigure;

public:
	KPlayerChatRoom();
	void	Release();

	void	JoinRoom(const char* szRoomName, int nId, CHATROOM_FIGURE eFigure);								// ���½�����ʾ
};
#endif

// �˶����Ƿ�Ϊ��ͨ���ж϶ӳ� id ����������Ϊ -1 ʱΪ�գ�ÿ������ض���һ���ӳ���
#ifdef _SERVER
class KChatRoom
{
private:
	int		m_nIndex;									// �� Team �� g_ChatRoom �е�λ��
public:
	BOOL	m_bIsGmRoom;
	char	m_szRoomHost[16];
	int		m_nRoomHost;
	char	m_szRoomName[10];
	int		m_nRoomLeftTime;
	int		m_nRoomDiceTime;
	int		m_nRoomDiceMax;
	int		m_nRoomPw;
	int		m_nMember[MAX_CHATROOM_MEMBER];					// ���ж�Ա id ������������ player index ���ͻ����� npc id ��-1 Ϊ��
	int		m_nMemParam[MAX_CHATROOM_MEMBER];
	int		m_nMemNum;									// ���ж�Ա����(�������ӳ�)
	char	m_szBlackName[MAX_CHATROOM_MEMBER][16];

public:
	KChatRoom();											// ���캯��
	void	Release();									// ���
	void	RemoveLeftRoom();									// ���
	void	DeleteRoom();									// ���
	void	SetIndex(int nIndex);						// �趨 Team �� g_ChatRoom �е�λ��
	int		FindFree();									// Ѱ�Ҷ�Ա��λ
	int		FindFreeBlackList();									// Ѱ�Ҷ�Ա��λ
	BOOL	OpenGame(int ntype, int n);
	BOOL	AddParam(const char* lpszName, int ntype, int n);
	BOOL	CheckMemberName(const char *lpszName);				// Ѱ�Ҿ���ָ��npc id�Ķ�Ա���������ӳ���
	BOOL	CheckBlackList(const char *lpszName);
	BOOL	CreateChatRoom(int nIdx, const char* szRoomName, int nRoomPw, int nLefttime,BOOL bIsGmRoom);// ����һ֧����
	void	MsgAll(const char* szMsg);
	void	Dice(int nIsHight);
};

extern	KChatRoom	g_ChatRoom[MAX_CHATROOM];


class KChatRoomSet
{
public:
	void	Init();										// ��ʼ��
	int		CreateChatRoom(int nIdx, const char* szRoomName, int nRoomPw, int nLefttime,BOOL bIsGmRoom);	// ����һ֧����
	BOOL	AddTime(const char* lpszName, int nLefttime);
	BOOL	RequestRoomList(int nPlayerIndex);
	BOOL	RequestList(int nPlayerIndex, int nRoomID);
	int		JoinRoom(int nPlayerIndex, int nRoomIndex, int nRoomPw);
	BOOL	LeaveRoom(int nPlayerIndex, int nRoomID);
	BOOL	DeleteRoom(int nPlayerIndex, int nRoomID);
	BOOL	ForceLeaveRoom(int nPlayerIndex, int nRoomID);
	BOOL	AddBlackList(int nPlayerIndex, int nRoomID, int nListIndex);
	BOOL	RemoveBlackList(int nPlayerIndex, int nRoomID, int nListIndex);
	BOOL	ChangePw(int nPlayerIndex, int nRoomID, int nRoomPw);
	BOOL	OpenGame(int nPlayerIndex, int nRoomID, int n);
	BOOL	Hight(int nPlayerIndex, int nRoomID, int n);
	BOOL	Low(int nPlayerIndex, int nRoomID, int n);
private:
	int		FindFree();
	BOOL	CheckHost(const char *lpszHost);					// �ж϶����Ƿ����
	int		FindName(const char *lpszName);					// �ж϶����Ƿ����
};

extern	KChatRoomSet	g_ChatRoomSet;

#endif

#endif
