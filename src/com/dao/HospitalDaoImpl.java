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
		return this.query(hospital.getName());
	}

	@Override
	public Hospital query(String name) {
		String hql = "from Hospital hospital where hospital.name=:n";
		List<Hospital> hospitals = this.hibernateTemplate.findByNamedParam(hql, "n",name);
		Hospital hospital = null;
		if (hospitals != null && hospitals.size() > 0) {
			hospital = hospitals.get(0);
		} else {
			System.out.println("query():hospitals.size=" + hospitals.size());
		}
		return hospital;
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
