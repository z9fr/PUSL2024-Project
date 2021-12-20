package com.example.xyzhotel.servletz.user;

import com.example.xyzhotel.dao.user.submitFeedback;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "user feedback", value = "/user/feedback")
public class feedback extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.getRequestDispatcher("/jsp/user/feedback.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();

        String feedback = (String) req.getParameter("feedback");
        int Rating = Integer.parseInt(req.getParameter("rating"));
        String uname = (String) session.getAttribute("username");

        PrintWriter out= resp.getWriter();
        out.println("<html><body>");


        if(uname.isEmpty()){
            out.println("send error");
        }
        else{
            out.println(feedback);
            out.println(Rating);

            submitFeedback sf = new submitFeedback();
            Boolean isOkay = sf.updateFeedBack(feedback, Rating, uname);

            if(isOkay){
                resp.sendRedirect("/user/panel?msg=Review+added");
            }else{
                out.println("error");
            }

        }


    }
}
