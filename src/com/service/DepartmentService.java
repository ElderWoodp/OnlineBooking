package com.service;

import java.util.List;

import com.model.Department;

public interface DepartmentService {
	public Department find(int id);
	
	public List<Department> find();

	public void save(Department department);

	public Department modify(Department department);

}
