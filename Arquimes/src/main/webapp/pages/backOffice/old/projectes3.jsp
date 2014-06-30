<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<div id="backOfficeBody">

	<ul class="nav nav-tabs" id="myTab">
		<li class="active"><a href="#home">HAS ENTRAT!!</a></li>
		<li><a href="#profile">Profile</a></li>
		<li><a href="#messages">Messages</a></li>
		<li><a href="#settings">Settings</a></li>
	</ul>

	<div class="tab-content">
		<div class="tab-pane active" id="home">
			<div id="myNicPanel" style="width: 64px;text-align: center; "></div>

			<form action="addContentForm" method="post"
				enctype="multipart/form-data">
				<s:hidden name="sectionType" value='%{section.sectionType}' />
				
				<div class="tabbable tabs-left">
					<ul class="nav nav-tabs" id="titols">
						<li class="active"><a href="#cat">Català</a></li>
						<li><a href="#esp">Español</a></li>
						<li><a href="#en">English</a></li>
						<li><a href="#fr">Français</a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane fade" id="cat">
							<s:textarea id="titolCat"
								name="content.header.ca_CA" title="Titol del projecte"  style="width: 338px; height: 100px;background-color: #fff;"></s:textarea>
							<s:textarea id="descCat" name="content.content.ca_CA"
								placeholder="Descripció del projecte" style="width: 338px; height: 100px;background-color: #fff;"></s:textarea>
						</div>
						<div class="tab-pane fade" id="esp">
							<s:textfield name="content.header.es_ES"
								label="Título Castellano"></s:textfield>
							<s:textfield name="content.content.es_ES"
								label="Descripción Castellano"></s:textfield>
						</div>
						<div class="tab-pane fade" id="en">
							<s:textfield name="content.header.en_EN" label="Title English"></s:textfield>
							<s:textfield name="content.content.en_EN"
								label="Description English"></s:textfield>
						</div>
						<div class="tab-pane fade" id="fr">
							<s:textfield name="content.header.fr_FR" label="Title Francee"></s:textfield>
							<s:textfield name="content.content.fr_FR"
								label="Decription Francee"></s:textfield>
						</div>
					</div>
				</div>

				<s:file name="upload"></s:file>
				<s:file name="upload"></s:file>
				<s:file name="upload"></s:file>

				<s:submit></s:submit>
			</form>
		</div>
		<div class="tab-pane" id="profile"></div>
		<div class="tab-pane" id="messages"></div>
		<div class="tab-pane" id="settings"></div>

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
	myNicEditor.addInstance('titolCat');
	myNicEditor.addInstance('descCat');

	$('#myTab a').click(function(e) {
		e.preventDefault();
		$(this).tab('show');
	});
	$('#titols a').click(function(e) {
		e.preventDefault();
		$(this).tab('show');
	});

	
</script>