<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="view" uri="/WEB-INF/tld/view.tld" %>
<%
	String path = request.getContextPath();
%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="<%=path%>/manager/common/css/webapp.css" rel="stylesheet" type="text/css"/>
	<link href="<%=path%>/manager/common/css/title.css" rel="stylesheet" type="text/css"/>
    <link href="<%=path%>/manager/common/ligerUI/skins/Aqua/css/ligerui-alert.css" rel="stylesheet" type="text/css" />
 
    <script language="javascript" src="<%=path%>/manager/common/js/jquery/jquery-1.4.2.min.js"></script>
    <script language="javascript" type="text/javascript">
	<!--
		$(function() {
			$("#menu li").each(function(index) { //带参数遍历各个选项卡
				$(this).click(function() { //注册每个选卡的单击事件
					$("#menu li.tabFocus").removeClass("tabFocus"); //移除已选中的样式
					$(this).addClass("tabFocus"); //增加当前选中项的样式
						//显示选项卡对应的内容并隐藏未被选中的内容
					$("#content li:eq(" + index + ")").show()
	                    .siblings().hide();
	                });
           	});
           	
           	//为了解决chrome 浏览器权限页签显示不出来问题 焦点必须先选中权限页面 然后再调整到基本信息页面
           	window.setTimeout(function(){
           	    //等权限树初始化了再跳到第一个页签页面
           		$("#menu li.tabFocus").removeClass("tabFocus"); //移除已选中的样式
           		$("#menu li:eq(0)").addClass("tabFocus"); //增加当前选中项的样式
           		$("#content li:eq(0)").show()
	                    .siblings().hide();
           	},10);
        
        });
	//-->
	</script>
 
  </head>
 <body style="overflow:auto; overflow-y:hidden">
	<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="ulOnTable">
      <tr>
        <td valign="top">
        <ul id="content">
		 <li>
		 <div style="height: 560px;overflow:scroll;" >
		 <table style="overflow:scroll;" width="100%" border="0" cellspacing="0" cellpadding="0" class="ulOnInsideTable">
             <tr>
               <td width="30%" align="right" valign="top">定制信息摘要<view:LanguageTag key="colon"/></td>
               <td width="40%">${prjinfo.prjdesc}</td>
               <td width="30%">&nbsp;</td>
             </tr>
             <tr>
               <td align="right" valign="top">定制信息类型<view:LanguageTag key="colon"/></td>
               <td>${prjinfo.typeStr}</td>
               <td>&nbsp;</td>
             </tr>
              <tr>
               <td align="right" valign="top">定制项目名称<view:LanguageTag key="colon"/></td>
               <td>${prjinfo.prjname}</td>
               <td>&nbsp;</td>
             </tr>
              <tr>
               <td align="right" valign="top">信息SVN<view:LanguageTag key="colon"/></td>
               <td>${prjinfo.svn}</td>
               <td>&nbsp;</td>
             </tr>
             <tr>
               <td align="right" valign="top">信息BUG<view:LanguageTag key="colon"/></td>
               <td>${prjinfo.bug}</td>
               <td>&nbsp;</td>
             </tr>
             <tr>
               <td align="right" valign="top">信息位置<view:LanguageTag key="colon"/></td>
               <td>${prjinfo.path}</td>
               <td>&nbsp;</td>
             </tr>
             <tr>
               <td align="right" valign="top">开发人员<view:LanguageTag key="colon"/></td>
               <td>${prjinfo.developer}</td>
               <td>&nbsp;</td>
             </tr>
             <tr>
               <td align="right" valign="top">测试人员<view:LanguageTag key="colon"/></td>
               <td>${prjinfo.tester}</td>
               <td>&nbsp;</td>
             </tr>
             <tr>
               <td align="right" valign="top">测试结果<view:LanguageTag key="colon"/></td>
               <td>${prjinfo.results}</td>
               <td>&nbsp;</td>
             </tr>
			<tr>
               <td align="right" valign="top">信息内容<view:LanguageTag key="colon"/></td>
               <td>${prjinfo.content}</td>
               <td>&nbsp;</td>
             </tr>
             <tr>
               <td align="right" valign="top">添加人<view:LanguageTag key="colon"/></td>
               <td>${prjinfo.operator}</td>
               <td>&nbsp;</td>
             </tr>
             <tr>
               <td align="right" valign="top">添加时间<view:LanguageTag key="colon"/></td>
               <td>${prjinfo.createtimeStr}</td>
               <td>&nbsp;</td>
             </tr>
           </table>
           </div>
           </li> 
       </ul>
		</td>
      </tr>
    </table>
 </body>
</html>