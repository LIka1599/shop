
//обработка выбора размера
const s =  document.querySelector('[value="S"]')
const m =  document.querySelector('[value="M"]')
const l =  document.querySelector('[value="L"]')

s.addEventListener('click', function() {
    s.setAttribute('checked', true);
    m.setAttribute('checked', false);
    l.setAttribute('checked', false);
})

m.addEventListener('click', function() {
    m.setAttribute('checked', true);
    s.setAttribute('checked', false);
    l.setAttribute('checked', false);
})

l.addEventListener('click', function() {
    l.setAttribute('checked', true);
    s.setAttribute('checked', false);
    m.setAttribute('checked', false);
})

//обробока смены фото

const side1 = document.querySelector('[data="side-1"]')
const side2 = document.querySelector('[data="side-2"]')
const side3 = document.querySelector('[data="side-3"]')
const main = document.querySelector('[data="main"]')

side1.addEventListener('mouseover', function() {
    var src = this.src;
    main.setAttribute('src', src)
} )

side2.addEventListener('mouseover', function() {
    var src = this.src;
    main.setAttribute('src', src)
} )

if (side3) {
    side3.addEventListener('mouseover', function() {
    var src = this.src;
    main.setAttribute('src', src)
    } ) 
}


/* const main = document.querySelector('[data="main"]')

function img (el) {
    main.setAttribute('src', el.src)
} */


//обработка кнопок счетчика

const btnMinus = document.querySelector('[data-action="minus"]');
const btnPlus = document.querySelector('[data-action="plus"]');

const counter = document.querySelector('[data-counter]');

btnMinus.addEventListener('click', function (){
    
    if (parseInt(counter.innerHTML) > 1)
    {
        counter.innerHTML = --counter.innerHTML;
        if (parseInt(counter.innerHTML) == 1){
            btnMinus.setAttribute('disabled', true);
        }
    }

})

btnPlus.addEventListener('click', function (){

    counter.innerHTML = ++counter.innerHTML;
    btnMinus.removeAttribute('disabled');
})

