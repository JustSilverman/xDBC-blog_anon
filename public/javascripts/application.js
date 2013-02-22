$(document).ready(function(){

  $('button.edit-button').click(function(){
    var postId = $(this).attr('id').split("_")[1];
    var url = "/posts/" + postId + "/edit"

    $(location).attr('href',url);
  });

  $('a.delete-post').click(function(e){
    e.preventDefault();
    var postId = $(this).attr('id').split("_")[1];
    $.post("/posts", { id: postId, _method: "Delete" } );
    $("#div_post_" + postId).fadeOut(200);
  });

});
