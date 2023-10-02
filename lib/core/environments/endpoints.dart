class Endpoints {
  static const baseUrl = 'http://10.0.2.2:3001';
  static const registerUrl = '$baseUrl/api/auth/register';
  static const loginUrl = '$baseUrl/api/auth/login';
  static const post = '$baseUrl/api/post';
  static const editProfile = '$baseUrl/api/user';
  static const defaultProfile =
      'https://images.nightcafe.studio//assets/profile.png';
  static const getComments = '$baseUrl/api/comment?post_id=';
  static const editComments = '$baseUrl/api/comment/';
  static const postComment = '$baseUrl/api/comment';
  static const likePost = '$baseUrl/api/post-like?post_id=';
}
