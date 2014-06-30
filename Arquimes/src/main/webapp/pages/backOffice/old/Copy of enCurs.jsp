<%@ taglib prefix="s" uri="/struts-tags"%>
<div id="backOfficeBody">
	<div class="accordion" id="accordion2">
	  <div class="accordion-group">
	    <div class="accordion-heading">
	      <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseOne">
	        Imatges de Menu <i id="icon" class="icon-plus-sign pull-right"></i>
	      </a>
	    </div>
	    <div id="collapseOne" class="accordion-body in collapse" style="height: auto; ">
	      <div class="accordion-inner">
			<ul class="_thumbnails">
				<li class="span" style="display: none;"></li>
					<s:iterator value="section.images" var="img">
						<li class="span2" style="opaque;">
							<s:a href="#" rel="popover" data-original-title='Accions <i class="icon-trash pull-right"/>
								<i class="icon-wrench pull-right"/>'>
								<s:if test="#img.visible">
									<img class="img-rounded" id="<s:property value="#img.id"/>" src="/images<s:property value="#img.url"/>"/>
								</s:if>
								<s:else>
									<img class="img-rounded desactivat" id="<s:property value="#img.id"/>" src="/images<s:property value="#img.url"/>"/>
								</s:else>
							</s:a>
						</li>
					</s:iterator>
				</ul>      
			</div>
	    </div>
	  </div>
	  <s:if test="section.elements != null">
	  <div class="accordion-group">
	    <div class="accordion-heading">
	      <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseTwo">
			Cotinguts
	      </a>
	    </div>
	    <div id="collapseTwo" class="accordion-body collapse">
	      <div class="accordion-inner">
			<table class="table table-hover">
				  <caption></caption>
				  <thead>
				    <tr>
				      <th>Data de creació</th>
				      <th>Títol</th>
				      <th># Imatges</th>
				    </tr>
				  </thead>
				  <tbody id="taulaNova">
				  	<s:iterator value="section.elements" var="elm">
				    	<s:if test="#elm.visible">
				    		<tr id="<s:property value="#elm.id"/>" class="success">
				    	</s:if>
				    	<s:else>
				    		<tr id="<s:property value="#elm.id"/>" class="error">
				    	</s:else>	
					      	<td><s:property value="#elm.dateAdded"></s:property></td>
					      	<td><s:property value="#elm.header.ca_CA"></s:property></td>
					      	<td><s:property value="#elm.images.size"></s:property></td>
				      	</tr>
				   </s:iterator> 
				  </tbody>
				</table>
				<div id="contingutContent">
				</div>
	      </div>
	    </div>
	  </div>
	  </s:if>
	</div>
	
</div>

<script type="text/javascript">
<!--
$('#taulaNova > tr').bind('click', function(e){
    callServerMethodJSP(true, false,"${pageContext.request.contextPath}/backOffice/getContent?idContent="
    		+ $(this).attr('id')+"&idSection="+'<s:property value="section.sectionType"/>', {}, null,
			function(status, data) {
				if (status == "success") {
					alert(data);
					$('#contingutContent').append(data);
					//$('#taula').remove();
					//$('#Portada').append(data);
				} else
					alert("error");
			});
	
});
$('#icon').popover({
	  live: true,
	  placement: 'left',
	  offset: 5,
	  html: true,
	  content: function() {
	    return $(this).attr('class');
	  },
	  trigger: 'manual'
	});
$("a[rel=popover]").popover();
$("i[rel=popover]").popover();
$('#collapseOne').bind('click',function(e){
	$('.popover').show();
});
	var myNicEditor = new nicEditor(
			{
				fullpanel : false,
				iconsPath : '${pageContext.request.contextPath}/scripts/nicEditorIcons.gif',
				buttonList : [ 'bold', 'italic', 'underline' ]
			});
	myNicEditor.setPanel('myNicPanel');
	myNicEditor.addInstance('descCa');
	myNicEditor.addInstance('descEs');
	myNicEditor.addInstance('descEn');
	myNicEditor.addInstance('descFr');

	$('#pestanyes a').click(function(e) {
		e.preventDefault();
		$(this).tab('show');
	});
	
	$('#titols a').click(function(e) {
		e.preventDefault();
		$(this).tab('show');
	});
	$('.dropdown-toggle').dropdown();
	$('._thumbnails').bind(
			'click',
			function(e) {
				callServerMethodJSP(true, false,
						"${pageContext.request.contextPath}/backOffice/loadImage?idImage="
								+ e.target.id, {}, null,
						function(status, data) {
							if (status == "success") {
								$('#taula').remove();
								$('#Portada').append(data);
							} else
								alert("error");
						});

			});
	$('.icon-trash').bind('click',function(e){
		alert("he clickat");
	});
