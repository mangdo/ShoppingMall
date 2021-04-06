$(function() {

	// Get the form.
	var form = $('.contact-form');

	// Get the messages div.
	var formMessages = $('.form-messege');

	// Set up an event listener for the contact form.
	$(form).submit(function(e) {
		// Stop the browser from submitting the form.
		e.preventDefault();

		// Serialize the form data.
		var formData = {"name": form.find("input[name='name']").val(),
		"email" : form.find("input[name='email']").val(), 
		"title" : form.find("input[name='title']").val(),
		"phone" : form.find("input[name='phone']").val(),
		"message":form.find("textarea[name='message']").val()};
		
		alert("메시지 전송중");

		// Submit the form using AJAX.
		$.ajax({
			type: 'POST',
			url: $(form).attr('action'),
			data: JSON.stringify(formData),
			contentType: "application/json"
		})
		.done(function(response) {
			// Make sure that the formMessages div has the 'success' class.
			$(formMessages).removeClass('error');
			$(formMessages).addClass('success');

			// Set the message text.
			//$(formMessages).text(response);
			alert("메시지를 보냈습니다.");
			
			// Clear the form.
			$('.contact-form input, .contact-form textarea').val('');
		})
		.fail(function(data) {
			// Make sure that the formMessages div has the 'error' class.
			$(formMessages).removeClass('success');
			$(formMessages).addClass('error');

			// Set the message text.
			if (data.responseText !== '') {
				$(formMessages).text(data.responseText);
			} else {
				$(formMessages).text('Oops! An error occured and your message could not be sent.');
			}
		});
	});

});
