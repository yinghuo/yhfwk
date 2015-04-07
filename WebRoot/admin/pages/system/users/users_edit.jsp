<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!doctype html>
<html>
<head>
	<%@include file='/admin/pages/importResource.jsp'%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/iframe.js"></script>
  	<script src="${pageContext.request.contextPath}/js/jquery.form.js"></script>
  	
  	<script type="text/javascript">
  		function save()
  		{
  			<s:if test="editUser==null">
    			var defname="";
    			var defedit=false;
    		</s:if>
    		<s:else>
    			var defname='<s:property value="editUser.uloginname"/>';
    			var defedit=true;
    		</s:else>
  			if($("#editUser_uloginname").val().length<=0)
    		{
    			alert("请输入用户登录名称，不能为空！");
    			return;
    		}
    		
    		else if(!defedit&&$("#editUser_upassword").val().length<=0)
    		{
    			alert("请输入用户登录密码，不能为空！");
    			return;
    		}
    		else if((defedit&&$("#editUser_upassword").val().length>0)&&$("#editUser_upassword").val().length<5)
    		{
    			alert("密码长度不能少于5个字符！");
    			return;
    		}
    		else if((defedit&&$("#editUser_upassword").val().length>0)&&$("#editUser_upassword1").val().length<=0)
    		{
    			alert("请再次输入登录密码，不能为空！");
    			return;
    		}
    		else if((defedit&&$("#editUser_upassword").val().length>0)&&($("#editUser_upassword").val()!=$("#editUser_upassword1").val()))
    		{
    			alert("两次密码不相等，从重新输入密码！");
    			return;
    		}
    		
    		else if($("#editUser_uname").val().length<=0)
    		{
    			alert("请输入用户的昵称，不能为空！");
    			return;
    		}
    		
    		
			//校验通过，进行远程校验
			
  			var ischanger=defname!=""&&$("#editUser_uname").val()==defname;
  			
			if(ischanger||checkLoginName())
			{
				$("#savebtn").attr({"disabled":"disabled"});
				$("#frm_users").ajaxSubmit({
					dataType:  'json',
					success: function(data) {
						alert(data["msg"]);
						if(data["error"]=="0")
						{
							//清空表单
							//clearfrm();
							window.location="${pageContext.request.contextPath}/master/system/user!listUsers.action";
						}
					},
					error:function(xhr){
						alert("提交过程中发生网络错误，请与管理员联系!");
					}
				});
			}
			else
			{
				alert("用户登录名已存在，请重新输入一个登录名吧！");
			}
  		}
  		
  		function checkLoginName()
  		{
  			var t=false;
  			$.ajax({
  				url:'${pageContext.request.contextPath}/master/system/user!doLNameExist.action?loginName='+$("#editUser_uloginname").val(),
				type:"get",
				async:false,
				data:"",
				timeout:1200000,
				success:function(data){
					t = (data["checked"]=="false");
				} 		
  			});
  			return t;
  		}
  		
  	</script> 	
</head>
<body>
	<div class="centerRightContainer">
     	<div class="centerRight">
     		<h6 id="NavMap"></h6>
     		<form id="frm_users" action="${pageContext.request.contextPath}/master/system/user!doSave.action" method="post">
     		<table cellpadding="0" cellspacing="0">
     		<thead>
				<tr>
					<th colspan="3" class="borderRightNone">
						<s:if test="editUser==null">
							<label>创建新的用户</label>
						</s:if>
						<s:else>
							<label>编辑用户信息</label>
						</s:else>
					</th>
				</tr>
			</thead>
			<tbody>
				<input type="hidden" value="<s:property value="editUser.uid"/>" name="editUser.uid" />
				<tr>
					<td width="30%">用户登陆名：</td>
					<td class="borderRightNone"><input id="editUser_uloginname" name="editUser.uloginname" type="text" style="width:300px;" value="<s:property value="editUser.uloginname"/>"   class="lightBlueInput"/></td>
				</tr>
				<tr>
					<td width="30%">用户登陆密码：</td>
					<td class="borderRightNone"><input id="editUser_upassword" name="editUser.upassword" type="password" style="width:300px;" class="lightBlueInput"/></td>
				</tr>
				<tr>
					<td width="30%">确认登陆密码：</td>
					<td class="borderRightNone"><input id="editUser_upassword1" type="password" style="width:300px;" class="lightBlueInput"/></td>
				</tr>
				 <tr>
					<td width="30%">用户昵称：</td>
					<td class="borderRightNone"><input id="editUser_uname" name="editUser.uname" type="text" style="width:300px;" value="<s:property value="editUser.uname"/>" class="lightBlueInput"/></td>
				</tr>
				<!--<tr>
					<td width="30%">用户类型：</td>
					<td class="borderRightNone">
						<select style="width:300px;">
							<option value="0">普通用户</option>
						</select>
					</td>
				</tr>
				 -->
				<tr>
					<td width="30%">用户角色：</td>
					<td class="borderRightNone">
						<select name="editUser.uroleid" style="width:300px;">
							<s:iterator value="roles" id="element" status="st">
								<option <s:if test="rid==editUser.uroleid">selected="true"</s:if> value="<s:property value="rid"/>"><s:property value="rname"/></option>
							</s:iterator>
						</select>
					</td>
				</tr>
				<tr>
					<td class="borderRightNone" width="30%" colspan="2"><input id="savebtn" class="blueBtn" onclick="save()" type="button" value=" <s:if test="editUser==null">新增</s:if><s:else>更新</s:else> "/></td>
				</tr>
			</tbody>
     	</table>
     	</form>
     	</div>
	</div>
</body>
</html>
