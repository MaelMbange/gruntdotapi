class Article {
  final String? headline;
  final String? shortHeadline;
  final String? content;
  final String? imageUrl;
  final List<Action>? actions;

  Article({
    required this.headline,
    required this.shortHeadline,
    required this.content,
    required this.imageUrl,
    required this.actions,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        headline: json['healdine'],
        shortHeadline: json['short_headline'],
        content: json['content'],
        imageUrl: json['image_url'],
        actions: json['actions'] != null
            ? List<Action>.from(
                json['actions'].map((action) => Action.fromJson(action)))
            : null,
      );

  Map<String, dynamic> toJson() => {
        'healdine': headline,
        'short_headline': shortHeadline,
        'content': content,
        'image_url': imageUrl,
        'actions': actions?.map((action) => action.toJson()).toList(),
      };
}

class Action {
  final String? title;
  final String? description;
  final String? url;

  Action({
    required this.title,
    required this.description,
    required this.url,
  });

  factory Action.fromJson(Map<String, dynamic> json) => Action(
        title: json['title'],
        description: json['description'],
        url: json['url'],
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'url': url,
      };

  @override
  String toString() => "title: $title, description: $description, url: $url";
}
