$(document).ready(function() {
	// $('.errors').hide();

	$('.signup').click(function() {
		$('.buttons').fadeOut(200);
		$('#links').hide();
		$('#links').fadeIn(1000);
		$('.box').fadeIn(800);
		$('#signup').fadeIn(700);
	});

	$('.login').click(function() {
		$('.buttons').fadeOut(200);
		$('#links').hide();
		$('#links').fadeIn(1000);
		$('.box').fadeIn(800);
		$('#login').fadeIn(700);
	});

	$('.home-cancel').click(function() {
		$('.box').fadeOut(200);
		$('#links').hide();
		$('.box').fadeOut(function() {
			$('#links').fadeIn(1000);
			$('.buttons').fadeIn(1000);
			$('#login').hide(200);
			$('#signup').hide(200);
		});	
	});

	$('.errors').slideDown(300);
});