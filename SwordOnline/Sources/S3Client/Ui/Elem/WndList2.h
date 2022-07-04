/*****************************************************************************************
//	���洰����ϵ�ṹ--�б���
//	Copyright : Kingsoft 2002
//	Author	:   Wooy(Wu yue)
//	CreateTime:	2002-9-11
------------------------------------------------------------------------------------------
    �б���ֻ�г����֡�����ÿ����Թ����������ݡ�
*****************************************************************************************/
#pragma once
#include "WndWindow.h"
#include "WndScrollBar.h"

#define	WNDLIST_ERROR					-1

class KWndList2 : public KWndWindow
{
public:
	virtual int	Init(KIniFile* pIniFile, const char* pSection);//��ʼ��
	virtual int		WndProc(unsigned int uMsg, unsigned int uParam, int nParam);//���ں���
	virtual void	PaintWindow();							//���ƴ���
	int				AddString(int nIndex, const char* pszString, bool bIsNode = false);//�����
	int				GetString(int nIndex, char* pBuffer, unsigned int nSize);//��ȡ�б�����ַ�������
	int				DeleteString(int nIndex);				//ɾ���б��е�һ��
	void			ResetContent();							//ɾ���б���ȫ��������
	//���б��в���ĳ���ַ�����
	int				FindString(const char* pString);
	int				SetItemData(int nIndex, int nData);		//�����б���������ݵ�ֵ
	int				GetItemData(int nIndex);				//����б���������ݵ�ֵ
	int 			SetItemColor(int nIndex, unsigned int Color);
	unsigned int 	GetItemColor(int nIndex);
	void			SetTopItemIndex(int nTopItemIndex);		//����б��ڶ�����ʾ�������������
	int				GetTopItemIndex() { return m_nTopItemIndex; }//����б��ڶ�����ʾ�������������
	int				GetVisibleLineCount() const;			//����б�����ͬʱ��ʾ�������Ŀ
	int				GetVisibleNodeCount(int nTopIndex) const;
	int				GetCount()  { return m_nNumItem; }		//��ȡ�����������Ŀ
	int				GetCurCount();
	int				GetCurSel() { return m_nSelItemIndex;  }//�õ���ǰѡ��������������
	int				SetCurSel(int nSel);
	void			SetScrollbar(KWndScrollBar* pScroll);
	
	virtual const char*	GetShortKey() {return NULL;}	//ȡ��ݼ�,����Tip��ʾ
	static void		SetAllButtonTipTextColor(unsigned int uColor);	//�������а�ť��ʾ�������ֵ���ɫ
	static void		EnableAllButtonTip(int bEnable);		
	virtual int		GetToolTipInfo(int nIndex, char* pBuffer, int nSize);
	int		SetToolTipInfo(int nIndex, char* pBuffer, int nSize);
	
	KWndList2();
	virtual ~KWndList2();
protected:
	void			Clone(KWndList2* pCopy);
private:
	void			OnLButtonDown(int x, int y);			//��Ӧ����������
	void			OnLButtonDClick(int x, int y);			//��Ӧ����������
	void			OnMouseMove(int x, int y);				//��Ӧ������б������ƶ�
	
private:
	void**			m_pContent;				//�б�����������
	int				m_nItemSpace;			//���Ա����item����Ŀ
	int				m_nNumItem;				//���������Ŀ

	int				m_nNodeList;
	int				m_nTopItemIndex;		//���ڶ�����ʾ�������������
	int				m_nSelItemIndex;		//ѡ�е������������
	int				m_nRowDis;

	int				m_nLastData;
	unsigned int	m_NodeItemColor;			//��ʾ�������ı�����ɫ
	unsigned int	m_NodeItemBorderColor;		//��ʾ�������ı��ı�Ե��ɫ
	unsigned int	m_ItemColor;			//��ʾ�������ı�����ɫ
	unsigned int	m_ItemBorderColor;		//��ʾ�������ı��ı�Ե��ɫ
	unsigned int	m_SelItemColor;			//��ѡ�е��������ı�����ɫ
	unsigned int	m_SelItemBorderColor;	//��ѡ�е��������ı��ı�Ե��ɫ
	unsigned int	m_uSelItemBgColor;
	unsigned int	m_uIconLineColor;
	unsigned int	m_uNodeLineColor;
	int				m_nFontSize;			//��ʾ�����С

	KWndScrollBar  *m_pScrollbar;
private:
	static unsigned int	ms_uBtnTipTextColor;	//��ť��ʾ�������ֵ���ɫ
	static int			ms_nDisableBtnTip;		//�Ƿ��ֹ��ť����ʾ����
};