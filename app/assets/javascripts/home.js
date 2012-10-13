$(function() {
    $('#login_link').unbind('click', false);
    $('#login_link').click(function(){
	window.location = $('#login_link').attr('href');
    });
});