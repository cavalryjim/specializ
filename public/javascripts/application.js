
$(function() {
  
	$( "#accordion" ).accordion(); // accordion on the _browser partial
	$( "#manager_tabs" ).tabs(); // tabs used in the manager module
	$( "#hr_tabs" ).tabs(); // tabs used in the HR module
	$( "#me_tabs" ).tabs(); // tabs used in the Me module
	$( "#grouping" ).multiselect({header: false}); // select widget in the manager module's configuration tab
	$( "#staffing_table" ).dataTable(); // datatable in the manager module's staffing tab
	$( "#user_table" ).dataTable(); // datatable in the admin module
	
	// JDavis: this function responds to the dropdown selection on the manager page and navigates to the select topic.
	$('#topic_select').change(function() {
		//alert($(this).attr('value'));
		if ($(this).attr('value') > 0)
			window.location.pathname = '/topics/'+$(this).attr('value')+'/edit';
		else
			window.location.pathname = '/topics/new';
			
	});
	
	// JDavis: this function responds to the dropdown selection on the grouping page and navigates to the select grouping.
	$('#grouping_select').change(function() {
		if ($(this).attr('value') > 0)
			window.location.pathname = '/groupings/'+$(this).attr('value')+'/edit';
		else
			window.location.pathname = '/groupings/new';
			
	});
	   
	// JDavis: this function responds to the dropdown selection on the iteration page and navigates to the selected iteration.
	$('#iteration_select').change(function() {
		var temp = new Array();
		temp = window.location.pathname.split('/');
		window.location.pathname = '/'+temp[1]+'/'+temp[2]+'/'+temp[3]+'/'+$(this).attr('value')+'#tabs-2';
		//alert(window.location.pathname);
	});
	
	// JDavis: for some reason, these two lines must come last or else shit breaks.
	$( "#rating_table input.jdstar" ).rating(); // JDavis: this line must come before staffing_table dataTable()
	$( "#rating_table" ).dataTable(); // datatable where users rate the elements
});