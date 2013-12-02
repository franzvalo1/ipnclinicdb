
jQuery(document).ready(function() {

    /*
        Background slideshow
    */
    $.backstretch([
      "assets/img/backgrounds/1.jpg"
    , "assets/img/backgrounds/2.jpg"
    , "assets/img/backgrounds/3.jpg"
    ], {duration: 3000, fade: 750});

    /*
        Tooltips
    */
    $('.links a.home').tooltip();
    $('.links a.blog').tooltip();

    /*
        Form validation
    */
    $('.register form').submit(function(){
    	 $(this).find("label[for='nombrep']").html('Nombre del Paciente');
         $(this).find("label[for='apep']").html('Apellido Paterno');
         $(this).find("label[for='apem']").html('Apellido Materno');
         $(this).find("label[for='curp']").html('CURP');
        $(this).find("label[for='username']").html('Usuario');
        $(this).find("label[for='email']").html('Email');
        $(this).find("label[for='password']").html('Password');
       
        ////$(this).find("label[for='']").html('');
      //$(this).find("label[for='']").append("<span style='display:none' class='red'> - Por favor introduce .</span>");
        var nombp = $(this).find('input#nombrep').val();
        var apep = $(this).find('input#apep').val();
        var apem = $(this).find('input#apem').val();
        var curp = $(this).find('input#curp').val();
        var username = $(this).find('input#username').val();
        var email = $(this).find('input#email').val();
        var password = $(this).find('input#password').val();

        if(nombp == ''){
        	$(this).find("label[for='nombrep']").append("<span style='display:none' class='red'> - Por favor introduce el nombre del paciente .</span>");
        	  $(this).find("label[for='nombrep'] span").fadeIn('medium');
              return false;
        }
        if(apep == ''){
        	$(this).find("label[for='apep']").append("<span style='display:none' class='red'> - Por favor introduce el apellido paterno.</span>");
        	 $(this).find("label[for='apep'] span").fadeIn('medium');
             return false;
        }
        if(apem == ''){
        	$(this).find("label[for='apem']").append("<span style='display:none' class='red'> - Por favor introduce el apellido materno.</span>");
        	 $(this).find("label[for='apem'] span").fadeIn('medium');
             return false;
        }
        
        if(curp == ''){
        	$(this).find("label[for='curp']").append("<span style='display:none' class='red'> - Por favor introduce el CURP</span>");
        	$(this).find("label[for='curp'] span").fadeIn('medium');
            return false;
        }
        if(username == '') {
            $(this).find("label[for='username']").append("<span style='display:none' class='red'> - Por favor introduce un usuario.</span>");
            $(this).find("label[for='username'] span").fadeIn('medium');
            return false;
        }
        if(email == '') {
            $(this).find("label[for='email']").append("<span style='display:none' class='red'> - Por favor introduce un email válido</span>");
            $(this).find("label[for='email'] span").fadeIn('medium');
            return false;
        }
        if(password == '') {
            $(this).find("label[for='password']").append("<span style='display:none' class='red'> - Please enter a valid password.</span>");
            $(this).find("label[for='password'] span").fadeIn('medium');
            return false;
        }
    });


});


