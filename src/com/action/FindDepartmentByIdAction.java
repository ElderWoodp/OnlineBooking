package com.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.model.Department;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.util.ValueStack;
import com.service.DepartmentService;


public class FindDepartmentByIdAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private int id;
	private DepartmentService departmentService;
	
	@Override
	public String execute() throws Exception {
		ActionContext context = ActionContext.getContext();
		ValueStack stack = context.getValueStack();
		int id = (int)stack.findValue("id");
		
		System.out.println(id);
		
		if (id > 0) {
			Department department = this.departmentService.find(id);
			if(department == null){
				return SUCCESS;
			} else{
				HttpServletRequest request = ServletActionContext.getRequest();
				HttpSession session = request.getSession();
				session.setAttribute("department", department);
				return SUCCESS;
			}
		}
		
		return ERROR;
	}
	
	public int getId(){
		return id;
	}
	
	public void setId(int id){
		this.id = id;
	}
	
	public DepartmentService getDepartmentService(){
		return departmentService;
	}
	
	public void setDepartmentService(DepartmentService departmentService){
		this.departmentService = departmentService;
	}
}
