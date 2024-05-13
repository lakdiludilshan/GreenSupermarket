 <script>
        // Create a link element for the CSS file
        var link = document.createElement('link');
        link.rel = 'stylesheet';
        link.type = 'text/css';
        link.href = 'CSS/header.css'; 

        document.body.appendChild(link);
    </script>

<header class="header">
<img class="logo" src="Images/sadmin.png" alt="logo" width="350px">
<nav>


    <ul class="nav__links">
        <li> <a class= "cta" href="allcustomers.jsp">Customers</a></li>
        <li> <a class= "cta" href="productlist.jsp">Product List</a></li>
        <li> <a class= "cta" href="orderlist.jsp">Orders</a></li>
        <li> <a class= "cta" href="#">Customer Care</a></li>

    </ul>
</nav>

<a class="btn btn-danger" href="logout">Sign Out</a>

</header>