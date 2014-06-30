<%@ taglib prefix="s" uri="/struts-tags"%>
<s:bean name="com.sirx.arquimes.utils.ContentComparator" var="contentComparator" />

<script
	src="${pageContext.request.contextPath}/scripts/showScrollbar.js"></script>

<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
<script
	src="${pageContext.request.contextPath}/scripts/jquery.mousewheel.min.js"></script>
<script
	src="${pageContext.request.contextPath}/scripts/jquery.mCustomScrollbar.js"></script>

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
			<s:text name="global.estudiSection"></s:text>
		</h1>
	</div>
	<div class="llista">
	<s:sort comparator="#contentComparator" source="%{section.elements}" var="auxVar">
		<ul>
			<s:if test="section.hasContents==0">
				<s:if test="locale.language=='ca' && section.elements[0].visible">
					<li><s:property value="section.elements[0].content.ca_CA"
							escapeHtml="false"></s:property></li>
				</s:if>
				<s:elseif
					test="locale.language=='es' && section.elements[0].visible">
					<li><s:property value="section.elements[0].content.es_ES"
							escapeHtml="false" /></li>
				</s:elseif>
				<s:elseif
					test="locale.language=='en' && section.elements[0].visible">
					<li><s:property value="section.elements[0].content.en_EN"
							escapeHtml="false" /></li>
				</s:elseif>
				<s:elseif
					test="locale.language=='fr' && section.elements[0].visible">
					<li><s:property value="section.elements[0].content.fr_FR"
							escapeHtml="false" /></li>
				</s:elseif>
			</s:if>
			<s:else>
				<s:iterator>
					<s:if test="visible">
						<s:if test="locale.language=='ca'">
							<li><a class="seccioInterna"
								onclick="getContent(<s:property value="section.sectionType"/>,<s:property value="id"/>)">
									<s:property value="header.ca_CA" escapeHtml="false"></s:property>
							</a></li>
						</s:if>
						<s:elseif test="locale.language=='es'">
							<li><a class="seccioInterna"
								onclick="getContent('<s:property value="section.sectionType"/>',<s:property value="id"/>)">
									<s:property value="header.es_ES" escapeHtml="false"></s:property>
							</a></li>
						</s:elseif>
						<s:elseif test="locale.language=='en'">
							<li><a class="seccioInterna"
								onclick="getContent(<s:property value="section.sectionType"/>,<s:property value="id"/>)">
									<s:property value="header.en_EN" escapeHtml="false"></s:property>
							</a></li>
						</s:elseif>
						<s:elseif test="locale.language=='fr'">
							<li><a class="seccioInterna"
								onclick="getContent(<s:property value="section.sectionType"/>,<s:property value="id"/>)">
									<s:property value="header.fr_FR" escapeHtml="false"></s:property>
							</a></li>
						</s:elseif>
					</s:if>
				</s:iterator>
			</s:else>
		</ul>
		</s:sort>		
	</div>
</div>

<script>
   $(".llistaWrapper").mCustomScrollbar();
 
</script>
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