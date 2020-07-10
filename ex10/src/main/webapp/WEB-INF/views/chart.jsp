<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
    <title>구글 차트 라이브러리</title>
    <!-- 라이브러리 Load -->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
</head>
<body>
	<select id="selChart" style="height:25px;">
		<option value="/chart/sum1">강좌별 평균점수</option>
		<option value="/chart/sum2">학생별 평균점수</option>
		<option value="/chart/sum3">강좌별 수강인원수</option>
		<option value="/chart/sum4">학생별 수강과목수</option>
	</select>
    <div id="chart_div" style="width:600px; height:500px;"></div>
    <div id="piechart" style="width: 900px; height: 500px;"></div>
</body>
<script type="text/javascript">
var url="/chart/sum1";
var varTitle;

$("#selChart").click(function(){
	url=$("#selChart").val();
	varTitle=$("#selChart option:checked").text();
	changeChart();
	changeChart2();
});
    changeChart();
    changeChart2();
    function changeChart(){
        google.charts.load('current', {'packages':['corechart']});
        google.charts.setOnLoadCallback(drawVisualization);
        function drawVisualization() { 
            $.ajax({
                type:"get",
                url:url,
                dataType:"json",
        		
                success:function(result){
                  //테스트용  var result=[['과목명','점수'],['자료구조',90],['데이타베이스',80],['자바',99],['김치전',52],['파전',0]];
                    /* 데이터 셋팅 */
                    var data = google.visualization.arrayToDataTable(result);

                    /* 옵션 셋팅 */
                    var options = {
                        title : varTitle,
                        seriesType: 'bars',
                        series: {0 : {type :'line', color:"black"}}
                    };

                    /* 차트 그리기 */
                    var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
                    chart.draw(data, options);
                    
                }
            });
        }
    }
    
    
    function changeChart2(){
    	google.charts.load('current', {'packages':['corechart']});
        google.charts.setOnLoadCallback(drawVisualization);
        function drawVisualization() { 
            $.ajax({
                type:"get",
                url:url,
                dataType:"json",
        		
                success:function(result){
                  //테스트용  var result=[['과목명','점수'],['자료구조',90],['데이타베이스',80],['자바',99],['김치전',52],['파전',0]];
                    /* 데이터 셋팅 */
                    var data = google.visualization.arrayToDataTable(result);

                    /* 옵션 셋팅 */
                   var options = {
         				 title: 'My Daily Activities',
         					 legend: 'none',
         			          pieSliceText: 'label',
         			          slices: { 0: {offset: 0.3},
         			        	  		1: {offset: 0.3},
         			                    2: {offset: 0.3},
         			                    3: {offset: 0.3},
         			                    4: {offset: 0.3},
         			                    5: {offset: 0.3},
         			                    6: {offset: 0.3},
         			                    7: {offset: 0.3},
         			                    8: {offset: 0.3},
         			          },
         			         is3D : true 
       						 };


                    /* 차트 그리기 */
                    var chart = new google.visualization.PieChart(document.getElementById('piechart'));
                    chart.draw(data, options);
                    
                }
            });
        }
    }
</script>
</html>