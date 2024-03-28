<?php
$query = "SELECT Fname, Lname
  FROM EMPLOYEE
    LEFT JOIN WORKS_ON ON Ssn = Essn
    LEFT JOIN PROJECT ON Pno = Pnumber
  WHERE Dno = ? AND Hours > ? AND Pname = ?;";

if ($_POST['dno']) {
  $q = $d->query($query, array($_POST['dno'], $_POST['hours'], $_POST['product']));
  print($q);
}
else {
  print <<<_HTML_
    <FORM method="post" action="$_SERVER['PHP_SELF']">
    Dno: <input type="number" name="dno" step="1">
    Hours: <input type="number" name="hours" step="1">
    Project: <input type="text" name="project">
    <BR/>
    <INPUT type="submit" value="SUBMIT">
    </FORM>
  _HTML_;
}
?>

<?php
$query = "SELECT Fname, Lname
  FROM EMPLOYEE
    LEFT JOIN DEPENDENT ON Ssn = Essn
  WHERE Fname = Dependent_name;";

if ($_POST) {
  $q = $d->query($query);
  print($q);
}
else {
  print <<<_HTML_
    <FORM method="post" action="$_SERVER['PHP_SELF']">
    <BR/>
    <INPUT type="submit" value="SUBMIT">
    </FORM>
  _HTML_;
}
?>

<?php
$query = "SELECT Fname, Lname
  FROM EMPLOYEE e1
    INNER JOIN EMPLOYEE e2 ON e1.Super_ssn = s2.Ssn
  WHERE e2.Fname = ? AND e2.Lname = ? ;";

if ($_POST['fname']) {
  $q = $d->query($query, array($_POST['fname'], $_POST['lname']));
  print($q);
}
else {
  print <<<_HTML_
    <FORM method="post" action="$_SERVER['PHP_SELF']">
    Fname: <input type="text" name="fname">
    Lname: <input type="text" name="lname">
    <BR/>
    <INPUT type="submit" value="SUBMIT">
    </FORM>
  _HTML_;
}
?>