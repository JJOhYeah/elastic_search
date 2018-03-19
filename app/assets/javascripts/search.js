document.addEventListener("turbolinks:load", function() {
  $input = $("[data-behavior='autocomplete']")

  var options = {
    
    getValue: "title",
    url: function(phrase) {
      return "/search.json?q=" + phrase;
    },
    categories: [
      {
        listLocation: "books",
        header: "<strong>Books</strong>",
      }, 
      {
        listLocation: "author",
        header: "<strong>Author</strong>",
      },
      {
        listLocation: "content",
        header: "<strong>Content</strong>",
      }
    ],
    list: {
      onChooseEvent: function() {
        var url = $input.getSelectedItemData().url
        $input.val("")
        Turbolinks.visit(url)
      }
    }
  }





  $input.easyAutocomplete(options)

});