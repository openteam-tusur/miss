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

  $("form.voting_form").live("submit", function(event) {
    var form = $(this);
    var url = $(this).attr("action");
    var type = $(this).closest("div").attr("class");
    if (type == "list_voting") {
      $("input", $(form).closest(".members_list")).attr("disabled", "disabled");
    };
    if (type == "single_voting") {
      $("input", $(form)).attr("disabled", "disabled");
    };
    $.ajax({
      type: "POST",
      url: url,
      data: { "type": type },
      success: function(data) {
        $("<div id='ajax_temporary'></div>").appendTo("body").html(data).hide();
        if (type == "list_voting") {
          $(form).closest(".members_list").html($("#ajax_temporary .members_list").html());
        };
        if (type == "single_voting") {
          $(form).closest(".member").html($("#ajax_temporary .member").html());
        };
        $("#ajax_temporary").remove();
      }
    });
    return false;
  });

});

