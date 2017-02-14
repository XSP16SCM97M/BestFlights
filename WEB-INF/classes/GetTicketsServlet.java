import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
import bestflight.Ticket;


public class GetTicketsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String to = request.getParameter("flyto");
        String from = request.getParameter("flyfrom");
        String dateinfo = request.getParameter("dateinfo");

        ArrayList<Ticket> tks = new ArrayList<>();
        tks=AirlineReservation.get(to,from,dateinfo);

        System.out.println(tks.size());
        PrintWriter out = response.getWriter();
        out.println("<html>");
        out.println("<head>");
        out.println("<title>GetTicketsServlet Result</title>");
       // out.println("<h2>"+tks.get(0).getAircraft()+"</h2>");
        out.println("</head>");
        out.println("<body> ");
        out.println("<center>");
        out.println("<h2>Search info</h2>");

        out.println("<form action=\"checkout.jsp\">" +
                "<table border=\"2\" cellpadding=\"5\">\n" +
                "    <thead>" +
                "    <tr>" +
                "      <th>&nbsp duration &nbsp</th>" +
                "      <th>&nbsp origin &nbsp</th>" +
                "      <th>&nbsp destination &nbsp</th>" +
                "      <th>&nbsp flightCarrier &nbsp</th>" +
                "      <th>&nbsp flightNum &nbsp</th>" +
                "      <th>&nbsp aircraft &nbsp</th>" +
                "      <th>&nbsp departTime &nbsp</th>" +
                "      <th>&nbsp arrivalTime &nbsp</th>" +
                "      <th>&nbsp price &nbsp</th>" +
                "      <th>&nbsp Select? &nbsp</th>" +
                "    </tr>" +
                "    </thead>");
        out.println(" <tbody>");
        int num =tks.size();
        if (num==0){
            out.println("<tr>" +
                    "      <td>No tickets found!</td>" +
                    "      <td></td>");
            out.println("</tbody> </table>");

        } else{
            for (int i=0;i<tks.size();i++){
            Ticket t=tks.get(i);
            out.println("<tr>" +
                    "      <td>"+t.getDuration()+"</td>" +
                    "      <td>"+t.getFrom()+"</td>" +
                    "      <td>"+t.getTo()+"</td>" +
                    "      <td>"+t.getFlightCarrier()+"</td>" +
                    "      <td>"+t.getFlightNum()+"</td>" +
                    "      <td>"+t.getAircraft()+"</td>" +
                    "      <td>"+t.getDepartTime()+"</td>" +
                    "      <td>"+t.getArrivalTime()+"</td>" +
                    "      <td>"+t.getPrice()+"</td>" +
                    "           <input type=\"hidden\" name=\"price\""+ "value=\""+t.getPrice()+"\""+"><br>" +

                    "      <td>" +
                    "           <input type=\"radio\" name=\"tid\""+ "value=\""+t.getId()+"\""+"> Yes<br>" +
                    "       </td>");
        }
            out.println("</tbody> </table>" +
                    "<input type=\"submit\" value=\"Check out\">"+
                    "</form>");

        }



        out.println("</center>");


        /*<div align="center">


    <tbody>
    <tr>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td><%= request.getParameter("flyto")%></td>
      <td><%= request.getParameter("flyfrom")%></td>
      <td></td>
      <td>
        <input type="radio" name="gender" value="yse"> Yes<br>
      </td>
    </tr>
    <tr>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td><%= request.getParameter("flyto")%></td>
      <td><%= request.getParameter("flyfrom")%></td>
      <td></td>
      <td>
        <input type="radio" name="gender" value="yse"> Yes<br>
      </td>
    </tr>


    <h1>API</h1>


  </div>*/
        out.println("</body>");
        out.println("</html>");
        out.close();

    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {

    }
}
