<%@taglib prefix="s" uri="/struts-tags"%>
<div class="accordion-group" id="grup3">
	<div class="accordion-heading">
		<a class="accordion-toggle" data-toggle="collapse"
			data-parent="#accordion2" href="#collapseThree"> Edició de
			Contingut <i id="icon" class="icon-arrow-left pull-right"
			onclick="returnToContent()"></i>
		</a>
	</div>
	<div id="collapseThree" class="accordion-body in collapse"
		style="height: auto;">
		<div class="accordion-inner">
			<p>En aquesta secció podràs modificar cadascun dels elements que
				conformen un contingut, només hi ha un botó, quan s'hagi acabat de
				modificar el contingut prém modificar.</p>
			<p> Per defecte, quan es crea un projecte nou, aquest no és visible </p>
			<ul class="nav nav-pills">
				<li class="active"><a href="#tab1" data-toggle="tab">Text</a></li>
				<li><a href="#tab3" data-toggle="tab">Prioritat</a></li>
				<s:if test="hasContents==1">
					<li><a href="#tab2" data-toggle="tab">Imatges Existents</a></li>
				</s:if>
				<s:form action="toggleContentSectionForm">
						<s:hidden name="content.id" value='%{content.id}' />
						<s:hidden name="sectionType" value='%{idSection}' />
				<s:if test="content.visible">
					<s:submit type="button" cssClass="btn btn-warning pull-right" label="Desactiva contingut"></s:submit>
				</s:if>
				<s:else>
					<s:submit type="button" cssClass="btn btn-success pull-right" label="Activa Contingut"></s:submit>
				</s:else>
				</s:form>
			</ul>

			<div class="tab-content">
				<div class="tab-pane active" id="tab1">
					<form action="updateContent" method="post"
						enctype="multipart/form-data" accept-charset="UTF-8">
						<s:submit type="button" cssClass="btn btn-success pull-right"
							label="Modifica"></s:submit>

						<s:hidden name="content.id" value='%{content.id}' />

						<div id="myNicPanel" style="width: 64px; text-align: center;"></div>

						<div class="tabbable tabs-left">
							<ul class="nav nav-tabs">
								<li class="active"><a href="#cat2" data-toggle="tab">Català</a></li>
								<li><a href="#esp2" data-toggle="tab">Español</a></li>
								<li><a href="#en2" data-toggle="tab">English</a></li>
								<li><a href="#fr2" data-toggle="tab">Français</a></li>
							</ul>
							<div class="tab-content">
								<div class="tab-pane active" id="cat2">
									<s:if test="hasContents==1">
									<s:textarea id="headCa" theme="simple"
										name="content.header.ca_CA"
										style="width: 292px; height: 30px;background-color: #fff;"
										value="%{content.header.ca_CA}"></s:textarea>
									</s:if>
									<s:textarea id="descCa" theme="simple"
										name="content.content.ca_CA"
										style="width: 292px; height: 392px;background-color: #fff;"
										value="%{content.content.ca_CA}"></s:textarea>
								</div>
								<div class="tab-pane" id="esp2">
									<s:if test="hasContents==1">
									<s:textarea id="headEs" theme="simple"
										name="content.header.es_ES"
										style="width: 292px; height: 30px;background-color: #fff;"
										value="%{content.header.es_ES}"></s:textarea>
										</s:if>
									<s:textarea id="descEs" theme="simple"
										name="content.content.es_ES"
										style="width: 292px; height: 392px;background-color: #fff;"
										value="%{content.content.es_ES}"></s:textarea>
								</div>
								<div class="tab-pane" id="en2">
									<s:if test="hasContents==1">
									<s:textarea id="headEn" theme="simple"
										name="content.header.en_EN"
										style="width: 292px; height: 30px;background-color: #fff;"
										value="%{content.header.en_EN}"></s:textarea>
										</s:if>
									<s:textarea id="descEn" theme="simple"
										name="content.content.en_EN"
										style="width: 292px; height: 392px;background-color: #fff;"
										value="%{content.content.en_EN}"></s:textarea>
								</div>
								<div class="tab-pane" id="fr2">
									<s:if test="hasContents==1">
									<s:textarea id="headFr" theme="simple"
										name="content.header.fr_FR"
										style="width: 292px; height: 30px;background-color: #fff;"
										value="%{content.header.fr_FR}"></s:textarea>
										</s:if>
									<s:textarea id="descFr" theme="simple"
										name="content.content.fr_FR"
										style="width: 292px; height: 392px;background-color: #fff;"
										value="%{content.content.fr_FR}"></s:textarea>
								</div>
							</div>
						</div>
					</form>
				</div>
				<div class="tab-pane" id="tab2">
						<i class="icon-plus-sign pull-right" onclick="afegirContentImatges(${idContent})"></i>
						<ul class="_thumbnails">
							<li class="span" style="display: none;"></li>
							<s:iterator value="content.images" var="img">
								<li class="span2" style=""><s:a href="#"
										onclick="accionsImatgeContent(%{#img.id},%{idContent})">
										<s:if test="#img.visible">
											<img class="img-rounded mini-image"
												id="<s:property value="#img.id"/>"
												src="/images<s:property value="#img.url"/>" />
										</s:if>
										<s:else>
											<img class="img-rounded desactivat mini-image"
												id="<s:property value="#img.id"/>"
												src="/images<s:property value="#img.url"/>" />
										</s:else>
									</s:a>
								</li>
							</s:iterator>
						</ul>
				</div>
				<div class="tab-pane" id="tab3">
					<form action="changePriorityContent" method="post"
						enctype="multipart/form-data" accept-charset="UTF-8">
						<s:hidden name="content.id" value="%{idContent}" />
						<s:textfield name="content.prioritat"></s:textfield>
						<s:submit />
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
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
myNicEditor.addInstance('headCa');
myNicEditor.addInstance('headEs');
myNicEditor.addInstance('headEn');
myNicEditor.addInstance('headFr');
</script>