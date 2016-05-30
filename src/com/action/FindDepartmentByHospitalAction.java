package com.action;

import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.model.Department;
import com.model.HospitalDepartment;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.util.ValueStack;
import com.service.DepartmentService;
import com.service.HospitalDepartmentService;


public class FindDepartmentByHospitalAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private int hid;
	private HospitalDepartmentService hospitalDepartmentService;
	private DepartmentService departmentService;
	
	@Override
	public String execute() throws Exception {
		ActionContext context = ActionContext.getContext();
		ValueStack stack = context.getValueStack();
		int hid = (int)stack.findValue("hid");
		
		System.out.println(hid);
		
		if ( hid > 0) {
			List<HospitalDepartment> hospitalDepartments = this.hospitalDepartmentService.find(hid);
			List<Department> departments = new LinkedList<Department>();
			
			if(hospitalDepartments == null){
				return SUCCESS;
			} else{
				for(int i = 0; i < hospitalDepartments.size(); i++){
					Department department = this.departmentService.find(hospitalDepartments.get(i).getDepId());
					departments.add(department);
				}
				HttpServletRequest request = ServletActionContext.getRequest();
				HttpSession session = request.getSession();
				session.setAttribute("departments", departments);
				return SUCCESS;
			}
		}
		
		return ERROR;
	}
	
	public int getHid(){
		return hid;
	}
	
	public void setHid(int hid){
		this.hid = hid;
	}
	
	public HospitalDepartmentService getHospitalDepartmentService(){
		return hospitalDepartmentService;
	}
	
	public void setHospitalDepartmentService(HospitalDepartmentService hospitalDepartmentService){
		this.hospitalDepartmentService = hospitalDepartmentService;
	}
	
	public DepartmentService getDepartmentService(){
		return departmentService;
	}
	
	public void setDepartmentService(DepartmentService departmentService){
		this.departmentService = departmentService;
	}

}
