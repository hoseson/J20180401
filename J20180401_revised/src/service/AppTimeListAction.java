package service;

import java.io.IOException;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.org.apache.bcel.internal.generic.NEW;

import dao.AppointmentDTO;
import dao.SearchDAO;

public class AppTimeListAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String date = request.getParameter("date");
			String docName = request.getParameter("docName");
			String deptNo = request.getParameter("deptNo");
			String memNo = request.getParameter("memNo");
			
			DateFormat inputFormat = new SimpleDateFormat("EEE MMM dd HH:mm:ss zzz yyyy", Locale.US);
			Date inputDate = (Date)inputFormat.parse(date);
			DateFormat outputFormat = new SimpleDateFormat("yy/MM/dd");
			String selectedDate = outputFormat.format(inputDate);
			
			String[] timeLists = {"09:00", "09:30", "10:00", "10:30", "11:00", "11:30", "13:00", "13:30", "14:00", "14:30", "15:00",
								 "15:30", "16:00", "16:30"};
			List<String> timeList = new ArrayList<String>();
			for (int i = 0; i < timeLists.length; i++) {
				timeList.add(timeLists[i]);
			}
			
			SearchDAO searchDAO = SearchDAO.getInstance();
			List<String> takenTimeList = searchDAO.timeSelect(memNo, docName, deptNo, selectedDate);
			String takenTimeString = "";
			for (int i = 0; i < takenTimeList.size(); i++) {
				takenTimeString = takenTimeString + takenTimeList.get(i);
			}
			
			List<String> availableTimeList = new ArrayList<String>();
			if (takenTimeList.size() == 0) {
				for (int i = 0; i < timeList.size(); i++) {
					availableTimeList.add(timeList.get(i));
				}
			} else {
				for (int i = 0; i < timeList.size(); i++) {
					if (!takenTimeString.contains(timeList.get(i))) {
						availableTimeList.add(timeList.get(i));
					}
				}
			}
			request.setAttribute("date", selectedDate);
			request.setAttribute("docName", docName);
			request.setAttribute("deptNo", deptNo);
			request.setAttribute("availableTimeList", availableTimeList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "appTimeList.jsp";
	}

}
