<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
  background-image: url(pal9.jpg);
  background-repeat: no-repeat;
  background-size: 100%; font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box;}

input[type=text], select, textarea {
  width: 80%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  margin-top: 6px;
  margin-bottom: 16px;
  resize: vertical;
}
input[type=email]{
  width: 80%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  margin-top: 6px;
  margin-bottom: 16px;
  resize: vertical;
}

input[type=date]{
  width: 80%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  margin-top: 6px;
  margin-bottom: 16px;
  resize: vertical;
}


input[type=button] {
  background-color: #4CAF50;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 56px;
  cursor: pointer;
}

input[type=button]:hover {
  background-color: #45a049;
}

input[type=submit] {
  background-color: #4CAF50;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 56px;
  cursor: pointer;
}

input[type=submit]:hover {
  background-color: #45a049;
}

.container {
  background-color: #f2f2f2;
  padding: 20px;
  opacity:0.7;
  width:50%;
}
</style>
</head>
<body>
<h3 style="color:green;">Upload Software Location</h3>
<form action = 'web.jsp'>
<br><br><br><br><br><br><br>
<br>
<br>
<center><div class="container">

<pre>
<center><b><label style="font-size: large; font-family: cursive;"> Upload Software Location </label></b><br>
</center>
<label style="font-size: medium; font-family: cursive;">Software File 1 :</label> <input type = "text" name = "file1" placeholder="Enter the software1 location">
<label style="font-size: medium; font-family: cursive;">Software File 2 :</label> <input type = "text" name = "file2" placeholder="Enter the software2 location">
<input type = "submit" value = "SUBMIT">
</pre>
</div>
</center>
</form>
</body>
</html>