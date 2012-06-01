/* JDavis: filtering function which will filter data in topic_group_table */
$.fn.dataTableExt.afnFiltering.push(
	function( oSettings, aData, iDataIndex ) {
		//var iMin = document.getElementById('min').value * 1;
		//var iMax = document.getElementById('max').value * 1;
		var iTopicGroup = document.getElementById('topic_group_select');
		//alert(iTopicGroup.id);
		//var iParticipantGroup = aData[1];
		//var iVersion = aData[3] == "-" ? 0 : aData[3]*1;
		//if ( iTopicGroup == iParticipantGroup ) {
		//	return true;
		//}
		//return false;
		return true;
	}
);
