package com.dao;

import java.util.List;

import org.springframework.orm.hibernate3.HibernateTemplate;
import com.dao.HospitalDepartmentDao;
import com.model.HospitalDepartment;


public class HospitalDepartmentDaoImpl implements HospitalDepartmentDao {
	private HibernateTemplate hibernateTemplate;

	public void delete(HospitalDepartment hospitalDepartment) {
		this.hibernateTemplate.delete(hospitalDepartment);
	}

	public void insert(HospitalDepartment hospitalDepartment) {
		this.hibernateTemplate.save(hospitalDepartment);
	}

	public HospitalDepartment query(int id) {
		String hql = "from HospitalDepartment hospitalDepartment where hospitalDepartment.id=:n";
		List<HospitalDepartment> hospitalDepartments = this.hibernateTemplate.findByNamedParam(hql, "n",id);
		HospitalDepartment hospitalDepartment = null;
		if (hospitalDepartments != null && hospitalDepartments.size() > 0) {
			hospitalDepartment = hospitalDepartments.get(0);
		} else {
			System.out.println("query():users.size=" + hospitalDepartments.size());
		}
		return hospitalDepartment;
	}
	
	public List<HospitalDepartment> queryDep(int hid){
		String hql = "from HospitalDepartment hospitalDepartment where hospitalDepartment.hid=:n";
		List<HospitalDepartment> hospitalDepartment = this.hibernateTemplate.findByNamedParam(hql, "n",hid);
		return hospitalDepartment;
	}

	public List<HospitalDepartment> query() {
		String hql = "from HospitalDepartment hospitalDepartment";
		List<HospitalDepartment> hospitalDepartments = this.hibernateTemplate.find(hql);
		return hospitalDepartments;
	}

	public HospitalDepartment update(HospitalDepartment hospitalDepartment) {
		this.hibernateTemplate.update(hospitalDepartment);
		return this.query(hospitalDepartment.getId());
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

}
