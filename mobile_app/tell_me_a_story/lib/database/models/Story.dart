class Story {
  final dynamic id;
  final dynamic scene;
  final dynamic resume;
  final dynamic parent;
  final dynamic author;
  final dynamic date;
  final dynamic popularity;
  final dynamic vote;
  final dynamic pages;
  final dynamic life;
  final dynamic players;
  final dynamic personnality;

  Story(
      {this.id,
      this.scene,
      this.author,
      this.parent,
      this.date,
      this.life,
      this.pages,
      this.personnality,
      this.players,
      this.popularity,
      this.resume,
      this.vote});

  static listToStories(List<Map<String, dynamic>> list) {
    List<Story> stories = new List();
    for (Map<String, dynamic> item in list) {
      Story story = new Story(
        id: item["id"],
        scene: item["scene"],
        resume: item["resume"],
        parent: item["parent"],
        author: item["author"],
        date: item["date"],
        popularity: item["popularity"],
        vote: item["vote"],
        pages: item["pages"],
        life: item["life"],
        players: item["players"],
        personnality: item["personnality"],
      );
      stories.add(story);
    }
    return stories;
  }

  toMap() {
    return {
      "id": this.id,
      "scene": this.scene,
      "resume": this.resume,
      "parent": this.parent,
      "author": this.author,
      "date": this.date,
      "popularity": this.popularity,
      "vote": this.vote,
      "pages": this.pages,
      "life": this.life,
      "players": this.players,
      "personnality": this.personnality,
    };
  }
}
