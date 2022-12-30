class wall_entry {

  final String title;
  final String file_url;

  wall_entry({required this.title, required this.file_url});

  
  Map<String,dynamic> toMap() {
    return {
      'title': title,
      'file_url': file_url
    };
  }

  factory wall_entry.fromMap(Map data) {
    return wall_entry(
        title: data['title'],
        file_url: data['file_url']
    );
  }

}