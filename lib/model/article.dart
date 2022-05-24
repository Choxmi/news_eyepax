class Article {
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;
  final String? sourceId;
  final String? sourceName;

  Article(
      {this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content,
      this.sourceId,
      this.sourceName});

  Article.fromJson(Map<String, dynamic> json)
      : author = json['author'],
        title = json['title'],
        description = json['description'],
        url = json['url'],
        urlToImage = json['urlToImage'],
        publishedAt = json['publishedAt'],
        content = json['content'],
        sourceId = json['source'] != null ? json['source']['id'] : '',
        sourceName = json['source'] != null ? json['source']['name'] : '';


}
