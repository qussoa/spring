package com.biz.rbooks.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.biz.rbooks.domain.ReadBookDTO;
import com.biz.rbooks.repository.BookReadDao;

@Service
public class ReadService {

	private final BookReadDao readDao;

	@Autowired
	public ReadService(BookReadDao readDao) {
		super();
		this.readDao = readDao;
	}
	
	public List<ReadBookDTO> selectAll() {
		return readDao.selectAll();
	}

	public List<ReadBookDTO> findBySeq() {
		List<ReadBookDTO> readList = readDao.findBySeq();
		return readList;
	}
	
}
