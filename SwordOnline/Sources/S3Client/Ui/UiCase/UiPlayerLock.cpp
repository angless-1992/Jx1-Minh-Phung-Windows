/*****************************************************************************************
//	����--ѡ����Ϸ����������
//	Copyright : Kingsoft 2002
//	Author	:   Wooy(Wu yue)
//	CreateTime:	2002-8-12
*****************************************************************************************/
#include "KWin32.h"
#include "KIniFile.h"
#include "../Elem/WndMessage.h"
#include "../Elem/Wnds.h"
#include "../UiShell.h"
#include "UiPlayerLock.h"
#include "../UiSoundSetting.h"
#include "UiStatus.h"
#include "../UiBase.h"
#include "UiGetString.h"
#include "../../Login/Login.h"
#include "../../../Core/Src/CoreShell.h"
#include "../../../Core/Src/GameDatadef.h"

#define	SCHEME_INI				"UiPlayerLock.ini"

extern iCoreShell*		g_pCoreShell;

KUiPlayerLock* KUiPlayerLock::m_pSelf = NULL;

//--------------------------------------------------------------------------
//	���ܣ����캯��
//--------------------------------------------------------------------------
KUiPlayerLock::KUiPlayerLock()
{
	m_szNotice[0] = 0;
	m_szMessage[0] = 0;
}

KUiPlayerLock::~KUiPlayerLock()
{
}

KUiPlayerLock* KUiPlayerLock::GetIfVisible()
{
	if (m_pSelf && m_pSelf->IsVisible())
		return m_pSelf;
	return NULL;
}

//--------------------------------------------------------------------------
//	���ܣ��򿪴��ڣ�����Ψһ��һ�������ʵ��
//--------------------------------------------------------------------------
KUiPlayerLock* KUiPlayerLock::OpenWindow()
{
	if (m_pSelf == NULL)
	{
		m_pSelf = new KUiPlayerLock;
		if (m_pSelf)
			m_pSelf->Initialize();
	}
	if (m_pSelf)
	{
		UiSoundPlay(UI_SI_POPUP_OUTGAME_WND);
		m_pSelf->Show();
		m_pSelf->UpdateNotice();
	}
	return m_pSelf;
}

//--------------------------------------------------------------------------
//	���ܣ��رմ���
//--------------------------------------------------------------------------
void KUiPlayerLock::CloseWindow()
{
	if (m_pSelf)
	{
		Wnd_ShowCursor(true);
		m_pSelf->Destroy();
		m_pSelf = NULL;
	}	
}

//--------------------------------------------------------------------------
//	���ܣ���ʼ��
//--------------------------------------------------------------------------
void KUiPlayerLock::Initialize()
{
	AddChild(&m_List);
	AddChild(&m_Notice);
	AddChild(&m_ListMS);
	AddChild(&m_MessageList);
	AddChild(&m_Close);
	AddChild(&m_UnlockBtn);

	char Scheme[256];
	g_UiBase.GetCurSchemePath(Scheme, 256);
	LoadScheme(Scheme);
	Wnd_AddWindow(this, WL_TOPMOST);
}

//--------------------------------------------------------------------------
//	���ܣ����봰�ڵĽ��淽��
//--------------------------------------------------------------------------
void KUiPlayerLock::LoadScheme(const char* pScheme)
{
	char		Buff[255];
	KIniFile	Ini;
	sprintf(Buff, "%s\\%s", pScheme, SCHEME_INI);
	if (Ini.Load(Buff))
	{
		KWndShowAnimate::Init(&Ini, "Main");
		m_List     .Init(&Ini, "List");
		m_Notice.Init(&Ini, "Notice");
		m_MessageList.Init(&Ini, "MessageList");
		m_ListMS.Init(&Ini, "ListMS");
		m_Close   .Init(&Ini, "Close");
		m_UnlockBtn   .Init(&Ini, "UnlockBtn");
		Ini.GetString("Message", "Notice", "", m_szNotice, sizeof(m_szNotice));
		Ini.GetString("Message", "Message", "", m_szMessage, sizeof(m_szMessage));
	}
}

void KUiPlayerLock::Breathe()
{
	m_UnlockBtn.CheckButton(g_pCoreShell->GetLockState());
}

void KUiPlayerLock::UpdateNotice()
{
	m_List.SetText(m_szNotice);
	m_ListMS.SetText(m_szMessage);
//	m_MessageList.AddOneMessage(m_szMessage, strlen(m_szMessage));
}
//--------------------------------------------------------------------------
//	���ܣ����ں���
//--------------------------------------------------------------------------
int KUiPlayerLock::WndProc(unsigned int uMsg, unsigned int uParam, int nParam)
{
	int nResult = false;
	switch(uMsg)
	{
	case WND_N_BUTTON_CLICK:
		if (uParam == (unsigned int)(KWndWindow*)&m_Close)
			CloseWindow();
		else if (uParam == (unsigned int)(KWndWindow*)&m_UnlockBtn)
		{
			if (g_pCoreShell->GetLockState())
				KUiGetString::OpenWindow(GSA_PW, "Nh�p m�t kh�u", "", this, 0, 0, 1,16);
			else
				g_pCoreShell->OperationRequest(GOI_LOCKSTATE, 0, 0);
		}			
		break;
	default:
		nResult = KWndWindow::WndProc(uMsg, uParam, nParam);
		break;
	}
	return nResult;
}

