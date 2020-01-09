package com.biz.rbooks.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.biz.rbooks.domain.BookDTO;
import com.biz.rbooks.service.BookService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping(value = "/book")
@Controller
public class BookController {
	
	@Autowired
	BookService bService;
	
	@RequestMapping(value = "/list",method = RequestMethod.GET)
	public String search( Model model,String b_name) {
		
		List<BookDTO> bList = new ArrayList<BookDTO>();
		
		bList = bService.selectNameSearch(b_name);
		model.addAttribute("BOOKLIST",bList);
		
		log.debug(bList.toString());
		
		return "list";
	}
}
