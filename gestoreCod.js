
$('document').ready(function () {
    var click = false;

    $(".encoding").click(function () {

        if(click == true){
            $(".encodingDesc").hide();
            click = false;
        }
        else {
            $(".encodingDesc").show();
            click = true; 
        }
      
    });
    
    var click1 = false;

    $(".profile").click(function () {        

        if(click1 == true){
            $("#profileDesc").hide();
            click1 = false;
        }
        else {
            $("#profileDesc").show();
            click1 = true; 
        }
        
    });
    
});

function jump_to(id_el){
    $([document.documentElement, document.body]).animate({
        scrollTop: $(id_el).offset().top
    }, 200);
}

