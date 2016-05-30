package com.service;

import java.util.List;

import com.model.Doctor;

public interface DoctorService {
	public Doctor find(String name);
	
	public List<Doctor> find(int hid,int depId);

	public void save(Doctor doctor);

	public Doctor modify(Doctor doctor);

}
