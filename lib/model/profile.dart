class ProfileModel {
  final UserModel user;
  final List<PostModel> posts;

  const ProfileModel({
    required this.user,
    required this.posts,
  });

  factory ProfileModel.fromData(dynamic data) {
    final UserModel user = UserModel.fromData(data["graphql"]["user"]);

    final List<
        dynamic> postsDynamic = data["graphql"]["user"]["edge_owner_to_timeline"]["edges"];
    final List<PostModel> posts = postsDynamic.map((postData) =>
        PostModel.fromData(postData["node"])).toList();

    return ProfileModel(
        user: user,
        posts: posts
    );
  }
}

class UserModel {
  final String fullname; // Bill Gates
  final String username; // @thisisbillgates
  final String imageUrl;
  final String bio;
  final String link;
  final int numPosts;
  final int numFollowers;
  final int numFollowing;

  const UserModel({
    required this.fullname,
    required this.username,
    required this.imageUrl,
    required this.bio,
    required this.link,
    required this.numPosts,
    required this.numFollowers,
    required this.numFollowing,
  });

  factory UserModel.fromData(dynamic data) {
    final String fullname = data["full_name"];
    final String username = data["username"];
    final String imageUrl = data["profile_pic_url"];
    final String bio = data["biography"];
    final String link = data["external_url"];
    final int numPosts = data["edge_owner_to:timeline_media"]["count"];
    final int numFollower = data["edge_followed_by"]["count"];
    final int numFollowing = data["edge_follow"]["count"];

    return UserModel(
      fullname: fullname,
      username: username,
      imageUrl: imageUrl,
      bio: bio,
      link: link,
      numPosts: numPosts,
      numFollowers: numFollower,
      numFollowing: numFollowing,
    );
  }
}

class PostModel {
  final String imageUrl;

  const PostModel({
    required this.imageUrl,
  });

  factory PostModel.fromData(dynamic data) {
    final String imageUrl = data["display_url"];

    return PostModel(
      imageUrl: imageUrl,
    );
  }
}