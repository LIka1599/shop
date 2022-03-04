<?php
    require "inc/config.inc.php";
    require "inc/lib.inc.php";
    $product_id = (int)$_GET['product_id']; 

    $result = showProductCard($connect, $product_id);
    $product = mysqli_fetch_assoc($result);
    if (!$product){
        header("Location: ../error.php");
    }
    $categoryResult = showProductCardCategories ($connect, $product_id);
    
    $imageResult = showProductCardImage ($connect, $product_id);
   
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style_product.css">
    <link rel="stylesheet" href="Simple-Alert-Dialog-Box-Plugin-For-jQuery-al-js/src/al.css">
    <title>Shop</title>
</head>
<body>
    <div class="conteiner">
        <div class="product"> 
            <?php
             if ($_COOKIE["category_id"]){?>
                <div><a href='products.php?category_id=<?=$_COOKIE["category_id"]?>' class = "category__back"> <img src="../img/back.png" alt=""> </a></div>
             <?}
             else {?>
                <div><a href='products.php?category_id=<?=$product["main_category_id"]?>' class = "category__back"> <img src="../img/back.png" alt=""> </a></div>
             <?}
            ?>               
            <div class="product__pictures">
                <div class="product__preview">
                    <?php
                        $count = 1;
                        while ( $imagies = mysqli_fetch_assoc($imageResult)){
                            echo "<img src='img/{$imagies["image"]}' alt='side-picture-1' data='side-{$count}'>";
                            $count++;
                        }
                    ?>
                </div>
                <img class="product__picture-main" src="img/<?= $product["image_name"]?>" alt="main-picture" data="main">
            </div>
            <div class="product__description">
                <h2 class="product__title"><?=$product["name"]?></h2>
                <div class="product__categories">
                    <?php
                        while ($categories = mysqli_fetch_assoc($categoryResult)) {
                            echo "<a href='../products.php?category_id={$categories["category_id"]}'>{$categories["name"]}</a>";
                        }
                    ?>
                </div>
                <div class="product__price">
                    <div class="product__price-actual">
                        <span class="product__pcice-old"><?=$product["price"]?></span>
                        <span class="product__price-curent price"><?=$product["price_discount"]?></span>
                    </div>
                    <div class="product__price-discount">
                       <span class="product__price-final"><?=$product["funal_price"]?> ₽</span>
                       <span class="product__price-text">  — с промокодом</span>
                    </div>
                    
                </div>
                <div class="product__info">
                    <div class="product__info-lamoda">В наличии в магазине <a href="#">Lamoda</a></div>
                    <div class="product__info-delivery">Бесплатная доставка</div>
                </div>
                <div class="product__options">
                    <div class="product__size">
                        <input class="size" id="s" type="radio" name="size" value="S" checked="true">
                        <label for="s">S</label>
                        <input class="size" id="m" type="radio" name="size" value="M">
                        <label for="m">M</label>
                        <input class="size" id="l" type="radio" name="size" value="L">
                        <label for="l">L</label>  
                    </div>
                    <div class="product__counter">
                        <button class="product__control action" data-action="minus" disabled>-</button>
                        <div class="product__control count" data-counter>1</div>
                        <button class="product__control action" data-action="plus">+</button>
                    </div>
                </div>
                
                <div class="product__actions">
                    <buttom class="custom-btn buy">Купить</buttom>
                    <buttom class="custom-btn like">В избранное</buttom>
                </div>
                <div class="product__text">
                    <div class="product__text-description"><?=$product["description"]?></div>
                </div>
                <div class="product__share">
                    <div class="product__share-text">Поделиться:</div>
                    <a><img src="img/1486147173-social-media-circled-network11_79480.png" alt="fb"></a>
                    <a><img src="img/1486147202-social-media-circled-network10_79475.png" alt="vk"></a>
                    <a><img src="img/1491579542-yumminkysocialmedia22_83078.png" alt="tw"></a>
                </div>
            </div>
        </div>
    </div>
    
    <div id="alBox"></div>
    <script src="Simple-Alert-Dialog-Box-Plugin-For-jQuery-al-js/lib/jquery-1.11.2.min.js"></script>
    <script src="Simple-Alert-Dialog-Box-Plugin-For-jQuery-al-js/src/al.js"></script>
    <script src="js/script.js"></script>
    <script src="js/notification.js"></script>
    
</body>
</html>