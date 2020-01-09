package com.biz.rbooks.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.biz.rbooks.domain.BookDTO;
import com.biz.rbooks.repository.BookDao;

@Service
public class BookService {

	protected final BookDao bDao;

	@Autowired
	public BookService(BookDao bDao) {
		super();
		this.bDao = bDao;
	}
	
	public List<BookDTO> selectAll(){
		return bDao.selectAll();
	}
	
	public BookDTO findByCode(String b_code) {
		BookDTO bookDTO = bDao.findByCode(b_code);
		return bookDTO;
	}
	
	public List<BookDTO> selectNameSearch(String b_name){
		List<BookDTO> bList  = bDao.findByName(b_name);
		
		return bList;
	}
	
}
