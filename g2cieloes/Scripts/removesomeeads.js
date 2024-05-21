$(document).ready(function () {
    adsRemover();
});

function adsRemover() {
    $('script[src="http://ads.mgmt.somee.com/serveimages/ad2/WholeInsert4.js"]').remove();
    $('script#last-script').nextAll('div').remove(); // last tag before </body>       
    $('center').filter(function () {
        return $(this).html() == '<a href="http://somee.com">Web hosting by Somee.com</a>';
    }).remove();
    setTimeout(function () {
        adsRemover()
    }, 500);
}