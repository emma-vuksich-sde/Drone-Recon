<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.dronerecon.ws.DBManager" %>
<%@ page import="com.dronerecon.ws.AreaGridTile" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Area Results</title>
</head>
<body>
    <h2>Area Results</h2>
    <%
        String area_id = request.getParameter("area_id");

        DBManager oDBManager = new DBManager();

        oDBManager.DBLocation = System.getProperty("catalina.base") +
            "\\webapps\\dronereconportal\\db\\" + oDBManager.DBLocation;

        ArrayList<AreaGridTile> areaGridTiles = oDBManager.readAreaGridTiles(area_id);

        if (areaGridTiles != null && !areaGridTiles.isEmpty()) {
            AreaGridTile maxR = areaGridTiles.get(0);
            AreaGridTile maxG = areaGridTiles.get(0);
            for (AreaGridTile tile : areaGridTiles) {
                if (tile.getR() > maxR.getR()) {
                    maxR = tile;
                }
                if (tile.getG() > maxG.getG()) {
                    maxG = tile;
                }
            }
            %>
            <p>The x,y values of the record with the highest r value: <%= maxR.getX() %>, <%= maxR.getY() %></p>
            <p>The x,y values of the record with the highest g value: <%= maxG.getX() %>, <%= maxG.getY() %></p>
            <%
        } else {
            %>
            <p>No data found for the specified area ID.</p>
            <%
        }
    %>
</body>
</html>
