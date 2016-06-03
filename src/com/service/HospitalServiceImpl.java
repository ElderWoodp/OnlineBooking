package com.service;

import java.util.List;

import com.dao.HospitalDao;
import com.model.Hospital;

public class HospitalServiceImpl implements HospitalService {
	private HospitalDao hospitalDao;
	
	public Hospital find(int id){
		Hospital hospital = null;
		hospital = this.hospitalDao.query(id);
		return hospital;
	}
	
	public List<Hospital> find(){
		List<Hospital> hospitals = null;
		hospitals = this.hospitalDao.query();
		return hospitals;
	}

	public List<Hospital> find(String region) {
		List<Hospital> hospitals = null;
		hospitals = this.hospitalDao.query(region);
		return hospitals;
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
