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
			<s:text name="global.contacte"></s:text>
		</h1>

	</div>
	
	<div class="llista">
		<s:form id="contactForm" theme="simple" action="sendContactMail" acceptcharset="UTF-8">
			<fieldset>
				<p>
					<s:label theme="simple" for="name"><s:text name="mail.nom"></s:text></s:label>
					<s:textfield theme="simple" type="text" id="name"
						name="contactName" />
				</p>
				<p>
					<s:label theme="simple" for="mail"><s:text name="mail.mail"></s:text></s:label>
					<s:textfield theme="simple" type="text" id="mail"
						name="mail" />
				</p>
				<p>
					<s:label theme="simple" for="contact"><s:text name="mail.contacte"></s:text></s:label>
					<s:textarea cssClass="textAreaForm" theme="simple" type="input" id="content"
						name="content" style="height: 192px;width: 100%;" />
				</p>
				<p class="submit">
					<a onclick="doSubmit()"><s:text name="mail.envia"></s:text></a>
				</p>
			</fieldset>
		</s:form>
	</div>
</div>
<script type="text/javascript">
	$(".imatges img").seqfx();	
</script>