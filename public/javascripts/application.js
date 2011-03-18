
$(function() {

  $("form.formtastic li.date input").datepicker();

  $(".sortable").sortable({
    axis: "y",
    handle: "label",
    cursor: "move"
  });

});

