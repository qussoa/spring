package com.biz.product.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.biz.product.domain.ProductDTO;
import com.biz.product.service.ProductService;

@Controller
public class ProductController {

	@Autowired
	ProductService pService;

	//@ResponseBody
	@RequestMapping(value = "plist", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public String getPlist(Model model) {
		List<ProductDTO> prolist= pService.selectAll();
		
		model.addAttribute("PLIST",prolist);
		return "p-list";
	}

	@ResponseBody
	@RequestMapping(value = "plist/name", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public List<ProductDTO> getNames(String p_name) {
		List<ProductDTO> prolist= pService.findByPNames(p_name);
		return prolist;
	}
	
	@ResponseBody
	@RequestMapping(value = "product", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public ProductDTO getProduct(String p_code) {
		ProductDTO proDTO = pService.findByPCode(p_code);
		return proDTO;
	}
	/*
	 * produces의 context-type 
	 * 서버에서
	 */
	
	@ResponseBody
	@RequestMapping(value = "pname", method = RequestMethod.GET, produces = "text/json;charset=UTF-8")
	public String getPName(String p_code) {
		ProductDTO proDTO = pService.findByPCode(p_code);
		//return proDTO.getP_name();
		return "<h1>" + proDTO.getP_name() +"</h1>";
	}
	@ResponseBody
	@RequestMapping(value = "oprice", method = RequestMethod.GET, produces = "text/html;charset=UTF-8")
	public String getOPrice(String p_code) {
		ProductDTO proDTO = pService.findByPCode(p_code);
		return proDTO.getP_oprice()+"";
	}
	@ResponseBody
	@RequestMapping(value = "iprice", method = RequestMethod.GET, produces = "text/html;charset=UTF-8")
	public String getIPrice(String p_code) {
		ProductDTO proDTO = pService.findByPCode(p_code);
		return proDTO.getP_iprice()+"";
	}
}
