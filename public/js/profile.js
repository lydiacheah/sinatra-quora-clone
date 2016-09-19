$(document).ready(function() {
	$('#answers-select').click(function() {
		$('#question-profile-feed').fadeOut(function() {
			$('#answer-profile-feed').fadeIn(1000);
		});
	});

	$('#questions-select').click(function() {
		$('#answer-profile-feed').fadeOut(function() {
			$('#question-profile-feed').fadeIn(1000);
		});
	});
});