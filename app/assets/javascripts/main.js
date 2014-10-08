$(function(){
  $("a.up_question_voteLink").click(function() {
    // console.log("cliie");
    var question_id = $(this).attr("data-question");
    // console.log("question id is " + question_id);
    var element = $(this);
    $.get("/quscores/changevote",{ question_id: question_id , vote: "up"},
    function(data,status){
      if (data.status == "2") {
        console.log("please login first`");
        $("#questionModal").modal("show");
      }else{
        console.log(status);
        console.log(element);
        newValue = parseInt($("span#result_"+ question_id).text()) + parseInt(data.result);
        $("span#result_"+ question_id).text(newValue);
        console.log(newValue);
      }
    });
  });

  $("a.down_question_voteLink").click(function() {
    var question_id = $(this).attr("data-question");
    // console.log("question id is " + question_id);
    var element = $(this);
    $.get("/quscores/changevote",{ question_id: question_id , vote: "down"},
    function(data,status){
      if (data.status == "2") {
        console.log("please login first`");
        $("#questionModal").modal("show");
      }else{
        console.log(status);
        console.log(element);
        // console.log( $("span#result_"+ question_id).text());
        newValue = parseInt($("span#result_"+ question_id).text()) + parseInt(data.result);
        $("span#result_"+ question_id).text(newValue);
        console.log(newValue);
      }
    });
  });
});