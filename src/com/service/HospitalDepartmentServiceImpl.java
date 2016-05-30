package com.service;

import java.util.List;

import com.dao.HospitalDepartmentDao;
import com.model.HospitalDepartment;

public class HospitalDepartmentServiceImpl implements HospitalDepartmentService {
	private HospitalDepartmentDao hospitalDepartmentDao;

	public List<HospitalDepartment> find(int hid) {
		List<HospitalDepartment> hospitalDepartments = null;
		hospitalDepartments = this.hospitalDepartmentDao.queryDep(hid);
		return hospitalDepartments;
	}

	public void save(HospitalDepartment hospitalDepartment) {
		this.hospitalDepartmentDao.insert(hospitalDepartment);
	}

	public HospitalDepartment modify(HospitalDepartment hospitalDepartment) {
		return this.hospitalDepartmentDao.update(hospitalDepartment);
	}

	public void setHospitalDepartmentDao(HospitalDepartmentDao hospitalDepartmentDao) {
		this.hospitalDepartmentDao = hospitalDepartmentDao;
	}

}
