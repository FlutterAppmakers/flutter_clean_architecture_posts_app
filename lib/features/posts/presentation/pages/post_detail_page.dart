import 'package:flutter/material.dart';

import '../../domain/entities/post.dart';
import '../widgets/post_detail_page/post_detail_widget.dart';

class PostDetailPage extends StatelessWidget {
  final Post post;

  const PostDetailPage({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() => AppBar(title: Text("Post Detail"),);
  Widget _buildBody() {
    return  Center(
      child: Padding(
        padding: EdgeInsets.all(10.0),
      child: PostDetailWidget(post:post) ,
      ),
    );
  }
}
