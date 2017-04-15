<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
    String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="pragma" content="no-cache"/>
    <meta http-equiv="cache-control" content="no-cache"/>
    <meta http-equiv="expires" content="0"/>
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
    <meta http-equiv="description" content="This is my page"/>

    <link href="<%=path %>/css/layout.css" type="text/css" rel="stylesheet"/>
    <link rel="stylesheet" href="<%=path %>/css/video-js.css" type="text/css" media="screen" title="Video JS">
    <script src="<%=path %>/js/video.js" type="text/javascript" charset="utf-8"></script>

    <script language="JavaScript" src="<%=path %>/js/public.js" type="text/javascript"></script>
</head>

<body>
<jsp:include flush="true" page="/qiantai/inc/incTop.jsp"></jsp:include>
<div class="page_row">
    <div class="page_main_msg left">
        <div class="left_row">
            <div class="list pic_news">
                <div class="video-js-box">
                    <!-- Using the Video for Everybody Embed Code http://camendesign.com/code/video_for_everybody -->
                    <video id="example_video_1" class="video-js" width="640" height="500" controls="controls"
                           preload="auto">
                        <source src="<%=path %><s:property value="#request.yinyue.fujian"/>"
                                type='video/mp4; codecs="avc1.42E01E, mp4a.40.2"'/>
                        <!-- Flash Fallback. Use any flash video player here. Make sure to keep the vjs-flash-fallback class. -->
                        <object id="flash_fallback_1" class="vjs-flash-fallback" width="640" height="500"
                                type="application/x-shockwave-flash"
                                data="<%=path %>/css/flowplayer-3.2.1.swf">
                            <param name="movie" value="<%=path %>/css/flowplayer-3.2.1.swf"/>
                            <param name="allowfullscreen" value="true"/>
                            <param name="flashvars"
                                   value='config={"playlist":["oceans-clip.png", {"url": "<%=path %>/<s:property value="#request.yinyue.fujian"/>","autoPlay":false,"autoBuffering":true}]}'/>
                        </object>
                    </video>
                </div>
            </div>
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