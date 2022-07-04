/*****************************************************************************************
//	������ʾ����
//	Copyright : Kingsoft 2002-2003
//	Author	:   Wooy(Wu yue)
//	CreateTime:	2002-12-23
------------------------------------------------------------------------------------------
*****************************************************************************************/
#pragma once

#include "WndMessage.h"
#include "UiImage.h"
#include "../../../Represent/iRepresent/KRepresentUnit.h"
#include "../../../core/src/GameDataDef.h"

class KSpaceOver
{
public:
	KSpaceOver();
	int		IsSpaceOverWndObj(void* pWnd, int nObj);
	void    SetSpaceOverInfo(void* pWnd, int nObj, int x, int y, unsigned int uHoverTime, bool LAlign = false, bool bFollowCursor = false);
	void    SetSpaceOverImage(bool bAdd);
    void    SetSpaceOverTitle(const char *pcszTitleText, int nTitleTextLen, UINT uColor);
	void	CancelSpaceOverInfo();
	void	PaintSpaceOverInfo();
	void	LoadScheme(const char* pScheme);		//������淽��
	void	UpdateCursorPos(int nX, int nY);		//����λ�ø�����
	void	OnWndClosed(void* pWnd);
private:
	void	Update(int nX, int nY);
private:
	int		m_nLeft;		        //�������ϽǺ�����
	int		m_nTop;			        //�������Ͻ�������
	int		m_nWndWidth;	        //��̬�Ĵ���ˮƽ��
	int		m_nWndHeight;	        //��̬�Ĵ��ڴ�ֱ��
	int		m_nWndWidthReduce;	        //��̬�Ĵ���ˮƽ��
	int		m_nWndHeightReduce;	        //��̬�Ĵ��ڴ�ֱ��
	int		m_nWidthReduce;
	int		m_nHeightReduce;
	int		m_nMaxWidthReduce;
	int		m_nMaxHeightReduce;
	int		m_nIndent;		        //������������߿��ˮƽ������룩
	int		m_nFontSize;	        //��������(��С)

	int     m_nApplyX;              //�ⲿ�ύ�ĸ������ڵ�X����
	int     m_nApplyY;              //�ⲿ�ύ�ĸ������ڵ�Y����
	int     m_nTitleLineNum;        //����(����)���ֵ�����
	int     m_nMaxLineLen;          //������һ��������еĳ���

	unsigned int m_uTitleBgColor;   //����(����)������ɫ
	unsigned int m_uTitleColor;     //����(����)������ɫ
	/////////////////////////
	unsigned int m_uBoderShadowColor;      //����������ɫ
	/////////////////////////
	KRUImagePart m_Image;	        //�߿�ͼ��

	void*	m_pSpaceOverWnd;		//���ͣ���Ĵ���
	int		m_nObj;
	char    m_ObjTitle[GOD_MAX_OBJ_TITLE_LEN];
	int		m_nTitleLen;
	bool	m_bTempImg;			//�Ƿ���ʾ��ͷ���β�߿�ͼ
	bool	m_LAlign;
	bool	m_bFollowCursor;		//�Ƿ�������ָ���λ�ã�һ���ƶ�����ͬʱû�к��������ƣ�
	BOOL	m_bShow;
	unsigned int	m_uHoverTime;
	unsigned int	m_uLastHoverTime;

public:
	KUiImageRef	 m_HoverImage;
};

extern KSpaceOver	g_SpaceOver;

void SetSpaceOverObjDescColor(unsigned int uColor);
void SetSpaceOverObjectDesc(void* pWnd, int nObj, unsigned int uGenre,
			unsigned int uId, int nContainer, int x, int y, unsigned int uHoverTime, bool LAlign = false);
//���Ʊ��϶���Ϸ����ĺ���
