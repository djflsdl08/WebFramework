package com.mycompany.helloSpringMVC.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.helloSpringMVC.model.Course;
import com.mycompany.helloSpringMVC.model.SemesterSubject;
import com.mycompany.helloSpringMVC.service.CourseService;

@Controller // component -> controller, service, Repository(dao)
public class CourseController {
	
	@Autowired
	private CourseService courseService;
	
	@RequestMapping("/showCourses")
	public String showCourse(Model model) {
		List<SemesterSubject> semesterSubject = courseService.getCourseBySemester();
		model.addAttribute("courseBySemesters", semesterSubject);
		
		return "showCourses";
	}
	
	@RequestMapping("/showCoursesDetail")
	public String showCourses(Model model,@RequestParam String year, @RequestParam String semester) {
		
		List<Course> courses = courseService.getSpecificCourses(year, semester);
		model.addAttribute("courses", courses);
				
		return "showCoursesDetail";
	}
	

	@RequestMapping("/enrollCourse")
	public String enrollCourse(Model model) {
		
		model.addAttribute("course", new Course());
		return "enrollCourse";
	}
	
	
	@RequestMapping("/doEnroll")
	public String doEnroll(Model model, @Valid Course course, BindingResult result) {
		
		System.out.println(course);
		
		if(result.hasErrors()) {
			System.out.println(">>>>>>>>> Form data does not validate! <<<<<<<<<<");
			List<ObjectError> errors = result.getAllErrors(); 
			
			for(ObjectError error : errors) {
				System.out.println(error.getDefaultMessage());
			}
			
			return "enrollCourse";
		}
		courseService.insert(course);
		
		return "courseEnrolled";
	}
	
	@RequestMapping("/enrolledCourse")
	public String viewEnrolledCourse(Model model) {
		List<Course> courses = courseService.getSpecificCourses(Integer.toString(2019), Integer.toString(1));
		model.addAttribute("courses", courses);
		return "enrolledCourse";
	}
	
}