//-->
</script>

<div id="backOfficeBody">
	<ul class="nav nav-tabs" id="pestanyes">
		<li class="active"><a href="#Portada">Col.lectiu</a></li>
		<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Edita... <b class="caret"></b></a>
			<ul class="dropdown-menu">
				<li class=""><a href="#imageSection" data-toggle="tab">Imatges de Secció</a></li>
				<li class="dropdown-submenu"><a tabindex ="-1" href="#">Continguts...</a>
					<ul class="dropdown-menu">
					  <li><a tabindex="-1" href="#addNewContent">Afegeix Continguts</a></li>
					  <li><a tabindex="-1" href="#listSectionContents">Edita Continguts</a></li>
					</ul>
				</li>
			</ul>
		</li>
	</ul>

	<div class="tab-content">
		<div class="tab-pane active" id="Portada">
			<p>Llistat d'imatges</p>
			<ul class="thumbnails">
				<li class="span" style="display: none;"></li>
				<s:iterator value="section.images" var="img">
					<li class="span2"><s:a href="#" class="thumbnail">
							<img id="<s:property value="#img.id"/>"
								src="/images<s:property value="#img.url"/>" />
						</s:a></li>
				</s:iterator>
			</ul>
		</div>
		<div class="tab-pane" id="contentSection">
		</div>
		<div class="tab-pane" id="imageSection">
			<s:form id="form" action="AddSectionForm" method="POST"
				enctype="multipart/form-data" theme="simple">
				<input type="button" onclick="afegeix()" value="Afegeix">
				<s:hidden name="sectionType" value='%{section.sectionType}' />

				<s:submit label="Envia"></s:submit>
			</s:form>
		</div>
		<div class="tab-pane" id="addNewContent">
			<p> Crear Contingut</p>
			
			<form action="addContentForm" method="post"
				enctype="multipart/form-data" accept-charset="UTF-8">
				<s:hidden name="sectionType" value='%{section.sectionType}' />
				
			<div id="myNicPanel2" style="width: 64px; text-align: center;"></div>
			
			<div class="tabbable tabs-left">
			  <ul class="nav nav-tabs">
			   <li class="active"><a href="#cat1" data-toggle="tab">Català</a></li>
						<li><a href="#esp1" data-toggle="tab">Español</a></li>
						<li><a href="#en1" data-toggle="tab">English</a></li>
						<li><a href="#fr1" data-toggle="tab">Français</a></li>
			  </ul>
			  <div class="tab-content">
				<div class="tab-pane active" id="cat1">
					<s:textarea id="headCa2" theme="simple" name="content.header.ca_CA" style="width: 292px; height: 30px;background-color: #fff;" value="Títol del Contingut"></s:textarea>
					<s:textarea id="descCa2" theme="simple" name="content.content.ca_CA" style="width: 292px; height: 392px;background-color: #fff;"></s:textarea>
				</div>
				<div class="tab-pane" id="esp1">
					<s:textarea id="headEs2" theme="simple" name="content.header.es_ES" style="width: 292px; height: 30px;background-color: #fff;" value="Título del Contenido"></s:textarea>
					<s:textarea id="descEs2" theme="simple" name="content.content.es_ES" style="width: 292px; height: 392px;background-color: #fff;"></s:textarea>
				</div>
				<div class="tab-pane" id="en1">
					<s:textarea id="headEn2" theme="simple" name="content.header.en_EN" style="width: 292px; height: 30px;background-color: #fff;" value="Content's Title"></s:textarea>
					<s:textarea id="descEn2" theme="simple" name="content.content.en_EN" style="width: 292px; height: 392px;background-color: #fff;"></s:textarea>						
					</div>
				<div class="tab-pane" id="fr1">
					<s:textarea id="headFr2" theme="simple" name="content.header.fr_FR" style="width: 292px; height: 30px;background-color: #fff;" value=""></s:textarea>
					<s:textarea id="descFr2" theme="simple" name="content.content.fr_FR" style="width: 292px; height: 392px;background-color: #fff;"></s:textarea>						
				</div>
			  </div>
			</div>
			
			<s:submit type="button" cssClass="btn btn-success" label="Afegeix"></s:submit>
			</form>
		</div>
		
		<div class="tab-pane" id="listSectionContents">
			<p> Llistat de Continguts</p>
			
			<table class="table table-hover">
			  <caption></caption>
			  <thead>
			    <tr>
			      <th>Visible</th>
			      <th>Data</th>
			      <th>Títol</th>
			    </tr>
			  </thead>
			  <tbody id="taula">
			  	<s:iterator value="section.elements" var="elm">
			    	<tr id="<s:property value="#elm.id"/>">
			    		<td><s:checkbox theme="simple" name="visible" checked="%{elm.isVisible}"/></td>
				      	<td><s:property value="#elm.dateAdded"></s:property></td>
				      	<td><s:property value="#elm.header.ca_CA"></s:property></td>
			      	</tr>
			   </s:iterator> 
			  </tbody>
			</table>
			<div id="contingutContent">
			</div>
			<!--<s:form id="form" action="AddSectionForm" method="POST"
				enctype="multipart/form-data" theme="simple">
				<input type="button" onclick="afegeix()" value="Afegeix">
				<s:hidden name="sectionType" value='%{section.sectionType}' />

				<s:submit label="Envia"></s:submit>
			</s:form>-->
		</div>
	</div>
