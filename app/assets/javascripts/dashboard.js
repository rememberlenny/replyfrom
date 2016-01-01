
// Usage: $form.find('input[type="checkbox"]').shiftSelectable();
// replace input[type="checkbox"] with the selector to match your list of checkboxes

$.fn.shiftSelectable = function() {
    var lastChecked,
        $boxes = this;
        $boxes.off('click');

    $boxes.click(function(evt)
    {
        if(!lastChecked)
        {
            lastChecked = this;
            return;
        }

        if(evt.shiftKey)
        {
            var start = $boxes.index(this),
                end = $boxes.index(lastChecked);
            //console.log("START: " + start + " END: " + end);

            $boxes.slice(Math.min(start, end), Math.max(start, end) + 1)
                .attr('checked', lastChecked.checked)
                .trigger('change');
        }

        lastChecked = this;
    });
};


$(document).ready(function(){
  var startFixedColumns = 2;
  $('.js__user-list-table').tablesorter({
    theme: 'default',
    showProcessing: true,
    headerTemplate : '{content} {icon}',
    widgets: [ 'uitheme', 'zebra', 'scroller' ],
    widgetOptions : {
      // scroll tbody to top after sorting
      scroller_upAfterSort: true,
      // pop table header into view while scrolling up the page
      scroller_jumpToHeader: true,

      scroller_height : 300,
      // set number of columns to fix
      scroller_fixedColumns : startFixedColumns,
      // add a fixed column overlay for styling
      scroller_addFixedOverlay : false,
      // add hover highlighting to the fixed column (disable if it causes slowing)
      scroller_rowHighlight : 'hover',

      // bar width is now calculated; set a value to override
      scroller_barWidth : null
    }
  });
  $('.js__user-list-table').find('input[type="checkbox"]').shiftSelectable();

  $("table").bind("sortEnd",function()
  {
    $("#listCont").find('input[type="checkbox"]').shiftSelectable();
  })


});
