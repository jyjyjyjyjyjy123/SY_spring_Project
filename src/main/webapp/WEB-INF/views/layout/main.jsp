<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content=""> 	
<tiles:insertAttribute name="asset"/>
<style>

.icon {
	max-width: 70%;
}

#middle-content-textbox1 {
	height: 550px;
	overflow: hidden;
}

#middle-content-textbox2 {
	height: 320px;
}

#middle-content-textbox3 {
	height: 320px;
}

.middle-content {
	width: auto;
}

</style>
    </head>
<body>

	<tiles:insertAttribute name="header"/>
	
	<tiles:insertAttribute name="content"/>
	
	<tiles:insertAttribute name="footer"/>
	
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script>
        google.charts.load('current', {'packages':['bar']});
        google.charts.setOnLoadCallback(drawChart);

        function drawChart() {
          var data = google.visualization.arrayToDataTable([
            ['', '청년', '중장년', '노년'],
            ['2023', 200, 500, 800],
          ]);

          var options = {
            bars: 'vertical' // Required for Material Bar Charts.
          };

          var chart = new google.charts.Bar(document.getElementById('barchart_material'));

          chart.draw(data, google.charts.Bar.convertOptions(options));
        }
        </script>
    </body>
</html>