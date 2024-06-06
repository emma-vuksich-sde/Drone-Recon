package com.dronerecon.ws;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.net.URL;
import java.util.*;
import java.security.SecureRandom;

/**
 *
 * @author Emma Vuksich :-)
 */
public class DroneDataService extends HttpServlet
{


    public void doGet(HttpServletRequest request,
                      HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("application/json;charset=utf-8");
        response.addHeader("Access-Control-Allow-Origin", "*");

        PrintWriter out = response.getWriter();

        String sArea_id = request.getParameter("area_id");
        String stilex = request.getParameter("tilex");
        String stiley = request.getParameter("tiley");
        String stotalcols = request.getParameter("totalcols");
        String stotalrows = request.getParameter("totalrows");
        String sg = request.getParameter("g");
        String sr = request.getParameter("r");

        try
        {
            URL url = new URL("http://127.0.0.1:8080/dronereconportal/PortalDBService?area_id=" + sArea_id + "&tilex=" + stilex +"&tiley=" + stiley + "&r= " + sr  +"&g=" + sg);
            BufferedReader br = new BufferedReader(new InputStreamReader(url.openStream()));
            String strDrone = "";
            while (null != (strDrone = br.readLine()))
            {

            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        String sDirection = "right";

        int tilex = Integer.parseInt(stilex);
        int tiley = Integer.parseInt(stiley);
        int totalcols = Integer.parseInt(stotalcols);
        int totalrows = Integer.parseInt(stotalrows);

        if (tiley % 2 == 0) {
            if (tilex == totalcols - 1) {
                tiley++;
                sDirection = "left";
            } else {
                tilex++;
                sDirection = "right";
            }
        } else {
            if (tilex == 0) {
                tiley++;
                sDirection = "right";
            } else {
                tilex--;
                sDirection = "left";
            }
        }
        if (tiley == totalrows) {
            sDirection = "stop";
        }

        String sReturnJson = "{\"area_id\":\"" + sArea_id + "\", \"nextTileX\":\"" + tilex + "\", \"nextTileY\":\"" + tiley + "\", \"direction\":\"" + sDirection + "\"}";
        out.println(sReturnJson);
    }
}