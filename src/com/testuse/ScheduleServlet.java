package com.testuse;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.sql.*;

import com.ad.model.AdService;
import com.ad.model.AdVO;

import java.util.*;


public class ScheduleServlet extends HttpServlet{    
    Timer timer ; 
    int count = 0;        
    public void destroy(){
        timer.cancel();
    }
    
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
    }
            
    public void init(){        
        timer = new Timer();
        Calendar cal = new GregorianCalendar(2019, Calendar.MARCH, 16, 0, 0, 0);        
        TimerTask task = new TimerTask(){
       
        
            public void run(){
            	 Long time = System.currentTimeMillis();
            	 AdVO adVO= new AdVO();

            	 Long ad_start =adVO.getAd_start().getTime();
            	 Long ad_end = adVO.getAd_end().getTime();
            	 if(time>ad_start)
                System.out.println("This is Task"+ count);
                System.out.println("工作排定的時間 = " + new Date(scheduledExecutionTime()));
                System.out.println("工作執行的時間 = " + new Date() + "\n");                
                count++;
            }
        };
        timer.scheduleAtFixedRate(task, cal.getTime(), 60*60*1000); 
    }
}