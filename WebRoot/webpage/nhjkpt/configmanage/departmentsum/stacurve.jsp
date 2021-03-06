<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<c:set var="ctxPath" value="${pageContext.request.contextPath}" />
<html>
<head>
	<title>分户用能总量的统计曲线</title>
<c:if test="${type!=null }">
<t:base type="jquery,easyui,tools,DatePicker"></t:base>
</c:if>
<script type="text/javascript" src="plug-in/Highcharts-2.3.3/js/highcharts.src.js"></script>
<script type="text/javascript" src="plug-in/Highcharts-2.3.3/js/modules/exporting.src.js"></script>
<script type="text/javascript" src="plug-in/tools/common.js"></script>
<script type="text/javascript">
	var url="";
	$(function(){
		$(document).ready(function() {
			url="departmentSumController.do?queryBroswerBar&departmentid=${departmentid}";
			//loadData(url);
			loadDataByAjax(url,"departmentSumline","分户用能总量统计表","日期","用能","折线图");
		});
	});
	function loadData(url){
		var chart;
		$.ajax({
			type : "POST",
			url : url,
			success : function(jsondata) {
				data = eval(jsondata);
				var arr=new Array();
				if(data[0]){
					for(var i=0,l=data[0].data.length;i<l;i++){
						arr.push(data[0].data[i].name);
					}
				}
				chart = new Highcharts.Chart({
					chart : {
						renderTo : 'departmentSumline',
						plotBackgroundColor : null,
						plotBorderWidth : null,
						plotShadow : false
					},
					title : {
						text : '分户用能总量统计表'
					},
					xAxis : {
						title:{
							text:'日期'
						},
						categories : arr
					},
					yAxis:{
						title:{
							text:'用能'
						}
					},
					tooltip : {
						pointFormat : '{series.name}: <b>{point.y}</b>',
						percentageDecimals : 1

					},
					exporting:{  
		                filename:'折线图',  
		                 url:'${ctxPath}/logController.do?export'  
		            }, 
					plotOptions : {
						pie : {
							allowPointSelect : true,
							cursor : 'pointer',
							showInLegend : true,
							dataLabels : {
								enabled : true,
								color : '#000000',
								connectorColor : '#000000',
								formatter : function() {
									return '<b>' + this.point.name + '</b>: ' + this.point.y;
								}
							}
						}
					},
					series : data
				});
			}
		});
	}
	function doSubmitSum(){
		url="departmentSumController.do?queryBroswerBar&departmentid=${departmentid}&funcid="+$("#departmentfuncid").val()+"&type="+$("#type").val()+"&startDate="+$("#startDate").val()+"&endDate="+$("#endDate").val();
		//loadData(url);
		loadDataByAjax(url,"departmentSumline","分户用能总量统计表","日期","用能","折线图");
	}
	function doExportSum(){
		window.location.href="departmentSumController.do?exportExcel&departmentid=${departmentid}&funcid="+$("#departmentfuncid").val()+"&type="+$("#type").val()+"&startDate="+$("#startDate").val()+"&endDate="+$("#endDate").val();
	}
</script>
</head>

<table style="width: 100%;" cellpadding="0" cellspacing="1" class="formtable" style="overflow-y: hidden" scroll="no">
	<tr>
		<td align="right"><label class="Validform_label">功能:</label></td>
		<td class="value">
			<select name="funcid" id="departmentfuncid">
				<option value="">--请选择--</option>
				<c:forEach items="${funclist}" var="func">
					<option value="${func.funcid}"
						<c:if test="${func.id==schoolSumPage.funcid }">selected="selected"</c:if>>
						${func.showtext}
					</option>
				</c:forEach>
			</select>
		</td>
		<td align="right">
			<label class="Validform_label">
				查看方式:
			</label>
		</td>
		<td class="value">
			<select name="type" id="type">
				<option value="-1">--请选择--</option>
				<option value="year">年</option>
				<option value="month">月</option>
				<option value="day">日</option>
				<option value="hour">小时</option>
			</select>
		</td>
	</tr>
	<tr>
		<td align="right">
			<label class="Validform_label">
				时间:
			</label>
		</td>
		<td class="value">
			<input class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH'})" id="startDate" name="startDate" datatype="*">
			<input class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH'})" id="endDate" name="endDate" datatype="*">
		</td>
		<td align="right" colspan="2">
			<input value="查询" type="button" onclick="doSubmitSum();">
			<input value="导出Excel" type="button" onclick="doExportSum();">
		</td>
	</tr>
</table>
<div id="departmentSumline" style="width:100%; height:100%"></div>
</html>