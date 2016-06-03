package com.action;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.model.Doctor;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.util.ValueStack;
import com.service.DoctorService;

public class GetOrderStateAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private DoctorService doctorService;
	private int docId;
	private String dayPart;
	private int dayOfWeek;
	
	@Override
	public String execute() throws Exception {
		ActionContext context = ActionContext.getContext();
		ValueStack stack = context.getValueStack();
		int docId = (int)stack.findValue("docId");
		String dayPart = (String)stack.findValue("dayPart");
		int dayOfWeek = (int)stack.findValue("dayOfWeek");
		
		System.out.println(docId);
		System.out.println(dayPart);
		System.out.println(dayOfWeek);
		
		if ( docId > 0 && dayPart != null && dayOfWeek > 0) {
			Doctor doctor = this.doctorService.find(docId);
			Map<String,Integer> maps = new HashMap<String,Integer>();
			
			if(doctor != null){
				String[] records = doctor.getScheduling().split(",");
				for(int i = 0; i < records.length; i++){
					String dPart;
					int wDay = 0;
					String[] reParts = records[i].split(" ");
					String[] timeParts = reParts[1].split("-");
					
					if(timeParts[0].split(":")[0].compareTo("14") >= 0){
						dPart = "pm";
					} else{
						dPart = "am";
					}
					
					switch(reParts[0]){
					case "周一": wDay = 1; break;
					case "周二": wDay = 2; break;
					case "周三": wDay = 3; break;
					case "周四": wDay = 4; break;
					case "周五": wDay = 5; break;
					case "周六": wDay = 6; break;
					case "周日": wDay = 7; break;
					}
					
					if(dPart.equals(dayPart) && wDay == dayOfWeek){
						maps.put(reParts[1], Integer.parseInt(reParts[2]));
					}

				}
				HttpServletRequest request = ServletActionContext.getRequest();
				HttpSession session = request.getSession();
				session.setAttribute("maps", maps);
				return SUCCESS;
			
			}
			return ERROR;
		}
		return ERROR;
		
	}
	
	
	public DoctorService getDoctorService(){
		return doctorService;
	}
	
	public void setDoctorService(DoctorService doctorService){
		this.doctorService = doctorService;
	}
	
	public int getDocId(){
		return docId;
	}
	
	public void setDocId(int docId){
		this.docId = docId;
	}
	
	public String getDayPart(){
		return dayPart;
	}
	
	public void setDayPart(String dayPart){
		this.dayPart = dayPart;
	}
	
	public int getDayOfWeek(){
		return dayOfWeek;
	}
	
	public void setDayOfWeek(int dayOfWeek){
		this.dayOfWeek = dayOfWeek;
	}

}
