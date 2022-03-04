<?php
    ob_start();
    
    require "inc/config.inc.php";
    require "inc/lib.inc.php";
    set_error_handler("myError");
    
    $category_id = (int)$_GET['category_id']; 

    $value = (string)$_GET['category_id'];

    setcookie("category_id", $value);

    $count = 12;
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style_category.css">
    <title>Shop</title>
</head>
<body>
    <?php
        if ($category_id)
        {
           require "inc/category.inc.php"; 
        }
        else {
            require "inc/menu.inc.php";
        }
    ?>
</body>
</html>