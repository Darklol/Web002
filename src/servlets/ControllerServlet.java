package servlets;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@WebServlet("/controller")
public class ControllerServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            System.out.println("****************\n" +
                    "req = "+ req+"\n" +
                    "req.getParameter = " + req.getParameter("r-value")+ "\n" +
                    "*************************");
            double r = Double.parseDouble(req.getParameter("r"));
            if (r==1.0 || r==1.5 || r==2.0 || r==2.5 || r==3.0) {
                getServletContext().getRequestDispatcher("/check_area").forward(req, resp);
            } else {
               getServletContext().getRequestDispatcher("/error.jsp").forward(req, resp);
            }
        } catch (NumberFormatException | NullPointerException | ServletException e) {
            getServletContext().getRequestDispatcher("/error.jsp").forward(req, resp);
        }
    }

}
