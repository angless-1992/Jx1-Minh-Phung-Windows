// DBBackup.h: interface for the CDBBackup class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(DBBACKUP_H)
#define DBBACKUP_H

#include "DBTable.h"
#include "S3DBInterface.h"

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#define DEFAULTSTATNUM 10
#define LEVELSTATNUM 1000
#define MONEYSTATNUM 10
#define SECTLEVELSTATNUM 10
#define SECTMONEYSTATNUM 10
class CDBBackup  
{
public:
	struct TRoleList
	{
		char Name[20];
		//char Account[32];
		int Level;
		int	Translife;
		int Money;
		int Sect;			//����
		int FightExp;
		int KillNum;
		int Repute;
		int	FuYuan;
		int	AccumStat1;
		int	AccumStat2;
		int	HonorStat;
		int	TimeStat;
		BYTE TongLv;
		int	TongMn;
		DWORD	TongEff;
		BYTE Sort;
	};
	struct TStatData
	{
		TRoleList LevelStat[LEVELSTATNUM];			//������������б�
		TRoleList MoneyStat[MONEYSTATNUM];			//��Ǯ��������б�
		TRoleList KillerStat[DEFAULTSTATNUM];			//ɱ����������б�
		TRoleList ReputeStat[DEFAULTSTATNUM];			//ɱ����������б�
		TRoleList FuYuanStat[DEFAULTSTATNUM];			//ɱ����������б�
		TRoleList AccumStat1[DEFAULTSTATNUM];			//ɱ����������б�
		TRoleList AccumStat2[DEFAULTSTATNUM];			//ɱ����������б�
		TRoleList HonorStat[DEFAULTSTATNUM];			//ɱ����������б�
		TRoleList TimeStat[DEFAULTSTATNUM];
		TRoleList TongLvStat[DEFAULTSTATNUM];			//ɱ����������б�
		TRoleList TongMnStat[DEFAULTSTATNUM];			//ɱ����������б�
		TRoleList TongEffStat[DEFAULTSTATNUM];			//ɱ����������б�
		TRoleList MoneyStatBySect[MAX_FACTION+1][SECTMONEYSTATNUM];	//�����ɽ�Ǯ��������б�[����][�����]
		TRoleList LevelStatBySect[MAX_FACTION+1][SECTLEVELSTATNUM];	//�����ɼ�����������б�[����][�����]
		int SectPlayerNum[MAX_FACTION+1];				//�������ɵ������
		int SectMoneyMost[MAX_FACTION+1];				//�Ƹ�����ǰMONEYSTATNUM����и�������ռ������
		int SectLevelMost[MAX_FACTION+1];				//��������ǰLEVELSTATNUM����и�������ռ������
		
	};
private:
	enum StatType{stMoney, stLevel, stKiller, stRepute, stFuYuan, stAccumStat1, stAccumStat2, stHonorStat, stTimeStat, stTongLv, stTongMn, stTongEff};//��Ҫ�жϵ����stMoney, stLevel��

	static TRoleList* GetMin(			//���ҳ��б���Ǯ/���𣨻����������ٵ�һ��Ԫ��
		TRoleList* const aRoleList,	//�б�
		const int n,				//�б��С
		const StatType aType,
		const char* TongName = 0);		//��Ҫ�жϵ����stMoney, stLevel��

	static TRoleList* GetMax(			//���ҳ��б���Ǯ/���𣨻����������ٵ�һ��Ԫ��
		TRoleList* const aRoleList,	//�б�
		const int n,				//�б��С
		const StatType aType,
		const char* TongName = 0);		//��Ҫ�жϵ����stMoney, stLevel��

	static void ListSort(			//���б����ض�������
		TRoleList* const aRoleList,	
		const int n,
		const StatType aType,
		const bool bSortZA = false);
	static int GetIndexByName(char* aName, TRoleList* aList, int aListSize);
	static void RoleDataCopy(TRoleList* Desc, TRoleData* Source, bool bTong= false);//��RoleData���õĽṹ���Ƶ�RoleList�ṹ��
private:
	HANDLE m_hThread; 
	HANDLE m_hManualThread; 
	static void Backup();			//���ݺ�д��ͳ������
	static void MakeSendStatData();	//���ɷ��͸��ͻ��˵�ͳ�����ݽṹ
	static DWORD WINAPI TimerThreadFunc( LPVOID lpParam );	//���ݼ�ʱ�߳�
	static DWORD WINAPI ManualThreadFunc( LPVOID lpParam );	//�ֹ������߳�
public:
	CDBBackup(char* aPath, char* aName, ZDBTable* aRunTable);
	virtual ~CDBBackup(){};
	bool Open(int aTime, DWORD bTime);		//�������ݼ�ʱ
	bool Suspend();						//����
	bool Resume();						//����ִ���߳�
	bool Close();						//�ر�
	TGAME_STAT_DATA GetSendStatData();	//ȡ�÷��͸��ͻ��˵�ͳ�����ݽṹ
	bool IsWorking();					//�߳��Ƿ��ڹ���
	bool IsBackuping();				//�����Ƿ��ڹ���
	bool ManualBackup();				//�ֹ�����
	static void SaveStatInfo();			//����Ϸ����ȼ�����д��ָ����ҽ�ɫ��
};

#endif // !defined(DBBACKUP_H)
