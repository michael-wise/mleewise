// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

// # on('turbolinks:load',... is necessary to get this JS to load across link_to clicks. 
$(document).on('turbolinks:load', function() {
	if(window.location.pathname=='/')
		$('.subheader').hide();
		$('main').on('mouseover', function(event) {
			$('.subheader').hide();
		});
	$('.navButton a').on('mouseover', function(event) {
		var $anchor = $(this);
		$('.subheader').hide();
		if ($anchor.text() == 'tech in miami') {
			$('#tech').show();
		}
		else if ($anchor.text() == 'blogs') {
			$('#blogs').show();
		}
		else if ($anchor.text() == 'works') {
			$('#works').show();
		}
		else if ($anchor.text() == 'me') {
			$('#me').show();
		}

	});


});