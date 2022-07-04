// DBBackup.cpp: implementation of the CDBBackup class.
//
//////////////////////////////////////////////////////////////////////
#include "stdafx.h"
#include "DBTABLE.H"
#include "DBBackup.h"
#include "DBDumpLoad.h"
#include <FSTREAM>
#include <direct.h>
#include "Macro.h"
#include "CRC32.h"
#include <time.h>

using namespace std;

#define IS_OUTPUT_LOG true

static char DBPath[32] = {0};						//���ݿ�Ŀ¼
static char DBName[32] = {0};						//���ݿ���
static ZDBTable* RunTable = NULL;

static bool IsBackupWorking = false;				//�Ƿ����ڱ���
static bool IsThreadWorking = false;				//�߳��Ƿ��ڹ���
static bool IsSuspended = false;					//�߳��Ƿ����
static WORD BackupTime = 0;				//���ݼ��ʱ��
static DWORD BackupBeginTime = 0;				//���ݼ��ʱ��
static bool IsTimeToBackup = true;

static CDBBackup::TStatData oldGameStatData;//�ɵ���Ϸͳ������
static CDBBackup::TStatData newGameStatData;//�µ���Ϸͳ������

static TGAME_STAT_DATA SendStatData;				//ȡ�÷��͸��ͻ��˵�ͳ�����ݽṹ

int CDBBackup::GetIndexByName(char* aName, TRoleList* aList, int aListSize)
{
	if(aList[0].Name[0] == '\0') return -1;
	for(int i=0;i<aListSize;++i)
	{
		if(aList[i].Name[0] == '\0') return -1;
		if (strcmp(aName, aList[i].Name) == 0)
			return i;
	}
	return -1;
}

CDBBackup::TRoleList* CDBBackup::GetMin(
					TRoleList* const aRoleList,
					const int n,
					const StatType aType,
					const char* TongName)
{//���ҳ��б���Ǯ/���𣨻����������ٵ�һ��Ԫ��
	TRoleList* tmpData;
	tmpData = &aRoleList[0];
	while(true)
	{
		for(int i=0;i<n;++i)
		{
			if(aRoleList[i].Name[0] == '\0')
				return &aRoleList[i];
			int aSourse, aDest;
			switch(aType)
			{
			case stMoney:
				aDest = tmpData->Money;
				aSourse = aRoleList[i].Money;
				break;
			case stLevel:
				aDest = tmpData->Level;
				aSourse = aRoleList[i].Level;
				break;
			case stKiller:
				aDest = tmpData->KillNum;
				aSourse = aRoleList[i].KillNum;
				break;
			case stRepute:
				aDest = tmpData->Repute;
				aSourse = aRoleList[i].Repute;
				break;
			case stAccumStat1:
				aDest = tmpData->AccumStat1;
				aSourse = aRoleList[i].AccumStat1;
				break;
			case stAccumStat2:
				aDest = tmpData->AccumStat2;
				aSourse = aRoleList[i].AccumStat2;
				break;
			case stHonorStat:
				aDest = tmpData->HonorStat;
				aSourse = aRoleList[i].HonorStat;
				break;
			case stTimeStat:
				aDest = tmpData->TimeStat;
				aSourse = aRoleList[i].TimeStat;
				break;
			case stTongLv:
				if (TongName[0] && (strcmp(TongName, aRoleList[i].Name) == 0))
					return &aRoleList[i];
				aDest = tmpData->TongLv;
				aSourse = aRoleList[i].TongLv;
				break;
			case stTongMn:
				if (TongName[0] && (strcmp(TongName, aRoleList[i].Name) == 0))
					return &aRoleList[i];
				aDest = tmpData->TongMn;
				aSourse = aRoleList[i].TongMn;
				break;
			case stTongEff:
				if (TongName[0] && (strcmp(TongName, aRoleList[i].Name) == 0))
					return &aRoleList[i];
				aDest = tmpData->TongEff;
				aSourse = aRoleList[i].TongEff;
				break;
			}
			if(aDest > aSourse)
			{
				tmpData = &aRoleList[i];
				break;
			}
		}
		if(i==n)break;
	}
	return tmpData;
}

CDBBackup::TRoleList* CDBBackup::GetMax(
					TRoleList* const aRoleList,
					const int n,
					const StatType aType,
					const char* TongName)
{//���ҳ��б���Ǯ/���𣨻����������ٵ�һ��Ԫ��
	TRoleList* tmpData;
	tmpData = &aRoleList[0];
	while(true)
	{
		for(int i=0;i<n;++i)
		{
			if(aRoleList[i].Name[0] == '\0')
				return &aRoleList[i];
			int aSourse, aDest;
			switch(aType)
			{
			case stMoney:
				aDest = tmpData->Money;
				aSourse = aRoleList[i].Money;
				break;
			case stLevel:
				aDest = tmpData->Level;
				aSourse = aRoleList[i].Level;
				break;
			case stKiller:
				aDest = tmpData->KillNum;
				aSourse = aRoleList[i].KillNum;
				break;
			case stRepute:
				aDest = tmpData->Repute;
				aSourse = aRoleList[i].Repute;
				break;
			case stAccumStat1:
				aDest = tmpData->AccumStat1;
				aSourse = aRoleList[i].AccumStat1;
				break;
			case stAccumStat2:
				aDest = tmpData->AccumStat2;
				aSourse = aRoleList[i].AccumStat2;
				break;
			case stHonorStat:
				aDest = tmpData->HonorStat;
				aSourse = aRoleList[i].HonorStat;
				break;
			case stTimeStat:
				aDest = tmpData->TimeStat;
				aSourse = aRoleList[i].TimeStat;
				break;
			case stTongLv:
				if (TongName[0] && (strcmp(TongName, aRoleList[i].Name) == 0))
					return &aRoleList[i];
				aDest = tmpData->TongLv;
				aSourse = aRoleList[i].TongLv;
				break;
			case stTongMn:
				if (TongName[0] && (strcmp(TongName, aRoleList[i].Name) == 0))
					return &aRoleList[i];
				aDest = tmpData->TongMn;
				aSourse = aRoleList[i].TongMn;
				break;
			case stTongEff:
				if (TongName[0] && (strcmp(TongName, aRoleList[i].Name) == 0))
					return &aRoleList[i];
				aDest = tmpData->TongEff;
				aSourse = aRoleList[i].TongEff;
				break;
			}
			if(aDest < aSourse)
			{
				tmpData = &aRoleList[i];
				break;
			}
		}
		if(i==n)break;
	}
	return tmpData;
}


void CDBBackup::ListSort(
					TRoleList* const aRoleList,
					const int n,
					const StatType aType,
					const bool bSortZA)
{//���б����ض�������
	int i,j;
	for(i=0;i<n;++i)
	{
		TRoleList* tmpData = &aRoleList[i];
		for(j=i+1;j<n;++j)
		{
			__int64 aSourse, aDest;
			switch(aType)
			{
			case stMoney:
				aDest = tmpData->Money;
				aSourse = aRoleList[j].Money;
				break;
			case stLevel:
				aDest = (__int64)(tmpData->Level + tmpData->Translife * MAX_LEVEL) * 0xffffffff + (__int64)tmpData->FightExp;
				aSourse = (__int64)(aRoleList[j].Level + aRoleList[j].Translife * MAX_LEVEL) * 0xffffffff + (__int64)aRoleList[j].FightExp;
				break;
			case stKiller:
				aDest = tmpData->KillNum;
				aSourse = aRoleList[j].KillNum;
				break;
			case stRepute:
				aDest = tmpData->Repute;
				aSourse = aRoleList[j].Repute;
				break;
			case stAccumStat1:
				aDest = tmpData->AccumStat1;
				aSourse = aRoleList[j].AccumStat1;
				break;
			case stAccumStat2:
				aDest = tmpData->AccumStat2;
				aSourse = aRoleList[j].AccumStat2;
				break;
			case stHonorStat:
				aDest = tmpData->HonorStat;
				aSourse = aRoleList[j].HonorStat;
				break;
			case stTimeStat:
				aDest = tmpData->TimeStat;
				aSourse = aRoleList[j].TimeStat;
				break;
			case stTongLv:
				aDest = tmpData->TongLv;
				aSourse = aRoleList[j].TongLv;
				break;
			case stTongMn:
				aDest = tmpData->TongMn;
				aSourse = aRoleList[j].TongMn;
				break;
			case stTongEff:
				aDest = tmpData->TongEff;
				aSourse = aRoleList[j].TongEff;
				break;
			}
			if(bSortZA)
			{
				if( aSourse < aDest )
						swap(*tmpData, aRoleList[j]);
			}
			else
			{
				if( aSourse > aDest )
						swap(*tmpData, aRoleList[j]);
			}
		}
	}
}

