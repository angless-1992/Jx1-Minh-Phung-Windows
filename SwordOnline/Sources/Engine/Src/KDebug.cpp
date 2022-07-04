//---------------------------------------------------------------------------
// Sword3 Engine (c) 1999-2000 by Kingsoft
//
// File:	KDebug.cpp
// Date:	2000.08.08
// Code:	WangWei(Daphnis)
// Desc:	Debug Helper Functions
//---------------------------------------------------------------------------
#include "KWin32.h"
#include "KFile.h"
#include "KMemBase.h"
#ifndef _STANDALONE
#include "KWin32Wnd.h"
#endif
#include "KDebug.h"
#include <string.h>
//---------------------------------------------------------------------------
#ifndef __linux
static HWND m_hWndDebug = NULL;
#endif
//---------------------------------------------------------------------------
// ����:	find debug window
// ����:	find debug window
// ����:	char*
//			char*
// ����:	void
//---------------------------------------------------------------------------
HWND g_FindDebugWindow(char* lpClassName, char* lpWindowName)
{
#ifndef __linux
	m_hWndDebug = FindWindow(lpClassName, lpWindowName);
	return m_hWndDebug;
#else 
	return 0;
#endif
}
//---------------------------------------------------------------------------
// ����:	g_DebugLog
// ����:	����Դ������������Ϣ
// ����:	Fmt		��ʽ���ַ���
//			...		������ַ���
// ����:	void
//---------------------------------------------------------------------------
void g_DebugLog(LPSTR Fmt, ...)
{
#ifndef __linux
	if (m_hWndDebug)
	{
		char buffer[256];
		va_list va;

		COPYDATASTRUCT data;
		va_start(va, Fmt);
		int n = vsprintf(buffer, Fmt, va);
		va_end(va);
		data.dwData = 1;
		data.cbData = n + 1;
		data.lpData = buffer;
		SendMessage(m_hWndDebug, WM_COPYDATA,
			(WPARAM)m_hWndDebug, (LPARAM)&data);
	}
#else
/*	char buffer[256];
	va_list va;
	va_start(va, Fmt);
	vsprintf(buffer, Fmt, va);
	strcat(buffer, "\n");
	printf(buffer);
	va_end(va);*/
#endif
}
//---------------------------------------------------------------------------
// ����:	g_MessageBox
// ����:	Display a System Message Box
// ����:	char* lpMsg, ...
// ����:	void
//---------------------------------------------------------------------------
void g_MessageBox(LPSTR lpMsg, ...)
{
#ifndef __linux
	char szMsg[256];
	va_list va;
	va_start(va, lpMsg);
	vsprintf(szMsg, lpMsg, va);
	va_end(va);
	g_DebugLog(szMsg);
//	MessageBox(g_GetMainHWnd(), szMsg, 0, MB_OK);
	MessageBox(NULL, szMsg, 0, MB_OK);
#endif
}
//---------------------------------------------------------------------------
// ����:	g_AssertFailed
// ����:	����ʧ��
// ����:	FileName	���ĸ��ļ���ʧ��
//			LineNum		���ļ��еĵڼ���
// ����:	void
//---------------------------------------------------------------------------
void g_AssertFailed(LPSTR pFileName, int nLineNum)
{
	char szMsg[256];
	sprintf(szMsg, "Assert failed in %s, line = %i", pFileName, nLineNum);
	g_DebugLog(szMsg);
	g_MessageBox(szMsg);
	exit(1);
}
//---------------------------------------------------------------------------
//////////////////////////////////////////////////////////////////////////
//Nhox Yeu Nhac
KSG_LogFile::KSG_LogFile(const char cszFileName[])
{
    if (!cszFileName)
        return;

    m_fpFile = fopen(cszFileName, "ab+");
    if (!m_fpFile)
    {
        return;
    }
}

KSG_LogFile::KSG_LogFile()
{
    m_fpFile = NULL;
}



KSG_LogFile::~KSG_LogFile()
{
    if (m_fpFile)
    {
        fclose(m_fpFile);
        m_fpFile = NULL;
    }
}

int KSG_LogFile::Init(const char cszFileName[])
{
    if (!cszFileName)
        return false;

    if (m_fpFile)
    {
        fclose(m_fpFile);
        m_fpFile = NULL;
    }

    m_fpFile = fopen(cszFileName, "ab+");
    if (!m_fpFile)
    {
        return false;
    }

    return true;
}

void KSG_LogFile::printf(const char* pcszFmt, ...)
{
    if (!(    
        (m_fpFile) &&
        (pcszFmt)
    ))
        return;

    char szBuffer[1024];
    szBuffer[0] = '\0';

	va_list va;
	va_start(va, pcszFmt);
	vsprintf(szBuffer, pcszFmt, va);
	strcat(szBuffer, "\n");
	va_end(va);

    int nRetCode = 0;
    nRetCode = fwrite(szBuffer, 1, strlen(szBuffer), m_fpFile);
    if (nRetCode > 0)
    {
        fflush(m_fpFile);
    }

}

void KSG_LogFile::Log(const char* pcszFmt, ...)
{
    if (!(    
        (m_fpFile) &&
        (pcszFmt)
    ))
        return;

    char szBuffer[1024];
    szBuffer[0] = '\0';

	va_list va;
	va_start(va, pcszFmt);
	vsprintf(szBuffer, pcszFmt, va);
	strcat(szBuffer, "\n");
	va_end(va);

    int nRetCode = 0;
    nRetCode = fwrite(szBuffer, 1, strlen(szBuffer), m_fpFile);
    if (nRetCode > 0)
    {
        fflush(m_fpFile);
    }

}

void KSG_LogFile::puts(const char* pcszString)
{
    if (!(    
        (m_fpFile) &&
        (pcszString)
    ))
        return;
    
    int nRetCode = 0;
    nRetCode = fwrite(pcszString, 1, strlen(pcszString), m_fpFile);
    if (nRetCode > 0)
    {
        fflush(m_fpFile);
    }
}
//////////////////////////////////////////////////////////////////////////