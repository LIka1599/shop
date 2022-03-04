<header>
        <div class="conteiner">
             <div class="logo">
                <img src="img/logo.svg" alt="">
            </div>
        </div>
    </header>
    <main>
    <nav>
            <div class="conteiner">
                <div class="category">
                    <div class="category__desc">Категории товаров</div>
                    <div class="category__list">
                         <?php
                            $result = addMenu($connect);
                            if (!$result){
                                trigger_error("Проблемы с базой данных", E_USER_ERROR);
                            }
                            while ($category = mysqli_fetch_assoc($result))
                            {
                                echo "<a href='products.php?category_id={$category["category_id"]}'>".$category["name"] .'</a>';
                            }
                        ?>
                    </div>
                </div>
            </div>
        </nav>
    </main>