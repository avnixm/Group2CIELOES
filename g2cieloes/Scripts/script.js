document.addEventListener('DOMContentLoaded', function () {
    var lis = document.querySelectorAll('.wrapper .sidebar ul li');
    lis.forEach(function (li) {
        li.addEventListener('click', function () {
            lis.forEach(function (item) {
                item.classList.remove('active');
            });
            this.classList.add('active');
        });
    });
});


window.addEventListener('scroll', function () {
    var container1 = document.querySelector('.text_container');
    var container2 = document.querySelector('.text_container_2');
    var rect1 = container1.getBoundingClientRect();
    var rect2 = container2.getBoundingClientRect();
    if (rect2.top < 0) {
        container2.style.position = 'sticky';
        container2.style.top = '15px';
    } else {
        container2.style.position = 'relative';
    }
});


