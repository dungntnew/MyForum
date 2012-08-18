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
    
    /*$(document).ajaxStart(function(){
        $("#msg").empty();
        $('#ajax-loading').fadeIn('fast');        
    }).ajaxStop(function(){
        $('#ajax-loading').fadeOut('slow');
    });

    */    
    /**
     * Load section
     */
    $('.manager_bar ul li a').click( function() {
        return true;
    });

    /*
     * Upload image
     */
      $("#upload_form").validate({
     	rules: {
     		file : {
     			accept: 'jpg|png|gif',
     		}
     	},
     	
 		submitHandler: function(form) {
			$(form).ajaxSubmit({
				clearForm: true,
				success: function (res, statusText, xhr) {
		            if (res[0]['status'] == 'success'){
		                $("#picture").attr("value", res[1]['data']['file_url']); 
		                $("#upload_form img").attr("src", res[1]['data']['file_url']);
		               	$("#upload_form input").width(400);
		               	//setMsg("Upload file successful","success" );
		            }else {
		                //setMsg("Upload fail: "+statusText, "error");    
		            }
            	}
			});
			return false;
		},
     });
     

     $("#upload_form input[type=file]").bind("change select", function() {
         var file = $(this).val(); 
         $("#upload_form").trigger("submit");
      });
       
       
      
	 $("#avatar_upload_form").validate({
     	rules: {
     		file : {
     			accept: 'jpg|png|gif',
     		}
     	},
     	
 		submitHandler: function(form) {
			$(form).ajaxSubmit({
			    clearForm: true,	
				success: function (res, statusText, xhr) {
		            if (res[0]['status'] == 'success'){
		                $("#avatar").attr("value", res[1]['data']['file_url']); 
		                $("#avatar_upload_form img").attr("src", res[1]['data']['file_url']);
		               	//setMsg("Upload file successful","success" );
		            }else {
		                //setMsg("Upload fail: "+statusText, "error");    
		            }
            	}
			});
			return false;
		},
     });	
     
     $("#avatar_upload_form input[type=file]").bind("change select", function() {
         var file = $(this).val(); 
         $("#avatar_upload_form").trigger("submit");
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
	  
	  /* Close bnt*/
      $('#close').click(function() {
      		$("#authdiv").fadeOut();
      });
      /* Close bnt*/
      $('#msg_close').click(function() {
      		$("#status").fadeOut();
      });
      
     $("a.signUp").click(function() {
     	$("#signInDiv").css("display", "none");
     	$("#signUpDiv").css("display", "block");
		$("#authdiv").fadeIn();
		return false;
	 });
      
   
     /* Validate -- Create */
     $("#registerform").validate( {
		rules: {
			first_name: "required",
			last_name: "required",
			username: {
				required: true,
				minlength: 2,
				remote: "auth/validate"
			},
			password: {
				required: true,
				minlength: 6
			},
			confirm: {
				required: true,
				minlength: 6,
				equalTo: "#password"
			},
			email: {
				required: true,
				email: true,
				remote: "auth/validate"
			},
		},
		messages: {
			first_name: "Enter your firstname",
			last_name: "Enter your lastname",
			username: {
				required: "Enter a username",
				minlength: jQuery.format("Enter at least {0} characters"),
				remote: jQuery.format("{0} is already in use")
			},
			password: {
				required: "Provide a password",
				rangelength: jQuery.format("Enter at least {0} characters")
			},
			confirm: {
				required: "Repeat your password",
				minlength: jQuery.format("Enter at least {0} characters"),
				equalTo: "Enter the same password as above"
			},
			email: {
				required: "Please enter a valid email address",
				minlength: "Please enter a valid email address",
				remote: jQuery.format("{0} is already in use")
			},
		},
		// set this class to error-labels to indicate valid fields
		success: function(label) {
			label.html("&nbsp;").addClass("checked");
		},
        submitHandler: function(form) {
            $(form).ajaxSubmit({
                type: 'post',
                dataType: 'json',
                clearForm: true,
                success : function ( res, statusText, xhr) {

                     if (res[0]['status'] == 'error') {
                         setMsg('Create user fail, '+ res[0]['msg'], 'error' ,'#authMsg'); 
                      }else{
                         setMsg(res[0]['msg'], "success");
                         $("#authdiv").fadeOut();
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
               success: function ( res, statusText, xhr) {
                   if ( res[0]['status'] == 'success' ){
                        setMsg("Deleted success user id: "+ res[1]['id'], "success");
                        $("#row"+res[1]['id']).remove();
                    }else {
                        setMsg("Could not delete user id: "+ res[1]['id'] + res[0]["error"], "error");    
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
     
     $("#thread_add_link").click(function() {
     	$("html, body").animate({ scrollTop: $(document).height() }, 1000);
     	$(".reply").fadeIn();
     	return false;
     });
     
      $("#topic_add_link").click(function() {
        $("html, body").animate({ scrollTop: $(document).height() }, 1000);
     	$(".reply").fadeIn();
       	return false;   	
     });
     
      $(".reply_link").click(function() {
      	$("html, body").animate({ scrollTop: $(document).height() }, 1000);
     	$(".reply").fadeIn();
     	return false;     	
     });
     
     $("#addthread_form").validate({
     	rules: {
     		content: {
     			required: true,
     			rangelength: [10, 512],
     		},
     		title: {
     			required: true,
     			rangelength: [10, 128],
     		},
     	},
     });	
     $("#addtopic_form").validate({
     	rules: {
     		description: {
     			required: true,
     			rangelength: [10, 512],
     		},
     		title: {
     			required: true,
     			rangelength: [10, 128],
     		},
     	},
     });
     $("#addpost_form").validate({
     	rules: {
     		content: {
     			required: true,
     			rangelength: [2, 512],
     		},
     	},
     });	
     $("#thread_bnt").bind("click", function() {
         $("#addthread_form").trigger("submit");
     });
     
     $("#topic_bnt").bind("click", function() {
         $("#addtopic_form").trigger("submit");
     });
     
      
	  $("#post_bnt").bind("click", function() {
		 $("#addpost_form").trigger("submit");
	  });
	  
	  /*Delete Post*/
     $(".del_link").click( function() {
         
         /* Start Ajax */
         $.ajax ({
               type: 'get',
               url: $(this).attr('href'),
               dataType: 'json',
               success: function ( res, statusText, xhr) {
                   if ( res[0]['status'] == 'success' ){
                        setMsg("Deleted success post id: "+ res[1]['id'], "success");
                        $("#post_"+res[1]['id']).remove();
                    }else {
                        setMsg("Could not delete post id: "+ res[1]['id'] + " "+res[0]["msg"], "error");    
                    }
               },
         });  
         
         setScroll();
         return false;
     });
     
      /*Delete Topic*/
     $(".del_link_topic").click( function() {
         
         /* Start Ajax */
         $.ajax ({
               type: 'get',
               url: $(this).attr('href'),
               dataType: 'json',
               success: function ( res, statusText, xhr) {
                   if ( res[0]['status'] == 'success' ){
                        setMsg("Deleted success topic id: "+ res[1]['id'], "success");
                        $("#topic_"+res[1]['id']).remove();
                    }else {
                        setMsg("Could not delete topic id: "+ res[1]['id'] + " "+res[0]["msg"], "error");    
                    }
               },
         });
         setScroll();
         return false;
     });
         
      /*Delete Thread*/
     $(".del_link_thread").click( function() {
         
         /* Start Ajax */
         $.ajax ({
               type: 'get',
               url: $(this).attr('href'),
               dataType: 'json',
               success: function ( res, statusText, xhr) {
                   if ( res[0]['status'] == 'success' ){
                        setMsg("Deleted success thread id: "+ res[1]['id'], "success");
                        $("#thread_"+res[1]['id']).remove();
                    }else {
                        setMsg("Could not delete thread id: "+ res[1]['id'] + " "+res[0]["msg"], "error");    
                    }
               },
         }); 
         
         setScroll();
         return false;
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
	     $("#status").fadeIn(100);
	 }
}

/* -- Setup user data -- */
function setUser(data) {
	
}

/* -- Scroll to top --*/
function setScroll() {
   $("html, body").animate({ scrollTop: 0 }, 1000);   
}

