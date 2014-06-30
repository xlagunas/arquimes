<%@ taglib prefix="s" uri="/struts-tags"%>
<div id="backOfficeBody">
	<div class="accordion" id="accordion2">
	  <div class="accordion-group" id="grup1">
	    <div class="accordion-heading">
	      <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseOne">
	        Imatges de Menu <i id="icon" class="icon-plus-sign pull-right" onclick="modalAddImages()"></i>
	      </a>
	    </div>
	    <div id="collapseOne" class="accordion-body in collapse" style="height: auto; ">
	      <div class="accordion-inner">
			<ul class="_thumbnails">
				<li class="span" style="display: none;"></li>
					<s:iterator value="section.images" var="img">
						<li class="span2" style="opaque;">
							<s:a href="#" onclick="accionsImatge(%{#img.id})">
								<s:if test="#img.visible">
									<img class="img-rounded mini-image" id="<s:property value="#img.id"/>" src="/images<s:property value="#img.url"/>"/>
								</s:if>
								<s:else>
									<img class="img-rounded desactivat mini-image" id="<s:property value="#img.id"/>" src="/images<s:property value="#img.url"/>"/>
								</s:else>
							</s:a>
						</li>
					</s:iterator>
				</ul>      
			</div>
	    </div>
	  </div>
	  <s:if test="section.elements != null">
	  <div class="accordion-group" id="grup2">
	    <div class="accordion-heading">
	      <s:if test="!section.hasContents && section.elements.size>0">
		      <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseTwo">
				Continguts
		      </a>
	      </s:if>
	      <s:else>
		      <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseTwo">
					Continguts <i id="icon" class="icon-plus-sign pull-right" onclick="modalAddContent()"></i>
			      </a>
	      </s:else>
	    </div>
	    <div id="collapseTwo" class="accordion-body collapse">
	      <div class="accordion-inner">
			<table class="table table-hover">
				  <caption></caption>
				  <thead>
				    <tr>
				      <th>Data Creació</th>
				      <th>Títol</th>
				      <th># Imatges</th>
				    </tr>
				  </thead>
				  <tbody id="taulaNova">
				  	<s:iterator value="section.elements" var="elm">
				    	<s:if test="#elm.visible">
				    		<tr id="<s:property value="#elm.id" />" class="success">
				    	</s:if>
				    	<s:else>
				    		<tr id="<s:property value="#elm.id"/>" class="error">				    		
				    	</s:else>	
				    		<td><s:date name="#elm.dateAdded" format="dd-MM-yyyy HH:mm"/></td>
					      	<!-- <td><s:property value="#elm.dateAdded"></s:property></td> -->
					      	<td><s:property value="#elm.header.ca_CA"></s:property></td>
					      	<td><s:property value="#elm.images.size"></s:property></td>
				      	</tr>
				   </s:iterator> 
				  </tbody>
				</table>
	      </div>
	    </div>
	  </div>
	  </s:if>
	</div>
</div>
<div class="modal hide" id="afegirImatges" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
    <h3 id="myModalLabel">Afegir Imatges...</h3>
  </div>
  <div class="modal-body">
    <p>Feu clic a afegir per afegir diverses imatges de cop, un cop finalitzat, premeu 'desa'.</p>
  </div>
  <div class="modal-footer">
  <s:form id="form" action="addImageSectionForm" method="POST"
				enctype="multipart/form-data" theme="simple">
	<div>
		<input type="button" class="btn pull-left" onclick="afegeix('#form')" value="Afegeix">
		<s:hidden name="sectionType" value='%{section.sectionType}' />
    </div>
    <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel.la</button>
    <s:submit type="button" cssClass="btn btn-warning" label="Desa"></s:submit>
    </s:form>
  </div>
</div>
<div class="modal hide" id="afegirContingut" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
    <h3 id="myModalLabel">Afegir Contingut...</h3>
  </div>
  <div class="modal-body">
    <p>Navegueu per les diferents pestanyes per afegir el contingut en diferents idiomes, posteriorment podreu afegir les imatges corresponents.</p>
    <div class="tab-pane" id="addNewContent">
			<p> Crear Contingut</p>
			
			<form action="addNewContentToSectionForm" method="post"
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
			
			<s:submit type="button" cssClass="btn btn-success pull-right" label="Afegeix"></s:submit>
			</form>
		</div>
  </div>
  <div class="modal-footer">
  
  </div>
