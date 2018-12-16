package com.mycompany.helloSpringMVC.model;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class Course {	
	
	@Size(min=4, max=4, message = "Year must be 4 integers")
	@NotEmpty(message = "The year can not be empty")
	private String year;
	
	@Size(min=1, max=1, message = "Semester must be 1 integers")
	@NotEmpty(message = "The semester can not be empty")
	private String semester;
	
	@Size(min=4, max=8, message = "Subject cord must be between 4 and 8 characters")
	@NotEmpty(message = "The subject cord can not be empty")
	private String subjectCord;
	
	@Size(min=5, max=100, message = "Course title must be between 5 and 100 characters")
	@NotEmpty(message = "The course title can not be empty")
	private String courseTitle;
	
	@Size(min=7, max=20, message = "Classify must be between 7 and 20 characters")
	@NotEmpty(message = "The classify can not be empty")
	private String classify;
	
	@Size(min=1, max=1, message = "Credit must be 1 integers")
	@NotEmpty(message = "The credit can not be empty")
	private String credit;
}