/*****************************************************************************************
//	���洰����ϵ�ṹ--���봰��
//	Copyright : Kingsoft 2002
//	Author	:   Wooy(Wu yue)
//	CreateTime:	2002-7-22
------------------------------------------------------------------------------------------
*****************************************************************************************/
#pragma once
#include "WndWindow.h"
#include "WndText.h"

#define	WNDEDIT_ES_FILTER				0x00ff
#define	WNDEDIT_ES_ENGLISH_AVAILABLE	0x0001		//�������������ַ������š�����
#define	WNDEDIT_ES_IME_AVAILABLE		0x0002		//��������ime�ַ��������ַ�����
#define	WNDEDIT_ES_CHAR_TYPE_FILTER		(WNDEDIT_ES_ENGLISH_AVAILABLE | WNDEDIT_ES_IME_AVAILABLE)
#define	WNDEDIT_ES_MASK_CHARACTER		0x0010		//��ʾʱ����������滻Ҫ��ʾ���ַ�
#define	WNDEDIT_ES_MULTI_LINE			0x0020		//���б༭
#define	WNDEDIT_F_HAVE_FOCUS			0x0100
#define	WNDEDIT_F_HAVE_SHADOW			0x0200

class KWndEdit : public KWndWindow
{
public:
	KWndEdit();
	~KWndEdit();
	virtual int	Init(KIniFile* pIniFile, const char* pSection);//��ʼ��
	virtual int		WndProc(unsigned int uMsg, unsigned int uParam, int nParam);//���ں���
	virtual void	PaintWindow();							//���ƴ���
	void			SetColor(unsigned int uColor);
	void			SetText(const char* pText, int nLen = -1);				//�����ı�����
	int				GetText(char* pBuffer, int nSize, bool bExcludeSpace);//��ȡ�ַ�������
	void			SetIntText(int nNumber);				//�����ı���������Ϊ��������������ַ���
	DWORD			GetIntNumber();
	void			Enable(int bEnable);					//��ֹ��������ʹ���ڱ�����
	void			Clone(KWndEdit* pCopy);
	void			Clear(bool bSafe = false);
	int				InsertString(const char* pString, int nLen);
	void			GetCaretPosition(int* nx, int* ny);
	unsigned int	GetFocusBkColor()	{return m_FocusBkColor;}
	void			SetFocusBkColor(unsigned int nC)	{m_FocusBkColor = nC;}
	virtual const char*	GetShortKey() {return NULL;}	//ȡ��ݼ�,����Tip��ʾ
	static void		SetAllButtonTipTextColor(unsigned int uColor);	//�������а�ť��ʾ�������ֵ���ɫ
	static void		EnableAllButtonTip(int bEnable);					//��ֹ/�������а�ť����ʾ����
	virtual void	OnButtonClick(){}
	virtual int		GetToolTipInfo(char* szTip, int nMax);
	int		SetToolTipInfo(char* szTip, int nMax);
	void	SetToolTipHover(bool bFlag) {m_bTipHover = bFlag;};
	int		GetFontSize() {return m_nFontSize;};
	void	SetMaskCharacter(bool bMask)
	{
		if (bMask)
		{
			m_Flag |= WNDEDIT_ES_MASK_CHARACTER;
			m_Flag &= ~WNDEDIT_ES_MULTI_LINE;
		}
		else
		{
			m_Flag &= ~WNDEDIT_ES_MASK_CHARACTER;
		}
	};
	int	GetMaskCharacter()
	{
		return (m_Flag & WNDEDIT_ES_MASK_CHARACTER);
	};
	void	SetLimitText(int nLimit)
	{
		m_nLimitText = nLimit;
	};
	
protected:
	void			SetTextPtr(char* pText, int nMaxLen);	//�����ı�������ָ��
	int				InsertChar(int nChar);					//
	int				InsertChar(char cLow, char cHigh);		//
	int				OnKeyDown(int nKeyCode, int nModifiers);//��Ӧ���̰�������

private:
	int				CharFromPos(int x, int y);				//retrieves information about the character closest to a specified point in the client area of an edit control
	void			UpdateData();
	void			FmtForShow();
	int				SelectAll();
	int				Copy();
	int				Paste();
	
private:
	unsigned int	m_Flag;
	int			m_nFontSize;				//�����С
	char*		m_pText;					//�ı�������ָ��
	int			m_nBufferSize;				//�ı�������ָ��ĳ���
	int			m_nLimitText;				//�ַ������ȣ�BYTE�����ƣ��������ַ����������š�
	int			m_nTextLen;					//�ַ���ʵ�ʳ���

	int			m_nSkipAhead;				//��ʾʱ����ǰ�˳������ַ���ǰ�˱������ַ�������
	int			m_nSkipBehind;				//��ʾʱ���Ժ�˳������ַ�����˱������ַ�������

	int			m_nCaretLineIndex;			//��������ڵ���λ��
	int			m_nCaretPos;				//�������λ��
	int			m_nCaretTime;				//���Ʋ������ʾ��ʱ��

    int         m_nCaretX;
    int         m_nCaretY;

    //HWND        m_hEdit;

	unsigned int m_TextColor;				//������ɫ
	unsigned int m_TextBorderColor;			//�����Ե��ɫ
	unsigned int m_FocusBkColor;			//�н���ʱ�ı�����ɫ
	
	char			m_szTip[256];
	int				m_nTipLen;
	bool			m_bTipHover;
private:
	static unsigned int	ms_uBtnTipTextColor;	//��ť��ʾ�������ֵ���ɫ
	static int			ms_nDisableBtnTip;		//�Ƿ��ֹ��ť����ʾ����
};

class KWndEdit80 : public KWndEdit
{
private:
	char			m_Text[80];
public:
	KWndEdit80();
};
//=====================================
//	�ı�����������Ϊ32���ı����봰����
//=====================================
class KWndEdit32 : public KWndEdit
{
private:
	char			m_Text[32];
public:
	KWndEdit32();
};

//=====================================
//	�ı�����������Ϊ32���ı����봰����
//=====================================
class KWndEdit512 : public KWndEdit
{
private:
	char			m_Text[512];
public:
	KWndEdit512();
};
