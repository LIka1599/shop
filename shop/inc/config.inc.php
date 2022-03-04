<?php
const DB_HOST = 'localhost';
const DB_LOGIN = 'root';
const DB_PASSWORD = 'root';
const DB_NAME = 'shop';


function myError($no, $msg, $file, $line) {
    if ($no == E_USER_ERROR){
        echo "Что-то пошло не так..";
        $s = "$msg в $file: $line \n";
        error_log($s, 3, "error.log" );
    }
}
set_error_handler("myError");

$connect = mysqli_connect(DB_HOST, DB_LOGIN, DB_PASSWORD, DB_NAME);

if ($connect == false)
{
    $error = 'Ошибка подключения базы данных ('.mysqli_connect_errno() .'):' . mysqli_connect_error();
    trigger_error($error, E_USER_ERROR);
}