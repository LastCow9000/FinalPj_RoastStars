package com.beans.roaststars.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.beans.roaststars.model.service.BeansPickService;

@Controller
public class BeansPickController {
	@Resource
	private BeansPickService beansPickService;

	@RequestMapping("beansPick-form.do")
	public String beansPickForm(Model model) {
		model.addAttribute("list", beansPickService.getAllBeansPickList());
		return "beansPick/beansPickForm.tiles";
	}

	@RequestMapping("beansPick-detail.do")
	public String beansPickDetail(String no, Model model) {
		model.addAttribute("beansNo", beansPickService.getOneBeansPick(no));
		return "beansPick/beansPickDetail.tiles";
	}

}