</div>
<script type="text/javascript">
<!--

$('#pestanyes a').click(function(e) {
	e.preventDefault();
	$(this).tab('show');
});

$('#titols a').click(function(e) {
	e.preventDefault();
	$(this).tab('show');
});
$('#taula>tr').bind('click', function(e){
    callServerMethodJSP(true, false,"${pageContext.request.contextPath}/backOffice/getContent?idContent="
    		+ $(this).attr('id')+"&idSection="+'<s:property value="section.sectionType"/>', {}, null,
			function(status, data) {
				if (status == "success") {
					alert(data);
					$('#contingutContent').append(data);
					//$('#taula').remove();
					//$('#Portada').append(data);
				} else
					alert("error");
			});
	
});
$('.dropdown-toggle').dropdown();
$('.thumbnails').bind(
		'click',
		function(e) {
			callServerMethodJSP(true, false,
					"${pageContext.request.contextPath}/backOffice/loadImage?idImage="
							+ e.target.id+"&idSection="+'<s:property value="section.sectionType"/>', {}, null,
					function(status, data) {
						if (status == "success") {
							$('#taula').remove();
							$('#Portada').append(data);
						} else
							alert("error");
					});

		});
		
	var myNicEditor = new nicEditor(
			{
				fullpanel : false,
				iconsPath : '${pageContext.request.contextPath}/scripts/nicEditorIcons.gif',
				buttonList : [ 'bold', 'italic', 'underline' ]
			});
	myNicEditor.setPanel('myNicPanel');
	//PETA AQUI NO SE XQ ENCARA;S'HA DE DEBUGGAR
	//myNicEditor.setPanel('myNicPanel2');
	myNicEditor.addInstance('descCa');
	myNicEditor.addInstance('descEs');
	myNicEditor.addInstance('descEn');
	myNicEditor.addInstance('descFr');
	myNicEditor.addInstance('descCa2');
	myNicEditor.addInstance('descEs2');
	myNicEditor.addInstance('descEn2');
	myNicEditor.addInstance('descFr2');
	myNicEditor.addInstance('headCa2');
	myNicEditor.addInstance('headEs2');
	myNicEditor.addInstance('headEn2');
	myNicEditor.addInstance('headFr2');
	
	
//-->

</script>