package com.se.team4.common.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Controller extends HttpServlet{
    private static final long serialVersionUID = 1L;
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String RequestURI=request.getRequestURI();
        String contextPath=request.getContextPath();
        String command=RequestURI.substring(contextPath.length());
        Action action = null;
        String forward = null;
        ServletContext context = getServletContext();
        String fullPath = context.getRealPath("/WEB-INF/booksys.properties");
        Properties prop = new Properties();
        FileInputStream fis = new FileInputStream(fullPath);
        prop.load(fis);
        fis.close();
        String classPath = prop.getProperty(command);
        try{
            Class<?> url = Class.forName(classPath);
            action = (Action) url.newInstance();
            try {
                forward = action.execute(request, response);
            } catch (Exception e) {
            }
        }catch(ClassNotFoundException ex){
            ex.printStackTrace();
        }catch(InstantiationException ex){
            ex.printStackTrace();
        }catch(IllegalAccessException ex){
            ex.printStackTrace();
        }catch(NullPointerException ex)
        {
            ex.printStackTrace();
        }
        if(forward != null){
            if(forward.contains("RequestDispatcher:"))
            {
                String jspName = (forward.split(":")[1]);
                request.getRequestDispatcher("WEB-INF/" + forward.split(":")[1]).forward(request, response);
            }
            else {
                PrintWriter pr = response.getWriter();
                pr.print(forward);
                pr.flush();
                pr.close();
            }
        }
    }
}
