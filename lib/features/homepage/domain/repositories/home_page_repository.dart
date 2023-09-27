import 'package:capstone_project/features/homepage/data/models/post_model.dart';

abstract class HomePageRepository {
  Future<List<PostModel>?> getListOfPost({int size = 5, required int page});


}
