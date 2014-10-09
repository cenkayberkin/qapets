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

  $("a.up_answer_voteLink").click(function() {
    var answer_id = $(this).attr("data-answer");
    var element = $(this);

    console.log(answer_id);

    $.get("/anscores/changevote",{ answer_id: answer_id , vote: "up"},
    function(data,status){
      if (data.status == "2") {
        console.log("please login first`");
        $("#questionModal").modal("show");
      }else{
        console.log(status);
        console.log(element);

        newValue = parseInt($("span#result_"+ answer_id).text()) + parseInt(data.result);
        $("span#result_"+ answer_id).text(newValue);
        console.log(newValue);
      }
    });
  });

  $("a.down_answer_voteLink").click(function() {
    var answer_id = $(this).attr("data-answer");
    var element = $(this);

    console.log(answer_id);

    $.get("/anscores/changevote",{ answer_id: answer_id , vote: "down"},
    function(data,status){
      if (data.status == "2") {
        console.log("please login first`");
        $("#questionModal").modal("show");
      }else{
        console.log(status);
        console.log(element);

        newValue = parseInt($("span#result_"+ answer_id).text()) + parseInt(data.result);
        $("span#result_"+ answer_id).text(newValue);
        console.log(newValue);
      }
    });
  });

});