void CDBBackup::RoleDataCopy(TRoleList* Desc, TRoleData* Source, bool bTong/*= false*/)
{//��RoleData���õĽṹ���Ƶ�RoleList�ṹ��
	//strcpy(Desc->Account, Source->BaseInfo.caccname);
	if(bTong)
		strcpy(Desc->Name, Source->BaseInfo.itongname);
	else
		strcpy(Desc->Name, Source->BaseInfo.szName);
	Desc->Sect = Source->BaseInfo.nSect;
	Desc->Money = Source->BaseInfo.imoney + Source->BaseInfo.isavemoney;
	Desc->Level = Source->BaseInfo.ifightlevel;
	Desc->Translife = Source->BaseInfo.ifighttranslife;
	Desc->FightExp = Source->BaseInfo.ifightexp;
	Desc->KillNum = Source->BaseInfo.nKillPeopleNumber;
	Desc->Repute = Source->BaseInfo.istattask[TASKVALUE_STATTASK_REPUTE-TASKVALUE_STATTASK_BEGIN];
	Desc->FuYuan = Source->BaseInfo.istattask[TASKVALUE_STATTASK_FUYUAN-TASKVALUE_STATTASK_BEGIN];
	Desc->AccumStat1 = Source->BaseInfo.istattask[TASKVALUE_STATTASK_ACCUMSTAT1-TASKVALUE_STATTASK_BEGIN];
	Desc->AccumStat2 = Source->BaseInfo.istattask[TASKVALUE_STATTASK_ACCUMSTAT2-TASKVALUE_STATTASK_BEGIN];
	Desc->HonorStat = Source->BaseInfo.istattask[TASKVALUE_STATTASK_HONORSTAT-TASKVALUE_STATTASK_BEGIN];
	Desc->TimeStat = Source->BaseInfo.istattask[TASKVALUE_STATTASK_TIMESTAT-TASKVALUE_STATTASK_BEGIN];
	Desc->TongLv = Source->BaseInfo.itonglevel;
	Desc->TongMn = Source->BaseInfo.itongmemnum;
	Desc->TongEff = Source->BaseInfo.itongeff;
}

CDBBackup::CDBBackup(char* aPath, char* aName, ZDBTable* aRunTable)
{
	memset(DBPath,0,32);
	memset(DBName,0,32);
	strcpy(DBPath, aPath);
	strcpy(DBName, aName);
	BackupTime = 0;
	BackupBeginTime = 0;
	m_hThread = NULL;
	m_hManualThread = NULL;
	RunTable = aRunTable;
	
	memset(&oldGameStatData, 0, sizeof(TStatData));
	memset(&newGameStatData, 0, sizeof(TStatData));
	memset(&SendStatData, 0, sizeof(TGAME_STAT_DATA));
}

bool CDBBackup::Open(int aTime, DWORD bTime)
{
	aTime = aTime % 24;
	if((DBPath[0] == '\0')||(DBName[0] == '\0'))
		return false;//��ʼ����������˳�
	
	BackupTime = aTime;
	BackupBeginTime = bTime;
	DWORD dwThreadId, dwThrdParam = 1;
	m_hThread = CreateThread(
		NULL,                        // no security attributes 
        0,                           // use default stack size  
        TimerThreadFunc,             // thread function 
        &dwThrdParam,                // argument to thread function 
        0,                           // use default creation flags 
        &dwThreadId);                // returns the thread identifier 
	if(!m_hThread)
	{
		BackupTime = 0;
		BackupBeginTime = 0;
		return false;//�����߳�ʧ��
	}
	
	char aAppPath[MAX_PATH] = {0};
	getcwd(aAppPath,MAX_PATH);
	strcat(aAppPath,"\\StatData.dat");
	//��ȡ������
	memset(&newGameStatData,0,sizeof(CDBBackup::TStatData));
	FILE* aStatFile = fopen(aAppPath,"rb");
	if(aStatFile)
	{		
		int a = fread(&newGameStatData, 1, sizeof(CDBBackup::TStatData), aStatFile);
		fclose(aStatFile);
	}
	MakeSendStatData();
	
	return true;
}

bool CDBBackup::Close()
{
	BackupTime = 0;
	BackupBeginTime = 0;
	if(m_hManualThread) CloseHandle( m_hManualThread );
	return (CloseHandle( m_hThread ) == TRUE);

}

bool CDBBackup::Suspend()
{
	if(!m_hThread) return false;	//����߳�û�г�ʼ���þͲ��ܹ���
	if(!IsThreadWorking) return false;	//����߳�û�п�ʼ�Ͳ��ܹ���
	if(IsBackupWorking) return false;	//������ڱ��ݾ���ֹ����
	if(IsSuspended) return false;	//������ڱ��ݾ���ֹ����
	if(SuspendThread(m_hThread) == -1)return false;
	IsSuspended = true;
	return true;
}

bool CDBBackup::Resume()
{//����ִ���߳�
	if(!m_hThread) return false;	//����߳�û�г�ʼ���þͲ��ܹ���
	if(!IsSuspended) return false;	//������ڱ��ݾ���ֹ����
	if(!IsThreadWorking) return false;	//����߳�û�п�ʼ�Ͳ��ܼ���ִ���߳�

	if(ResumeThread(m_hThread) == -1)return false;
	IsSuspended = false;
	return true;
}

TGAME_STAT_DATA CDBBackup::GetSendStatData()
{//ȡ�÷��͸��ͻ��˵�ͳ�����ݽṹ
	return SendStatData;
}

bool CDBBackup::IsWorking()
{//�߳��Ƿ��ڹ���
	return IsThreadWorking;
}

bool CDBBackup::IsBackuping()
{//�����Ƿ��ڹ���
	return IsBackupWorking;
}

bool CDBBackup::ManualBackup()
{//�ֹ�����
	if(!m_hThread) return false;	//����߳�û�г�ʼ���þͲ��ܹ���
	if(!IsThreadWorking) return false;	//����߳�û�п�ʼ�Ͳ��ܼ���ִ���߳�

	DWORD dwThreadId, dwThrdParam = 1;
	m_hManualThread = CreateThread(
		NULL,                        // no security attributes 
        0,                           // use default stack size  
        ManualThreadFunc,             // thread function 
        &dwThrdParam,                // argument to thread function 
        0,                           // use default creation flags 
        &dwThreadId);                // returns the thread identifier 
	if(!m_hManualThread)
	{
		BackupTime = 0;
		BackupBeginTime = 0;
		return false;//�����߳�ʧ��
	}

	return true;
}

