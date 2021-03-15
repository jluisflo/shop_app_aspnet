(function($){
  $(function(){
        
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