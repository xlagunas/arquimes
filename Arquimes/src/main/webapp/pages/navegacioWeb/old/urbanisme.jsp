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
		<h1><s:text name="global.urbanismeSection"></s:text></h1>
	<s:debug />
	</div>

	<div class="llista">
		<ul>
		<s:iterator value="section.elements" var="elements">
			<s:if test="#elements.visible">
				<s:if test="locale.language=='ca'">
					<li><s:property value="#elements.header.ca_CA" escapeHtml="false"/></li>
				</s:if>
				<s:elseif test="locale.language=='es'">
					<li><s:property value="#elements.header.es_ES" escapeHtml="false"/></li>
				</s:elseif>
				<s:elseif test="locale.language=='en'">
					<li><s:property value="#elements.header.en_EN" escapeHtml="false"/></li>
				</s:elseif>
				<s:elseif test="locale.language=='fr'">
					<li><s:property value="#elements.header.fr_FR" escapeHtml="false"/></li>
				</s:elseif>
			</s:if>
		</s:iterator>
		</ul>
	</div>
</div>

<script type="text/javascript">;
	$(".imatges img").seqfx();
</script>