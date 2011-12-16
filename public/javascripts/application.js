var rTable;
$(function() {
  
	$( "#accordion" ).accordion(); // accordion on the _browser partial
	$( "#manager_tabs" ).tabs(); // tabs used in the manager module
	$( "#hr_tabs" ).tabs(); // tabs used in the HR module
	$( "#me_tabs" ).tabs(); // tabs used in the Me module
	//$( "#grouping" ).multiselect({header: false}); // select widget in the manager module's configuration tab
	$( "#topic_groupings").multiselect({header: "Select groups that will participate"}).multiselectfilter(); // select widget in the manager module's setup tab
	$( "#groupings").multiselect({header: "Select groups that will participate"}).multiselectfilter();
	
	$( "#staffing_table" ).dataTable({ // datatable in the manager module's staffing tab
		"bJQueryUI": true,
        "sPaginationType": "full_numbers"
	}); 
	
	$( "#user_table" ).dataTable({ // datatable in the admin module
		"bJQueryUI": true,
        "sPaginationType": "full_numbers"
	}); 
	
	$( "#member_table" ).dataTable({ // datatable listing the other user participating in a topic
		"bJQueryUI": true,
        "sPaginationType": "full_numbers"
	}); 
	
	$( "#topic_groups_table" ).dataTable({ // datatable listing the topic_groups belonging to a topic
		"bJQueryUI": true,
        "sPaginationType": "full_numbers"
	}); 
	
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
	$( "#rating_table input.jdstar" ).rating(); // JDavis: this line must come before rating_table dataTable()
	rTable = $( "#rating_table" ).dataTable({ // datatable where users rate the elements
		"aoColumns": [
		              { "sWidth": "75%" },
		              { "sWidth": "15%" },
		              { "bVisible": false },
		              { "bVisible": false }
		          ],
		          
		"bAutoWidth": false,
		
		"bJQueryUI": true,
		
        "sPaginationType": "full_numbers"
        
    });
	
	
	/* Hide the second column after initialisation*/
    //rTable.fnSetColumnVis( 3, true );
	
	//rTable.fnDeleteRow( 2 );
	// JDavis: Ok...this is about the get complicated.  Not only do I want to be able to add elements to the table via js but
	//    	also need to delete elements.  Not to mention checking for duplicates when adding.
	//		http://datatables.net/api
	//		http://datatables.net/plug-ins/api
});