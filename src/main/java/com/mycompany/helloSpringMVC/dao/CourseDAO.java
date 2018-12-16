package com.mycompany.helloSpringMVC.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.mycompany.helloSpringMVC.model.Course;
import com.mycompany.helloSpringMVC.model.SemesterSubject;

@Repository
public class CourseDAO {
	private JdbcTemplate jdbcTemplate;

	@Autowired
	public void setDataSource(DataSource dataSource) { // BasicDataSource implements DataSource
		jdbcTemplate = new JdbcTemplate(dataSource);
	}

	public List<SemesterSubject> getCourseBySemester(List<SemesterSubject> semesterSubject) {

		String sql;
		int n;
		
		for(SemesterSubject s : semesterSubject) {
			sql = "select sum(credit) from academicRecord where year = ? and semester = ?";
			n = jdbcTemplate.queryForObject(sql, new Object[] {s.getYear(), s.getSemester()}, Integer.class);
			s.setTotalCredit(Integer.toString(n));
		}
		
		return semesterSubject;
	}
	
	public List<SemesterSubject> getSemester() {
		String sql = "select distinct year, semester from academicRecord";
		
		return jdbcTemplate.query(sql, new RowMapper() {

			@Override
			public Object mapRow(ResultSet rs, int rowNum) throws SQLException {

				SemesterSubject semesterSubject = new SemesterSubject();
				semesterSubject.setYear(rs.getString("year"));
				semesterSubject.setSemester(rs.getString("semester"));

				return semesterSubject;

			}

		});

	}

	public List<Course> getCourses() {
		String sql = "select * from academicRecord";
		return jdbcTemplate.query(sql, new RowMapper() {

			@Override
			public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
				Course course = new Course();

				course.setYear(rs.getString("year"));
				course.setSemester(rs.getString("semester"));
				course.setSubjectCord(rs.getString("subjectCord"));
				course.setCourseTitle(rs.getString("courseTitle"));
				course.setClassify(rs.getString("classify"));
				course.setCredit(rs.getString("credit"));

				return course;
			}
		});
	}

	public List<Course> getSpecificCourses(String year, String semester) {
		String sql = "select * from academicRecord where year = ? and semester = ?";
		return jdbcTemplate.query(sql, new Object[] {year, semester} , new RowMapper() {

			@Override
			public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
				Course course = new Course();

				course.setYear(rs.getString("year"));
				course.setSemester(rs.getString("semester"));
				course.setSubjectCord(rs.getString("subjectCord"));
				course.setCourseTitle(rs.getString("courseTitle"));
				course.setClassify(rs.getString("classify"));
				course.setCredit(rs.getString("credit"));

				return course;
			}
		});
	}
	
	public boolean insert(Course course) {
		String year = course.getYear();
		String semester = course.getSemester();
		String subjectCord = course.getSubjectCord();
		String courseTitle = course.getCourseTitle();
		String classify = course.getClassify();
		String credit = course.getCredit();

		String sql = "insert into academicRecord (year, semester, subjectCord, courseTitle, classify, credit) values (?,?,?,?,?,?)";
		return (jdbcTemplate.update(sql,
				new Object[] { year, semester, subjectCord, courseTitle, classify, credit }) == 1);

	}
}
