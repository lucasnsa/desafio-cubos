import 'package:desafiocubos/modules/movies/views/home/widgets/tab_indicator.dart';
import 'package:desafiocubos/resources/text_styles.dart';
import 'package:flutter/material.dart';

/// TabBarChip descartado
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

/// Cria um tabbar com botões selecionaveis
/// [OnChanged] é a ação ao mudar de tab
/// [selectedIndex] guarda a posição da tab selecionada
/// [labels] é a lista de botões
class TabChips extends StatelessWidget {
  final ValueChanged<int> onChanged;
  final int selectedIndex;
  final List<String> labels;

  const TabChips({
    Key? key,
    required this.onChanged,
    this.selectedIndex = 0,
    required this.labels,
  }) : super(key: key);

  // bypass para o toque
  void _handleTap(int value) {
    onChanged(value);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: labels.map<Widget>(
        (e) {
          final index = labels.indexOf(e);
          return ChoiceChip(
            selected: selectedIndex == index,
            label: Text(e),
            labelStyle: selectedIndex == index
                ? tabTitleStyle
                : tabTitleStyle.copyWith(color: Colors.black),
            backgroundColor: Colors.white,
            onSelected: (selected) {
              if (selected) {
                _handleTap(index);
              }
            },
            selectedColor: const Color(0xFF00384C),
          );
        },
      ).toList(),
    );
  }
}
