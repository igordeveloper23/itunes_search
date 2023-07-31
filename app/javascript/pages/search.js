$(document).ready(function() {
  const btn_search = $("#btn_search");
  const btn_loading = $("#btn_loading");

  $("#btn_search").click(function() {
    const term = $('#search_term').val();

    if(term == "")
      return;

    btn_search.hide();
    btn_loading.show();

    $.ajax({
      url: '/search',
      type: 'GET',
      data: { search_term: term },
      dataType: 'script'
    }).done(function() {
      btn_search.show();
      btn_loading.hide();
    });
  });

  $(document).on('click', '.favorite', function() {
    const icon = $(this);
    const collection_id = icon.data("itunes");
    $.ajax({
      url: '/toggle_favorite',
      method: 'POST',
      data: { collection_id: collection_id },
    }).done(function(data) {
      icon.removeClass("bi-heart bi-heart-fill").addClass("bi-heart" + (data.is_favorite ? "-fill" : ""));
    });
  });

  btn_loading.hide();
});