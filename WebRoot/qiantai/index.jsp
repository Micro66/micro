<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />
		
		<link href="<%=path %>/css/layout.css" type="text/css" rel="stylesheet" />
		
		<script language="JavaScript" src="<%=path %>/js/public.js" type="text/javascript"></script>
	    <script type="text/javascript">
	        
	    </script>
	</head>

	<body>
		<jsp:include flush="true" page="/qiantai/inc/incTop.jsp"></jsp:include>
		<div class="page_row">
			<div class="page_main_msg left">
				<div class="cycle_news_row">
					<s:iterator value="#request.cateLogList" id="catelog">
					<div class="list cycle_news">
						<div class="list_bar">
							<span style="float:left"><s:property value="#catelog.catelogName"/></span>
							<span style="float:right"><a href="<%=path %>/yinyueMoreByCatelog.action?catelogId=<s:property value="#catelog.catelogId"/>">更多>></a>&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</div>
						<div class="list_content">
							<table width="100%">
							     <s:iterator value="#catelog.yinyueList" id="yinyue">
							          <tr>
									       <td width="56%" height="22" align="left"><a href="<%=path %>/yinyueDetailQian.action?id=<s:property value="#yinyue.id"/>"><s:property value="#yinyue.name"/></a></td>
									       <td width="44%" height="22" align="left"><s:property value="#yinyue.shijian"/></td>
									  </tr>
							     </s:iterator>
							</table>
						</div>
					</div>
					</s:iterator>
					<div style="clear: both"></div>
				</div>
			</div>
			
			<!-- 右边的用户登录。评价。投票 -->
			<div class="page_other_msg right">
				<div class="left_row">
					<div class="list">
						<div class="list_bar">用户登录</div>
						<div class="list_content">
							<div id="div">
								<jsp:include flush="true" page="/qiantai/userlogin/userlogin.jsp"></jsp:include>
							</div>
						</div>
					</div>
				</div>
				<div class="left_row">
				    <div class="list">
				        <div class="list_bar">视频排行榜</div>
				        <div class="list_content">
				            <div id="div"> 
								<s:action name="yinyuePaihang" executeResult="true" flush="true"></s:action>
					        </div>
					    </div>
				    </div>
				</div>
				<div class="left_row">
				    <div class="list">
				        <div class="list_bar">网站日历表</div>
				        <div class="list_content">
				            <jsp:include flush="true" page="/qiantai/rili/rili.jsp"></jsp:include>
					    </div>
				    </div>
			    </div>
			</div>
			<!-- 右边的用户登录。评价。投票 -->
		</div>
		
		<div class="foot">
		   <jsp:include flush="true" page="/qiantai/inc/incFoot.jsp"></jsp:include>
	    </div>
	</body>
</html>
