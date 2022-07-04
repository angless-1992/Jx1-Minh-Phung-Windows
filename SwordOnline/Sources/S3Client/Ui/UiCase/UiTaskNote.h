/* 
 * File:     UiTaskNote.h
 * Desc:     ������´���
 * Author:   flying
 * Creation: 2003/7/18
 * �����ڶ��βμ�������ѵ
 */
//-----------------------------------------------------------------------------
#pragma once

#if !defined _UITASKNOTE
#define _UITASKNOTE

#include "../Elem/WndShowAnimate.h"
#include "../Elem/WndPureTextBtn.h"
#include "../Elem/WndMessageListBox.h"
#include "../Elem/WndList.h"
#include "../Elem/WndShadow.h"
#include "../Elem/WndText.h"
#include "../Elem/WndImage.h"
#include "../Elem/WndScrollBar.h"


#define MAX_TASK_PAGE 3
#define MAX_TASK_ON_PAGE 12
#define	MAX_TASK_HEAD MAX_TASK_PAGE*MAX_TASK_ON_PAGE

enum RECORD_ACTION
{
	REA_EXPLAIN = 0,
	REA_PERFORM,
	REA_FINISH,
};

struct KWndTaskButton
{
	KWndButton				btn;
	KWndImage				onimg;
	KWndImage				bdimg;
	unsigned				id;
};

class KUiTaskNote : public KWndShowAnimate
{
public:
	static KUiTaskNote*		OpenWindow();
	//�رմ��ڣ�ͬʱ����ѡ���Ƿ�ɾ������ʵ��
	static void				CloseWindow(bool bDestroy);
	static KUiTaskNote*		GetIfVisible();
	// ����Ϸѭ������
	static void				WakeUp(KMissionRecord* pRecord);
	//������淽��
	static void				LoadScheme(const char* pScheme);
private:
	KUiTaskNote();
	virtual ~KUiTaskNote();
	int		WndProc(unsigned int uMsg, unsigned int uParam, int nParam);
	void	Initialize();
	void	OnClose();
	void	InitData();		//��ʼ����ش浵����
	void	SaveData();		//��������
	void	UpdateData(int nSel);
	void	UpdateList(int nId);
	void	OnDelete(int nIndex);
private:
	// here goes data.
	static KUiTaskNote*		m_pSelf;
	
	KWndButton				m_BtnGut, m_BtnTask, m_BtnEvent;
	KWndTaskButton			m_TBtnTaskSel[MAX_TASK_ON_PAGE];
	KWndButton				m_BtnClose;
	KWndImage				m_icon;
	KScrollMessageListBox	m_RecordList;
	KWndButton				m_BtnDelete;
	unsigned int			m_uNotOKPicIndex, m_uOKPicIndex;
	KRColor					m_uExplainColor,m_uNotOKColor, m_uOKColor, m_uFnColor;
	int						m_nTabSel, m_nTaskSel[MAX_TASK_PAGE];
	unsigned int			m_uCurHeaderId;
	int						m_nDirLeft, m_nDirTop;
	char					m_szTaskImage[MAX_TASK_HEAD][2][FILE_NAME_LENGTH], m_szBorderImage[FILE_NAME_LENGTH], m_szOnImage[FILE_NAME_LENGTH];
};

class KUiMissionNote : public KWndShadow
{
public:
	static KUiMissionNote*		OpenWindow(KMissionRecord* pRecord);
	//�رմ��ڣ�ͬʱ����ѡ���Ƿ�ɾ������ʵ��
	static void				CloseWindow(bool bDestroy);
	static KUiMissionNote*		GetIfVisible();
	//������淽��
	static void				LoadScheme(const char* pScheme);
private:
	KUiMissionNote();
	virtual ~KUiMissionNote();
	int		WndProc(unsigned int uMsg, unsigned int uParam, int nParam);
	void	Initialize();
	int		PtInWindow(int x, int y);				//�ж�һ�����Ƿ��ڴ��ڷ�Χ��,������Ǿ�������
private:
	// here goes data.
	static KUiMissionNote*		m_pSelf;


	KWndText32				m_Name;
	KWndMessageListBox		m_DestText;
	KWndPureTextBtn			m_CloseBtn;
};
#endif