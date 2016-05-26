package com.service;

import com.dao.HospitalDepartmentDao;
import com.model.HospitalDepartment;

public class HospitalDepartmentServiceImpl implements HospitalDepartmentService {
	private HospitalDepartmentDao hospitalDepartmentDao;

	public HospitalDepartment find(int id) {
		HospitalDepartment hospitalDepartment = null;
		hospitalDepartment = this.hospitalDepartmentDao.query(id);
		return hospitalDepartment;
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
