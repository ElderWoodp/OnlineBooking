package com.service;

import java.util.List;

import com.dao.HospitalDao;
import com.model.Hospital;

public class HospitalServiceImpl implements HospitalService {
	private HospitalDao hospitalDao;
	
	public List<Hospital> find(){
		List<Hospital> hospitals = null;
		hospitals = this.hospitalDao.query();
		return hospitals;
	}

	public Hospital find(String name) {
		Hospital hospital = null;
		hospital = this.hospitalDao.query(name);
		return hospital;
	}

	public void save(Hospital hospital) {
		this.hospitalDao.insert(hospital);
	}

	public Hospital modify(Hospital hospital) {
		return this.hospitalDao.update(hospital);
	}

	public void setHospitalDao(HospitalDao hospitalDao) {
		this.hospitalDao = hospitalDao;
	}

}
