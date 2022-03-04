<?php

function addMenu($connect)
{
    $sql = "SELECT c.category_id,
                    c.name,
                    count(*) AS count_category,
                    c.description
            FROM category c
            JOIN product_category pc
                ON pc.category_id = c.category_id
            GROUP BY  c.category_id
            ORDER BY  count_category DESC";
    $result = mysqli_query($connect, $sql);
    return $result;
}

function addProductCards($connect, $category_id) {

    $sql = "SELECT p.product_id,
                    p.name,
                    c.name AS category_name,
                    i.image AS image_name,
                    i.image_alt
            FROM product p
            JOIN category c
                ON p.main_category_id = c.category_id
            JOIN image i
                ON p.main_img_id = i.image_id
            WHERE p.product_id IN 
                    (SELECT pc.product_id
                    FROM product_category pc
                    WHERE pc.category_id = $category_id)";

    if(!$result = mysqli_query($connect, $sql))
        return false;

    while ($product = mysqli_fetch_assoc($result))
    {
        $products[] = $product;
    }
    return $products;
}

function showProductCard ($connect, $product_id){

    $sql = "SELECT p.product_id,
                    p.name,
                    p.price,
                    round(price - price*discount) AS price_discount,
                    round((price - price*discount) * 0.9) AS funal_price,
                    p.description,
                    i.image AS image_name,
                    p.main_category_id
                FROM product p, image i
                WHERE p.main_img_id = i.image_id 
                    AND p.product_id =  $product_id";
    
    $result = mysqli_query($connect, $sql);
    
    return $result;
}

function showProductCardCategories ($connect, $product_id) {

    $sql = "SELECT c.category_id, c.name
            FROM product_category pc
            JOIN category c
                ON pc.category_id = c.category_id
                    AND pc.product_id = $product_id";

   $result = mysqli_query($connect, $sql);
   return $result;
} 

function showProductCardImage ($connect, $product_id) {

    $sql = "SELECT i.image
            FROM product_image pi
            JOIN image i
                ON pi.image_id = i.image_id
                    AND pi.product_id  = $product_id";

   $result = mysqli_query($connect, $sql);
   return $result;
}