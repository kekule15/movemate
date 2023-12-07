import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movemate/widgets/single_text_line_widget.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final List<String> _items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5'
  ];
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated List Example'),
      ),
      body: AnimatedList(
        key: _listKey,
        initialItemCount: 20,
        itemBuilder: (context, index, animation) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 1),
              end: Offset.zero,
            ).animate(animation),
            child: Container(height: 100.h,width: MediaQuery.sizeOf(context).width,decoration: BoxDecoration(),)
          );
        },
      ),
    );
  }
}