DWORD WINAPI CDBBackup::TimerThreadFunc( LPVOID lpParam )
{//���ݼ�ʱ�߳�
	IsThreadWorking = true;
	while(true)
	{
		time_t rawtime;
		struct tm * timeinfo;
		
		time ( &rawtime );
		timeinfo = localtime ( &rawtime );

		if(timeinfo->tm_hour == BackupTime)
		{	
			if(IsTimeToBackup)
			{
				Backup();
				SaveStatInfo();
			}
			IsTimeToBackup = false;
		}
		else
		{
			IsTimeToBackup = true;
		}
		
		Sleep(1000 * 60 * 30);
		//Sleep(BackupTime);
	}
	IsThreadWorking = false;
	return 0;
}

DWORD WINAPI CDBBackup::ManualThreadFunc( LPVOID lpParam )
{//�ֹ������߳�
	Backup();
	SaveStatInfo();
	return 0;
}

void CDBBackup::Backup()
{
	IsBackupWorking = true;
	
	//�򿪱���״̬log�ļ�
	time_t rawtime;
	struct tm * timeinfo;
	
	time ( &rawtime );
	timeinfo = localtime ( &rawtime );

	char aLogPath[MAX_PATH] = {0};
	getcwd(aLogPath,MAX_PATH);

	char aFileName[64];
	sprintf(aFileName,"\\goddess_log\\Backup_%02d-%02d-%02d_%04d-%02d-%02d.log",
		timeinfo->tm_hour,timeinfo->tm_min,timeinfo->tm_sec,
		timeinfo->tm_year + 1900,timeinfo->tm_mon + 1,timeinfo->tm_mday);
	strcat(aLogPath,aFileName);

	fstream aLogFile(aLogPath,ios::out);
	
	SYSTEMTIME aSysTime;
	GetSystemTime(&aSysTime);	
	string aBackupDir;
	char aIntStr[10];
	itoa(aSysTime.wYear,aIntStr,10);
	aBackupDir = aIntStr;
	itoa(aSysTime.wMonth,aIntStr,10);
	aBackupDir += aIntStr;
	itoa(aSysTime.wDay,aIntStr,10);
	aBackupDir += aIntStr;
	aBackupDir += "_";
	itoa(aSysTime.wHour,aIntStr,10);
	aBackupDir += aIntStr;
	itoa(aSysTime.wMinute,aIntStr,10);
	aBackupDir += aIntStr;
	itoa(aSysTime.wSecond,aIntStr,10);
	aBackupDir += aIntStr;
	itoa(aSysTime.wMilliseconds,aIntStr,10);
	aBackupDir += aIntStr;
	aLogFile<<"Backup Log File Open Time:"<<timeinfo->tm_year + 1900<<"."<<
				timeinfo->tm_mon + 1<<"."<<timeinfo->tm_mday<<" "<<
				timeinfo->tm_hour<<":"<<timeinfo->tm_min<<":"<<timeinfo->tm_sec<<endl;
	int i,j;
	char aSavePath[MAX_PATH] = {0};
	getcwd(aSavePath, MAX_PATH);
	strcat(aSavePath,"\\");
	strcat(aSavePath,DBPath);
	strcat(aSavePath,"\\");
	#ifdef WIN32
		mkdir(aSavePath);
	#else
        mkdir(aSavePath, 0);
	#endif
	strcat(aSavePath,aBackupDir.c_str());
	strcat(aSavePath,"\\");
	#ifdef WIN32
		mkdir(aSavePath);
	#else
        mkdir(aSavePath, 0);
	#endif
	strcat(aSavePath,aBackupDir.c_str());
	
	//���ݿ��¼ͳ�ƣ�ά���鿴�ã�==========Add by Fellow,2003.08.26
	char aDBSFullPath[MAX_PATH] = {0};
	strcpy(aDBSFullPath, aSavePath);
	strcat(aDBSFullPath,".txt");
	fstream aDBSOutput(aDBSFullPath,ios::out);
	aDBSOutput<<"Tai khoan\tTen nhan vat\tMon phai\tTrung sinh\tDang cap\tNgan luong"<<endl;
	int aDBSPlayerCount=0;
	int aDBSSectPlayerCount[MAX_FACTION+2] = {0};
	double aDBSMoneyCount=0;
	double aDBSSectMoneyCount[MAX_FACTION+2] = {0};
	int aDBSLevelPlayerCount[MAX_LEVEL+1] = {0};
	//==================

	strcat(aSavePath,".bak");
	CDBDump DBDump;
	DBDump.Open(aSavePath);
	
	if(!RunTable)
	{
		aLogFile<<"RunTable NULL Error."<<endl;
		return;
	}
	
	TStatData aStatData;//ʵʱ���ݺ��������Ϸͳ������
	memset(&aStatData, 0, sizeof(TStatData));

	ZCursor *cursor = RunTable->first();
	aLogFile<<"RunTable cursor Opened. Backup begin."<<endl;
	while(cursor)
	{		
		if(!DBDump.AddData(cursor->key,cursor->key_size,cursor->data,cursor->size))
		{
			aLogFile<<"Role["<<cursor->key<<"] Dump Error."<<endl;
		}

		TRoleList* tmpData;
		TRoleData* pRoleData = (TRoleData*)cursor->data;

		//���ݿ��¼ͳ�ƣ�ά���鿴�ã�==========Add by Fellow,2003.08.26
		char aDBSSect[32] = {0};
		int aDBSSectIndex = (int)pRoleData->BaseInfo.nSect;
		switch(aDBSSectIndex)
		{
			case 0:strcpy(aDBSSect,"Thieu Lam phai");break;
			case 1:strcpy(aDBSSect,"Thien Vuong Bang");break;
			case 2:strcpy(aDBSSect,"Duong Mon");break;
			case 3:strcpy(aDBSSect,"Ngu Doc Giao");break;
			case 4:strcpy(aDBSSect,"Nga My phai");break;
			case 5:strcpy(aDBSSect,"Thuy Yen Mon");break;
			case 6:strcpy(aDBSSect,"Cai Bang");break;
			case 7:strcpy(aDBSSect,"Thien Nhan Giao");break;
			case 8:strcpy(aDBSSect,"Vo Dang phai");break;
			case 9:strcpy(aDBSSect,"Con Lon phai");break;
			case 10:strcpy(aDBSSect,"Hoa Son phai");break;
			default:
				if(pRoleData->BaseInfo.ijoincount == 0)
					{strcpy(aDBSSect,"So nhap");break;}
				else
					{strcpy(aDBSSect,"Xuat su");break;}
		}
		if(aDBSSectIndex == 255)
		{
			if(pRoleData->BaseInfo.ijoincount == 0)
			{
				++aDBSSectPlayerCount[11];
				aDBSSectMoneyCount[11] += pRoleData->BaseInfo.isavemoney + pRoleData->BaseInfo.imoney;
			}
			else
			{
				++aDBSSectPlayerCount[12];
				aDBSSectMoneyCount[12] += pRoleData->BaseInfo.isavemoney + pRoleData->BaseInfo.imoney;
			}
		}
		else
		{
			++aDBSSectPlayerCount[aDBSSectIndex];
			aDBSSectMoneyCount[aDBSSectIndex] += pRoleData->BaseInfo.isavemoney + pRoleData->BaseInfo.imoney;
		}
		aDBSMoneyCount += pRoleData->BaseInfo.isavemoney + pRoleData->BaseInfo.imoney;
		++aDBSPlayerCount;
		if((pRoleData->BaseInfo.ifightlevel % MAX_LEVEL > 0) && (pRoleData->BaseInfo.ifightlevel % MAX_LEVEL <= MAX_LEVEL))
			aDBSLevelPlayerCount[pRoleData->BaseInfo.ifightlevel % MAX_LEVEL]++;
		else
		{
			aDBSOutput<<"***Phat sinh van de cap bac*** ";
			aDBSLevelPlayerCount[0]++;
		}
		aDBSOutput<<pRoleData->BaseInfo.caccname<<"\t"<<
					pRoleData->BaseInfo.szName<<"\t"<<
					aDBSSect<<"\t"<<
					pRoleData->BaseInfo.ifightlevel / MAX_LEVEL<<"\t"<<
					pRoleData->BaseInfo.ifightlevel % MAX_LEVEL<<"\t"<<
					pRoleData->BaseInfo.isavemoney + pRoleData->BaseInfo.imoney<<endl;
		
		//=======================================
		
		if(pRoleData->BaseInfo.iteam == camp_event)
		{//����ĳЩ��ɫ
			if(!RunTable->next(cursor))break;
			continue;
		}

		if(pRoleData->BaseInfo.iroletm < BackupBeginTime)
		{
			if(!RunTable->next(cursor))break;
			continue;
		}
		//////////////////////////////���ͳ��////////////////////////////////////
		//�Խ�Ǯ����
		tmpData = GetMin(aStatData.MoneyStat, MONEYSTATNUM, stMoney);
		if( tmpData->Money < pRoleData->BaseInfo.imoney + pRoleData->BaseInfo.isavemoney)
		{//�����ǰ���ݽϴ�Ͱѵ�ǰ���ݴ����б�����С��
			RoleDataCopy(tmpData, pRoleData);
		}

		//�Լ�������
		tmpData = GetMin(aStatData.LevelStat, LEVELSTATNUM, stLevel);
		if( tmpData->Level < pRoleData->BaseInfo.ifightlevel)
		{//�����ǰ���ݽϴ�Ͱѵ�ǰ���ݴ����б�����С��
			RoleDataCopy(tmpData, pRoleData);
		}
		
		//��ɱ��������
		tmpData = GetMin(aStatData.KillerStat, DEFAULTSTATNUM, stKiller);
		if( tmpData->KillNum < pRoleData->BaseInfo.nKillPeopleNumber)
		{//�����ǰ���ݽϴ�Ͱѵ�ǰ���ݴ����б�����С��
			RoleDataCopy(tmpData, pRoleData);
		}
		tmpData = GetMin(aStatData.ReputeStat, DEFAULTSTATNUM, stRepute);
		if( tmpData->Repute < pRoleData->BaseInfo.istattask[TASKVALUE_STATTASK_REPUTE-TASKVALUE_STATTASK_BEGIN])
		{//�����ǰ���ݽϴ�Ͱѵ�ǰ���ݴ����б�����С��
			RoleDataCopy(tmpData, pRoleData);
		}		
		tmpData = GetMin(aStatData.FuYuanStat, DEFAULTSTATNUM, stFuYuan);
		if( tmpData->Repute < pRoleData->BaseInfo.istattask[TASKVALUE_STATTASK_FUYUAN-TASKVALUE_STATTASK_BEGIN])
		{//�����ǰ���ݽϴ�Ͱѵ�ǰ���ݴ����б�����С��
			RoleDataCopy(tmpData, pRoleData);
		}		
		tmpData = GetMin(aStatData.AccumStat1, DEFAULTSTATNUM, stAccumStat1);
		if( tmpData->AccumStat1 < pRoleData->BaseInfo.istattask[TASKVALUE_STATTASK_ACCUMSTAT1-TASKVALUE_STATTASK_BEGIN])
		{//�����ǰ���ݽϴ�Ͱѵ�ǰ���ݴ����б�����С��
			RoleDataCopy(tmpData, pRoleData);
		}	
		tmpData = GetMin(aStatData.AccumStat2, DEFAULTSTATNUM, stAccumStat2);
		if( tmpData->AccumStat2 < pRoleData->BaseInfo.istattask[TASKVALUE_STATTASK_ACCUMSTAT2-TASKVALUE_STATTASK_BEGIN])
		{//�����ǰ���ݽϴ�Ͱѵ�ǰ���ݴ����б�����С��
			RoleDataCopy(tmpData, pRoleData);
		}	
		tmpData = GetMin(aStatData.HonorStat, DEFAULTSTATNUM, stHonorStat);
		if( tmpData->HonorStat < pRoleData->BaseInfo.istattask[TASKVALUE_STATTASK_HONORSTAT-TASKVALUE_STATTASK_BEGIN])
		{//�����ǰ���ݽϴ�Ͱѵ�ǰ���ݴ����б�����С��
			RoleDataCopy(tmpData, pRoleData);
		}
		tmpData = GetMax(aStatData.TimeStat, DEFAULTSTATNUM, stTimeStat);
		if( tmpData->TimeStat < pRoleData->BaseInfo.istattask[TASKVALUE_STATTASK_TIMESTAT-TASKVALUE_STATTASK_BEGIN])
		{//�����ǰ���ݽϴ�Ͱѵ�ǰ���ݴ����б�����С��
			RoleDataCopy(tmpData, pRoleData);
		}
		tmpData = GetMin(aStatData.TongLvStat, DEFAULTSTATNUM, stTongLv, pRoleData->BaseInfo.itongname);
		if( tmpData->TongLv < pRoleData->BaseInfo.itonglevel)
		{//�����ǰ���ݽϴ�Ͱѵ�ǰ���ݴ����б�����С��
			RoleDataCopy(tmpData, pRoleData, true);
		}	
		tmpData = GetMin(aStatData.TongMnStat, DEFAULTSTATNUM, stTongMn, pRoleData->BaseInfo.itongname);
		if( tmpData->TongMn < pRoleData->BaseInfo.itongmemnum)
		{//�����ǰ���ݽϴ�Ͱѵ�ǰ���ݴ����б�����С��
			RoleDataCopy(tmpData, pRoleData, true);
		}	
		tmpData = GetMin(aStatData.TongEffStat, DEFAULTSTATNUM, stTongEff, pRoleData->BaseInfo.itongname);
		if( tmpData->TongEff < pRoleData->BaseInfo.itongeff)
		{//�����ǰ���ݽϴ�Ͱѵ�ǰ���ݴ����б�����С��
			RoleDataCopy(tmpData, pRoleData, true);
		}	
		//�����ɶԽ�Ǯ����
		if( (pRoleData->BaseInfo.nSect <(MAX_FACTION+1)) && (pRoleData->BaseInfo.nSect >= 0) )
		{
			tmpData = GetMin(aStatData.MoneyStatBySect[pRoleData->BaseInfo.nSect + 1], SECTMONEYSTATNUM, stMoney);
		}
		else
		{
			tmpData = GetMin(aStatData.MoneyStatBySect[0], SECTMONEYSTATNUM, stMoney);
		}
		if( tmpData->Money < pRoleData->BaseInfo.imoney  + pRoleData->BaseInfo.isavemoney)
		{//�����ǰ���ݽϴ�Ͱѵ�ǰ���ݴ����б�����С��
			RoleDataCopy(tmpData, pRoleData);
		}

		//�����ɶԼ�������
		if( (pRoleData->BaseInfo.nSect <(MAX_FACTION+1)) && (pRoleData->BaseInfo.nSect >= 0) )
		{
			tmpData = GetMin(aStatData.LevelStatBySect[pRoleData->BaseInfo.nSect + 1], SECTLEVELSTATNUM, stMoney);
		}
		else
		{
			tmpData = GetMin(aStatData.LevelStatBySect[0], SECTLEVELSTATNUM, stMoney);
		}
		if( tmpData->Level < pRoleData->BaseInfo.ifightlevel)
		{//�����ǰ���ݽϴ�Ͱѵ�ǰ���ݴ����б�����С��
			RoleDataCopy(tmpData, pRoleData);
		}
		
		//////////////////////////////����ͳ��////////////////////////////////////
		//�������ɵ������ͳ��
		if( (pRoleData->BaseInfo.nSect <(MAX_FACTION+1)) && (pRoleData->BaseInfo.nSect >= 0) )
		{
			++aStatData.SectPlayerNum[pRoleData->BaseInfo.nSect + 1];
		}
		else
		{
			++aStatData.SectPlayerNum[0];
		}
		if( (pRoleData->BaseInfo.nSect <(MAX_FACTION+1)) && (pRoleData->BaseInfo.nSect >= 0) )
		{
			++aStatData.SectMoneyMost[pRoleData->BaseInfo.nSect + 1];
		}
		else
		{
			++aStatData.SectMoneyMost[0];
		}
		if( (pRoleData->BaseInfo.nSect <(MAX_FACTION+1)) && (pRoleData->BaseInfo.nSect >= 0) )
		{
			++aStatData.SectLevelMost[pRoleData->BaseInfo.nSect + 1];
		}
		else
		{
			++aStatData.SectLevelMost[0];
		}
		if(!RunTable->next(cursor))break;
	}	
	DBDump.Close();		//�رձ������ݿ�
	aLogFile<<"DB Dump Finished."<<endl;
	aLogFile<<"RunTable cursor closed."<<endl;

	//���ݿ��¼ͳ�ƣ�ά���鿴�ã�==========Add by Fellow,2003.08.26
	aDBSOutput<<"==Hoan tat ghi chep=="<<endl<<endl;
	aDBSOutput<<"==Thong ke=="<<endl;
	aDBSOutput<<"Tong so nguoi choi toan server: "<<aDBSPlayerCount<<endl;
	for(i=0;i<(MAX_FACTION+2);++i)
	{
		char aDBSSect[32] = {0};
		switch(i)
		{
			case 0:strcpy(aDBSSect,"Thieu Lam phai");break;
			case 1:strcpy(aDBSSect,"Thien Vuong Bang");break;
			case 2:strcpy(aDBSSect,"Duong Mon");break;
			case 3:strcpy(aDBSSect,"Ngu Doc Giao");break;
			case 4:strcpy(aDBSSect,"Nga My phai");break;
			case 5:strcpy(aDBSSect,"Thuy Yen Mon");break;
			case 6:strcpy(aDBSSect,"Cai Bang");break;
			case 7:strcpy(aDBSSect,"Thien Nhan Giao");break;
			case 8:strcpy(aDBSSect,"Vo Dang phai");break;
			case 9:strcpy(aDBSSect,"Con Lon phai");break;
			case 10:strcpy(aDBSSect,"Hoa Son phai");break;
			case 11:strcpy(aDBSSect,"So nhap");;break;
			case 12:strcpy(aDBSSect,"Xuat su");;break;
		}		
		aDBSOutput<<aDBSSect<<": "<<aDBSSectPlayerCount[i]<<endl;
	}
	aDBSOutput<<"------------------------------------------------"<<endl;
	aDBSOutput<<"Tong ngan luong toan server: "<<aDBSMoneyCount<<endl;
	for(i=0;i<(MAX_FACTION+2);++i)
	{
		char aDBSSect[32] = {0};
		switch(i)
		{
			case 0:strcpy(aDBSSect,"Thieu Lam phai");break;
			case 1:strcpy(aDBSSect,"Thien Vuong Bang");break;
			case 2:strcpy(aDBSSect,"Duong Mon");break;
			case 3:strcpy(aDBSSect,"Ngu Doc Giao");break;
			case 4:strcpy(aDBSSect,"Nga My phai");break;
			case 5:strcpy(aDBSSect,"Thuy Yen Mon");break;
			case 6:strcpy(aDBSSect,"Cai Bang");break;
			case 7:strcpy(aDBSSect,"Thien Nhan Giao");break;
			case 8:strcpy(aDBSSect,"Vo Dang phai");break;
			case 9:strcpy(aDBSSect,"Con Lon phai");break;
			case 10:strcpy(aDBSSect,"Hoa Son phai");break;
			case 11:strcpy(aDBSSect,"So nhap");;break;
			case 12:strcpy(aDBSSect,"Xuat su");;break;
		}		
		aDBSOutput<<aDBSSect<<": "<<aDBSSectMoneyCount[i]<<endl;
	}
	aDBSOutput<<"------------------------------------------------"<<endl;
	aDBSOutput<<"Thong ke so luong nguoi choi moi cap[1-200 cap]:"<<endl;
	for(i=1;i<(MAX_LEVEL+1);++i)
		if(aDBSLevelPlayerCount[i] != 0)
			aDBSOutput<<i<<"cap: "<<aDBSLevelPlayerCount[i]<<endl;
	aDBSOutput<<"Nhan si loi dang cap: "<<aDBSLevelPlayerCount[0]<<endl;

	//////////////////////////////����////////////////////////////////////
	ListSort(aStatData.MoneyStat, MONEYSTATNUM, stMoney);
	ListSort(aStatData.LevelStat, LEVELSTATNUM, stLevel);
	ListSort(aStatData.KillerStat, DEFAULTSTATNUM, stKiller);
	ListSort(aStatData.ReputeStat, DEFAULTSTATNUM, stRepute);
	ListSort(aStatData.FuYuanStat, DEFAULTSTATNUM, stFuYuan);
	ListSort(aStatData.AccumStat1, DEFAULTSTATNUM, stAccumStat1);
	ListSort(aStatData.AccumStat2, DEFAULTSTATNUM, stAccumStat2);
	ListSort(aStatData.HonorStat, DEFAULTSTATNUM, stHonorStat);
	ListSort(aStatData.TimeStat, DEFAULTSTATNUM, stTimeStat, true);
	ListSort(aStatData.TongLvStat, DEFAULTSTATNUM, stTongLv);
	ListSort(aStatData.TongMnStat, DEFAULTSTATNUM, stTongMn);
	ListSort(aStatData.TongEffStat, DEFAULTSTATNUM, stTongEff);
	for(i=0;i<(MAX_FACTION+1);++i)
	{//�����ɽ�Ǯ����
		ListSort(aStatData.MoneyStatBySect[i], SECTMONEYSTATNUM, stMoney);
	}
	for(i=0;i<(MAX_FACTION+1);++i)
	{//�����ɼ�������
		ListSort(aStatData.LevelStatBySect[i], SECTLEVELSTATNUM, stLevel);
	}
	
	///////////////����Ϊ��ͳ�����ݵĴ���//////////////////////////////////////////////////////
	char aAppPath[MAX_PATH] = {0};
	getcwd(aAppPath,MAX_PATH);
	strcat(aAppPath,"\\StatData.dat");
	//��ȡ������
	memset(&oldGameStatData,0,sizeof(CDBBackup::TStatData));
	FILE* aStatFile = fopen(aAppPath,"rb");
	if(aStatFile)
	{		
		int a = fread(&oldGameStatData, 1, sizeof(CDBBackup::TStatData), aStatFile);
		fclose(aStatFile);
	}
	
	newGameStatData = aStatData;
	
	//�ҳ�ǰʮ����oldGameStatData�е����������������������½���
	int aIndex;
	for(i=0;i<10;++i)
	{
		//�ȼ�
		aIndex = CDBBackup::GetIndexByName(
				newGameStatData.LevelStat[i].Name,oldGameStatData.LevelStat, LEVELSTATNUM);
		if(aIndex != -1)
		{
			if(i < aIndex)
				newGameStatData.LevelStat[i].Sort = 1;
			else if(i > aIndex)
				newGameStatData.LevelStat[i].Sort = 255;
			else
				newGameStatData.LevelStat[i].Sort = 0;
		}
		else
			newGameStatData.LevelStat[i].Sort = 1;

		//��Ǯ
		aIndex = CDBBackup::GetIndexByName(
				newGameStatData.MoneyStat[i].Name,oldGameStatData.MoneyStat, MONEYSTATNUM);
		if(aIndex != -1)
		{
			if(i < aIndex)
				newGameStatData.MoneyStat[i].Sort = 1;
			else if(i > aIndex)
				newGameStatData.MoneyStat[i].Sort = 255;
			else
				newGameStatData.MoneyStat[i].Sort = 0;
		}
		else
			newGameStatData.MoneyStat[i].Sort = 1;

		//ɱ����
		aIndex = CDBBackup::GetIndexByName(
				newGameStatData.KillerStat[i].Name,oldGameStatData.KillerStat, DEFAULTSTATNUM);
		if(aIndex != -1)
		{
			if(i < aIndex)
				newGameStatData.KillerStat[i].Sort = 1;
			else if(i > aIndex)
				newGameStatData.KillerStat[i].Sort = 255;
			else
				newGameStatData.KillerStat[i].Sort = 0;
		}
		else
			newGameStatData.KillerStat[i].Sort = 1;

		aIndex = CDBBackup::GetIndexByName(
				newGameStatData.ReputeStat[i].Name,oldGameStatData.ReputeStat, DEFAULTSTATNUM);
		if(aIndex != -1)
		{
			if(i < aIndex)
				newGameStatData.ReputeStat[i].Sort = 1;
			else if(i > aIndex)
				newGameStatData.ReputeStat[i].Sort = 255;
			else
				newGameStatData.ReputeStat[i].Sort = 0;
		}
		else
			newGameStatData.ReputeStat[i].Sort = 1;

		aIndex = CDBBackup::GetIndexByName(
				newGameStatData.FuYuanStat[i].Name,oldGameStatData.FuYuanStat, DEFAULTSTATNUM);
		if(aIndex != -1)
		{
			if(i < aIndex)
				newGameStatData.FuYuanStat[i].Sort = 1;
			else if(i > aIndex)
				newGameStatData.FuYuanStat[i].Sort = 255;
			else
				newGameStatData.FuYuanStat[i].Sort = 0;
		}
		else
			newGameStatData.FuYuanStat[i].Sort = 1;

		aIndex = CDBBackup::GetIndexByName(
				newGameStatData.AccumStat1[i].Name,oldGameStatData.AccumStat1, DEFAULTSTATNUM);
		if(aIndex != -1)
		{
			if(i < aIndex)
				newGameStatData.AccumStat1[i].Sort = 1;
			else if(i > aIndex)
				newGameStatData.AccumStat1[i].Sort = 255;
			else
				newGameStatData.AccumStat1[i].Sort = 0;
		}
		else
			newGameStatData.AccumStat1[i].Sort = 1;

		aIndex = CDBBackup::GetIndexByName(
				newGameStatData.AccumStat2[i].Name,oldGameStatData.AccumStat2, DEFAULTSTATNUM);
		if(aIndex != -1)
		{
			if(i < aIndex)
				newGameStatData.AccumStat2[i].Sort = 1;
			else if(i > aIndex)
				newGameStatData.AccumStat2[i].Sort = 255;
			else
				newGameStatData.AccumStat2[i].Sort = 0;
		}
		else
			newGameStatData.AccumStat2[i].Sort = 1;

		aIndex = CDBBackup::GetIndexByName(
				newGameStatData.HonorStat[i].Name,oldGameStatData.HonorStat, DEFAULTSTATNUM);
		if(aIndex != -1)
		{
			if(i < aIndex)
				newGameStatData.HonorStat[i].Sort = 1;
			else if(i > aIndex)
				newGameStatData.HonorStat[i].Sort = 255;
			else
				newGameStatData.HonorStat[i].Sort = 0;
		}
		else
			newGameStatData.HonorStat[i].Sort = 1;

		aIndex = CDBBackup::GetIndexByName(
				newGameStatData.TimeStat[i].Name,oldGameStatData.TimeStat, DEFAULTSTATNUM);
		if(aIndex != -1)
		{
			if(i < aIndex)
				newGameStatData.TimeStat[i].Sort = 1;
			else if(i > aIndex)
				newGameStatData.TimeStat[i].Sort = 255;
			else
				newGameStatData.TimeStat[i].Sort = 0;
		}
		else
			newGameStatData.TimeStat[i].Sort = 1;


		aIndex = CDBBackup::GetIndexByName(
				newGameStatData.TongLvStat[i].Name,oldGameStatData.TongLvStat, DEFAULTSTATNUM);
		if(aIndex != -1)
		{
			if(i < aIndex)
				newGameStatData.TongLvStat[i].Sort = 1;
			else if(i > aIndex)
				newGameStatData.TongLvStat[i].Sort = 255;
			else
				newGameStatData.TongLvStat[i].Sort = 0;
		}
		else
			newGameStatData.TongLvStat[i].Sort = 1;

		aIndex = CDBBackup::GetIndexByName(
				newGameStatData.TongMnStat[i].Name,oldGameStatData.TongMnStat, DEFAULTSTATNUM);
		if(aIndex != -1)
		{
			if(i < aIndex)
				newGameStatData.TongMnStat[i].Sort = 1;
			else if(i > aIndex)
				newGameStatData.TongMnStat[i].Sort = 255;
			else
				newGameStatData.TongMnStat[i].Sort = 0;
		}
		else
			newGameStatData.TongMnStat[i].Sort = 1;

		aIndex = CDBBackup::GetIndexByName(
				newGameStatData.TongEffStat[i].Name,oldGameStatData.TongEffStat, DEFAULTSTATNUM);
		if(aIndex != -1)
		{
			if(i < aIndex)
				newGameStatData.TongEffStat[i].Sort = 1;
			else if(i > aIndex)
				newGameStatData.TongEffStat[i].Sort = 255;
			else
				newGameStatData.TongEffStat[i].Sort = 0;
		}
		else
			newGameStatData.TongEffStat[i].Sort = 1;

		for(j=0;j<(MAX_FACTION+1);++j)
		{//��������
			//�ȼ�
			aIndex = CDBBackup::GetIndexByName(
					newGameStatData.LevelStatBySect[j][i].Name,oldGameStatData.LevelStatBySect[j], SECTLEVELSTATNUM);
			if(aIndex != -1)
			{
				if(i < aIndex)
					newGameStatData.LevelStatBySect[j][i].Sort = 1;
				else if(i > aIndex)
					newGameStatData.LevelStatBySect[j][i].Sort = 255;
				else
					newGameStatData.LevelStatBySect[j][i].Sort = 0;
			}
			else
				newGameStatData.LevelStatBySect[j][i].Sort = 1;

			//��Ǯ
			aIndex = CDBBackup::GetIndexByName(
					newGameStatData.MoneyStatBySect[j][i].Name,oldGameStatData.MoneyStatBySect[j], SECTMONEYSTATNUM);
			if(aIndex != -1)
			{
				if(i < aIndex)
					newGameStatData.MoneyStatBySect[j][i].Sort = 1;
				else if(i > aIndex)
					newGameStatData.MoneyStatBySect[j][i].Sort = 255;
				else
					newGameStatData.MoneyStatBySect[j][i].Sort = 0;
			}
			else
				newGameStatData.MoneyStatBySect[j][i].Sort = 1;
		}
	}
	//����������
	aStatFile = fopen(aAppPath,"wb");
	if(aStatFile)
	{
		int a = fwrite(&newGameStatData, 1, sizeof(CDBBackup::TStatData), aStatFile);

		fclose(aStatFile);
	}

	MakeSendStatData();//��ͳ������д�����͸��ͻ��˵�ͳ�����ݽṹ��

	if(IS_OUTPUT_LOG){//�Ƿ����ͳ������
		aLogFile<<"DB Statistic Log:"<<endl;
		aLogFile<<"-------------Level-------------"<<endl;
		for(i=0;i<DEFAULTSTATNUM;++i)
		{			
			aLogFile<<SendStatData.LevelStat[i].Name<<"\t"<<
				SendStatData.LevelStat[i].nValue / MAX_LEVEL<<"\t"<<
				SendStatData.LevelStat[i].nValue % MAX_LEVEL<<"\t"<<
				(int)SendStatData.LevelStat[i].bySort<<endl;
		}
		aLogFile<<"-------------Money-------------"<<endl;
		for(i=0;i<DEFAULTSTATNUM;++i)
		{
			aLogFile<<SendStatData.MoneyStat[i].Name<<"\t"<<
				SendStatData.MoneyStat[i].nValue<<"\t"<<
				(int)SendStatData.MoneyStat[i].bySort<<endl;
		}
		aLogFile<<"-------------Killer-------------"<<endl;
		for(i=0;i<DEFAULTSTATNUM;++i)
		{
			aLogFile<<SendStatData.KillerStat[i].Name<<"\t"<<
				SendStatData.KillerStat[i].nValue<<"\t"<<
				(int)SendStatData.KillerStat[i].bySort<<endl;
		}
		aLogFile<<"-------------Repute-------------"<<endl;
		for(i=0;i<DEFAULTSTATNUM;++i)
		{
			aLogFile<<SendStatData.ReputeStat[i].Name<<"\t"<<
				SendStatData.ReputeStat[i].nValue<<"\t"<<
				(int)SendStatData.ReputeStat[i].bySort<<endl;
		}
		aLogFile<<"-------------FuYuan-------------"<<endl;
		for(i=0;i<DEFAULTSTATNUM;++i)
		{
			aLogFile<<SendStatData.FuYuanStat[i].Name<<"\t"<<
				SendStatData.FuYuanStat[i].nValue<<"\t"<<
				(int)SendStatData.FuYuanStat[i].bySort<<endl;
		}
		aLogFile<<"-------------AccumStat1-------------"<<endl;
		for(i=0;i<DEFAULTSTATNUM;++i)
		{
			aLogFile<<SendStatData.AccumStat1[i].Name<<"\t"<<
				SendStatData.AccumStat1[i].nValue<<"\t"<<
				(int)SendStatData.AccumStat1[i].bySort<<endl;
		}
		aLogFile<<"-------------AccumStat2-------------"<<endl;
		for(i=0;i<DEFAULTSTATNUM;++i)
		{
			aLogFile<<SendStatData.AccumStat2[i].Name<<"\t"<<
				SendStatData.AccumStat2[i].nValue<<"\t"<<
				(int)SendStatData.AccumStat2[i].bySort<<endl;
		}
		aLogFile<<"-------------HonorStat-------------"<<endl;
		for(i=0;i<DEFAULTSTATNUM;++i)
		{
			aLogFile<<SendStatData.HonorStat[i].Name<<"\t"<<
				SendStatData.HonorStat[i].nValue<<"\t"<<
				(int)SendStatData.HonorStat[i].bySort<<endl;
		}
		aLogFile<<"-------------TimeStat-------------"<<endl;
		for(i=0;i<DEFAULTSTATNUM;++i)
		{
			aLogFile<<SendStatData.TimeStat[i].Name<<"\t"<<
				SendStatData.TimeStat[i].nValue<<"\t"<<
				(int)SendStatData.TimeStat[i].bySort<<endl;
		}
		aLogFile<<"-------------TongLv-------------"<<endl;
		for(i=0;i<DEFAULTSTATNUM;++i)
		{
			aLogFile<<SendStatData.TongLvStat[i].Name<<"\t"<<
				SendStatData.TongLvStat[i].nValue<<"\t"<<
				(int)SendStatData.TongLvStat[i].bySort<<endl;
		}
		aLogFile<<"-------------TongMn-------------"<<endl;
		for(i=0;i<DEFAULTSTATNUM;++i)
		{
			aLogFile<<SendStatData.TongMnStat[i].Name<<"\t"<<
				SendStatData.TongMnStat[i].nValue<<"\t"<<
				(int)SendStatData.TongMnStat[i].bySort<<endl;
		}
		aLogFile<<"-------------TongEff-------------"<<endl;
		for(i=0;i<DEFAULTSTATNUM;++i)
		{
			aLogFile<<SendStatData.TongEffStat[i].Name<<"\t"<<
				SendStatData.TongEffStat[i].nValue<<"\t"<<
				(int)SendStatData.TongEffStat[i].bySort<<endl;
		}
		for(i=0;i<(MAX_FACTION+1);++i)
		{
			aLogFile<<"--------------Sect "<<i<<" Level--------------"<<endl;
			for(j=0;j<SECTMONEYSTATNUM;++j)
			{
				aLogFile<<SendStatData.LevelStatBySect[i][j].Name<<"\t"<<
				SendStatData.LevelStatBySect[i][j].nValue / MAX_LEVEL<<"\t"<<
				SendStatData.LevelStatBySect[i][j].nValue % MAX_LEVEL<<"\t"<<
				(int)SendStatData.LevelStatBySect[i][j].bySort<<endl;
			}
			aLogFile<<"-------------Sect "<<i<<" Money---------------"<<endl;
			for(j=0;j<SECTMONEYSTATNUM;++j)
			{
				aLogFile<<SendStatData.MoneyStatBySect[i][j].Name<<"\t"<<
				SendStatData.MoneyStatBySect[i][j].nValue<<"\t"<<
				(int)SendStatData.MoneyStatBySect[i][j].bySort<<endl;
			}
		}
		aLogFile<<"Thong ke so luong nguoi choi moi mon phai"<<endl;
		for(i=0;i<(MAX_FACTION+1);++i)
		{
			aLogFile<<"Sect "<<i<<": "<<SendStatData.SectPlayerNum[i]<<endl;
		}
		aLogFile<<"Thong ke so luong phu ho moi mon phai(Tong: "<<MONEYSTATNUM<<")"<<endl;
		for(i=0;i<(MAX_FACTION+1);++i)
		{
			aLogFile<<"Sect "<<i<<": "<<SendStatData.SectMoneyMost[i]<<endl;
		}
		aLogFile<<"Thong ke so luong cao thu moi mon phai(Tong: "<<LEVELSTATNUM<<")"<<endl;
		for(i=0;i<(MAX_FACTION+1);++i)
		{
			aLogFile<<"Sect "<<i<<": "<<SendStatData.SectLevelMost[i]<<endl;
		}
	}
	//================

	IsBackupWorking = false;
}

