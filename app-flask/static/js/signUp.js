/*$(function(){
	$('#btnSignUp').click(function(){
		
		$.ajax({
			url: '/',
			data: $('form').serialize(),
			type: 'POST',
			success: function(response){
				console.log(response);
			},
			error: function(error){
				console.log(error);
			}
		});
	});
});*/

$(function(){
	$('#btnSignUp').click(function(){
		
		$(".form-signin").submit();

	});
});
