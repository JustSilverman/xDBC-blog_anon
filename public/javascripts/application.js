$(document).ready(function(){

  $('button.edit-button').click(function(){
    var postId = $(this).attr('id').split("_")[1];
    var url = "/posts/" + postId + "/edit"

    $(location).attr('href',url);
  });
  
});
