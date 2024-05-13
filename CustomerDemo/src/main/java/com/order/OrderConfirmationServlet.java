package com.order;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/orderConfirmation")
public class OrderConfirmationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        String productTitle = request.getParameter("productTitle");

       
        String senderEmail = "greensupermarket24x7@gmail.com";
        String senderPassword = "oxnm xibi lnsf urih";

       
        String receiverEmail = "lakdilu1234@gmail.com";

   
        Properties properties = new Properties();
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "465");

     
        Session session = Session.getInstance(properties, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(senderEmail, senderPassword);
            }
        });

        try {
           
            Message message = new MimeMessage(session);

          
            message.setFrom(new InternetAddress(senderEmail));

         
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(receiverEmail));

         
            message.setSubject("Order Confirmation");

         
            String emailContent = "Dear Customer,\n\nYour order for the product '" + productTitle
                    + "' has been confirmed. Thank you for your purchase!";
            message.setText(emailContent);

          
            Transport.send(message);

            response.getWriter().println("Email sent successfully.");

        } catch (MessagingException e) {
            response.getWriter().println("Error sending email. Please check the logs for details.");
         
            e.printStackTrace();
        }
    }
}
