<%@taglib prefix="s" uri="/struts-tags" %>
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
		<h1><s:text name="global.projectes"></s:text></h1>

	</div>

	<div class="llista">
		<ul>
			<li>2003_Reforma i ampliació rest.Robert de Nola, Caldes de
				Montbui</li>
			<li>2005_Edifici d'oficines al carrer Calàbria, Barcelona</li>
			<li></li>
		</ul>
	</div>
</div>

<script type="text/javascript">;
	$(".imatges img").seqfx();
	
</script>