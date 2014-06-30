<%@ taglib prefix="s" uri="/struts-tags"%>

<div id="backOfficeBody">
	<ul class="nav nav-tabs" id="pestanyes">
		<li class="active"><a href="#Portada">Estudi</a></li>
		<li class="dropdown"><a href="#" class="dropdown-toggle"
			data-toggle="dropdown">Edita... <b class="caret"></b></a>
			<ul class="dropdown-menu">
				<li class=""><a href="#imageSection" data-toggle="tab">Imatges
						de Secció</a></li>
				<li class="disabled"><a class="disabled" href="#contentSection"
					data-toggle="tab">Contingut</a></li>
			</ul></li>
	</ul>

	<div class="tab-content">
		<div class="tab-pane active" id="Portada">
			<h2>Llistat d'imatges</h2>
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
			<div id="myNicPanel" style="width: 64px; text-align: center;"></div>

			<form action="addContentForm" method="post"
				enctype="multipart/form-data" accept-charset="UTF-8">
				<s:hidden name="sectionType" value='%{section.sectionType}' />
				<s:if test="section.elements[0]!=null">
				<s:hidden name="content.id" value="%{section.elements[0].id}"></s:hidden>
				<s:hidden name="content.content.id" value="%{section.elements[0].id}"></s:hidden>
				
				</s:if>
				<div class="tabbable tabs-left">
					<ul class="nav nav-tabs" id="titols">
						<li class="active"><a href="#cat">Català</a></li>
						<li><a href="#esp">Español</a></li>
						<li><a href="#en">English</a></li>
						<li><a href="#fr">Français</a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane fade" id="cat">
							<s:textarea id="descCa" theme="simple" name="content.content.ca_CA" label="Descripció del projecte" style="width: 292px; height: 392px;background-color: #fff;" value="%{section.elements[0].content.ca_CA}"></s:textarea>
						</div>
						<div class="tab-pane fade" id="esp">
							<s:textarea id="descEs" name="content.content.es_ES" label="Descripció del projecte" style="width: 292px; height: 392px;background-color: #fff;" value="%{section.elements[0].content.es_ES}"></s:textarea>
						</div>
						<div class="tab-pane fade" id="en">
							<s:textarea id="descEn" name="content.content.en_EN" label="Descripció del projecte" style="width: 292px; height: 392px;background-color: #fff;" value="%{section.elements[0].content.en_EN}"></s:textarea>						
							</div>
						<div class="tab-pane fade" id="fr">
							<s:textarea id="descFr" name="content.content.fr_FR" label="Descripció del projecte" style="width: 292px; height: 392px;background-color: #fff;" value="%{section.elements[0].content.fr_FR}"></s:textarea>						
						</div>
					</div>
				</div>
				<s:submit type="button" cssClass="btn btn-success">Edita</s:submit>
			</form>
		</div>
		<div class="tab-pane" id="imageSection">
			<s:form id="form" action="AddSectionForm" method="POST"
				enctype="multipart/form-data" theme="simple">
				<input type="button" onclick="afegeix()" value="Afegeix">
				<s:hidden name="sectionType" value='%{section.sectionType}' />

				<s:submit label="Envia"></s:submit>
			</s:form>
		</div>
	</div>
</div>
<script type="text/javascript">
<!--
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
	$('.thumbnails').bind(
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

