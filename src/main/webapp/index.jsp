<%@ page import="com.cybersoft.model.GameNumber" %>

<%!
    int minimum = 0;
    int maximum = 1000;

    GameNumber target = new GameNumber();
    GameNumber guesses = new GameNumber(1);
%>
<%
    target.setRandom(minimum, maximum);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Guessing game</title>

</head>
<body>
    <h2>GUESSING GAME</h2>
    <p>
        Please guess a number from 1 to 1000
    </p>
    <form action="guess" method="post">
        <label>
            Guess 1:
        </label>
        <input type="text" name="guess" /><br>
        <input type="submit" value="Guess" />
        <%-- View page source to see target--%>
        <input type="hidden" name="target" value="<%= target.getValue() %>" />
        <input type="hidden" name="guesses" value="<%= guesses.getValue() %>" />
    </form>
</body>
</html>