</div>
<div class="modal hide" id="accionsImatge" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
    <h3 id="myModalLabel">Opcions d'Imatge..</h3>
  </div>
  <div class="modal-body">
    <p>Cliqueu sobre la acció que volgueu dur a terme</p>
  </div>
  <div class="modal-footer">
  <s:form id="form" action="ImageTransformSectionForm" method="POST"
				enctype="multipart/form-data" theme="simple">
	<div>
		<s:hidden name="sectionType" value='%{section.sectionType}' />
		<s:hidden name="idImage" value="21" id="idImageForm" />
    </div>
    <s:submit type="button" action="deleteImageSectionForm" cssClass="btn btn-warning" name="Elimina" value="elimina">Elimina <i class="icon-trash icon-white"></i></s:submit>
    <s:submit type="button" action="toggleImageSectionForm" cssClass="btn btn-success" name="ToggleVisibility" value="toggleVisibility">Mostra/Oculta <i class="icon-wrench icon-white"></i></s:submit>
    </s:form>
  </div>
</div>
<div class="modal hide" id="accionsImatgeContent" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
    <h3 id="myModalLabel">Opcions d'Imatge..</h3>
  </div>
  <div class="modal-body">
    <p>Cliqueu sobre la acció que volgueu dur a terme</p>
  </div>
  <div class="modal-footer">
  <s:form id="form" action="ContentImageTransformSectionForm" method="POST"
				enctype="multipart/form-data" theme="simple">
	<div>
		<s:hidden name="sectionType" value='%{section.sectionType}' />
		<s:hidden name="idImage" value="" id="idImageContentForm" />
		<s:hidden name="content.id" value="" id="idContent" />
    </div>
    <s:submit type="button" action="deleteContentImageSectionForm" cssClass="btn btn-warning" name="Elimina" value="elimina">Elimina <i class="icon-trash icon-white"></i></s:submit>
    <s:submit type="button" action="toggleContentImageSectionForm" cssClass="btn btn-success" name="ToggleVisibility" value="toggleVisibility">Mostra/Oculta <i class="icon-wrench icon-white"></i></s:submit>
    </s:form>
  </div>
</div>
<div class="modal hide" id="afegirContentImatges" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
    <h3 id="myModalLabel">Afegir Imatges...</h3>
  </div>
  <div class="modal-body">
    <p>Feu clic a afegir per afegir diverses imatges de cop, un cop finalitzat, premeu 'desa'.</p>
  </div>
  <div class="modal-footer">
  <s:form id="formContent" action="addImageContentSectionForm" method="POST"
				enctype="multipart/form-data" theme="simple">
	<div>
		<input type="button" class="btn pull-left" onclick="afegeix('#formContent')" value="Afegeix">
		<s:hidden name="sectionType" value='%{section.sectionType}' />
		<s:hidden name="content.id" value="-5" id="idContentImageSection"/>
    </div>
    <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel.la</button>
    <s:submit type="button" cssClass="btn btn-warning" label="Desa"></s:submit>
    </s:form>
  </div>
</div>
<div class="modal hide" id="afegirImatges" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
    <h3 id="myModalLabel">Afegir Imatges...</h3>
  </div>
  <div class="modal-body">
    <p>Feu clic a afegir per afegir diverses imatges de cop, un cop finalitzat, premeu 'desa'.</p>
  </div>
  <div class="modal-footer">
  <s:form id="form" action="addImageSectionForm" method="POST"
				enctype="multipart/form-data" theme="simple">
	<div>
		<input type="button" class="btn pull-left" onclick="afegeix()" value="Afegeix">
		<s:hidden name="sectionType" value='%{section.sectionType}' />
    </div>
    <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel.la</button>
    <s:submit type="button" cssClass="btn btn-warning" label="Desa"></s:submit>
    </s:form>
  </div>
</div>

<script type="text/javascript">
	$('#taulaNova > tr').bind('click', function(e){
	    callServerMethodJSP(true, false,"${pageContext.request.contextPath}/backOffice/getContent?idContent="
	    		+ $(this).attr('id')+"&idSection="+'<s:property value="section.sectionType"/>', {}, null,
				function(status, data) {
					if (status == "success") {
						$('#grup2').hide("slide");
						$('#accordion2').append(data);
					} else
						alert("error");
				});
		
	});

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
</script>