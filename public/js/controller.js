function Controller(selector){
  this.selector = $(selector)
  this.view = new View();
}

Controller.prototype.run = function() {
 model = new Model(this.selector);
 model.loadArticles(this.view.createArticle);
 model.loadSummary(this.view.showSummary);
}