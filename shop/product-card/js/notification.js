$(document).ready(function(){

    //обработка кнопки купить
    $('.buy').on('click', function(){
        let count = $('.count').html();
        let size = $('input[checked="true"]').attr('value');    
        $("#alBox").al({
        context: "default",
        text: {
            title: "Success!",
            description: ("В корзину успешно добавлены Джинсы Stradivarius в количестве " + count + " шт.,  " + "размера " + size),
            dismiss:"OK"
        },

        seconds: 10
        });
    });

    //обработка кнопки добавить в избранное
    $('.like').on('click', function(){    
        $("#alBox").al({
        context: "default",
        text: {
            title: "Success!",
            description: "В избранное успешно добавлены Джинсы Stradivarius",
            dismiss:"OK"
        },
        seconds: 10
        });
    });
    
});