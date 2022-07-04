/* 
 * File:     UiCaveList.h
 * Desc:     �����ͼ
 * Author:   flying
 * Creation: 2003/7/22
 */
//-----------------------------------------------------------------------------
#pragma once

#include "../Elem/WndImage.h"
#include "../Elem/WndButton.h"
#include "../Elem/UiImage.h"

class KUiCaveList : protected KWndImage
{
public:
	static KUiCaveList* OpenWindow();		//�򿪴��ڣ�����Ψһ��һ�������ʵ��
	static void			CloseWindow();		//�رմ���
	static KUiCaveList*	GetIfVisible();
	void				LoadScheme(const char* pScheme);	//������淽��

private:
	KUiCaveList() {}
	~KUiCaveList() {}
	void	Initialize();
	int		WndProc(unsigned int uMsg, unsigned int uParam, int nParam);
	void	Breathe();				//�����
	void	UpdateData();
private:
	static KUiCaveList* m_pSelf;
	KWndImage			m_Sign;
};