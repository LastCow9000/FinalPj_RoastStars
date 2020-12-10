package com.beans.roaststars.model.vo;

public class MenuVO {
   private String menuName;
   private String menuPrice;
   private CafeVO cafeVO;
   
   public MenuVO() {
      super();
   }

public String getMenuName() {
	return menuName;
}

public void setMenuName(String menuName) {
	this.menuName = menuName;
}

public String getMenuPrice() {
	return menuPrice;
}

public void setMenuPrice(String menuPrice) {
	this.menuPrice = menuPrice;
}

public CafeVO getCafeVO() {
	return cafeVO;
}

public void setCafeVO(CafeVO cafeVO) {
	this.cafeVO = cafeVO;
}

public MenuVO(String menuName, String menuPrice, CafeVO cafeVO) {
	super();
	this.menuName = menuName;
	this.menuPrice = menuPrice;
	this.cafeVO = cafeVO;
}

@Override
public String toString() {
	return "MenuVO [menuName=" + menuName + ", menuPrice=" + menuPrice + ", cafeVO=" + cafeVO + "]";
}
   
}