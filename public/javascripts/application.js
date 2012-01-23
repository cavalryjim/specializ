var rTable;
var mTabs;
var hrTabs;
var giRedraw = false;

$(function() {

	//$('#flash').delay(500).fadeIn('normal', function() {
		//$(this).delay(1500).fadeOut('slow');
	//	$(this).delay(2500).fadeTo('slow', 0);
	//});
	
	$(".best_in_place").best_in_place();
	
	$('#navigation_horiz').naviDropDown({
		dropDownWidth: '150px'
	});
	
	//$("#layout_table").colResizable();
	$( "#browser_div" ).resizable({
		maxWidth: 400,
		minWidth: 200
	});
	
	$( "#main_content_div" ).resizable({
		minWidth: 600,
		maxWidth: 800
	});


	$( "#accordion" ).accordion({ fillSpace: true }); // accordion on the _browser partial
	mTabs = $( "#manager_tabs" ).tabs(); // tabs used in the manager module
	hrTabs = $( "#hr_tabs" ).tabs(); // tabs used in the HR module
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
	
	$( "#new_elements_table" ).dataTable({ // datatable listing newly suggested elements needing manager approval
		"aoColumns": [
		              { "sWidth": "5%" },
		              { "sWidth": "90%" }
		          ],
		"bAutoWidth": false,
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
	
	// JDavis: for some reason, the rating stuff must come last or else shit breaks.
	$( "#rating_table input.jdstar" ).rating(); // JDavis: this line must come before rating_table dataTable()
	
	/* Add a click handler to the rows - this could be used as a callback */
    $("#rating_table tbody").click(function(event) {
        $(rTable.fnSettings().aoData).each(function (){
            $(this.nTr).removeClass('row_selected');
        });
        $(event.target.parentNode).addClass('row_selected');
        //rTable.fnDraw();
    });
     
    /* Add a click handler for the delete row */
    $('#item_delete').click( function() {
        var anSelected = fnGetSelected( rTable );
        rTable.fnDeleteRow( anSelected[0] );
    } );
	
	
	rTable = $( "#rating_table" ).dataTable({ // datatable where users rate the elements
		"aoColumns": [
		              { "sWidth": "60%" },
		              { "sWidth": "20%" },
		              { "bVisible": false },
		              { "bVisible": false }
		          ],
		"bAutoWidth": false,
		"bJQueryUI": true,
        "sPaginationType": "full_numbers"
        
    });

});

/* Get the rows which are currently selected */
function fnGetSelected( oTableLocal )
{
    var aReturn = new Array();
    var aTrs = oTableLocal.fnGetNodes();
     
    for ( var i=0 ; i<aTrs.length ; i++ )
    {
        if ( $(aTrs[i]).hasClass('row_selected') )
        {
            aReturn.push( aTrs[i] );
        }
    }
    return aReturn;
}