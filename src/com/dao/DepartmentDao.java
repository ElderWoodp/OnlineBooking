package com.dao;

import java.util.List;

import com.model.Department;

public interface DepartmentDao {
	public void insert(Department department);

	public void delete(Department department);

	public Department update(Department department);

	public Department query(int id);

	public List<Department> query();

}
