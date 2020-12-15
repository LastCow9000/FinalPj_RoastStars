package com.beans.roaststars.model.vo;

public class MenuKindVO {
	private String espresso;
	private MenuVO menuVO;
	
	public MenuKindVO() {
		super();
	}

	public MenuKindVO(String espresso, MenuVO menuVO) {
		super();
		this.espresso = espresso;
		this.menuVO = menuVO;
	}

	public String getEspresso() {
		return espresso;
	}

	public void setEspresso(String espresso) {
		this.espresso = espresso;
	}

	public MenuVO getMenuVO() {
		return menuVO;
	}

	public void setMenuVO(MenuVO menuVO) {
		this.menuVO = menuVO;
	}

	@Override
	public String toString() {
		return "MenuKindVO [espresso=" + espresso + ", menuVO=" + menuVO + "]";
	}
	
}
