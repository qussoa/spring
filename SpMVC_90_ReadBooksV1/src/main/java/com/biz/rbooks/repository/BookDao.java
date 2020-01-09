package com.biz.rbooks.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.biz.rbooks.domain.BookDTO;

public interface BookDao {

	@Select("SELECT * FROM TBL_BOOKS")
	public List<BookDTO> selectAll();
	
	@Select("SELECT * FROM TBL_BOOKS WHERE b_code = #{b_code}")
	public BookDTO findByCode(String b_code);

	@Select("SELECT * FROM tbl_books WHERE b_name LIKE '%' || #{b_name} || '%' ")
	public List<BookDTO> findByName(@Param("b_name") String b_name);
	
	
}
