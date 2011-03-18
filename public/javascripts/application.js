$(function() {

  $(".focus_first:first").focus();

  $("form.formtastic li.date input").datepicker();

  $(".sortable").sortable({
    axis: "y",
    handle: "label",
    cursor: "move"
  });

});

