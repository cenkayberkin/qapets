$(function(){
  tags = [];
  changeStateSubmit();

  $('#addTask').click(function(evt) {
    var input_id = $("#question_tags").val();
    var input_name = $("#question_tags option:selected").text();
    addTag({id: input_id,name: input_name}, evt);
    changeStateSubmit();
  });

  function changeStateSubmit(){
    if(_.size(tags) > 0)  {
      $('div#tagformSubmit input[type="submit"]').removeAttr('disabled');
      $("#tagMessage").hide();
    } else {
      $('div#tagformSubmit input[type="submit"]').attr('disabled','disabled');
      $("#tagMessage").show();
    }
  };

  $('ul#tasks').on('click',"li", function(evt) {
    $(this).fadeOut('slow', function() {
      $(this).remove();
      tags = _.without(tags, _.findWhere(tags, {name: $(this).text()}));
      arrangeInputTags();
      changeStateSubmit();
    });
  });

  function addTag(value, evt) {
    evt.preventDefault();
    tags.push(value);
    utags = _.uniq(tags,function (item,key){
      return item.id;
    });
    showTags(utags);
    tags = utags;
    arrangeInputTags();
  };

  function arrangeInputTags(){
    console.log("arranging input");
    $('.dynamicInput').remove();
    _.each(tags,function(tag) {
      console.log("adding input " + tag);
      $('<input name="postedTags[]" type="hidden" class="dynamicInput">').attr("value",tag.id).html("").appendTo('form#new_question');
    });
  };

  function showTags(tags){
    $('ul#tasks li').remove();
    _.each(tags,function(tag) {
      $('<li>').text(tag.name).appendTo('#tasks');
    });
  };
});