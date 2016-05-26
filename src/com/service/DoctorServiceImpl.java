package com.service;

import com.dao.DoctorDao;
import com.model.Doctor;

public class DoctorServiceImpl implements DoctorService {
	private DoctorDao doctorDao;

	public Doctor find(String name) {
		Doctor doctor = null;
		doctor = this.doctorDao.query(name);
		return doctor;
	}

	public void save(Doctor doctor) {
		this.doctorDao.insert(doctor);
	}

	public Doctor modify(Doctor doctor) {
		return this.doctorDao.update(doctor);
	}

	public void setDoctorDao(DoctorDao doctorDao) {
		this.doctorDao = doctorDao;
	}

}
