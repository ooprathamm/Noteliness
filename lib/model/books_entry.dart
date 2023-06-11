class books_entry{

  final String book_name;
  final String book_url;

  books_entry({required this.book_name,required this.book_url});

  Map<String,dynamic> toMap() {
    return {
      'book_name': book_name,
      'book_url': book_url
    };
  }

  factory books_entry.fromMap(Map data){
    return books_entry(
        book_name: data['book_name'],
        book_url: data['book_url']
    );
  }

}