<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Form Page</title>
    </head>
    <body>
        <h1>Ticket Form</h1>
        
        <form action="post.servlet" method="post">
            Email:<br/>
            <input type="text" name="requestor-email" size="60"/> <br/>
            Title:<br/>
            <input type="text" name="title" size="60"/> <br/>
            Description: <br/>
            <textarea name="description" cols="60" rows="10"></textarea> <br/>
            <input type="submit"/>
        </form>
    </body>
</html>
