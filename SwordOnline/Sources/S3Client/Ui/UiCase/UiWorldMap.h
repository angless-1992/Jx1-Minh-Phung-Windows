/* 
 * File:     UiWorldMap.h
 * Desc:     �����ͼ
 * Author:   flying
 * Creation: 2003/7/22
 */
//-----------------------------------------------------------------------------
#pragma once

#include "../Elem/WndImage.h"
#include "../Elem/UiImage.h"
#include "../Elem/WndShadow.h"
#include "../Elem/WndPureTextBtn.h"
#include "../Elem/WndText.h"

class KUiWorldmap : protected KWndImage
{
public:
	static KUiWorldmap* OpenWindow();		//�򿪴��ڣ�����Ψһ��һ�������ʵ��
	static void			CloseWindow();		//�رմ���
	static KUiWorldmap*	GetIfVisible();
	void				LoadScheme(const char* pScheme);	//������淽��

private:
	KUiWorldmap() {}
	~KUiWorldmap() {}
	void	Initialize();
	int		WndProc(unsigned int uMsg, unsigned int uParam, int nParam);
	void	PaintWindow();				//�����
	void	UpdateData();
private:
	static KUiWorldmap* m_pSelf;
	KWndImage			m_Sign;
	KWndImage			m_City;
	KWndImage			m_Capital;
	KWndImage			m_Cave;
	KWndImage			m_Battlefield;
	KWndImage			m_Field;
	KWndImage			m_Others;
	KWndImage			m_Country;
	KWndImage			m_Tong;
};