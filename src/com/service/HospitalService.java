package com.service;

import com.model.Hospital;

public interface HospitalService {
	public Hospital find(String name);

	public void save(Hospital hospital);

	public Hospital modify(Hospital hospital);

}
