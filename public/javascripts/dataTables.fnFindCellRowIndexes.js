$.fn.dataTableExt.oApi.fnFindCellRowIndexes = function ( oSettings, sSearch, iColumn )
{
    var
        i,iLen, j, jLen,
        aOut = [], aData;
     
    for ( i=0, iLen=oSettings.aoData.length ; i<iLen ; i++ )
    {
        aData = oSettings.aoData[i]._aData;
         
        if ( typeof iColumn == 'undefined' )
        {
            for ( j=0, jLen=aData.length ; j<jLen ; j++ )
            {
                if ( aData[j] == sSearch )
                {
                    aOut.push( i );
                }
            }
        }
        else if ( aData[iColumn] == sSearch )
        {
            aOut.push( i );
        }
    }
     
    return aOut;
}
 
 
/* Example use */
//var oTable, a;
//$(document).ready(function() {
//    oTable = $('#example').dataTable();
//    a = oTable.fnFindCellRowIndexes( '1.7' );    /* Search all columns */
//    a = oTable.fnFindCellRowIndexes( '1.7', 3 ); /* Seach only column 3 */
//});