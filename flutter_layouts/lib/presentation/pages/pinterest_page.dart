import 'package:flutter/material.dart';
import 'package:flutter_layouts/presentation/pages/widgets/pinterest_menu.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class PinterestPage extends StatelessWidget {
  const PinterestPage({
    super.key,
  });

  static const name = "pinterest_page";

  @override
  Widget build(BuildContext context) {
    // return _PinterestGrid();
    // return PinterestMenu();
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: Stack(
        children: [_PinterestGrid(), _Pinterest_menu_location()],
      ),
    );
  }
}

class _Pinterest_menu_location extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    final show = Provider.of<_MenuModel>(context).mostrar;

    return Positioned(
        bottom: 30,
        child: Container(
          width: widthScreen,
          child: Align(
            child: PinterestMenu(
              items: [
                PinteresButtton(onPress: () {}, icon: Icons.pie_chart),
                PinteresButtton(onPress: () {}, icon: Icons.search),
                PinteresButtton(onPress: () {}, icon: Icons.notifications),
                PinteresButtton(
                    onPress: () {}, icon: Icons.supervised_user_circle_sharp),
              ],
              show: show,
              activeColor: Colors.deepPurple,
              inactiveColor: Colors.deepOrangeAccent,
            ),
          ),
        ));
  }
}

class _PinterestGrid extends StatefulWidget {
  _PinterestGrid();

  @override
  State<_PinterestGrid> createState() => _PinterestGridState();
}

class _PinterestGridState extends State<_PinterestGrid> {
  final List<int> items = List.generate(200, (i) => i);
  ScrollController controller = ScrollController();
  double scrollAnterior = 0;

  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      // print(contro)

      if (controller.offset > scrollAnterior && controller.offset > 150) {
        Provider.of<_MenuModel>(context, listen: false).mostrar = false;
        // ocultar menu
      } else {
        // mostrar menu
        Provider.of<_MenuModel>(context, listen: false).mostrar = true;
      }
      scrollAnterior = controller.offset;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return MasonryGridView.count(
      controller: controller,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      itemCount: items.length,
      crossAxisCount: 2,
      mainAxisSpacing: 4,
      crossAxisSpacing: 2,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.all(5),
          padding: const EdgeInsets.all(10),
          height: 150,
          decoration: BoxDecoration(
              color: colors.primary, borderRadius: BorderRadius.circular(5)),
          child: CircleAvatar(
            child: Text('${index + 1}'),
          ),
        );
      },
    );
  }
}

class _MenuModel with ChangeNotifier {
  bool _mostrar = true;

  bool get mostrar {
    return _mostrar;
  }

  set mostrar(bool value) {
    _mostrar = value;
    notifyListeners();
  }
}
