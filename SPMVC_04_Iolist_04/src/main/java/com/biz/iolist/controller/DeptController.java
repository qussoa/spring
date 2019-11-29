package com.biz.iolist.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.biz.iolist.domain.DeptDTO;
import com.biz.iolist.service.DeptService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping(value = "/dept")
@Controller
public class DeptController {

	@Autowired
	DeptService dService;

	@RequestMapping(value = "/search",method = RequestMethod.GET)
	public String search(String strText,Model model) {
		
		List<DeptDTO> dList = dService.selectNameSearch(strText);
		model.addAttribute("DEPTLIST",dList);
		
		return "dept/list-body";
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list() {

		/*
		 * Model(ui.model) class와 같은 역할을 수행하는 string class 사용법이 조금 다른 형식 여기에는 view와 객체를
		 * 동시에 담아서 Dispatcher에게 객체를 return 해주는 형식으로 사용
		 */
		ModelAndView mView = new ModelAndView();

		List<DeptDTO> deptList = dService.getAllList();
		// return "/dept/list" 와같은 역할
		mView.setViewName("/dept/list");

		// model.addAtribute("DEPTLIST",deptList)와같은 역할
		mView.addObject("DEPTLIST", deptList);
		// return String 이 아닌 return mView
		return mView;
	}

	/*
	 * 입력 form을 보여주고 데이터를 입력 받도록 시작하는 절차
	 */

	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String input(Model model) {

		return "dept/input";
	}

	/*
	 * 입력 form에서 데이터를 입력하고 전성(저장) 버튼을 클릭하면 데이터를 가지고 호출될 method
	 */
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String input(DeptDTO dto, Model model) {

		log.debug("거래처정보" + dto.toString());
		int ret = dService.insert(dto);
		/*
		 * redirect: 문자열로 시작되는 return view(*.jsp, /dept/list.jsp)를 호출하라는 것이 아닌
		 * http://localhost:8080/context/dept/list 명령을 실행하라 메뉴에서 /dept/list 주소를 클릭하라
		 * 브라우저 주소창에 /dept/list를 입력하고 enter
		 */
		return "redirect:/dept/list";
	}

	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public String view(String d_code, Model model) {
		log.debug("거래처코드 : " + d_code);
		DeptDTO dto = dService.findByDCode(d_code);
		model.addAttribute("DEPT_DTO", dto);
		return null;
	}

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(String id, Model model) {

		int let = dService.delete(id);

		return "redirect:/dept/list";
	}

	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String update(String id, Model model) {
		
		DeptDTO dto = dService.findByDCode(id);
		model.addAttribute("DI", dto);
		return "dept/input";
		
	}
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(DeptDTO dto, Model model) {
		int ret = dService.update(dto);
		//dto = dService.findByDCode(d_code);
		//model.addAttribute("DI", dto);
		return "redirect:/dept/list";
	}
}
