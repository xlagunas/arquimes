<%@ taglib prefix="s" uri="/struts-tags"%>

<div class="imatges">
	<s:iterator value="section.images" var="img">
		<s:if test="#img.visible">
			<img src="/images<s:property value="#img.url"/>"
				style="width: 100%; height: 100%;" />
		</s:if>
	</s:iterator>
</div>

<div class="textplantilla">
	<div class="titol">
		<h1>
			<s:text name="global.serveis"></s:text>
		</h1>
	</div>
	<div class="llista">
		<ul>
			<s:if test="section.hasContents==0">
				<s:if test="locale.language=='ca'">
					<li><s:property value="section.elements[0].content.ca_CA"
							escapeHtml="false" /></li>
				</s:if>
				<s:elseif test="locale.language=='es'">
					<li><s:property value="section.elements[0].content.es_ES"
							escapeHtml="false" /></li>
				</s:elseif>
				<s:elseif test="locale.language=='en'">
					<li><s:property value="section.elements[0].content.en_EN"
							escapeHtml="false" /></li>
				</s:elseif>
				<s:elseif test="locale.language=='fr'">
					<li><s:property value="section.elements[0].content.fr_FR"
							escapeHtml="false" /></li>
				</s:elseif>
			</s:if>
			<s:else>
				<s:iterator value="section.elements" var="elements">
					<s:if test="#elements.visible">
						<s:if test="locale.language=='ca'">
							<li><a class="seccioInterna"
								onclick="getContent(<s:property value="section.sectionType"/>,<s:property value="#elements.id"/>)">
									<s:property value="#elements.header.ca_CA"></s:property>
							</a></li>
						</s:if>
						<s:elseif test="locale.language=='es'">
							<li><a class="seccioInterna"
								onclick="getContent(<s:property value="section.sectionType"/>,<s:property value="#elements.id"/>)">
									<s:property value="#elements.header.es_ES"></s:property>
							</a></li>
						</s:elseif>
						<s:elseif test="locale.language=='en'">
							<li><a class="seccioInterna"
								onclick="getContent(<s:property value="section.sectionType"/>,<s:property value="#elements.id"/>)">
									<s:property value="#elements.header.en_EN"></s:property>
							</a></li>
						</s:elseif>
						<s:elseif test="locale.language=='fr'">
							<li><a class="seccioInterna"
								onclick="getContent(<s:property value="section.sectionType"/>,<s:property value="#elements.id"/>)">
									<s:property value="#elements.header.fr_FR"></s:property>
							</a></li>
						</s:elseif>
					</s:if>
				</s:iterator>
			</s:else>
		</ul>
	</div>
</div>


<script type="text/javascript">;
	$(".imatges img").seqfx();
	function getContent(idSection, idContent){
		callServerMethodJSP(true, false,"${pageContext.request.contextPath}/getContent?idSection="+idSection+"&idContent="+idContent, {}, null, function(status, data) {
			if (status == "success") {
				if ( $('#menuProjectes').is(':visible'))
					$('#menuProjectes').hide();
				if ( $('#menuDifusio').is(':visible'))
					$('#menuDifusio').hide();
				$('.imatges').remove();
				$('.textplantilla').remove();
				$(data).prependTo($('.mainContent'));
			} else {
				alert("error");
			}
		});
	};

	$('.llista').jScrollPane();
		
</script>