/*****************************************************************************************
//	���洰����ϵ�ṹ--��ʾͼ�ξֲ��Ĵ���
//	Copyright : Kingsoft 2002
//	Author	:   Wooy(Wu yue)
//	CreateTime:	2002-7-25
*****************************************************************************************/
#include "KWin32.h"
#include "KIniFile.h"
#include "WndImagePart.h"
#include "KSprite.h"
#include "../../../Represent/iRepresent/iRepresentShell.h"
extern iRepresentShell*	g_pRepresentShell;

//--------------------------------------------------------------------------
//	���ܣ����캯��
//--------------------------------------------------------------------------
KWndImagePart::KWndImagePart()
{
	m_BalanceValue = 0;
	IR_InitUiImagePartRef(m_Image);
}

void KWndImagePart::Clone(KWndImagePart* pCopy)
{
	if (pCopy)
	{
		KWndWindow::Clone(pCopy);
		pCopy->m_Image	= m_Image;
		pCopy->SetPart(0, 100);
	}
}

//--------------------------------------------------------------------------
//	���ܣ���ʼ������
//--------------------------------------------------------------------------
int KWndImagePart::Init(KIniFile* pIniFile, const char* pSection)
{
	if (KWndWindow::Init(pIniFile, pSection))
	{
		pIniFile->GetInteger(pSection, "PartType", 0, &m_Image.nDivideFashion);
		if (m_Image.nDivideFashion < IDF_LEFT_TO_RIGHT || m_Image.nDivideFashion > IDF_BOTTOM_TO_TOP)
			m_Image.nDivideFashion = IDF_LEFT_TO_RIGHT;
		m_Image.uImage = 0;
		m_Image.nISPosition = 0;
		int nValue;
		pIniFile->GetInteger(pSection, "ImgType", 0, &nValue);
		if (nValue == 1)
		{
			m_Image.nType = ISI_T_BITMAP16;
			m_Image.bRenderStyle = IMAGE_RENDER_STYLE_OPACITY;
		}
		else
		{
			m_Image.nType = ISI_T_SPR;
			m_Image.bRenderStyle = IMAGE_RENDER_STYLE_ALPHA;
		}
		pIniFile->GetString(pSection, "Image", "" , m_Image.szImage, sizeof(m_Image.szImage));
		return true;
	}
	return false;
}


void KWndImagePart::SetImage(short nType, const char* pszImgName, bool bAdjustWndSize)
{
	m_Image.nType = nType;
	strncpy(m_Image.szImage, pszImgName, sizeof(m_Image.szImage));
	m_Image.szImage[sizeof(m_Image.szImage) - 1] = 0;
	m_Image.uImage = 0;

	if (bAdjustWndSize && g_pRepresentShell)
	{
		KImageParam	Param;
		if (g_pRepresentShell->GetImageParam(m_Image.szImage, &Param, nType))
			SetSize(Param.nWidth, Param.nHeight);
	}
}
//--------------------------------------------------------------------------
//	���ܣ��������
//--------------------------------------------------------------------------
void KWndImagePart::PaintWindow()
{
	KWndWindow::PaintWindow();
	if (g_pRepresentShell)
	{
		#ifdef _DEBUG
		if (m_Image.szImage[0] == 0 && WND_SHOW_DEBUG_FRAME_TEXT)
		{
			g_pRepresentShell->OutputText(16, m_Caption, -1, m_nAbsoluteLeft + 1, m_nAbsoluteTop + 1, 0xFF000000);
			g_pRepresentShell->OutputText(16, m_Caption, -1, m_nAbsoluteLeft, m_nAbsoluteTop, 0xFFFFFFFF);
		}
		else
		#endif
		{
			m_Image.oPosition.nX = m_nAbsoluteLeft;
			m_Image.oPosition.nY = m_nAbsoluteTop + m_BalanceValue;
			g_pRepresentShell->DrawPrimitives(1, &m_Image, RU_T_IMAGE_PART, true);
		}
	}
}

//--------------------------------------------------------------------------
//	���ܣ����ݲ���ֵ��ȫֵ�ı�����ϵ���û���ͼ���Ĳ�������
//--------------------------------------------------------------------------
void KWndImagePart::SetPart(int nPartValue, int nFullValue)
{
	if (nFullValue)
	{
		if (m_Image.nDivideFashion == IDF_BOTTOM_TO_TOP && nPartValue <= nFullValue)
			m_BalanceValue = m_Image.Height - m_Image.Height * nPartValue / nFullValue;
		else
			m_BalanceValue = 0;
		IR_UpdateImagePart(m_Image, nPartValue, nFullValue);
	}
}