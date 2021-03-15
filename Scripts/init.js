(function($){
  $(function(){

    $('.button-collapse').sideNav();
    $('.slider').slider({full_width: true, height: 500});
	$('.collapsible').collapsible();
    $('.parallax').parallax();
	$('select').material_select();
	$(".dropdown-button").dropdown();
        

	var fecha = new Date();
	

	  $('.datepicker').pickadate({
	    selectMonths: true, // Creates a dropdown to control month
	    selectYears: 100, // Creates a dropdown of 15 years to control year
	    formatSubmit: 'yyyy/mm/dd',
      	min: new Date(1920,1,1),
  		max: new Date(fecha.getFullYear()-10, fecha.getMonth(), fecha.getDay())
	  });
        

  }); // end of document readysss
})(jQuery); // end of jQuery name space