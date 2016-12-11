<?php
$q = $_REQUEST["q"];
echo ($q === "bob" || $q === "Bob")
    ? "Hi, Bob !"
    : "YOU ARE AN INPOSTOR !";
?>