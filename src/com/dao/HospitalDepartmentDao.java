package com.dao;

import java.util.List;

import com.model.HospitalDepartment;

public interface HospitalDepartmentDao {
	public void insert(HospitalDepartment hospitalDepartment);

	public void delete(HospitalDepartment hospitalDepartment);

	public HospitalDepartment update(HospitalDepartment hospitalDepartment);

	public HospitalDepartment query(int id);
	
	public List<HospitalDepartment> queryDep(int hid);
	
	public List<HospitalDepartment> query();

}
