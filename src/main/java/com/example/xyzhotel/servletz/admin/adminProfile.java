package com.example.xyzhotel.servletz.admin;

import com.example.xyzhotel.dao.admin.AdminHelper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Objects;

@WebServlet(name = "Admin Profile ", value = "/user/admin/profile")
public class adminProfile extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session =req.getSession();
        String role = (String) session.getAttribute("role");

        PrintWriter out = resp.getWriter();


        if(Objects.equals(role, "admin")){
            // give the admin dashboard

            AdminHelper adminhelper = new AdminHelper();

            String username = (String) session.getAttribute("username");

            //getting those numbers
            req.setAttribute("admin_username", username);
            System.out.println("[+] admin access the dashboard " + username);

            //getting those numbers
            req.setAttribute("userCount", adminhelper.UserCount());
            req.setAttribute("totalBookings", adminhelper.TotalBookings());

            System.out.println(adminhelper.UserCount());

            req.getRequestDispatcher("/admin/profile.jsp").forward(req, resp);


        }
        else{
            out.println("<html><body>");
            out.println("<h1> not admin</h1>");
        }
        out.println(session.getAttribute("role"));
        out.println("</body></html>");
    }
}
