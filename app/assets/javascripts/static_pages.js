// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/



		console.log('test');
$(function() {
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