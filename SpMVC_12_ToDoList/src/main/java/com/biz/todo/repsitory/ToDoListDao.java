package com.biz.todo.repsitory;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.biz.todo.domain.ToDoList;

public interface ToDoListDao {

	public List<ToDoList> selectAll();
	public ToDoList findBySeq(long tdSeq);
	
	public List<ToDoList> findBySubject(String tdSubject);
	
	public int insert(ToDoList toDoList);
	public int update(ToDoList todoList);
	public int delete(long tdSeq);
	
	public int complete(@Param("tdSeq") long tdSeq, 
						@Param("tdComplete") String tdComplete);
	public int alarm(@Param("tdSeq")long tdSeq, 
					 @Param("tdAlarm")String tdAlarm);

}
