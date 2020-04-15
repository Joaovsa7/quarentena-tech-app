class Events {
  String title;
  String logo;
  String alt;
  String content;
  String url;
  List<String> categories;
  String className;

  Events({
    this.title,
    this.logo,
    this.alt,
    this.content,
    this.url,
    this.categories,
  });

  Events.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    logo = json['logo'];
    alt = json['alt'];
    content = json['content'];
    url = json['url'];
    categories = json['categories'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['logo'] = this.logo;
    data['alt'] = this.alt;
    data['content'] = this.content;
    data['url'] = this.url;
    data['categories'] = this.categories;

    return data;
  }
}
