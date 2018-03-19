json.books do 
  json.array!(@books) do |book|
    json.title book.title
    # json.author book.author
    # json.content book.content
    json.url book_path(book)
  end
end

json.author do 
  json.array!(@author) do |book|
    json.title book.author
    # json.author book.author
    # json.content book.content
    json.url book_path(book)
  end
end

json.content do 
  json.array!(@content) do |book|
    json.title book.content[0..20]
    # json.author book.author
    # json.content book.content
    json.url book_path(book)
  end
end