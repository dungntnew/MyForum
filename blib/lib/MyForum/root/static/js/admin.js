/*
 *  Admin JS
 * */

$(document).ready(function(){
    /**------------------------------------------------
     *
     *  ---------- GLOBAL SECTION ---------------------
     *-------------------------------------------------*/
    /*
		Auto resize screen
     */
	 resizeDisplay();
	 $(window).resize(function() {
		   resizeDisplay();
     });
	  
	


     /* 
      * Setup ajax indicator
      */
    //$('#container').append("<div id='ajax-loading'><img src='/static/images/ajax-loader.gif'></div>");
    
    $(document).ajaxStart(function(){
        $("#msg").empty();
        $('#ajax-loading').fadeIn('fast');        
    }).ajaxStop(function(){
        $('#ajax-loading').fadeOut('slow');
    });

    
    /**
     * Load section
     */
    $('.manager_bar ul li a').click( function() {
        return true;
    });

    /*
     * Upload image
     */
     /* Start upload */
      $("#upload_form").ajaxForm( {
            success: function (response, statusText, xhr) {

                if (response['status'] == 'success'){
                    $("#avatar").attr("value", response['data']['file_url']); 
                    $("#picture").attr("value", response['data']['file_url']); 
                    $("#upload_form img").attr("src", response['data']['file_url']);
                   	$("#upload_form input").width(400);
                   	setMsg("Upload file successful","success" );
                }else {
                    setMsg("Upload fail: "+statusText, "error");    
                }
            }
             
      });

     $("input[type=file]").bind("change select", function() {
         var file = $(this).val(); 
         $("#upload_form").trigger("submit");
      });
        

    /*
     * User manager section
     */
      
      /*
      	User Login
      */
	 $("#loginform").validate();	
     $("a.signIn").click(function() {
     	$("#signInDiv").css("display", "block");
     	$("#signUpDiv").css("display", "none");
		$("#authdiv").fadeIn();
		return false;
	 });
      /*
  		User Login
    
     $("a.signIn").click(function() {
		$("#authdiv").fadeIn();
		$("#loginform").validate( {
		
			submitHandler: function(form) {
				$(form).ajaxSubmit({
					type: 'post',
					dataType: 'json',
					success: function ( res, statusText, xhr){
						 if (res['status'] == 'error') {
                        	 setMsg('SignIn fail, '+ res['msg'], 'error', '#authMsg');
                        	
                     	 }else{
                        	  setMsg("SignIn successful", "success",'#authMsg'); 
                        	  setUser(res);
                        	  $("#authdiv").fadeOut();
                      	}
					}
				});
				return false;
			},
		});
		return false;
	 });*/
	 
	 $("#registerform").validate();	
     $("a.signUp").click(function() {
     	$("#signInDiv").css("display", "none");
     	$("#signUpDiv").css("display", "block");
		$("#authdiv").fadeIn();
		return false;
	 });
      
      /* Close bnt*/
      $('#close').click(function() {
      		$("#authdiv").fadeOut();
      });
     /* Validate -- Create */
     $("#adduser_form").validate( {
        submitHandler: function(form) {
            $(form).ajaxSubmit({
                type: 'post',
                dataType: 'json',
                success : function ( response, statusText, xhr) {

                     if (response['status'] == 'error') {
                         setMsg('Create user fail, '+ response['msg'], 'error'); 
                      }else{
                         setMsg("Created user successful", "success"); 
                      }
                      setScroll();
                 }

            });
            return false;
        },    
     
     });
     /* Active - Delete */
     $(".operator a.delete").click( function() {
         
         /* Start Ajax */
         $.ajax ({
               type: 'get',
               url: $(this).attr('href'),
               dataType: 'json',
               success: function ( response, statusText, xhr) {
                   if ( response['status'] == 'success' ){
                        setMsg("Deleted success user id: "+ response['id'], "success");
                        $("#row"+response['id']).remove();
                    }else {
                        setMsg("Could not delete user id: "+ response['id'] + response["error"], "error");    
                    }
               },
         });  
         
         setScroll();
         return false;
     });
    
     $(".operator a.edit").click( function() {
            

     });
    /*
     * Topic manager section
     *
     */
	
    /*
     * Thread manager section
     *
     */
     $("#addthread_form").validate();	
     $("#addtopic_form").validate();
     $("#addpost_form").validate();	
     $("#thread_bnt").bind("click", function() {
         $("#addthread_form").trigger("submit");
     });
      
	  $("#post_bnt").bind("click", function() {
		 $("#addpost_form").trigger("submit");
	  });

    
});

/* -- Resize page -- */
function resizeDisplay() {

	 /* resize height*/
	 $("#container").css( "min-height",( $(window).height() - ( 
			$("#navigation").height() + 
		    $("#copyright").height() + 80) )); 

	/* resize content layout */
	$("#content").width( $("#container").width() - $("#left_column").width() - 5);

}
/* -- Set Message to status bar --*/
function setMsg( msg, css, id) {
	 if (id) {
	 	$(id).removeClass().addClass(css).html(msg).fadeIn(100);
	 }else {
	     $("#msg").removeClass().addClass(css).html(msg).fadeIn(100);
	 }
}

/* -- Setup user data -- */
function setUser(data) {
	
}

/* -- Scroll to top --*/
function setScroll() {
    $("#content").animate( {
        scrollTop: 0    
    }, 500);    
}

