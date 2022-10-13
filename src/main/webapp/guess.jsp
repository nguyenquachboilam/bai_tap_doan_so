<%@ page import="com.cybersoft.model.GameNumber" %><%
    String guessStr = request.getParameter("guess");
    GameNumber guess = new GameNumber(Integer.parseInt(guessStr));
    String targetStr = request.getParameter("target");
    GameNumber target = new GameNumber(Integer.parseInt(targetStr));

    GameNumber guesses = new GameNumber(Integer.parseInt(request.getParameter("guesses")));

    String msg = "";
%>

<%
    if(guess.getValue() == target.getValue()) {
        msg = "Exactly!!! You got it in " + guesses.getValue() + " guesses.";
    } else {
        guesses.increment();
        if(guess.getValue() < target.getValue()){
            msg = "Incorrect. Guess higher!";
        } else {
            msg = "Incorrect. Guess lower!";
        }
    }
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
    <%= msg %>
</p>
<%
    if(guess.getValue() == target.getValue()) {
%>
        <a href="http://localhost:8080/guess">Play again!</a>
<%    } else {
%>
        <form action="guess" method="post">
            <label>
                Guess <%= guesses.getValue() %>:
            </label>
            <input type="text" name="guess" /><br>
            <input type="submit" value="Guess" />
            <%-- View page source to see target--%>
            <input type="hidden" name="target" value="<%= target.getValue() %>" />
            <input type="hidden" name="guesses" value="<%= guesses.getValue() %>" />
        </form>
<%
    }
%>
</body>
</html>