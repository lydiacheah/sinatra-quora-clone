$(document).ready(function() {	
	$('.vote').on('submit',function(event) {
		event.preventDefault();
		var form = $(this);
		var vote_text = $('.vote_text', this)
		var count = $('.question_vote_count', this)
		$.ajax({
			url: $(this).attr('action'), // https:localhost:3000/questions/1/vote
			method: 'POST',
			dataType: 'json',
			success: function(questionVote) {
					if(questionVote.voted){
						button = form.find('button');
						count.text(questionVote.vote_count);
						button.attr('class','downvote_button');
						vote_text.text(' | Upvoted');
	        }
	        else{
						button = form.find('button');
						count.text(questionVote.vote_count);						
						button.attr('class','upvote_button');
						vote_text.text(' | Upvote');
	        }
        },
			error: function(request, errorType, errorMessage) {
          alert('Error: ' + errorType + ' with message: ' + errorMessage)} 
		});
	});
});