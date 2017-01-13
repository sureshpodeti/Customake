// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require easyzoom
//= require_tree .
//= require bootstrap-sprockets

$(document).on('turbolinks:load', function(){
	$(window).on("scroll",function(){
		$(".panel").fadeIn(3000);


	});

	$(".contact-box").mouseenter(function(){
		$(this).animate({
          opacity: '1'
        });
	});


	$(".contact-box").mouseleave(function(){
		$(this).animate({
          opacity: '0.5'
        });
	});


/*	$(window).on("scroll", function(){

	});*/
	$(window).scroll(function(){
		$(".home-bottom").slideDown(4000);
	});


	// $(window).scroll(function(){
		$(".about-us").animate(
			{opacity: '1'}, 3000
		);
	// });

	$(window).scroll(function(){
		$(".jumbo").slideDown(4000);
	});




    $("#flip1").click(function(){
        $("#panel1").slideToggle("slow");
    });


     $("#flip2").click(function(){
        $("#panel2").slideToggle("slow");
    });

     $("#flip3").click(function(){
        $("#panel3").slideToggle("slow");
    });

     $("#flip4").click(function(){
        $("#panel4").slideToggle("slow");
    });


     $("#flip5").click(function(){
        $("#panel5").slideToggle("slow");
    });

});





var $easyzoom = $('.easyzoom').easyZoom();

// Get an instance API
var api = $easyzoom.data('easyZoom');










