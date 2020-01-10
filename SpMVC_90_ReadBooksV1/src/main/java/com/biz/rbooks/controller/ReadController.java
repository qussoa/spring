package com.biz.rbooks.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.biz.rbooks.domain.ReadBookDTO;
import com.biz.rbooks.service.ReadService;

@Controller
public class ReadController {
	
	@Autowired
	ReadService rService;
	
	@RequestMapping(value = "view",method = RequestMethod.GET)
	public String view(Model model, long seq) {
		
		List<ReadBookDTO> readList = new ArrayList<ReadBookDTO>();
		
		readList = rService.findBySeq();
		model.addAttribute("READLIST",readList);
		
		return "list";
	}
}
