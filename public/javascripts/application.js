$(function() {

  $(".focus_first:first").focus();

  $("form.formtastic li.date input").attr("autocomplete", "off").datepicker({
    changeMonth: true,
    changeYear: true,
    showOn: "button",
    buttonImage: "/images/calendar.png",
    buttonImageOnly: true,
    buttonText: "Выбрать"
  });

  $(".sortable").sortable({
    axis: "y",
    handle: "label",
    cursor: "move"
  });

});

