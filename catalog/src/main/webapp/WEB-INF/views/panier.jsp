<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>

<!DocType html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap-theme.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main.css">
	
<style>
body {
  padding-top: 40px;
  padding-bottom: 40px;
  background-color: #E6E6FA; 
}
</style>
</head>
<body>

      <div class="container table-responsive">
		<div class="row">
		<div class="col-xs-12 forminternaute text-center bg-info">
		<form action="ajouterArticle"  method="post"
			enctype="multipart/form-data">
		<c:if test="${panier.size!=0}">
		<table class="table table-bordered">
			<tr>
				<th>ID</th>
				<th>Désignation</th>
				<th>Quantité</th>
				<th>Prix</th>
				<th>Montant</th>
			</tr>
			<c:forEach items="${panier.articles}" var="art">
				<tr>
					<td>${art.produit.idProduit}</td>
					<td>${art.produit.designation}</td>	
					<td>		
  <a href="<%=request.getContextPath()%>/plus?idProduit=${art.produit.idProduit}">+</a>
					${art.quantite}
  <a href="<%=request.getContextPath()%>/minus?idProduit=${art.produit.idProduit}">-</a>
 
</td>

					<td>${art.produit.prix}</td>
					<td>${art.quantite*art.produit.prix}</td>
					<td><a href="<%=request.getContextPath()%>/deleteItem?idProduit=${art.produit.idProduit}">Supprimer</a></td>
					
				</tr>
			</c:forEach>
			<tr>
				<td colspan="4">Total</td>
				<td>${panier.total}</td>
			</tr>
		</table>
	</c:if>
	</form>
</div>
</div>
</div>


<div class="container table-responsive">
		<div class="row">
		<div class="col-xs-12 forminternaute text-center bg-info">
<table class="table table-bordered">
<tr>
 	 <td colspan="7">
         <a href="<%=request.getContextPath()%>/shop">Continuer Achat</a>
     </td>
</tr>    

</table>
</div>
</div>
</div>

<%-- <div class="container table-responsive">
		<div class="row">
		<div class="col-xs-12 forminternaute text-center bg-info">
<table class="table table-bordered">
<tr>
 	 <td colspan="7">		
<a href="<%=request.getContextPath()%>/commande">Enregistrer Commande</a>
</td>
</tr>    

</table>
</div>
</div>
</div> --%>

<br>
<br>
<br>


 <%--  <div class="container table-responsive">
		<div class="row">
		<div class="col-xs-12 forminternaute text-center bg-info">
			<f:form action="checkout" method="post"
			enctype="multipart/form-data">
			<table class="table table-bordered">
			
				<tr>
					<td>Nom Client</td>
					<td><input type="text" path="nomClient" /></td>
				</tr>
				<tr>
					<td>Adresse</td>
					<td><input type="text" path="adresse" /></td>
				</tr>
				<tr>
					<td>Email</td>
					<td><input type="text" path="email" /></td>
				</tr>
				<tr>
					<td>Téléphone</td>
					<td><input type="text" path="tel" /></td>
				</tr>
				<<tr>
					<td><input type="Submit" value="Enregistrement Commande" /></td>
				</tr> 
			</table>
	</f:form>
		</div>
			
		</div>
	</div> --%>
<br>
<br>

<%-- <div class="shopping-cart margin-top-70">
                        <div class="col-lg-4 col-md-4 col-sm-4 estimate">
                            <h6>Estimate shipping and tax</h6>
                            <h5>Enter your destination to get a shipping estimate.</h5>
                            <div class="reg-count">
                                <label>Country<span>&nbsp;*</span></label><br>
                                <input type="text">
                            </div>
                            <div class="reg-state"> 
                                <label>State/Province</label><br>
                                <input type="text">
                            </div>
                            <div class="reg-zip">   
                                <label>Zip/Postal Code</label><br>
                                <input type="text"><br>
                            </div>  
                            <a href="#" class="btn btn_reverse">Get a quote</a>
                        </div>  
                        <div class="col-lg-4 col-md-4 col-sm-4 cart_discount">
                            <h6>Discount code</h6>
                            <h5>Enter your destination to get a shipping estimate.</h5>
                            <input type="text"><br>
                            <a href="#" class="btn btn_reverse">apply coupon</a>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-4 cart_checkout">
                            <div class="info-checkout">
                                <div>
                                    <div class="subtotal-grandtotal">
                                        <div class="sub-total">
                                            
                                            <span class="check-grandtot">Grand Total</span>
                                            
                                        </div>
                                        <div class="grand-total">   
                                            
                                            <span class="check-grandtot">${panier.total}</span><br>
                                            
                                        </div>  
                                    </div>  
                                    <li><a href="checkout.html">Check Out</a></li>
                                    <a class="btn" href="<%=request.getContextPath()%>/checkout">Check Out</a>
                                    <a href="<%=request.getContextPath()%>/checkout" class="btn">procced to Checkout</a><br><br>
                                    <span class="description">Checkout with multiple address!</span>
                                </div>
                            </div>
                        </div>                  
                    </div>
                </div>
            </div>
        </section>
        <!-- End Shopping Cart --> --%>
        
</body>
</html>