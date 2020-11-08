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
            double x = Double.parseDouble(req.getParameter("x-value"));
            double y = Double.parseDouble(req.getParameter("y-value"));
            double r = Double.parseDouble(req.getParameter("r-value"));
//            System.out.println(checkData(r));
            if (r==1.0 || r==1.5 || r==2.0 || r==2.5 || r==3.0) {
                getServletContext().getRequestDispatcher("/check_area").forward(req, resp);
//                getServletContext().getRequestDispatcher("/error.jsp").forward(req, resp);
            } else {
//                getServletContext().getRequestDispatcher("/check_area").forward(req, resp);
               getServletContext().getRequestDispatcher("/error.jsp").forward(req, resp);
            }
        } catch (NumberFormatException | NullPointerException e) {
            getServletContext().getRequestDispatcher("/error.jsp").forward(req, resp);
        }
    }

//    private boolean checkData(double r) {//We only need to check R, because x and y can be any num.
//        double[] rValue = new double[]{1.0, 1.5, 2.0, 2.5, 3.0};
//        return Arrays.asList(rValue).contains(r);
//    }
}
