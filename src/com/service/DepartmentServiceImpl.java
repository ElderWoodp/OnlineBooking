package com.service;

import java.util.List;

import com.dao.DepartmentDao;
import com.model.Department;


public class DepartmentServiceImpl implements DepartmentService {
	private DepartmentDao departmentDao;

	public Department find(int id) {
		Department department = null;
		department = this.departmentDao.query(id);
		return department;
	}
	
	public List<Department> find(){
		List<Department> departments = null;
		departments = this.departmentDao.query();
		return departments;
	}

	public void save(Department department) {
		this.departmentDao.insert(department);
	}

	public Department modify(Department department) {
		return this.departmentDao.update(department);
	}

	public void setDepartmentDao(DepartmentDao departmentDao) {
		this.departmentDao = departmentDao;
	}
}
