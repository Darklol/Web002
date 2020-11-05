package servlets;

import models.Query;
import models.QueryStorageService;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;

@WebServlet("/check_area")
public class AreaCheckServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        double x = Double.parseDouble(req.getParameter("x-value"));
        double y = Double.parseDouble(req.getParameter("y-value"));
        double r = Double.parseDouble(req.getParameter("r-value"));
        boolean result = getResult(x, y, r);
        Date currentTime = new Date();

        Query query = new Query(x, y, r);
        query.setResult(result);
        query.setQueryTime(currentTime);

        HttpSession session = req.getSession();  //New a session to save data

        QueryStorageService qss = (QueryStorageService) session.getAttribute("qss");
        qss = qss == null ? new QueryStorageService() : qss;

        qss.addQuery(query);
        session.setAttribute("qss", qss);

        resp.sendRedirect("/answer.jsp");
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        doGet(req,resp);
    }

    private boolean getResult(double x, double y, double r){
        //Quarter part
        boolean firstQuarter = x >= 0 && y >= 0;
        boolean thirdQuarter = x <= 0 && y <= 0;
        boolean fourthQuarter = x <= 0 && y <= 0;
        //check part
        if (firstQuarter && (y <= -x + r/2)) return true;
        if (thirdQuarter && (x*x + y*y <= r*r/4)) return true;
        if (fourthQuarter && (x<=r/2) && (y>=-r)) return true;

        return false;
    }
}
