$.fn.sortableGrid = function(url) {
  $(this).sortable({
    handle: 'td.grabber a',
    items: 'tr', 
    containment: 'parent', 
    axis: 'y', 
    opacity: 0.8,
    cursor: 'crosshair', 
    tolerance: 'pointer',
    update: function() { 
      setupGridStyles();
      var ids = [];
      $(this).find('tr').each(function() {
        var id = $(this).attr('id').split('_')[1];
        ids.push(id);
      });
      $.post(url, {departments: ids.join(',')}); 
    }
  });
}
function setupGridStyles() {
  // alternating grid row
  $('table.grid')
    .find('tr:odd').addClass('alternate').end()
    .find('tr:even').removeClass('alternate').end();
}

$(function() {
    setupGridStyles();

    // progress
    $('#progress').ajaxStart(function() {
      $(this).show();
    }).ajaxComplete(function() {
      $(this).hide();
    });

    $('table.grid')
      .find('td:not(.actions, .grabber)').click(function() {
        var href = $(this).parent().find('a.edit').attr('href');
        window.location = href;
      }).end()
      .find('a.destroy').each(function() {
        var link = $(this);
        var href = link.attr('href') + '.js';
        link.attr('href', '#delete'); // remove href

        link.click(function() {
          if (!confirm("Are you sure you want to remove this row?"))
            return;

          $.post(href, {_method: 'DELETE'}, function() {  
            link.parents('tr').remove(); // remove row
            setupGridStyles();
          })
        });
      }).end();
});
