<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>
<%@ page import="java.util.Properties" %>

<%
   
    String productTitle = request.getParameter("productTitle");

    
    String senderEmail = "greensupermarket24x7@gmail.com";
    String senderPassword = "oxnm xibi lnsf urih";

    
    String receiverEmail = "lakdilu1234@gmail.com";

    
    Properties property = new Properties();
    property.put("mail.smtp.auth", "true");
    property.put("mail.smtp.starttls.enable", "true");
    property.put("mail.smtp.host", "smtp.gmail.com");
    property.put("mail.smtp.port", "587"); 

    
    Session sessi = Session.getInstance(property, new Authenticator() {
        protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(senderEmail, senderPassword);
        }
    });

    try {
        
        Message message = new MimeMessage(sessi);

        
        message.setFrom(new InternetAddress(senderEmail));

       
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(receiverEmail));

        
        message.setSubject("Order Confirmation");

       
        String emailContent = "Dear Customer,\n\nYour order for the product '" + productTitle + "' has been confirmed. Thank you for your purchase!";
        message.setText(emailContent);

       
        Transport.send(message);

        out.println("Email sent successfully.");

    } catch (MessagingException e) {
        out.println("Error sending email. Please check the logs for details.");
        
        e.printStackTrace();
    }
%>
