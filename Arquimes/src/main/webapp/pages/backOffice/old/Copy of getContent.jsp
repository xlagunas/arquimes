<%@taglib prefix="s" uri="/struts-tags"%>
<div class="accordion-group" id="grup3">
	    <div class="accordion-heading">
	      <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseThree">
	        Edició de Contingut <i id="icon" class="icon-arrow-left pull-right" onclick="returnToContent()"></i>
	      </a>
	    </div>
	    <div id="collapseThree" class="accordion-body in collapse" style="height: auto; ">
		<p>Edita Contingut</p>
		  <ul class="nav nav-pills">
		    <li class="active"><a href="#tab1" data-toggle="tab">Text</a></li>
		    <li><a href="#tab2" data-toggle="tab">Imatges Existents</a></li>
		    <li><a href="#tab3" data-toggle="tab">Noves Imatges</a></li>    
		        
		  </ul>
		  
		  <div class="tab-content">
		    <div class="tab-pane active" id="tab1">
		    <form action="updateContent" method="post"
						enctype="multipart/form-data" accept-charset="UTF-8">
		        <s:submit type="button" cssClass="btn btn-success pull-right" label="Modifica"></s:submit>
		      
						<s:hidden name="content.id" value='%{content.id}' />
						
					<div id="myNicPanel2" style="width: 64px; text-align: center;"></div>
					
					<div class="tabbable tabs-left">
					  <ul class="nav nav-tabs">
					   <li class="active"><a href="#cat2" data-toggle="tab">Català</a></li>
								<li><a href="#esp2" data-toggle="tab">Español</a></li>
								<li><a href="#en2" data-toggle="tab">English</a></li>
								<li><a href="#fr2" data-toggle="tab">Français</a></li>
					  </ul>
					  <div class="tab-content">
						<div class="tab-pane active" id="cat2">
							<s:textarea id="headCa2" theme="simple" name="content.header.ca_CA" style="width: 292px; height: 30px;background-color: #fff;" value="%{content.header.ca_CA}"></s:textarea>
							<s:textarea id="descCa2" theme="simple" name="content.content.ca_CA" style="width: 292px; height: 392px;background-color: #fff;" value="%{content.content.ca_CA}"></s:textarea>
						</div>
						<div class="tab-pane" id="esp2">
							<s:textarea id="headEs2" theme="simple" name="content.header.es_ES" style="width: 292px; height: 30px;background-color: #fff;" value="%{content.header.es_ES}"></s:textarea>
							<s:textarea id="descEs2" theme="simple" name="content.content.es_ES" style="width: 292px; height: 392px;background-color: #fff;" value="%{content.content.es_ES}"></s:textarea>
						</div>
						<div class="tab-pane" id="en2">
							<s:textarea id="headEn2" theme="simple" name="content.header.en_EN" style="width: 292px; height: 30px;background-color: #fff;" value="%{content.header.en_EN}"></s:textarea>
							<s:textarea id="descEn2" theme="simple" name="content.content.en_EN" style="width: 292px; height: 392px;background-color: #fff;" value="%{content.content.en_EN}"></s:textarea>						
							</div>
						<div class="tab-pane" id="fr2">
							<s:textarea id="headFr2" theme="simple" name="content.header.fr_FR" style="width: 292px; height: 30px;background-color: #fff;" value="%{content.header.fr_FR}"></s:textarea>
							<s:textarea id="descFr2" theme="simple" name="content.content.fr_FR" style="width: 292px; height: 392px;background-color: #fff;" value="%{content.content.fr_FR}"></s:textarea>						
						</div>
					  </div>
					</div>
				</form>	
		    </div>
		    <div class="tab-pane" id="tab2">
		    <form action="updateContent" method="post"
						enctype="multipart/form-data" accept-charset="UTF-8">
		      <p>Llistat d'imatges</p>
					<ul class="thumbnails_2">
						<li class="span" style="display: none;"></li>
						<s:iterator value="content.images" var="img">
							<li class="span2"><s:a href="#" class="thumbnail">
									<img id="<s:property value="#img.id"/>"
										src="/images<s:property value="#img.url"/>" />
								</s:a></li>
						</s:iterator>
					</ul>
		       </form>
		    </div>
		    
		    <div class="tab-pane" id="tab3">
		    <form action="addImagesContent" method="post"
						enctype="multipart/form-data" accept-charset="UTF-8">
				<s:hidden name="idContent" value='%{content.id}' />
		    	<p>Afegeix noves imatges</p>
				<div id="newImageForm"> <!-- Es diu form xq coincideixi amb la funcio afegeix -->
					<input type="button" onclick="afegeixNoStyle()" value="Afegeix">
			
					<s:submit label="Envia"></s:submit>
				</div>
			</form>
		    </div>
		  </div>
	</div>
</div>
<script>
$('.thumbnails_2').bind(
		'click',
		function(e) {
			callServerMethodJSP(true, false,
					"${pageContext.request.contextPath}/backOffice/loadImage?idImage="
							+ e.target.id+"&idSection="+'<s:property value="section.sectionType"/>', {}, null,
					function(status, data) {
						if (status == "success") {
							$('#taula').remove();
							$('#contingutContent').append(data);
						} else
							alert("error");
					});

		});
		
function afegeixNoStyle(){
	var item= "<div class='upload-wrapper'>";
	item += "			<div class='upload-wrapper-cell'>";
	item += "				<input type='file' name='upload' style='margin-top: 4px;margin-left: 4px;' value='' id='form_upload'>";
	item += "			</div>";
	item += "			<div class='upload-wrapper-cell-icon'>";
	item += "				<i class='icon-remove-sign'></i>";
	item += "			</div>";
	item += "		</div>";
	alert(item);
	var elem = $(item).prependTo($('#newImageForm'));
	$(elem).find(".icon-remove-sign").bind("click",{row:elem},function(e){
		$(e.data.row).remove();
	});
}
</script>