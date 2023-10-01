class Endpoints {
  static const baseUrl = 'http://10.0.2.2:3001';
  static const registerUrl = '$baseUrl/api/auth/register';
  static const loginUrl = '$baseUrl/api/auth/login';
  static const post = '$baseUrl/api/post';
  static const editProfile = '$baseUrl/api/user';
  static const defaultProfile =
      'https://drive.google.com/file/d/1LVYy96Pxryf7Oia2UPpr9ihApZV1MP1e/view?usp=drive_link';
  static const getComments = '$baseUrl/api/comment?post_id=';
  static const editComments = '$baseUrl/api/comment/';
  static const postComment = '$baseUrl/api/comment';
  static const likePost = '$baseUrl/api/post-like?post_id=';
}
