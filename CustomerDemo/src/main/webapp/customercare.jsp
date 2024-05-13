<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Customer Care</title>
    
   <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<style>
    .myDiv {
      background-color:  #24252A; 
      padding: 15px;
      display: inline-block;
    }
    .divpl{
    padding-left: 40px;
    
    }
   
 </style>
</head>
<body>
 <%@ include file="header.jsp" %>

<br>
    <div class="container mt-5">


        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <h4>Customer Care Center - <b>Green Supermarket</b>
                            <a href="home.jsp" class="btn btn-danger float-right" style="display: block; text-align: right;">BACK</a>
                        </h4> 
         </div>
                    <div class="card-body">
                        <div>
                                <h5>
            Welcome to Green Supermarket's Customer Care Center! Your satisfaction is our top priority, 
            and we are here to assist you every step of the way. 
            Feel free to explore the various ways you can connect with us and the services we offer.
        						</h5>
                            </div>
                            
                            <div class="myDiv">
                            <img alt="" src="Images/slogo.png" width="300px">
                            </div>
                            <br>
                            <br>
                          
                            
                            <div>
                              <h4>Contact Us</h4>  
                               <strong>1. Customer Support Hotline:</strong> <a href="#" style="font-size: 20px; color: blue;"> 078 1122200</a>
                              <p> Call our toll-free number at above during business hours to speak with a friendly and knowledgeable representative.</p>
                            </div>
                            
                            <div>
                                <strong>2. Email Support:</strong><a href="#" style="font-size: 20px; color: blue;"> greensupermarket24x7@gmail.com</a>
                                <p>Send us an email at above email address. Our team will respond promptly, typically within 24 hours.</p>
                            </div>
                            
                            <div>
                            	<strong>3. Location:</strong> No 95, Galle Road, Colombo 4
                       
                            	 <p style="margin-bottom: 0;">Visit us during our convenient store hours:</p>
    							<ul class="divpl">
       								 	<li><strong>Weekdays:</strong> 7am - 10pm</li>
        								<li><strong>Weekends:</strong> 8am - 8pm</li>
    							</ul>
                            </div>
                            
                            <div>
                            <strong>4. Connect with Our Team Members:</strong> 
                           	<div>
                           	<ul class="divpl">
                            	<li>Jayaru 	: 077 0388622</li>
                            	<li>Lakdilu : 077 0802121</li>
                            	<li>Sonal   : 077 4256386</li>
                            	<li>Nimantha: 071 3083163</li>
                            	<li>Nisal   : 075 0684121</li>
                            </ul>
                           	</div>
                            <p>Chat with us instantly through whatsapp. Our team is ready to assist you in real-time.</p>
                            </div>
                            
                            <div>
                            <strong>4. In-Store Assistance:</strong> Visit our physical store, and our staff will be happy to assist you with any questions or concerns.
                            
							</div>
                       		<br>
                       		
                       		<div>
                       			<h4>Services We Offer</h4>
                       			<strong>1. Product Assistance:</strong> Unsure about a product or need more information? Our team can provide detailed information about our products, including ingredients, sourcing, and environmental impact.<br>
                       			<strong>2. Order Support:</strong> Having issues with an order? Whether it's tracking, returns, or cancellations, our Customer Care team is here to streamline the process for you.<br>
                       			<strong>3. Membership Programs:</strong> Learn about our loyalty programs, exclusive offers, and special promotions. Our team can guide you on how to maximize your membership benefits.<br>
                       		</div>
                       		<br>
                       		
                       		<div>
                       		<h4>Thank You!</h4>
                       		<p>We appreciate your trust in choosing Green Supermarket for your eco-friendly shopping needs. Our Customer Care team is here to ensure that your journey with us is smooth, enjoyable, and environmentally conscious. Thank you for being a part of our commitment to a greener, healthier future!</p>
                       		</div>
                       		
                       	</div>
                </div>
            </div>
        </div>
        </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<%@ include file="footer.jsp" %>


</body>
</html>
    