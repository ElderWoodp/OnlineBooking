package com.service;

import java.util.List;

import com.model.HospitalDepartment;

public interface HospitalDepartmentService {
	public List<HospitalDepartment> find(int hid);

	public void save(HospitalDepartment hospitalDepartment);

	public HospitalDepartment modify(HospitalDepartment hospitalDepartment);

}
