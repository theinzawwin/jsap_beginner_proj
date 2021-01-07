package com.best.service;


import com.best.dao.StudentDao;
import com.best.model.Student;

public class StudentService {
	
	private StudentDao studentDao;
	public StudentService(){
		studentDao=new StudentDao();
	}
	public void saveStudent(Student std){
		studentDao.saveStudent(std);
	}
	public List<Student> getStudentList(){
		
		return studentDao.getStudentList();
	}

}
