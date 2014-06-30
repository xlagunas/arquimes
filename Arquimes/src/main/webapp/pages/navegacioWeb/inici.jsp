<%@ taglib prefix="s" uri="/struts-tags"%>


<!DOCTYPE html>
<html>
<head>
  

<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>

<link rel="shortcut icon" href="${pageContext.request.contextPath}/img/q+.ico" />
<link href="${pageContext.request.contextPath}/css/jquery.mCustomScrollbar.css" rel="stylesheet" type="text/css" />
<link type="text/css" href="${pageContext.request.contextPath}/css/jquery.jscrollpane.css" rel="stylesheet" media="all" />

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<script	src="${pageContext.request.contextPath}/scripts/commonFunctions.js"></script>
<script src="${pageContext.request.contextPath}/scripts/jquery.js"></script>
<script src="${pageContext.request.contextPath}/scripts/rotaImatges.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/jquery.mousewheel.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/jquery.jscrollpane.min.js"></script>
	

<script src="${pageContext.request.contextPath}/scripts/jquery.queryloader2.js"></script>


<script type="text/javascript">
function doSubmit(){
	var name=$("#name").val();
	var mail=$("#mail").val();
	var content=$("#content").val();
	callServerMethodJSP(true, false,$('#contactForm').attr('action'),{contactName: name,mail: mail, content: content}, null, function(status, data){
		if (status=="success"){
			alert("<s:text name="mail.successMail"></s:text>");
			$("#name").val('');
			$("#mail").val('');
			$("#content").val('');
		}
		else alert("error");
	});
}
	$(document).ready(function() {
		$(".mainContent").queryLoader2({
			barColor: "#d9d9d9",
	        backgroundColor: "#ffffff",
	        percentage: false,
	        barHeight: 1,
	        completeAnimation: "fade",
	        minimumTime: 100,
	        onComplete: function(){$(".imatges img").seqfx();
	        }
	    });
		
			$('.seccio').bind('click',function(e) {
				if(e.target.id != 'projectes' && e.target.id != 'difusio'){
					callServerMethodJSP(true, false,"${pageContext.request.contextPath}/"+ e.currentTarget.id + "Link", {}, null, function(status, data) {
								if (status == "success") {
									if ( $('#menuProjectes').is(':visible'))
										$('#menuProjectes').hide();
									if ( $('#menuDifusio').is(':visible'))
										$('#menuDifusio').hide();
									if(e.target.id == 'colectiu' || e.target.id == 'individual' || e.target.id == 'enCurs' || e.target.id == 'urbanisme' ){
										$(".seccio").removeClass("actiu");
										$(e.target).addClass("actiu");
										$('#projectes').addClass("actiu");
									}
									else if(e.target.id == 'actualitat' || e.target.id == 'publicacions'){
										$(".seccio").removeClass("actiu");
										$('#difusio').addClass("actiu");
										$(e.target).addClass("actiu");
									}
									else{
										$(".seccio").removeClass("actiu");
										$(e.target).addClass("actiu");
									}
									$('.imatges').remove();
									$('.textplantilla').remove();
									
									$(data).prependTo($('.mainContent'));
								} else {
									alert("error");
								}
							});
				}
				else if (e.target.id == 'projectes'){
					$('#menuProjectes').slideToggle("fast");
					if ( $('#menuDifusio').is(':visible'))
						$('#menuDifusio').hide();
				}
				else if (e.target.id == 'difusio'){
					$('#menuDifusio').slideToggle("fast");
					if ( $('#menuProjectes').is(':visible')){
						$('#menuProjectes').hide();
					}
				}
				});
			});
