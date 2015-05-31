function Model(selector) {
  this.selector = selector
}

Model.prototype.loadArticles = function(loadArticles){
  this.selector.on("click", ".submit", function(e){
    e.preventDefault();
    var formUrl = $(this).parent().attr('action');

    $.ajax({
      url: formUrl,
      type: 'post',
      data: $(this).parent().serialize(),
      success: function(data, status){
        loadArticles(data.response.results)
      }
    });
  });
}

Model.prototype.loadSummary = function(showSummary) {
 this.selector.on("click", ".summary", function(e){
   e.preventDefault();

   var summaryUrl = $(".summary").attr('action');

   $.ajax({
     url: summaryUrl,
     type: 'post',
     data: $(this).serialize(),
     success: function(data, status){
      var target = $(e.target).parent().parent()
      showSummary(target, data)
     }
   });
 });
}

// If get time add search:
// <form action='/summary' method='post'><input type='hidden' name='url' value="+data.webURL+"><input type='submit' value='Summary'></form>




