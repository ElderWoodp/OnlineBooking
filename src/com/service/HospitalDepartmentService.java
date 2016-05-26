package com.service;

import com.model.HospitalDepartment;

public interface HospitalDepartmentService {
	public HospitalDepartment find(int id);

	public void save(HospitalDepartment hospitalDepartment);

	public HospitalDepartment modify(HospitalDepartment hospitalDepartment);

}
