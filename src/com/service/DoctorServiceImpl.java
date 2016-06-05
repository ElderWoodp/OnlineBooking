package com.service;

import java.util.List;

import com.dao.DoctorDao;
import com.model.Doctor;

public class DoctorServiceImpl implements DoctorService {
	private DoctorDao doctorDao;

	public Doctor find(int id) {
		Doctor doctor = null;
		doctor = this.doctorDao.query(id);
		return doctor;
	}
	
	public List<Doctor> find(int hid,int depId){
		List<Doctor> doctors = null;
		doctors = this.doctorDao.query(hid, depId);
		return doctors;
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
