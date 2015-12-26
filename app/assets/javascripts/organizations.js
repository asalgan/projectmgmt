function brainDump() {
  var left = document.getElementById('left');
  var containers = $(".brain-dump-category-list").toArray();

  containers.push(left)

  dragula(containers)
  .on('move', function (el, source, handle, sibling) {
    if(!el.hasClass("brain-dump-category")) {
      return false } else { return true }
  }).on('drop', function (el, target, source, sibling) {
    var id = $(el).attr('data-id');
    var category_id = $(el).closest('ul').attr('data-id');

    $.ajax({
      type: 'PUT',
      url: window.location.origin + '/brain_dumps/' + id,
      data: { category_id: category_id }
    });
  });
}
