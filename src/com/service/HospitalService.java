package com.service;

import java.util.List;

import com.model.Hospital;

public interface HospitalService {
	
	public Hospital find(int id);
	
	public List<Hospital> find();
	
	public List<Hospital> find(String region);

	public void save(Hospital hospital);

	public Hospital modify(Hospital hospital);

}
