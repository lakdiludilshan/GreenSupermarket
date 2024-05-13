<%@ page import="com.paypal.api.payments.*" %>
<%@ page import="com.paypal.base.rest.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>

<%
    
    String clientId = "Ab9yflfJU7bXkk3Y-Jr26QR63RL3ybIPbpjG44OSKwWEuxV_lwk1Q1zx4wbkw21Nym_M9D_VZv1pieOY";
    String clientSecret = "EARNAoGum5QbxtnfDKeE1siX4kOuzBHXOY6ohdutpopJ5pxaXG2ZOTa5an2yTswSHGv8irDUg9aV1YiD";

    
    APIContext apiContext = new APIContext(clientId, clientSecret, "sandbox");

    
    String productId = request.getParameter("productId");
    String productTitle = request.getParameter("productTitle");
    String productDescription = request.getParameter("productDescription");
    String productCategory = request.getParameter("productCategory");
    String productPrice = request.getParameter("productPrice");

   
    Payer payer = new Payer();
    payer.setPaymentMethod("paypal");

    
    Details details = new Details();
    details.setSubtotal(productPrice);

    Amount amount = new Amount();
    amount.setCurrency("USD");
    amount.setTotal(productPrice);
    amount.setDetails(details);

    Transaction transaction = new Transaction();
    transaction.setAmount(amount);
    transaction.setDescription(productTitle);

    List<Transaction> transactions = new ArrayList<Transaction>();
    transactions.add(transaction);

    
    RedirectUrls redirectUrls = new RedirectUrls();
    redirectUrls.setReturnUrl("http://yourwebsite.com/success.jsp");
    redirectUrls.setCancelUrl("http://yourwebsite.com/cancel.jsp");

    
    Payment payment = new Payment();
    payment.setIntent("sale");
    payment.setPayer(payer);
    payment.setTransactions(transactions);
    payment.setRedirectUrls(redirectUrls);

    try {
        
        Payment createdPayment = payment.create(apiContext);
        Iterator links = createdPayment.getLinks().iterator();
        while (links.hasNext()) {
            Links link = (Links) links.next();
            if (link.getRel().equalsIgnoreCase("approval_url")) {
              
                response.sendRedirect(link.getHref());
            }
        }
    } catch (PayPalRESTException e) {
        e.printStackTrace();
        
        response.sendRedirect("unsuccess.jsp");
    }
    
    
%>
