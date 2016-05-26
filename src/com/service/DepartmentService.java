package com.service;

import com.model.Department;

public interface DepartmentService {
	public Department find(String name);

	public void save(Department department);

	public Department modify(Department department);

}
