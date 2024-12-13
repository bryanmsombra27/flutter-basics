import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinteresButtton {
  final void Function()? onPress;
  final IconData icon;

  PinteresButtton({required this.onPress, required this.icon});
}

class PinterestMenu extends StatelessWidget {
  final bool show;
  final Color backgroundColor;
  final Color activeColor;
  final Color inactiveColor;
  final List<PinteresButtton> items;

  PinterestMenu({
    super.key,
    this.show = true,
    this.backgroundColor = Colors.white,
    this.activeColor = Colors.black,
    this.inactiveColor = Colors.blueGrey,
    required this.items,
  });

  static const name = "pinterest_menu";

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 250),
        opacity: show ? 1 : 0,
        child: Builder(builder: (context) {
          Provider.of<_MenuModel>(context).backgroundColor = backgroundColor;
          Provider.of<_MenuModel>(context).activeColor = activeColor;
          Provider.of<_MenuModel>(context).inactiveColor = inactiveColor;

          return _PinterestMenuWrapper(
            content: _MenuItems(
              items: items,
            ),
          );
        }),
      ),
    );
  }
}

class _PinterestMenuWrapper extends StatelessWidget {
  final Widget content;

  const _PinterestMenuWrapper({required this.content});

  @override
  Widget build(BuildContext context) {
    final background = Provider.of<_MenuModel>(context).backgroundColor;

    return Container(
      width: 250,
      height: 60,
      decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(100),
          boxShadow: const <BoxShadow>[
            BoxShadow(color: Colors.black38, blurRadius: 10, spreadRadius: -5),
          ]),
      child: content,
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<PinteresButtton> items;

  const _MenuItems({required this.items});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(items.length, (index) {
        return _PinterestMenuButton(index: index, item: items[index]);
      }),
    );
  }
}

class _PinterestMenuButton extends StatelessWidget {
  final int index;
  final PinteresButtton item;

  const _PinterestMenuButton({required this.index, required this.item});

  @override
  Widget build(BuildContext context) {
    final itemSelect = Provider.of<_MenuModel>(context).itemSelect;
    final menuModelProvider = Provider.of<_MenuModel>(context);

    return GestureDetector(
      onTap: () {
        Provider.of<_MenuModel>(context, listen: false).itemSelect = index;
        item.onPress!();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon(
          item.icon,
          size: itemSelect == index ? 35 : 25,
          color: itemSelect == index
              ? menuModelProvider.activeColor
              : menuModelProvider.inactiveColor,
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  int _itemSelect = 0;
  Color backgroundColor = Colors.white;
  Color activeColor = Colors.black;
  Color inactiveColor = Colors.blueGrey;

  int get itemSelect {
    return _itemSelect;
  }

  set itemSelect(int value) {
    _itemSelect = value;
    notifyListeners();
  }
}
