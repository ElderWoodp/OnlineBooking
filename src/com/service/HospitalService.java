package com.service;

import java.util.List;

import com.model.Hospital;

public interface HospitalService {
	
	public List<Hospital> find();
	
	public Hospital find(String name);

	public void save(Hospital hospital);

	public Hospital modify(Hospital hospital);

}
