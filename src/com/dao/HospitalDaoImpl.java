package com.dao;

import java.util.List;

import org.springframework.orm.hibernate3.HibernateTemplate;

import com.model.Hospital;
import com.model.User;

public class HospitalDaoImpl implements HospitalDao {
	private HibernateTemplate hibernateTemplate;

	@Override
	public void insert(Hospital hospital) {
		this.hibernateTemplate.save(hospital);

	}

	@Override
	public void delete(Hospital hospital) {
		this.hibernateTemplate.delete(hospital);

	}

	@Override
	public Hospital update(Hospital hospital) {
		this.hibernateTemplate.update(hospital);
		return this.query(hospital.getRegion()).get(0);
	}

	public Hospital query(int id){
		String hql = "from Hospital hospital where hospital.id=:n";
		List<Hospital> hospitals = this.hibernateTemplate.findByNamedParam(hql, "n", id);
		Hospital hospital = null;
		if(hospitals != null && hospitals.size() > 0){
			hospital = hospitals.get(0);
		} else{
			System.out.println("query():hospitals.size=" + hospitals.size());
		}
		return hospital;
		
	}
	
	@Override
	public List<Hospital> query(String region) {
		String hql = "from Hospital hospital where hospital.region=:n";
		List<Hospital> hospitals = this.hibernateTemplate.findByNamedParam(hql, "n",region);
		return hospitals;
	}

	@Override
	public List<Hospital> query() {
		String hql = "from Hospital hospital";
		List<Hospital> hospitals = this.hibernateTemplate.find(hql);
		return hospitals;
	}
	
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate){
		this.hibernateTemplate = hibernateTemplate;
	}

}
