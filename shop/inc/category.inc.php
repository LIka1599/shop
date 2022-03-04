<header>
        <nav>
            <div class="conteiner">
                <div class="category">
                    <div class="category__name">
                         <?php
                            $result = addMenu($connect);
                            if (!$result){
                                trigger_error("Проблемы с базой данных", E_USER_ERROR);
                            }
                            while ($category = mysqli_fetch_assoc($result))
                            {
                                echo "<a href='products.php?category_id={$category["category_id"]}'>".$category["name"] .'</a>';
                                $count_category[$category["category_id"]] = $category["count_category"];
                                $description_category [$category["category_id"]] = $category["description"]; 
                            }
                        ?>
                    </div>
                   <div class="category__description">
                       <div><a href='products.php' class = "category__back"> <img src="../img/back.png" alt=""> </a></div>
                       <div class="category__description-name"><span><?=$description_category[$category_id]?> / </span> 
                       <span class="count"> Всего товаров: <?=$count_category[$category_id]?></span></div>
                    </div>
                </div>
            </div>
        </nav>
    </header>
    <main>
        <div class="conteiner">
            <div class="product-card">
                <div class="product-card__conteiner">
                    <?php
            
                        $products = addProductCards($connect, $category_id);
                                            
                        if ($products == false)
                        {
                            header("Location: ../error.php");
                        }
                        
                        $page_count = ceil(count($products) / $count);

                        $page = (int)$_GET['page'];

                        if (!$page){
                            $page = 1;
                        }
                        
                        if ($page > $page_count){
                            header("Location: ../error.php");
                        }
                        
                        for($i = ($page-1)*$count; $i < $page*$count; $i++){ ?>
                            <a href='product.php?product_id=<?=$products[$i]['product_id']?>' class='product-card__box'>
                            <div><img src='../img/<?=$products[$i]['image_name']?>' alt='<?=$products[$i]['image_alt']?>'></div>
                            <div class='product-card__category'><?=$products[$i]['category_name']?></div>
                            <div class='product-card__caption'><?=$products[$i]['name']?></div>  
                        <?}
                    ?>
                </div>
            </div>
            <div class="page-list">
                <?php
                    $count = 0;
                    for ($i = 1; $i <= $page_count; $i++){ 
                        if ($page == $i)
                            echo "<a href='?category_id={$category_id}&page=$i' ><button disabled class='page-button active'>$i</button></a>";
                        else 
                           echo "<a href='?category_id={$category_id}&page=$i'><button class='page-button'>$i</button></a>";
                        $count++;
                    }
                ?> 
            </div>
        </div>
    
</main>