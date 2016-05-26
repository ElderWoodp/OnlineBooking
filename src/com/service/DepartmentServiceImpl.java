package com.service;

import com.dao.DepartmentDao;
import com.model.Department;


public class DepartmentServiceImpl implements DepartmentService {
	private DepartmentDao departmentDao;

	public Department find(String name) {
		Department department = null;
		department = this.departmentDao.query(name);
		return department;
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
