package com.action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.model.Hospital;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.util.ValueStack;
import com.service.HospitalService;

public class FindHospitalByIdAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private int id;
	private HospitalService hospitalService;
	
	@Override
	public String execute() throws Exception {
		ActionContext context = ActionContext.getContext();
		ValueStack stack = context.getValueStack();
		int id = (int)stack.findValue("id");
		
		System.out.println(id);
		
		if (id > 0) {
			Hospital hospital = this.hospitalService.find(id);
			if(hospital == null){
				return SUCCESS;
			} else{
				HttpServletRequest request = ServletActionContext.getRequest();
				HttpSession session = request.getSession();
				session.setAttribute("hospital", hospital);
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
	
	public HospitalService getHospitalService(){
		return hospitalService;
	}
	
	public void setHospitalService(HospitalService hospitalService){
		this.hospitalService = hospitalService;
	}

}
