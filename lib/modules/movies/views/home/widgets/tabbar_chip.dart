import 'package:desafiocubos/modules/movies/views/home/widgets/tab_indicator.dart';
import 'package:desafiocubos/resources/text_styles.dart';
import 'package:flutter/material.dart';

class TabBarChip extends StatelessWidget {
  final TabController controller;
  const TabBarChip({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: controller,
      unselectedLabelColor: Colors.black,
      labelStyle: tabTitleStyle,
      indicatorSize: TabBarIndicatorSize.label,
      indicator: const TabIndicator(
        backgroundColor: Color(0xFF00384C),
        height: 24,
      ),
      tabs: const [
        Tab(
          child: Align(
            alignment: Alignment.center,
            child: Text('Ação'),
          ),
        ),
        Tab(
          child: Align(
            alignment: Alignment.center,
            child: Text('Aventura'),
          ),
        ),
        Tab(
          child: Align(
            alignment: Alignment.center,
            child: Text('Fantasia'),
          ),
        ),
        Tab(
          child: Align(
            alignment: Alignment.center,
            child: Text('Comédia'),
          ),
        ),
      ],
    );
  }
}
