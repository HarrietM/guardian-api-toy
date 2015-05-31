function View() {

}

View.prototype.createArticle = function(data) {

  $(".container").empty();
  $.each(data, function(index, data){
    var newArticle = createArticleTemplate(data);
    $(".container").append(newArticle);
  });
}


View.prototype.showSummary = function(target, data) {
  target.children(".smmry").remove();
  target.append(summaryDiv(data));
}


function createArticleTemplate(data){
  return "<div class='article'><div class='title'>Title: "+data.webTitle+"</div><div>Date: "+data.webPublicationDate+"</div><div>Section: "+data.sectionName+"</div><form class='summary' action='/summary' method='post'><input type='hidden' name='url' value="+data.webUrl+"><input type='submit' value='Summary'></form></div>"
}

function summaryDiv(data){
  return "<div class='smmry'>"+data.sm_api_content+"</div>"
}