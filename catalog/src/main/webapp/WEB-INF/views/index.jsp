<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>

<!DocType html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main.css">
</head>
<body>
	
	<div class="container table-responsive">
		<div class="row">
		<div class="col-xs-12 formcategory text-center bg-info">
			<h3> Smart Informatique </h3> <br>
			<f:form modelAttribute="categorie" action="saveCat" method="post"
			enctype="multipart/form-data">
			<table class="table table-bordered">
				<tr>
					<td>Nom Catégorie</td>
					<td><f:input path="nomCategorie" /></td>
					<td><f:errors path="nomCategorie" cssClass="errors"></f:errors></td>
				</tr>
				<tr>
					<td>Description</td>
					<td><f:textarea path="description" /></td>
					<td><f:errors path="description" cssClass="errors"></f:errors></td>
				</tr>
				<tr>
					<td>Photo</td>
					<td><input type="file" name="file" /></td>
					<td></td>
				</tr>
				<tr>
					<td><input type="submit" value="Save" /></td>
				</tr>
			</table>
	</f:form>
		</div>
			
		</div>
	</div>
<br>
<br>

<div class="container table-responsive">
		<div class="row">
		<div class="col-xs-12 formcategory text-center bg-info">
		<div id="">
		<f:form modelAttribute="categorie" action="deleteCat" method="post"
			enctype="multipart/form-data">
			<table class="table table-bordered">
				<tr>
					<th>ID</th>
					<th>NOM CAT</th>
					<th>DESCRIPTION</th>
					<th>PHOTO</th>
					<c:forEach items="${categories}" var="cat">
						<tr>
							<td>${cat.idCategorie}</td>
							<td>${cat.nomCategorie}</td>
							<td>${cat.description}</td>
							<td><img src="photoCat?idCat=${cat.idCategorie}"></td>
							<td><input type="submit" value="Delete" /></td>
						</tr>
					</c:forEach>
				</tr>
			</table>
			</f:form>
		</div>
		</div>
		</div>
</div>


</body>
</html>











