<%@taglib prefix="s" uri="/struts-tags"%>

<div id="taula">
<table class="table table-striped" style="text-align: center">
	<thead>
		<tr>
			<th>Activa</th>
			<th>Imatge</th>
			<th>Esborrar</th>
		</tr>
	</thead>
	<tbody id="cosElement">
		<tr>
			<td><s:checkbox theme="simple" name="visible" value="%{image.visible}"/></td>
			<td><img src="/images<s:property value='image.url'/>"/></td>
			<td><i class="icon-trash" data-toggle="modal" onclick="modalDelete()"></i></td>
			
		</tr>
	</tbody>
</table>
<s:form action="toggleImage" method="post"
				enctype="multipart/form-data" accept-charset="UTF-8">
<s:hidden name="idSection" value="%{section.sectionType}"/>
<s:hidden name="isSectionImage" value="true"/>				
<s:hidden name="image.id" value="%{image.id}"></s:hidden>
<s:hidden name="image.visible" value="%{image.visible}"/>
<s:submit type="button" label="Activa/Desactiva" cssClass="btn btn-success"></s:submit>
</s:form>
</div>
<div class="modal hide" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
    <h3 id="myModalLabel">Eliminar contingut...</h3>
  </div>
  <div class="modal-body">
    <p>Confirmeu que voleu eliminar l'element seleccionat?</p>
  </div>
  <div class="modal-footer">
  <form action="deleteImage" method="post"
				enctype="multipart/form-data" accept-charset="UTF-8">
  	<s:hidden name="idImage" value='%{image.id}' />
    <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel.la</button>
    <s:submit type="button" cssClass="btn btn-warning" label="Elimina"></s:submit>
    </form>
  </div>
</div>
