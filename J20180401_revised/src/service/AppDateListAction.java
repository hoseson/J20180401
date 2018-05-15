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

import dao.AppointmentDTO;
import dao.SearchDAO;

public class AppDateListAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String docName = request.getParameter("docName");
			String deptNo = request.getParameter("deptNo");
			String appNextMonth = request.getParameter("nowNext");
			String appPrevMonth = request.getParameter("nowPrev");
			String memNo = request.getParameter("memNo");
			String stringTime1 = "";
			String stringTime2 = "";
			List<String> takenTimeList = null;
			String[] timeLists = {"09:00", "09:30", "10:00", "10:30", "11:00", "11:30", "13:00", "13:30", "14:00", "14:30", "15:00",
								 "15:30", "16:00", "16:30"};
			for (int i = 0; i < timeLists.length; i++) {
				stringTime1 = stringTime1 + " " + timeLists[i];
			}
			List<String> timeList = new ArrayList<String>();
			for (String times : timeLists) {
				timeList.add(times);
			}
			Calendar cal = Calendar.getInstance();
			DateFormat sdf = new SimpleDateFormat("yy/MM/dd");
			int setYear = 0;
			int setMonth = 0;
			int setDay = 0;
			int monthFirstDay = 0;
			int monthLastDay = 0;
			int thisMonth = cal.get(Calendar.MONTH);
			if(appNextMonth != null){
				DateFormat inputFormat = new SimpleDateFormat("EEE MMM dd HH:mm:ss zzz yyyy", Locale.US);
				Date inputDate = (Date)inputFormat.parse(appNextMonth);
				DateFormat outputFormat = new SimpleDateFormat("yyyy/MM/dd");
				String now = outputFormat.format(inputDate);
				setYear = Integer.parseInt(now.substring(0, 4));
				setMonth = Integer.parseInt(now.substring(5, 7));
				Calendar fixedCal = Calendar.getInstance();
				fixedCal.set(setYear, setMonth, 1);
				setDay = 0;
				monthFirstDay = fixedCal.getMinimum(Calendar.DAY_OF_MONTH);
				monthLastDay = fixedCal.getActualMaximum(Calendar.DAY_OF_MONTH);
			} else if(appPrevMonth != null){
				DateFormat inputFormat = new SimpleDateFormat("EEE MMM dd HH:mm:ss zzz yyyy", Locale.US);
				Date inputDate = (Date)inputFormat.parse(appPrevMonth);
				DateFormat outputFormat = new SimpleDateFormat("yyyy/MM/dd");
				String now = outputFormat.format(inputDate);
				setYear = Integer.parseInt(now.substring(0, 4));
				setMonth = Integer.parseInt(now.substring(5, 7)) - 2;
				Calendar fixedCal = Calendar.getInstance();
				fixedCal.set(setYear, setMonth, 1);
				if (thisMonth == setMonth) {
					setDay = cal.get(Calendar.DAY_OF_MONTH);
				} else {
					setDay = 0;
				}
				monthFirstDay = fixedCal.getMinimum(Calendar.DAY_OF_MONTH);
				monthLastDay = fixedCal.getActualMaximum(Calendar.DAY_OF_MONTH);
			} else {
				setYear = cal.get(Calendar.YEAR);
				setMonth = cal.get(Calendar.MONTH);
				setDay = cal.get(Calendar.DAY_OF_MONTH);
				monthFirstDay = cal.getMinimum(Calendar.DAY_OF_MONTH);
				monthLastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
			}
			SearchDAO searchDAO = SearchDAO.getInstance();
			List<HashMap> showHideMapList = new ArrayList<HashMap>();
			String appSearchDate = "";
			
			for (int i = monthFirstDay; i <= monthLastDay; i++) {
				HashMap<String, String> showHideMap = new HashMap<String, String>();
				appSearchDate = sdf.format(new Date(setYear, setMonth, i));
				takenTimeList = searchDAO.timeSelect(memNo, docName, deptNo, appSearchDate);
				if (setDay >= i) {
					showHideMap.put(appSearchDate, "hide");
					showHideMapList.add(showHideMap);
				} else if (takenTimeList.size() != 0) {
					stringTime2 = "";
					for (int j = 0; j < takenTimeList.size(); j++) {
						stringTime2 = stringTime2 + " " + takenTimeList.get(j);
					}
					if (stringTime2.equals(stringTime1)) {
						showHideMap.put(appSearchDate, "hide");
						showHideMapList.add(showHideMap);
					} else {
						showHideMap.put(appSearchDate, "show");
						showHideMapList.add(showHideMap);
					}
				} else {
					showHideMap.put(appSearchDate, "show");
					showHideMapList.add(showHideMap);
				}
			}
			if (showHideMapList != null) {
				request.setAttribute("showHideMapList", showHideMapList);
			}
			
			request.setAttribute("docName", docName);
			request.setAttribute("deptNo", deptNo);
			request.setAttribute("appSearchDate", appSearchDate);
			request.setAttribute("thisMonth", thisMonth);
			request.setAttribute("setMonth", setMonth);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "appDateList.jsp";
	}

}
