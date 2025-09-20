class Album2 {
  /**
   * 
   *  {
    "albumId": 1,
    "id": 1,
    "title": "accusamus beatae ad facilis cum similique qui sunt",
    "url": "https://via.placeholder.com/600/92c952",
    "thumbnailUrl": "https://via.placeholder.com/150/92c952"
  }
   */

  final int albumId;
  final int id;
  final String title;
  final String url;

  const Album2({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
  });

  factory Album2.fromJson(Map<String, dynamic> json) {
    return Album2(
      albumId: json['albumId'],
      id: json['id'],
      title: json['title'],
      url: json['thumbnailUrl'],
    );
  }
}
