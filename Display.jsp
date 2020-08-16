<%@ page import="java.io.*" %>
<%@ page import="java.lang.*" %>
<%@ page import="java.util.*" %>


<html>
  <head>
   <style>
    body {
  
  background-color:grey;
  background-size: 100%; font-family: Arial, Helvetica, sans-serif;}
    </style>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);
      google.charts.setOnLoadCallback(drawChart1);
      google.charts.setOnLoadCallback(drawChart2);
      google.charts.setOnLoadCallback(drawChart3);
      google.charts.setOnLoadCallback(drawChart4);
     
      function drawChart() {
         <% 
         int func1=(Integer) session.getAttribute("Function1");
         int var1=(Integer) session.getAttribute("variable1");
         int class1=(Integer) session.getAttribute("class1"); 
         int s_class1=(Integer) session.getAttribute("support1");
 
          %>
    
       var data = google.visualization.arrayToDataTable([
         ['Element', 'Count', { role: 'style' }],
         ['Class', <%=class1%>, '#b87333'],            // RGB value
         ['Functions', <%=func1%>, 'silver'],            // English color name
         ['Variables',<%=var1%>, 'gold'],
         ['Supporting class',<%=s_class1%>, 'red'],
         ['KeyClass', <%=class1%>, 'green'],
          // CSS-style declaration
      ]);

        var options = {
          title: 'Software - 1 Details'
        };

        var chart = new google.visualization.BarChart(document.getElementById('barchart'));
        chart.draw(data, options);
}

	function drawChart1() {
         <% 
         int func2=(Integer) session.getAttribute("Function2");
         int var2=(Integer) session.getAttribute("variable2");
         int class2=(Integer) session.getAttribute("class2"); 
         int s_class2=(Integer) session.getAttribute("support2");
          %>
           
	 var data = google.visualization.arrayToDataTable([
         ['Element', 'Count', { role: 'style' }],
         ['Class', <%=class2%>, '#b87333'],            // RGB value
         ['Functions', <%=func2%>, 'silver'],            // English color name
         ['Variables',<%=var2%>, 'gold'],
         ['Supporting class',<%=s_class2%>, 'red'],
         ['KeyClass', <%=class2%>, 'green'],
          // CSS-style declaration
      ]);

        var options = {
          title: 'Software - 2 Details'
        };



        var chart = new google.visualization.BarChart(document.getElementById('barchart1'));

        chart.draw(data, options);


      }

function drawChart2() {
         <% 
         int commonclass=(Integer) session.getAttribute("Commonclass"); 
         int class11=(Integer) session.getAttribute("class1");
         int class12=(Integer) session.getAttribute("class2");
         int total = class11 + class12;
         int noncommon = total - commonclass;
         if(commonclass == noncommon)
           noncommon=0;
         %>
        var data = google.visualization.arrayToDataTable([
          ['Similar', 'Count'],
          
          ['Common Class', <%=commonclass%>],
          ['Non-Common Class', <%=noncommon%>],
          
        ]);

        var options = {
          title: 'Similarity Data/Tool s Output'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
      }
function drawChart3() {
         <% 
         int commonvar=(Integer) session.getAttribute("common_variable"); 
         int var11=(Integer) session.getAttribute("variable1");
         int var12=(Integer) session.getAttribute("variable2");
         int total1 = var11 + var12;
         int noncommonvar = total1 - commonvar;
         if(commonvar == noncommonvar)
          noncommonvar=0;
         %>
        var data = google.visualization.arrayToDataTable([
          ['Similar', 'Count'],
        
          ['Common Variable', <%=commonvar%>],
          ['Non-Common Variable',<%=noncommonvar%>],
          
        ]);

        var options = {
          title: 'Similarity Data/Tool s Output'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart1'));

        chart.draw(data, options);
      }
function drawChart4() {
         <% 
         int commonfunc=(Integer) session.getAttribute("common_function"); 
         int func11=(Integer) session.getAttribute("Function1");
         int func12=(Integer) session.getAttribute("Function2");
         int total2 = func11 + func12;
         int noncommonfunc = total2 - commonfunc;
         if(commonfunc == noncommonfunc)
          noncommonfunc=0;
         %>
        var data = google.visualization.arrayToDataTable([
          ['Similar', 'Count'],
          
          ['Common Function',<%=commonfunc%>],
          ['Non-Common Function',<%=noncommonfunc%>],
          
        ]);

        var options = {
          title: 'Similarity Data/Tool s Output'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart2'));

        chart.draw(data, options);
      }
</script>
  </head>
  <body><center>
    <h1  style="font-size: 42px; font-family: cursive; color:orange;">Analyzed Software Report</h1>
    <div id="barchart" style="width: 900px; height: 500px;"></div><br>
    <div id="barchart1" style="width: 900px; height: 500px;"></div><br>
    <div id="piechart" style="width: 900px; height: 500px;"></div><br>
    <div id="piechart1" style="width: 900px; height: 500px;"></div><br>
    <div id="piechart2" style="width: 900px; height: 500px;"></div><br>
</center>  

</body>
</html>