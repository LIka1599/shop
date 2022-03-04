$(document).ready(function(){
 
    //обработка кнопки купить
    $('.buy').on('click', function(){
        let count = $('.count').html();
        let size = $('input[checked="true"]').attr('value'); 
        let title = $('.product__title').html(); 
        $("#alBox").al({
        context: "default",
        text: {
            title: "Success!",
            description: ("В корзину успешно добавлены " + title + " в количестве " + count + " шт.,  " + "размера " + size),
            dismiss:"OK"
        },

        seconds: 10
        });
    });

    //обработка кнопки добавить в избранное
    $('.like').on('click', function(){
        let title = $('.product__title').html();     
        $("#alBox").al({
        context: "default",
        text: {
            title: "Success!",
            description: ("В избранное успешно добавлены " + title),
            dismiss:"OK"
        },
        seconds: 10
        });
    });
    
});