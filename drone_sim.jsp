<html>
  <head>
    
      <%
        int iCols = Integer.parseInt(request.getParameter("colcount"));
        int iRows = Integer.parseInt(request.getParameter("rowcount"));
      %>

    <style>
      body {
        font-family: "Arial", arial, ans-serif;
      }
    </style>

    <script src="js/jquery.min.js"></script>
    <script src="js/webservice_client.js"></script>
    <script src="js/dronesim.js"></script>

    <script>

      setTiles(<%=iCols%>, <%=iRows%>);

    </script>

  </head>

  <!--<body onload="changeColor();">-->
  <body>

    <br />
    <h2 style="text-align:center;background-color:gray;color:white">DRONE RECON</h2>
    Area ID: <span id="area_id" type="text"><%=request.getParameter("area_id")%></span>
    <br />
    <button onclick="beginDroneSim();">Begin Drone Sim</button>
    <button onclick="stopDroneSim();">Stop Drone Sim</button>

    <br /><br />

    <table style="width:100%;border-style:solid;
      text-align:center;vertical-align:middle;font-weight:bold;font-size:large">

      <%
        for (int x = 0; x < iRows; x++) {
      %>
          <tr>
          <%
          for (int y = 0; y < iCols; y++) {
          %>
            
              <td id="<%="x" + x + "-y" + y%>" style="height:100;background-color:white">
                
                <div id="<%="div-x" + x + "-y" + y%>" style="width: 100px; height: 1px; position: relative;">
                </div>
                <%=x + ", " + y%>
              </td>

            <%
          }

          %>
          </tr>
          <%
        }
        %>
    </table>
  </body>
</html>