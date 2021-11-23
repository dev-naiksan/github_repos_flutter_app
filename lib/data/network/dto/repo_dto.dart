class RepoDto {
  late int id;
  late String name;
  late String description;
  late int issues;
  late int watchers;
  late String language;

  RepoDto(
    this.id,
    this.name,
    this.description,
    this.issues,
    this.watchers,
    this.language,
  );

  RepoDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description']??'-';
    issues = json['open_issues'];
    watchers = json['watchers'];
    language = json['language']??'-';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['open_issues'] = this.issues;
    data['watchers'] = this.watchers;
    data['language'] = this.language;
    return data;
  }
}
