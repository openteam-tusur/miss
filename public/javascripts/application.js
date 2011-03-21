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
    handle: "label, img",
    cursor: "move"
  });

  $('.member .photo_link').colorbox({
    previous: "назад",
    next: "вперед",
    close: "закрыть",
    current:	"{current} из {total}"
  });

});

