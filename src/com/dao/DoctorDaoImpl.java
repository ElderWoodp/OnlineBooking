package com.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.orm.hibernate3.HibernateTemplate;

import com.model.Doctor;


public class DoctorDaoImpl implements DoctorDao {
	private HibernateTemplate hibernateTemplate;

	public void delete(Doctor doctor) {
		this.hibernateTemplate.delete(doctor);
	}

	public void insert(Doctor doctor) {
		this.hibernateTemplate.save(doctor);
	}

	public Doctor query(int id) {
		String hql = "from Doctor doctor where doctor.id=:n";
		List<Doctor> doctors = this.hibernateTemplate.findByNamedParam(hql, "n",id);
		Doctor doctor = null;
		if (doctors != null && doctors.size() > 0) {
			doctor = doctors.get(0);
		} else {
			System.out.println("query():users.size=" + doctors.size());
		}
		return doctor;
	}

	public List<Doctor> query(int hid,int depId) {
		String hql = "from Doctor doctor where doctor.hid=:hid and doctor.depId=:depId";
		String[] paramName= new String[]{"hid", "depId"};
		Integer[] value = new Integer[]{hid,depId};
		List<Doctor> doctors = this.hibernateTemplate.findByNamedParam(hql, paramName, value);
		return doctors;
	}

	public Doctor update(Doctor doctor) {
		this.hibernateTemplate.update(doctor);
		return this.query(doctor.getId());
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

}
