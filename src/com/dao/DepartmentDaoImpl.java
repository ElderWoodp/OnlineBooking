package com.dao;

import java.util.List;

import org.springframework.orm.hibernate3.HibernateTemplate;
import com.dao.DepartmentDao;
import com.model.Department;


public class DepartmentDaoImpl implements DepartmentDao {
	private HibernateTemplate hibernateTemplate;

	public void delete(Department department) {
		this.hibernateTemplate.delete(department);
	}

	public void insert(Department department) {
		this.hibernateTemplate.save(department);
	}

	public Department query(String name) {
		String hql = "from Department department where department.name=:n";
		List<Department> departments = this.hibernateTemplate.findByNamedParam(hql, "n",name);
		Department department = null;
		if (departments != null && departments.size() > 0) {
			department = departments.get(0);
		} else {
			System.out.println("query():users.size=" + departments.size());
		}
		return department;
	}

	public List<Department> query() {
		String hql = "from Department department";
		List<Department> departments = this.hibernateTemplate.find(hql);
		return departments;
	}

	public Department update(Department department) {
		this.hibernateTemplate.update(department);
		return this.query(department.getName());
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
}
