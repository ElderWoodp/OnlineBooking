package com.dao;

import java.util.List;

import org.springframework.orm.hibernate3.HibernateTemplate;
import com.dao.DoctorDao;
import com.model.Doctor;


public class DoctorDaoImpl implements DoctorDao {
	private HibernateTemplate hibernateTemplate;

	public void delete(Doctor doctor) {
		this.hibernateTemplate.delete(doctor);
	}

	public void insert(Doctor doctor) {
		this.hibernateTemplate.save(doctor);
	}

	public Doctor query(String name) {
		String hql = "from Doctor doctor where doctor.name=:n";
		List<Doctor> doctors = this.hibernateTemplate.findByNamedParam(hql, "n",name);
		Doctor doctor = null;
		if (doctors != null && doctors.size() > 0) {
			doctor = doctors.get(0);
		} else {
			System.out.println("query():users.size=" + doctors.size());
		}
		return doctor;
	}

	public List<Doctor> query() {
		String hql = "from Doctor doctor";
		List<Doctor> doctors = this.hibernateTemplate.find(hql);
		return doctors;
	}

	public Doctor update(Doctor doctor) {
		this.hibernateTemplate.update(doctor);
		return this.query(doctor.getName());
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

}
