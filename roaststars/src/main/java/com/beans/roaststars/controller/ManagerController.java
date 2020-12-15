package com.beans.roaststars.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.beans.roaststars.model.service.CafeService;
import com.beans.roaststars.model.vo.CafeOperatingTimeVO;
import com.beans.roaststars.model.vo.CafeVO;
import com.beans.roaststars.model.vo.MenuVO;
import com.beans.roaststars.model.vo.UserVO;
@Controller
public class ManagerController {
   @Resource
   private CafeService cafeService;
   private String uploadPath; // 업로드 경로

   // 카페등록폼으로 이동
   @Secured("ROLE_MANAGER")
   @RequestMapping("register-cafeform.do")
   public String registerCafeForm() {
      return "cafe/registerCafeForm.tiles";
   }

   // 카페등록하기
   @Transactional
   @Secured("ROLE_MANAGER")
   @PostMapping("register-cafe.do")
   public String registerCafe(CafeVO cafeVO, CafeOperatingTimeVO cafeOperVO,MultipartHttpServletRequest request) {
      // 로그인한 유저정보 불러오기
      UserVO uvo = (UserVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
      cafeVO.setUserVO(uvo);
      cafeOperVO.setCafeVO(cafeVO);
            //이미지 파일 업로드용            
            if (cafeVO.getUploadFile() != null) {
               uploadPath = request.getSession().getServletContext().getRealPath("/resources/upload/"); //server(tomcat) 경로
               File uploadDir = new File(uploadPath);
               if (uploadDir.exists() == false)
                  uploadDir.mkdirs();
               MultipartFile file = cafeVO.getUploadFile();
               if (file != null && file.isEmpty() == false) {
                  File uploadFile = new File(uploadPath + file.getOriginalFilename());
                  try {
                     file.transferTo(uploadFile);
                     cafeVO.setCafePic(file.getOriginalFilename());
                     String localPath = "C:\\kosta203\\Final-project\\FinalPj_RoastStars\\roaststars\\src\\main\\webapp\\resources\\upload";
                     File localPathDir = new File(localPath);
                     
                     if (localPathDir.exists() == false)
                        localPathDir.mkdirs();
                     // server에 업로드된 이미지->workspace(local)에 카피
                     FileCopyUtils.copy(uploadFile, new File(localPath+File.separator+file.getOriginalFilename())); 
                  } catch (IllegalStateException | IOException e) {
                     e.printStackTrace();
                  }
               }
            }
             
      // 카페정보 등록
      cafeService.registerCafe(cafeVO, cafeOperVO);
      // cafeNo 보내주기
      cafeVO = cafeService.findcafeByNoNotJoin(cafeVO.getCafeNo());
      String cafeNo = cafeVO.getCafeNo();
      //cafeOperVO = cafeService.findCafeByCafeNo(cafeVO.getCafeNo());
      return "redirect:register-cafe-result.do?cafeNo="+cafeNo;
   }
   
   // 카페 등록 완료 페이지로 이동
   @Secured("ROLE_MANAGER")
   @RequestMapping("register-cafe-result.do")
   public ModelAndView viewRegisterCafeResult(String cafeNo) {
	   return new ModelAndView("cafe/registerCafeResult.tiles",
			   "cafeNo", cafeNo);
   }



	// 카페정보수정폼으로 이동하기 전에 자신의 카페 리스트 불러오기
	@Secured("ROLE_MANAGER")
	@RequestMapping("update-cafelist.do")
	public String updateCafeList(Model model) {
		UserVO userVO = (UserVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		List<CafeVO> list = cafeService.getCafeList(userVO.getId());
		model.addAttribute("list", list);
		return "cafe/updateCafeList.tiles";
	}

	// 카페정보수정폼으로 이동하기 전에 자신의 카페 리스트 불러오기
	@Secured("ROLE_MANAGER")
	@RequestMapping("view-cafelist-for-menu.do")
	public String ViewCafeListForMenu(Model model) {
		UserVO userVO = (UserVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		List<CafeVO> list = cafeService.getCafeList(userVO.getId());
		model.addAttribute("list", list);
		return "cafe/updateCafeListForMenu.tiles";
	}
	
	//카페정보 수정전 자신의 카페목록 불러오기.
	@Secured("ROLE_MANAGER")
	@PostMapping("update-cafe-form.do")
	public ModelAndView updateCafeForm(String cafeNo, Model model) {
		model.addAttribute("cafeNo", cafeNo);
		CafeVO cafeVO = new CafeVO();
		cafeVO = cafeService.findcafeByNoNotJoin(cafeNo);
		CafeOperatingTimeVO cafeOperVO = new CafeOperatingTimeVO();
		cafeOperVO = cafeService.findCafeByCafeNo(cafeNo);
		return new ModelAndView("cafe/updateCafeForm.tiles", "cafeOperVO", cafeOperVO);
	}

	// 카페정보수정하기
	@Transactional
	@Secured("ROLE_MANAGER")
	@PostMapping("update-cafe.do")
	public String updateCafe(CafeVO cafeVO,CafeOperatingTimeVO cafeOperVO,MultipartHttpServletRequest request) { // 로그인한 유저정보 불러오기
		UserVO uvo = (UserVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		cafeVO.setUserVO(uvo);
		cafeOperVO.setCafeVO(cafeVO);
		if (cafeVO.getUploadFile() != null) {
			uploadPath = request.getSession().getServletContext().getRealPath("/resources/upload/");
			File uploadDir = new File(uploadPath);
			if (uploadDir.exists() == false)
				uploadDir.mkdirs();
			MultipartFile file = cafeVO.getUploadFile();
			if (file != null && file.isEmpty() == false) {
				File uploadFile = new File(uploadPath + file.getOriginalFilename());
				try {
					file.transferTo(uploadFile);
					cafeVO.setCafePic((file.getOriginalFilename()));
					String localPath = "C:\\kosta203\\Final-project\\FinalPj_RoastStars\\roaststars\\src\\main\\webapp\\resources\\upload";
					File localPathDir = new File(localPath);
					if (localPathDir.exists() == false)
						localPathDir.mkdirs();
					FileCopyUtils.copy(uploadFile,
							new File(localPath + File.separator + file.getOriginalFilename()));
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
			}
		}
		cafeService.updateCafe(cafeVO, cafeOperVO);
		cafeOperVO = cafeService.findCafeByCafeNo(cafeVO.getCafeNo());
		// cafeNo 보내주기
	    String cafeNo = cafeOperVO.getCafeVO().getCafeNo();
	    return "redirect:register-cafe-result.do?cafeNo="+cafeNo;
	}
	
	// 카페정보수정 후 결과페이지로 이동
	@Secured({"ROLE_MANAGER","ROLE_ADMIN"})
	@RequestMapping("update-cafe-result.do")
    public ModelAndView viewUpdateCafeResult(String cafeNo) {
 	   return new ModelAndView("cafe/updateCafeResult.tiles",
 			   "cafeNo", cafeNo);
    }
	
	// 카페 삭제하기
	@Secured({"ROLE_MANAGER","ROLE_ADMIN"})
    @PostMapping("deleteCafe-Ajax.do")
    @ResponseBody
    public String deleteCafe(String cafeNo) {
       return cafeService.deleteCafe(cafeNo);
    }

	// 카페 메뉴 수정 폼
	@Secured({"ROLE_MANAGER","ROLE_ADMIN"})
	@RequestMapping("update-menuForm.do")
	public ModelAndView updateMenuForm(String cafeNo) {
		return new ModelAndView("cafe/updateMenuForm.tiles","cafeNo",cafeNo);
	}
	
	// 메뉴 ajax로 수정하기
	@Secured({"ROLE_MANAGER","ROLE_ADMIN"})
	@PostMapping("updateMenu-Ajax.do")
	@ResponseBody
	public MenuVO updateMenu(MenuVO menuVO,String cafeNo) {
		UserVO uvo = (UserVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		CafeVO cafeVO = new CafeVO();
		cafeVO= cafeService.findcafeByNoNotJoin(cafeNo);
		cafeVO.setUserVO(uvo);
		menuVO.setCafeVO(cafeVO);
		cafeService.updateMenu(menuVO);
		return menuVO;
	}
	
	
	// 메뉴 리스트 불러오기
	@Secured({"ROLE_MANAGER","ROLE_ADMIN"})
	@RequestMapping("update-menuList.do")
	@ResponseBody
	public ModelAndView updateMenuList(String cafeNo, Model model) {
		List<MenuVO> list = cafeService.updateMenuList(cafeNo);
		model.addAttribute("cafeNo", cafeNo);
		return new ModelAndView("cafe/updateMenuList.tiles", "menuList", list);
	}
	
	// 메뉴 이름 중복 체크
	@Secured({"ROLE_MANAGER","ROLE_ADMIN"})
	@RequestMapping("menuName-checkAjax.do")
	@ResponseBody
	public String menuNamecheckAjax(String cafeNo, String menuName) {
		return cafeService.menuNameCheck(cafeNo,menuName);
	}
	
	// 메뉴 삭제
	@Secured({"ROLE_MANAGER","ROLE_ADMIN"})
	@PostMapping("deleteMenu-Ajax.do")
	@ResponseBody
	public String deleteMenu(String cafeNo, String menuName) {
		return cafeService.deleteMenu(cafeNo,menuName);
	}
}
