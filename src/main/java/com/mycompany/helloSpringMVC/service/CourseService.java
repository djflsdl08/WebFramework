package com.mycompany.helloSpringMVC.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.helloSpringMVC.dao.CourseDAO;
import com.mycompany.helloSpringMVC.model.Course;
import com.mycompany.helloSpringMVC.model.SemesterSubject;

@Service
public class CourseService {

	@Autowired
	private CourseDAO courseDao;
	
	public List<SemesterSubject> getCourseBySemester() {
		return courseDao.getCourseBySemester(courseDao.getSemester());
	}
	
	public List<Course> getCourses() {
		return courseDao.getCourses();
	}
	
	public List<Course> getSpecificCourses(String year, String semester) {
		return courseDao.getSpecificCourses(year,semester);
	}
	
	public void insert(Course course) {	
		courseDao.insert(course);
	}
}
