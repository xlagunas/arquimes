<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
<!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">

</head>
<body>
	<s:if test="hasActionMessages()">
   		<div class="alert alert-success">
		<button type="button" class="close" data-dismiss="alert">×</button>
      	<s:actionmessage cssClass=""/>
		</div>
	</s:if>
	<s:if test="hasActionErrors()">
   		<div class="alert alert-error">
		<button type="button" class="close" data-dismiss="alert">×</button>
		<s:actionerror/>
		</div>
	</s:if>
	<s:div cssClass="row span4">
		<s:div cssClass="well">
			<!--<s:actionerror theme="bootstrap" />
	<s:actionmessage theme="bootstrap" />
	<s:fielderror theme="bootstrap" />
	-->
	
			<s:form action="LoginForm" cssClass="form-horizontal">
				<legend>Autenticació</legend>
				<div class="control-group">
				<s:textfield label="Name" name="username" tooltip="Enter your Name here" />
				<s:password label="password" name="password" tooltip="Enter your password here"/>
				<s:submit cssClass="btn btn-success" />
				</div>
			</s:form>
		</s:div>
	</s:div>
</body>
</html>
