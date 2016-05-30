package com.action;


import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import com.model.Department;
import com.opensymphony.xwork2.ActionSupport;
import com.service.DepartmentService;


public class FindAllDepartmentAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private DepartmentService departmentService;
	
	@Override
	public String execute() throws Exception {
		List<Department> departments = this.departmentService.find();
		if(departments == null){
			return ERROR;
		} else{
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session = request.getSession();
			session.setAttribute("departments", departments);
			return SUCCESS;
		}
	}
	
	public DepartmentService getDepartmentService(){
		return departmentService;
	}
	
	public void setDepartmentService(DepartmentService departmentService){
		this.departmentService = departmentService;
	}
	
}
