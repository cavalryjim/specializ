
$(function() {
  //$("#elements th a, #elements .pagination a").live("click", function() {
	//alert( this.href );
    //$.getScript(this.href);
    //return false;
  //});
  
	$( "#accordion" ).accordion(); // accordion on the _browser partial
	$( "#manager_tabs" ).tabs(); // tabs used in the manager module
	$( "#hr_tabs" ).tabs(); // tabs used in the HR module
	$( 'input.jdstar' ).rating(); // JDavis: this line must come before staffing_table dataTable()
	$( "#staffing_table" ).dataTable(); // datatable in the manager module's staffing tab
	$( "#grouping" ).multiselect({header: false}); // select widget in the manager module's configuration tab
	$( "#rating_table" ).dataTable(); // datatable where users rate the elements
	
	// JDavis: this function responds to the dropdown selection on the manager page and navigates to the select topic.
	$('#topic_select').change(function() {
		//alert($(this).attr('value'));
		if ($(this).attr('value') > 0)
			window.location.pathname = '/topics/'+$(this).attr('value')+'/edit';
		else
			window.location.pathname = '/topics/new';
			
	});
	
	// JDavis: this function responds to the dropdown selection on the iteration page and navigates to the selected iteration.
	$('#iteration_select').change(function() {
		var temp = new Array();
		temp = window.location.pathname.split('/');
		window.location.pathname = '/'+temp[1]+'/'+temp[2]+'/'+temp[3]+'/'+$(this).attr('value');
	});
	   
	
});