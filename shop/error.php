<?php
    header($_SERVER["SERVER_PROTOCOL"]." 404 Not Found");
    $error_title = '404 Page not found';
    $error_message = 'Страница не найдена';
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shop</title>
    <link rel="stylesheet" href="css/style_category.css">
</head>
<body>
    <div class="conteiner">
        <div class="error">
            <div class="error__title"><?=$error_title?></div>
            <div class="error__description"><?=$error_message?></div>
            <a href="products.php" class=""><button class="error__button">На главную</button></a>
        </div>
        
    </div>
   
</body>
</html>