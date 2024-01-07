 <script>
        // Create a link element for the CSS file
        var link = document.createElement('link');
        link.rel = 'stylesheet';
        link.type = 'text/css';
        link.href = 'CSS/header.css'; 

        document.body.appendChild(link);
    </script>

<header class="header">
<img class="logo" src="Images/slogo.png" alt="logo" width="340px">
<nav>


    <ul class="nav__links">
        <li> <a class= "cta" href="home.jsp">Home</a></li>
        <li> <a class= "cta" href="products.jsp">Products</a></li>
        <li> <a class= "cta" href="customercare.jsp">Customer Care</a></li>

    </ul>
</nav>
<a class="btn btn-danger" href="logout">Sign Out</a>
</header>