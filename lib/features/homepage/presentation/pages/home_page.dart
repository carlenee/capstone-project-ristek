import 'package:capstone_project/core/theme/_themes.dart';
import 'package:capstone_project/features/create_post/presentation/pages/create_post_page.dart';
import 'package:capstone_project/features/homepage/data/models/post_model.dart';
import 'package:capstone_project/features/homepage/presentation/bloc/home_page_bloc.dart';
import 'package:capstone_project/features/homepage/presentation/widgets/_widgets.dart';
import 'package:capstone_project/features/homepage/presentation/widgets/bottom_bar.dart';
import 'package:capstone_project/features/homepage/presentation/widgets/home_page_header.dart';
import 'package:capstone_project/features/homepage/presentation/widgets/post_card.dart';
import 'package:capstone_project/features/main/profile/presentation/pages/profile_page.dart';
import 'package:capstone_project/services/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final PagingController<int, PostModel> _pagingController =
      PagingController(firstPageKey: 1);
  late final HomePageBloc _bloc;

  @override
  void initState() {
    _bloc = get<HomePageBloc>();
    _bloc.add(
      HomePageLoadDataEvent(
        pagingController: _pagingController,
        pageKey: 1,
      ),
    );

    _pagingController.addPageRequestListener((pageKey) {
      _bloc.add(
        HomePageLoadDataEvent(
          pagingController: _pagingController,
          pageKey: _pagingController.nextPageKey!,
        ),
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
          ),
          child: Column(
            children: [
              const HomePageHeader(),
              const SizedBox(
                height: 20,
              ),
              BlocBuilder<HomePageBloc, HomePageState>(
                bloc: _bloc,
                builder: (context, state) {
                  if (state is HomePageInitial) {
                    return const Center(
                      child: Text(
                        "No Post yet",
                        style: CapstoneFontTheme.greySecondary,
                      ),
                    );
                  }
                  if (state is HomePageLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: CapstoneColors.purple,
                      ),
                    );
                  }
                  if (state is HomePageLoadedState) {
                    return Expanded(
                      child: RefreshIndicator(
                        onRefresh: () => _refreshPost(),
                        child: PagedListView.separated(
                          pagingController: _pagingController,
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 20,
                          ),
                          builderDelegate: PagedChildBuilderDelegate<PostModel>(
                            itemBuilder: (context, item, index) {
                              return PostCard(
                                content: item.content,
                                photo: item.photoUrl,
                                likeCount: item.likeCount,
                                dislikeCount: item.dislikeCount,
                                postId: item.id,
                                userId: item.userId,
                                bloc: _bloc,
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  }
                  if (state is HomePageSuccessState) {
                    return Expanded(
                      child: RefreshIndicator(
                        onRefresh: () => _refreshPost(),
                        child: PagedListView.separated(
                          pagingController: _pagingController,
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 20,
                          ),
                          builderDelegate: PagedChildBuilderDelegate<PostModel>(
                            itemBuilder: (context, item, index) {
                              return PostCard(
                                content: item.content,
                                photo: item.photoUrl,
                                likeCount: item.likeCount,
                                dislikeCount: item.dislikeCount,
                                postId: item.id,
                                userId: item.userId,
                                bloc: _bloc,
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  }
                  return const SizedBox();
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          if (index == 1) {
            // Navigate to CreatePostPage when the "Create Post" tab is tapped (index 1).
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => CreatePostPage(),
              ),
            );
          } else if (index == 2) {
            // Navigate to ProfilePage when the "Profile" tab is tapped (index 2).
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) =>
                    ProfilePage(), // Replace with your ProfilePage widget.
              ),
            );
          }
        },
      ),
    );
  }

  Future<void> _refreshPost() async {
    setState(() {
      _pagingController.refresh();
    });
  }
}
