package com.dao;

import java.util.List;

import com.model.Doctor;

public interface DoctorDao {
	public void insert(Doctor doctor);

	public void delete(Doctor doctor);

	public Doctor update(Doctor doctor);

	public Doctor query(String name);

	public List<Doctor> query(int hid,int depId);

}
