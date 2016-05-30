package com.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.model.Hospital;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.util.ValueStack;
import com.service.HospitalService;

public class FindHospitalByRegionAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private String region;
	private HospitalService hospitalService;
	
	@Override
	public String execute() throws Exception {
		ActionContext context = ActionContext.getContext();
		ValueStack stack = context.getValueStack();
		String region = (String)stack.findValue("region");
		
		System.out.println(region);
		
		if (region != null && region.length() > 0) {
			List<Hospital> hospitals = this.hospitalService.find(region);
			if(hospitals == null){
				return ERROR;
			} else{
				HttpServletRequest request = ServletActionContext.getRequest();
				HttpSession session = request.getSession();
				session.setAttribute("hospitals", hospitals);
				return SUCCESS;
			}
		}
		
		return ERROR;
	}
	
	public String getRegion(){
		return region;
	}
	
	public void setRegion(String region){
		this.region = region;
	}
	
	public HospitalService getHospitalService(){
		return hospitalService;
	}
	
	public void setHospitalService(HospitalService hospitalService){
		this.hospitalService = hospitalService;
	}

}