void CDBBackup::MakeSendStatData()
{//���ɷ��͸��ͻ��˵�ͳ�����ݽṹ
	int i,j;
	memset(&SendStatData,0,sizeof(TGAME_STAT_DATA));
	for(i=0;i<10;++i)
	{
		strcpy(SendStatData.LevelStat[i].Name, newGameStatData.LevelStat[i].Name);
		SendStatData.LevelStat[i].nValue = newGameStatData.LevelStat[i].Level + newGameStatData.LevelStat[i].Translife * MAX_LEVEL;
		SendStatData.LevelStat[i].bySort = newGameStatData.LevelStat[i].Sort;

		strcpy(SendStatData.MoneyStat[i].Name, newGameStatData.MoneyStat[i].Name);
		SendStatData.MoneyStat[i].nValue = newGameStatData.MoneyStat[i].Money;
		SendStatData.MoneyStat[i].bySort = newGameStatData.MoneyStat[i].Sort;

		strcpy(SendStatData.KillerStat[i].Name, newGameStatData.KillerStat[i].Name);
		SendStatData.KillerStat[i].nValue = newGameStatData.KillerStat[i].KillNum;
		SendStatData.KillerStat[i].bySort = newGameStatData.KillerStat[i].Sort;

		strcpy(SendStatData.ReputeStat[i].Name, newGameStatData.ReputeStat[i].Name);
		SendStatData.ReputeStat[i].nValue = newGameStatData.ReputeStat[i].Repute;
		SendStatData.ReputeStat[i].bySort = newGameStatData.ReputeStat[i].Sort;		

		strcpy(SendStatData.FuYuanStat[i].Name, newGameStatData.FuYuanStat[i].Name);
		SendStatData.FuYuanStat[i].nValue = newGameStatData.FuYuanStat[i].FuYuan;
		SendStatData.FuYuanStat[i].bySort = newGameStatData.FuYuanStat[i].Sort;	

		strcpy(SendStatData.AccumStat1[i].Name, newGameStatData.AccumStat1[i].Name);
		SendStatData.AccumStat1[i].nValue = newGameStatData.AccumStat1[i].AccumStat1;
		SendStatData.AccumStat1[i].bySort = newGameStatData.AccumStat1[i].Sort;		

		strcpy(SendStatData.AccumStat2[i].Name, newGameStatData.AccumStat2[i].Name);
		SendStatData.AccumStat2[i].nValue = newGameStatData.AccumStat2[i].AccumStat2;
		SendStatData.AccumStat2[i].bySort = newGameStatData.AccumStat2[i].Sort;

		strcpy(SendStatData.HonorStat[i].Name, newGameStatData.HonorStat[i].Name);
		SendStatData.HonorStat[i].nValue = newGameStatData.HonorStat[i].HonorStat;
		SendStatData.HonorStat[i].bySort = newGameStatData.HonorStat[i].Sort;	

		strcpy(SendStatData.TimeStat[i].Name, newGameStatData.TimeStat[i].Name);
		SendStatData.TimeStat[i].nValue = newGameStatData.TimeStat[i].TimeStat;
		SendStatData.TimeStat[i].bySort = newGameStatData.TimeStat[i].Sort;	

		strcpy(SendStatData.TongLvStat[i].Name, newGameStatData.TongLvStat[i].Name);
		SendStatData.TongLvStat[i].nValue = newGameStatData.TongLvStat[i].TongLv;
		SendStatData.TongLvStat[i].bySort = newGameStatData.TongLvStat[i].Sort;		

		strcpy(SendStatData.TongMnStat[i].Name, newGameStatData.TongMnStat[i].Name);
		SendStatData.TongMnStat[i].nValue = newGameStatData.TongMnStat[i].TongMn;
		SendStatData.TongMnStat[i].bySort = newGameStatData.TongMnStat[i].Sort;		

		strcpy(SendStatData.TongEffStat[i].Name, newGameStatData.TongEffStat[i].Name);
		SendStatData.TongEffStat[i].nValue = newGameStatData.TongEffStat[i].TongEff;
		SendStatData.TongEffStat[i].bySort = newGameStatData.TongEffStat[i].Sort;		
		for(j=0;j<(MAX_FACTION+1);++j)
		{//��������
			strcpy(SendStatData.LevelStatBySect[j][i].Name, newGameStatData.LevelStatBySect[j][i].Name);
			SendStatData.LevelStatBySect[j][i].nValue = newGameStatData.LevelStatBySect[j][i].Level;
			SendStatData.LevelStatBySect[j][i].bySort = newGameStatData.LevelStatBySect[j][i].Sort;

			strcpy(SendStatData.MoneyStatBySect[j][i].Name, newGameStatData.MoneyStatBySect[j][i].Name);
			SendStatData.MoneyStatBySect[j][i].nValue = newGameStatData.MoneyStatBySect[j][i].Money;
			SendStatData.MoneyStatBySect[j][i].bySort = newGameStatData.MoneyStatBySect[j][i].Sort;

			SendStatData.SectLevelMost[j] = newGameStatData.SectLevelMost[j];
			SendStatData.SectMoneyMost[j] = newGameStatData.SectMoneyMost[j];
			SendStatData.SectPlayerNum[j] = newGameStatData.SectPlayerNum[j];
		}
	}
}

