package com.beans.roaststars.controller;

import java.io.File;
import java.io.IOException;

import javax.annotation.Resource;

import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.beans.roaststars.model.service.BeansPickService;
import com.beans.roaststars.model.vo.BeansPickListVO;
import com.beans.roaststars.model.vo.BeansPickVO;
import com.beans.roaststars.model.vo.UserVO;

@Controller
public class BeansPickController {
	@Resource
	private BeansPickService beansPickService;
	private String uploadPath;
	//빈즈픽 게시글 리스트
	@RequestMapping("main-beansPick.do")
	public String beansPickForm(String pageNo,Model model) {
//		model.addAttribute("list", beansPickService.getAllBeansPickList());
		model.addAttribute("beansPickTotalCount", beansPickService.getTotalCountBeansPick());
		BeansPickListVO lvo=beansPickService.getAllBeansPickList(pageNo);
		model.addAttribute("lvo",lvo);
		return "beansPick/mainBeansPick.tiles";
	}
	//빈즈픽 게시글 하나
	@RequestMapping("detail-beansPick.do")
	public String beansPickDetail(String no, Model model) {
		model.addAttribute("BeansPickNo", beansPickService.getOneBeansPick(no));
		return "beansPick/detailBeansPick.tiles";
	}
	//빈즈픽 등록폼
	@RequestMapping("register-form-beansPick.do")
	public String registerFormBeansPick() {
		return "beansPick/registerFormBeansPick.tiles";
	}

	//빈즈픽 등록
	@Secured("ROLE_ADMIN")
	@PostMapping("register-result-beansPick.do")
	public ModelAndView registerResultBeansPick(BeansPickVO beansPickVO,MultipartHttpServletRequest request) {
		UserVO uvo = (UserVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		beansPickVO.setUserVO(uvo);
		if (beansPickVO.getUploadFile() !=null) {
			uploadPath=request.getSession().getServletContext().getRealPath("/resources/upload/");
			File uploadDir = new File(uploadPath);
			if (uploadDir.exists() == false)
				uploadDir.mkdirs();
			MultipartFile file = beansPickVO.getUploadFile();
			if (file != null && file.isEmpty() == false) {
				File uploadFile = new File(uploadPath + file.getOriginalFilename());
				try {
					file.transferTo(uploadFile);
					// System.out.println(uploadPath + file.getOriginalFilename());
					beansPickVO.setBeansPic(file.getOriginalFilename());
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
		beansPickService.registerBeansPick(beansPickVO);
		return new ModelAndView("beansPick/registerResultBeansPick.tiles", "beansPickVO", beansPickVO);
	}
	//빈즈픽 수정폼
	@RequestMapping("update-form-beansPick.do")
	public String updateFormBeansPick(String no, Model model) {
		model.addAttribute("beansPickVO", beansPickService.getOneBeansPick(no));
		return "beansPick/updateFormBeansPick.tiles";
	}
	
	//빈즈픽 수정
	@Secured("ROLE_ADMIN")
	@PostMapping("update-result-beansPick.do")
	public ModelAndView updateResultBeansPick(BeansPickVO beansPickVO,MultipartHttpServletRequest request) {
		UserVO uvo = (UserVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		beansPickVO.setUserVO(uvo);
		if (beansPickVO.getUploadFile() !=null) {
			uploadPath=request.getSession().getServletContext().getRealPath("/resources/upload/");
			File uploadDir = new File(uploadPath);
			if (uploadDir.exists() == false)
				uploadDir.mkdirs();
			MultipartFile file = beansPickVO.getUploadFile();
			if (file != null && file.isEmpty() == false) {
				File uploadFile = new File(uploadPath + file.getOriginalFilename());
				try {
					file.transferTo(uploadFile);
					// System.out.println(uploadPath + file.getOriginalFilename());
					beansPickVO.setBeansPic(file.getOriginalFilename());
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
//		beansPickVO=(BeansPickVO) beansPickService.getOneBeansPick(beansPickVO.getBeansNo());
		beansPickService.updateBeansPick(beansPickVO);
		return new ModelAndView("beansPick/updateResultBeansPick.tiles","beansPickVO", beansPickVO);
	}

	//빈즈픽 제거
	@Secured("ROLE_ADMIN")
	@PostMapping("delete-beansPick.do")
	public String deleteFormBeansPick(String no) {
		beansPickService.deleteBeansPick(no);
		return "beansPick/deleteBeansPick.tiles";
	}
}