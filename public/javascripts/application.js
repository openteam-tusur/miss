function create_slug() {
  var ru_en = [
    ["а", "a"],
    ["б", "b"],
    ["в", "v"],
    ["г", "g"],
    ["д", "d"],
    ["е", "e"],
    ["ё", "yo"],
    ["ж", "zh"],
    ["з", "z"],
    ["и", "i"],
    ["й", "y"],
    ["к", "k"],
    ["л", "l"],
    ["м", "m"],
    ["н", "n"],
    ["о", "o"],
    ["п", "p"],
    ["р", "r"],
    ["с", "s"],
    ["т", "t"],
    ["у", "u"],
    ["ф", "f"],
    ["х", "h"],
    ["ц", "c"],
    ["ч", "ch"],
    ["ш", "sh"],
    ["щ", "shj"],
    ["ъ", "j"],
    ["ы", "y"],
    ["ь", "j"],
    ["э", "ye"],
    ["ю", "ju"],
    ["я", "ja"]
  ];
  if ($("#member_slug").val() == "") {
    $('#member_name').blur(function() {
      var source = $(this).val().toLowerCase().replace(" ", "-");
      for (var i=0; i < ru_en.length; i++) {
        var elem = ru_en[i];
        source = source.replace(new RegExp(elem[0], "g"), elem[1]);
      };
      $("#member_slug").val(source);
      console.log($("#member_slug").val());
    });
  };
};

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
    opacity: "0.5",
    previous: "назад",
    next: "вперед",
    close: "закрыть",
    current:	"{current} из {total}"
  });

  create_slug();

});