void CDBBackup::SaveStatInfo()
{//����Ϸ����ȼ�����д��ָ����ҽ�ɫ��
	TStatData aStatData;
	char aAppPath[MAX_PATH] = {0};
	getcwd(aAppPath,MAX_PATH);
	strcat(aAppPath,"\\StatData.dat");
	//��ȡ����
	memset(&aStatData,0,sizeof(TStatData));
	FILE* aStatFile = fopen(aAppPath,"rb");
	if(aStatFile)
	{		
		int aRead = fread(&aStatData, sizeof(TStatData), 1, aStatFile);
		if(aRead != 1) return;
		fclose(aStatFile);
	}
	else
	{
		return;
	}
	
	int i,j;
	for(i=0;i<LEVELSTATNUM;++i)
	{
		if(aStatData.LevelStat[i].Name[0] == '\0')continue;
		ZCursor *cursor = RunTable->search(aStatData.LevelStat[i].Name, strlen(aStatData.LevelStat[i].Name) +1);
//		char* aBuffer = RunTable->search(aStatData.LevelStat[i].Name, strlen(aStatData.LevelStat[i].Name) +1,size);
		if(!cursor)
		{
			continue;
		}
		TRoleData* pRoleData = (TRoleData*)cursor->data;
		pRoleData->BaseInfo.nWorldStat = i+1;
		
		/*if (pRoleData->dwDataLen - 4 == pRoleData->dwFriendOffset)
		{
			DWORD dwCRC = 0;
			dwCRC = CRC32(dwCRC, pRoleData, pRoleData->dwDataLen - 4);
			memcpy(cursor->data + pRoleData->dwDataLen - 4, &dwCRC, 4);
		}*/

		RunTable->add(aStatData.LevelStat[i].Name, strlen(aStatData.LevelStat[i].Name) +1, cursor->data, cursor->size);
		RunTable->closeCursor(cursor);
	}


	//�����ɵȼ�����д��ָ����ҽ�ɫ��
	for(i=0;i<(MAX_FACTION+1);++i)
	{
		for(j=0;j<SECTLEVELSTATNUM;++j)
		{
			if(aStatData.LevelStatBySect[i][j].Name[0] == '\0')continue;
			ZCursor *cursor = RunTable->search( aStatData.LevelStatBySect[i][j].Name, strlen(aStatData.LevelStatBySect[i][j].Name) +1 );
//			char* aBuffer = RunTable->search(aStatData.LevelStatBySect[i][j].Name, strlen(aStatData.LevelStatBySect[i][j].Name) +1,size);
			if(!cursor)
			{
				continue;
			}
			TRoleData* pRoleData = (TRoleData*)cursor->data;
			pRoleData->BaseInfo.nSectStat = j+1;

			/*if (pRoleData->dwDataLen - 4 == pRoleData->dwFriendOffset)
			{
				DWORD dwCRC = 0;
				dwCRC = CRC32(dwCRC, pRoleData, pRoleData->dwDataLen - 4);
				memcpy(cursor->data + pRoleData->dwDataLen - 4, &dwCRC, 4);
			}*/
			RunTable->add(aStatData.LevelStatBySect[i][j].Name, strlen(aStatData.LevelStatBySect[i][j].Name) +1, cursor->data, cursor->size);
			RunTable->closeCursor(cursor);
		}
	}
}