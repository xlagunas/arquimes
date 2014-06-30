<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Arquimes BackOffice</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/img/q+.ico" />
<!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
<!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

<style type="text/css">
.desactivat {
	opacity: 0.2;
}
.upload-wrapper {
	width: 300px;
	height: 22px;
	background-color: white;
	border-radius: 5px;
}

.upload-wrapper-cell {
	position: relative;
	float: left;
	width: 275px;
	height: 23px;
	float: left;
	width: 275px;
}

.upload-wrapper-cell-icon {
	position: relative;
	float: left;
	width: 23px;
	height: 100%;
}

.icon-remove-sign {
	width: 16px;
	margin-top: 5px;
	margin-left: 5px;
	height: 100%;
	cursor: pointer;
}

.nicEdit-selected {
	
}

.nicEdit-panel {
	
}

.nicEdit-button {
	
}

.nicEdit-main {
	background-color: #fff;
}

body {
	padding-top: 50px;
}
</style>

<title>backOffice Arqui+</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="${pageContext.request.contextPath}/scripts/jquery.js"></script>
<script
	src="${pageContext.request.contextPath}/scripts/commonFunctions.js"></script>
<script
	src="${pageContext.request.contextPath}/scripts/bootstrap-dropdown.js"></script>
<script
	src="${pageContext.request.contextPath}/scripts/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/scripts/bootstrap-tab.js"></script>
<script src="${pageContext.request.contextPath}/scripts/nicEdit.js"></script>

<script type="text/javascript">
	$(document).ready(function(e) {		
		$('.dummy >a').bind('click', function(e){
			$('.active').removeClass('active');
			$(e.target).parent().addClass('active');
			if (e.target.id != null){
			callServerMethodJSP(true, false, "${pageContext.request.contextPath}/backOffice/"+e.target.id+"Action", {}, null, function (status,data){
				if(status=="success"){
				
					$('#backOfficeBody').remove();
					$(data).prependTo($('#entrada'));
				}
				else
					alert("error");
			});
			}
			else alert("CLIIIIIICK");
		});
		$('#myTab a').bind('click',function (e) {
			  alert('clicki');
			  e.preventDefault();
			  $(this).tab('show');
			});
		
	});

</script>
</head>
<body>
	<s:if test="hasActionMessages()">
   		<div class="alert alert-success">
		<button type="button" class="close" data-dismiss="alert">X</button>
      	<s:actionmessage cssClass=""/>
		</div>
	</s:if>
	<s:if test="hasActionErrors()">
   		<div class="alert alert-error">
		<button type="button" class="close" data-dismiss="alert">X</button>
		<s:actionerror/>
		</div>
	</s:if>
	<div class="navbar navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container-fluid">
				<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
				 	<span class="icon-bar"></span> 
				 	<span class="icon-bar"></span>
				 	<span class="icon-bar"></span>
				</a> 
				<a class="brand">Arquimes BackOffice</a>
				<ul class="nav pull-right">
					<li><a href="<s:url action='logout'/>"><i class="icon-off"></i> Desconnecta't</a></li>
				</ul>
			</div>
		</div>
	</div>

	<div class="container-fluid">
		<div class="row-fluid">
			<!-- comença la barra lateral -->
			<div class="span2">
				<div class="well sidebar-nav">
					<ul id="llista" class="nav nav-list">
						<li class="nav-header">Seccions</li>
						<li class="dummy"><a id="portada">Portada</a></li>
						<li class="dummy"><a id="estudi">Estudi</a></li>
						<li class="dummy"><a id="contacte">Contacte</a></li>
						<li class="dummy"><a id="serveis">Serveis</a></li>
						<li class="nav-header">Projectes</li>
							<ul id="demo" class="nav nav-list">
								<li class="dummy"><a id="colectiu">Col.lectiu</a></li>
								<li class="dummy"><a id="individual">Individual</a></li>
								<li class="dummy"><a id="urbanisme">Urbanisme</a></li>
								<li class="dummy"><a id="enCurs">En Curs</a></li>
							</ul>
						<li class="nav-header">difusio</li>
							<ul id="demo2" class="nav nav-list">
								<li class="dummy"><a id="actualitat">Actualitat</a></li>
								<li class="dummy"><a id="publicacions">Publicacions</a></li>
							</ul>
					</ul>
				</div>
			</div>
			<!-- Acaba la barra lateral -->
			<!-- Comença la seccio central -->
			<div class="span10">
				<div id="entrada" class="span10"></div>
			</div>
			<!-- Acaba la seccio central -->
		</div>
	</div>
</body>
<!-- Le javascript
    ================================================== -->
<script>
<!-- Placed at the end of the document so the pages load faster -->
function afegeix(idValue){
	var item = "<tr>";
	item += "	<td class='tdLabel' style='padding: 5px;'>";
	item += "		<div class='upload-wrapper'>";
	item += "			<div class='upload-wrapper-cell'>";
	item += "				<input type='file' name='upload' style='margin-top: 4px;margin-left: 4px;' value='' id='form_upload'>";
	item += "			</div>";
	item += "			<div class='upload-wrapper-cell-icon'>";
	item += "				<i class='icon-remove-sign'></i>";
	item += "			</div>";
	item += "		</div>";
	item += "	</td>";
	item += "</tr>";
	
	var elem = $(item).prependTo($(idValue));
	$(elem).find(".icon-remove-sign").bind("click",{row:elem},function(e){
		$(e.data.row).remove();
	});
	
	
};
function modalAddImages(){
	$('#afegirImatges').modal("show");
};

function modalAddContent(){
	$('#afegirContingut').modal("show");
};

function modalEditContent(id){
	$('input[name=idImage]').val(id);
	$('#grup2').hide();
	$('#accionsImatge').modal("show");
}
function accionsImatge(id){
	$('input[name=idImage]').val(id);
	$('#accionsImatge').modal("show");
}

function accionsImatgeContent(idImage, idContent){
	$('input[id=idImageContentForm]').val(idImage);
	$('input[id=idContent]').val(idContent);
	
	$('#accionsImatgeContent').modal("show");
}

function afegirContentImatges(idContent){
	$("input[id=idContentImageSection]").val(idContent);
	$('#afegirContentImatges').modal("show");
}

function returnToContent(){
	$('#grup2').show();
	$('#grup3').remove();
}


</script>

</html>