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

function progressBar(id, brain_dumps_total, brain_dumps_done) {
  $(document).ready(function(){
    $('#jqmeter-container_'+id).jQMeter({
      goal: brain_dumps_total,
      raised: brain_dumps_done,
      meterOriengation:'horizontal',
      height: '10px;',
      bgColor: '#444',
      barColor: '#bfd255'
    });
  });
};

function checkCompletion(category_id) {
  var thisItem = $(document).find('li#category_'+category_id);
  $(thisItem).removeClass('incomplete').addClass('complete');
  $(thisItem).find('a').css('text-decoration','line-through')
}

function progressCircle(value, elem) {
  // defaulting to max days of 50, and calculating percentage of it
  var percentage = ((50 - parseInt(value)) / 50)
  $("#"+elem).circleProgress({
    value: percentage,
    size: 60,
    fill: {
        color: "#7B77C9"
    }
  });
}
