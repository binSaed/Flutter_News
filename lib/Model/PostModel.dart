class PostModel {
  String id, title, content, dateWritten, featuredImage;
  int votesUp, votesDown, userId, categoryId;
  List<int> votersUp, votersDown;

  PostModel(
      {this.id,
      this.title,
      this.content,
      this.dateWritten,
      this.featuredImage,
      this.votesUp,
      this.votesDown,
      this.votersUp,
      this.votersDown,
      this.userId,
      this.categoryId});
}
