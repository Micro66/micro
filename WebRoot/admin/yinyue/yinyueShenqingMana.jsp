<%@ page language="java" pageEncoding="UTF-8"%>
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

		<link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
		
		<script language="JavaScript" src="<%=path %>/js/public.js" type="text/javascript"></script>
		
        <script language="javascript">
           function down1(fujianPath,fujianYuashiMing)
           {
               var url="<%=path %>/updown/updown.jsp?fujianPath="+fujianPath+"&fujianYuashiMing="+fujianYuashiMing;
		       url=encodeURI(url); 
               url=encodeURI(url); 
               window.open(url,"_self");
           }
       </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/img/allbg.gif'>
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="5" background="<%=path %>/img/tbg.gif">&nbsp;视频&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="20%">名称</td>
					<td width="30%">视频文件</td>
					<td width="10%">演员</td>
					<td width="25%">发布时间</td>
					<td width="25%">操作</td>
		        </tr>	
				<s:iterator value="#request.yinyueList" id="yinyue">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
						 <s:property value="#yinyue.name"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
					     <s:property value="#yinyue.fujianYuanshiming"/>
						 <a href="#" onclick="down1('<s:property value="#yinyue.fujian"/>','<s:property value="#yinyue.fujianYuanshiming"/>')" style="font-size: 11px;color: red">down</a>
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    <s:property value="#yinyue.geshou"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    <s:property value="#yinyue.shijian"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<a class="pn-loperator" href="<%=path %>/yinyuePiZhun.action?id=<s:property value="#yinyue.id"/>">批准</a>
						<a class="pn-loperator" href="<%=path %>/yinyueDel.action?id=<s:property value="#yinyue.id"/>">删除</a>
					</td>
				</tr>
				</s:iterator>
			</table>
	</body>
</html>
