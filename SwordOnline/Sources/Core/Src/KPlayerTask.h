//---------------------------------------------------------------------------
// Sword3 Engine (c) 2002 by Kingsoft
//
// File:	KPlayerTask.h
// Date:	2002.10.05
// Code:	�߳�����
// Desc:	PlayerTask Class
//---------------------------------------------------------------------------
#include 	"GameDataDef.h"

#ifndef KPLAYERTASK_H
#define KPLAYERTASK_H


#ifdef _SERVER
#define TASKGLOBALVALUENUM 5000
extern int		g_TaskGlobalValue[TASKGLOBALVALUENUM];

extern KTabFile g_WayPointTabFile;
extern KTabFile g_StationTabFile;
extern KTabFile g_DockTabFile;

extern KTabFile g_StationPriceTabFile;
extern KTabFile g_WayPointPriceTabFile;
extern KTabFile g_DockPriceTabFile;

extern int	*g_pStationPriceTab;
extern int  *g_pWayPointPriceTab;
extern int  *g_pDockPriceTab;

#endif


class KPlayerTask
{	friend class KPlayer;
private:
	int			m_nPlayerIndex;
public:
	char		szSave[MAX_TASK][16];					// ���ڼ�¼�����Ƿ���ɣ��뱣�浽���ݿ�
	char		szClear[MAX_TEMP_TASK][16];
										// ���ڼ�¼��������е��м䲽����������������浽���ݿ⣬������ߺ���������
public:
	KPlayerTask();									// ���캯��
	void		Release();							// ���
	void		ClearTempVar();						// �����ʱ���̿��Ʊ���
				// �õ�����������
	int			GetClearVal(int nNo);				// �õ���ʱ���̿��Ʊ���ֵ
	const char*		GetClearStr(int nNo);				// �õ���ʱ���̿��Ʊ���ֵ
	void		SetClearVal(int nNo, char* szVal);		// �趨��ʱ���̿��Ʊ���ֵ
	void		SetSaveVal(int nTaskID, char* szTaskVal, BOOL bSync = FALSE);
	void		SetSaveVal(int nTaskID, int nTaskVal, BOOL bSync = FALSE);
	int			GetSaveVal(int nNo);
	const char*		GetSaveStr(int nNo);
	
	BOOL	SetValue(int nIndex, int nValue);			
	int		GetValue(int nIndex);							
	void		Init(int nPlayerIdx);
#ifdef _SERVER
	BOOL		SyncTaskValue(int nTaskID);
#endif
	
};




#endif
