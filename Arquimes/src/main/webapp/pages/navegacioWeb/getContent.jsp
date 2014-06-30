<%@ taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$('.goBack')
								.bind(
										'click',
										function(e) {
											callServerMethodJSP(
													true,
													false,
													"${pageContext.request.contextPath}/"
															+ e.currentTarget.id
															+ "Link",
													{},
													null,
													function(status, data) {
														if (status == "success") {
															if ($(
																	'#menuProjectes')
																	.is(
																			':visible'))
																$(
																		'#menuProjectes')
																		.hide();
															if ($(
																	'#menuDifusio')
																	.is(
																			':visible'))
																$(
																		'#menuDifusio')
																		.hide();
															if (e.target.id == 'colectiu'
																	|| e.target.id == 'individual'
																	|| e.target.id == 'enCurs'
																	|| e.target.id == 'urbanisme') {
																$(".seccio")
																		.removeClass(
																				"actiu");
																$(e.target)
																		.addClass(
																				"actiu");
																$('#projectes')
																		.addClass(
																				"actiu");
																$('.imatges')
																		.remove();
																$(
																		'.textplantilla')
																		.remove();

																$(data)
																		.prependTo(
																				$('.mainContent'));
																$(".goBack")
																		.attr(
																				"id",
																				e.target.id);
															} else if (e.target.id == 'actualitat'
																	|| e.target.id == 'publicacions') {
																$(".seccio")
																		.removeClass(
																				"actiu");
																$('#difusio')
																		.addClass(
																				"actiu");
																$(e.target)
																		.addClass(
																				"actiu");
																$('.imatges')
																		.remove();
																$(
																		'.textplantilla')
																		.remove();

																$(data)
																		.prependTo(
																				$('.mainContent'));
																$(".goBack")
																		.attr(
																				"id",
																				e.target.id);

															} else {
																$(".seccio")
																		.removeClass(
																				"actiu");
																$(e.target)
																		.addClass(
																				"actiu");
																$('.imatges')
																		.remove();
																$(
																		'.textplantilla')
																		.remove();

																$(data)
																		.prependTo(
																				$('.mainContent'));
															}

														} else {
															alert("error");
														}
													});
										});

					});
</script>
<div class="imatges">
	<s:iterator value="content.images" var="img">
		<s:if test="#img.visible">
			<img src="/images<s:property value="#img.url"/>"
				style="width: 100%; height: 100%;" />
		</s:if>
	</s:iterator>
</div>

<div class="textplantilla">
	<div class="titol">
		<h1>
			<s:if test="locale.language=='ca'">
				<s:property value="content.header.ca_CA" />
			</s:if>
			<s:elseif test="locale.language=='es'">
				<s:property value="content.header.es_ES" />
			</s:elseif>
			<s:elseif test="locale.language=='en'">
				<s:property value="content.header.en_EN" />
			</s:elseif>
			<s:elseif test="locale.language=='fr'">
				<s:property value="content.header.fr_FR" />
			</s:elseif>
			<a id="enCurs" class="goBack"><<</a>
		</h1>
	</div>
	<div class="llista">
		<ul>
			<s:if test="locale.language=='ca'">
				<li><s:property value="content.content.ca_CA"
						escapeHtml="false" /></li>
			</s:if>
			<s:elseif test="locale.language=='es'">
				<li><s:property value="content.content.es_ES"
						escapeHtml="false" /></li>
			</s:elseif>
			<s:elseif test="locale.language=='en'">
				<li><s:property value="content.content.en_EN"
						escapeHtml="false" /></li>
			</s:elseif>
			<s:elseif test="locale.language=='fr'">
				<li><s:property value="content.content.fr_FR"
						escapeHtml="false" /></li>
			</s:elseif>
		</ul>
	</div>
</div>

<script type="text/javascript">
	;
	$(".imatges img").seqfx();
	
	$('.llista').jScrollPane();


	
</script>