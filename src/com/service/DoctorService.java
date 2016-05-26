package com.service;

import com.model.Doctor;

public interface DoctorService {
	public Doctor find(String name);

	public void save(Doctor doctor);

	public Doctor modify(Doctor doctor);

}
