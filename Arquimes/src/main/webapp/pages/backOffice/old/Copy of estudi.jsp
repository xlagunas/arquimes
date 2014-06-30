<%@ taglib prefix="s" uri="/struts-tags"%>
<div class="accordion" id="accordion2">
  <div class="accordion-group">
    <div class="accordion-heading">
      <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseOne">
        Imatges de Menu
      </a>
    </div>
    <div id="collapseOne" class="accordion-body in collapse" style="height: auto; ">
      <div class="accordion-inner">
		<ul class="thumbnails">
			<li class="span" style="display: none;"></li>
				<s:iterator value="section.images" var="img">
					<li class="span2">
						<s:a href="#" cssClass="thumbnail">
							<img id="<s:property value="#img.id"/>" src="/images<s:property value="#img.url"/>"/>
						</s:a>
				</s:iterator>
			</ul>      
		</div>
    </div>
  </div>
  <div class="accordion-group">
    <div class="accordion-heading">
      <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseTwo">
		Cotinguts
      </a>
    </div>
    <div id="collapseTwo" class="accordion-body collapse">
      <div class="accordion-inner">
        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
      </div>
    </div>
  </div>
  <div class="accordion-group">
    <div class="accordion-heading">
      <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseThree">
        Collapsible Group Item #3
      </a>
    </div>
    <div id="collapseThree" class="accordion-body collapse">
      <div class="accordion-inner">
        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
      </div>
    </div>
  </div>
</div>

<script type="text/javascript">
<!--
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

