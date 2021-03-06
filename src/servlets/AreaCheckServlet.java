package servlets;

import models.Query;
import models.QueryStorageService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.Date;

@WebServlet("/check_area")
public class AreaCheckServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException, NumberFormatException {

        double x = Double.parseDouble(req.getParameter("x"));
        double y = Double.parseDouble(req.getParameter("y"));
        double r = Double.parseDouble(req.getParameter("r"));

        boolean result = getResult(x, y, r);
        x = floor(x);
        y = floor(y);
        r = floor(r);
        Date currentTime = new Date();

        Query query = new Query(x, y, r);
        query.setResult(result);
        query.setQueryTime(currentTime);

        ServletContext context = this.getServletContext();

        QueryStorageService qss = (QueryStorageService) context.getAttribute("qss");
        qss = qss == null ? new QueryStorageService() : qss;

        qss.addQuery(query);

        context.setAttribute("qss", qss);

        req.getSession().setAttribute("qss",qss);
        RequestDispatcher view = req.getRequestDispatcher("answer.jsp");
        view.forward(req, resp);
        //        req.getSession().setAttribute("qss",qss);
//        resp.sendRedirect("/answer.jsp");
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        doGet(req,resp);
    }

    private boolean getResult(double x, double y, double r){
        //Quarter part
        boolean firstQuarter = x >= 0 && y >= 0;
        boolean thirdQuarter = x <= 0 && y <= 0;
        boolean fourthQuarter = x >= 0 && y <= 0;
        //check part
        return (fourthQuarter && (x<=r/2) && (y>=-r)) ||
               (thirdQuarter && (x*x + y*y <= r*r/4)) ||
               (firstQuarter && (y <= -x + r/2));
    }

    private double floor(double d){
        return Math.floor(d*1000)/1000.0;
    }

}
