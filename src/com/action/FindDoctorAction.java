package com.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import com.model.Doctor;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.util.ValueStack;
import com.service.DoctorService;

public class FindDoctorAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private DoctorService doctorService;
	private int hid;
	private int depId;
	
	@Override
	public String execute() throws Exception {
		ActionContext context = ActionContext.getContext();
		ValueStack stack = context.getValueStack();
		int hid = (int)stack.findValue("hid");
		int depId = (int)stack.findValue("depId");
		
		System.out.println(hid);
		System.out.println(depId);
		
		if ( hid > 0 && depId > 0) {
			List<Doctor> doctors = this.doctorService.find(hid,depId);
			
			if(doctors == null){
				return SUCCESS;
			} else{
				HttpServletRequest request = ServletActionContext.getRequest();
				HttpSession session = request.getSession();
				session.setAttribute("doctors", doctors);
				return SUCCESS;
			}
		}
		
		return ERROR;
	}
	
	public DoctorService getDoctorService(){
		return doctorService;
	}
	
	public void setDoctorService(DoctorService doctorService){
		this.doctorService = doctorService;
	}
	
	public int getHid(){
		return hid;
	}
	
	public void setHid(int hid){
		this.hid = hid;
	}
	
	public int getDepId(){
		return depId;
	}
	
	public void setDepId(int depId){
		this.depId = depId;
	}

}