</script>
<title>Arqui+</title>
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="header" class="header">
		<div id="logo">
			<s:a action="introLink.action">
				<img src="${pageContext.request.contextPath}/img/logo_ARQUI+.png"
					width="130" height="36">
			</s:a>
		</div>
		<div id="enconstruccio" class="enconstruccio">
			<ul>
				<s:if test="locale.language=='ca'">
				<li><s:url id="ca" action="localeChange">
						<s:param name="request_locale">ca</s:param>					
					</s:url> 
					<s:a cssClass="actiu locale" href="%{ca}">CAT</s:a></li>
				</s:if>
				<s:else>
				<li><s:url id="ca" action="localeChange">
						<s:param name="request_locale">ca</s:param>					
					</s:url> 
					<s:a cssClass="locale" href="%{ca}">CAT</s:a></li>
				</s:else>
				
				<s:if test="locale.language=='es'">
				<li><s:url id="es" action="localeChange">
						<s:param name="request_locale">es</s:param>					
					</s:url> 
					<s:a cssClass="actiu locale" href="%{es}">ESP</s:a></li>
				</s:if>
				<s:else>
				<li><s:url id="es" action="localeChange">
						<s:param name="request_locale">es</s:param>					
					</s:url> 
					<s:a cssClass="locale" href="%{es}">ESP</s:a></li>
				</s:else>
				
				<s:if test="locale.language=='en'">
				<li><s:url id="en" action="localeChange">
						<s:param name="request_locale">en</s:param>					
					</s:url> 
					<s:a cssClass="actiu locale" href="%{en}">EN</s:a></li>
				</s:if>
				<s:else>
				<li><s:url id="en" action="localeChange">
						<s:param name="request_locale">en</s:param>					
					</s:url> 
					<s:a cssClass="locale" href="%{en}">EN</s:a></li>
				</s:else>
				
				<s:if test="locale.language=='fr'">
				<li><s:url id="fr" action="localeChange">
						<s:param name="request_locale">fr</s:param>					
					</s:url> 
					<s:a cssClass="actiu locale" href="%{fr}">FR</s:a></li>
				</s:if>
				<s:else>
				<li><s:url id="fr" action="localeChange">
						<s:param name="request_locale">fr</s:param>					
					</s:url> 
					<s:a cssClass="locale" href="%{fr}">FR</s:a></li>
				</s:else>
			</ul>
		</div>
	</div>
	<div class="mainContent">
	
		<div id="imatges" class="imatges">
			<s:iterator value="section.images" var="img">
				<s:if test="#img.visible">
					<img src="/images<s:property value="#img.url"/>"
							style="width: 720px; height: 392px;">
				</s:if>
			</s:iterator>
		</div>
		
		<div id="menuProjectes">
			<s:if test="locale.language=='ca'">
			<ul>
			</s:if>
			<s:elseif test="locale.language=='es'">
				<ul style="margin-left: 184px;">
			</s:elseif> 
			<s:elseif test="locale.language=='en'">
				<ul style="margin-left: 189px;">
			</s:elseif> 
			<s:elseif test="locale.language=='fr'">
				<ul style="margin-left: 193px;">
			</s:elseif> 
			     <li><a class="seccio" id="colectiu"><s:text name="global.colectiuSection"></s:text></a></li> 
			     <li><a class="seccio" id="individual"><s:text name="global.individualSection"></s:text></a></li> 
			     <li><a class="seccio" id="urbanisme"><s:text name="global.urbanismeSection"></s:text></a></li>
			     <li><a class="seccio" id="enCurs"><s:text name="global.enCursSection"></s:text></a></li>
		     </ul>
		</div>
		<div id="menuDifusio">
			<s:if test="locale.language=='ca'">
				<ul style="margin-left: 482px;">
			</s:if>
			<s:elseif test="locale.language=='es'">
				<ul style="margin-left: 479px;">
			</s:elseif> 
			<s:elseif test="locale.language=='en'">
				<ul style="margin-left: 477px;">
			</s:elseif> 
			<s:elseif test="locale.language=='fr'">
				<ul style="margin-left: 477px;">
			</s:elseif>  
			     <li><a class="seccio" id="actualitat"><s:text name="global.actualitatSection"></s:text></a></li> 
			     <li><a class="seccio" id="publicacions"><s:text name="global.publicacionsSection"></s:text></a></li> 
		     </ul>
		</div> 	 	
	</div>
	<div class="footer">
		<div class="menu">
			<ul>
				<li><a class="seccio" id="estudi"><s:text
							name="global.estudi"></s:text></a></li>
				<li><a class="seccio" id="projectes"><s:text
							name="global.projectes"></s:text></a></li>
				<li><a class="seccio" id="serveis"><s:text
							name="global.serveis"></s:text></a></li>
				<li><a class="seccio" id="difusio"><s:text
							name="global.difusio"></s:text></a></li>
				<li><a class="seccio" id="contacte"><s:text
							name="global.contacte"></s:text></a></li>
			</ul>
		</div>
		<div class="direccio">Plaça del Marquès _08140 Caldes de
			Montbui_Barcelona_T 938 652 896_info@arquimes.com
			<div class="extern">
				<ul id="ulextern">
					<li><img src="${pageContext.request.contextPath}/img/facebook.png"/></li>
					<li><img src="${pageContext.request.contextPath}/img/twitter.png"/></li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>