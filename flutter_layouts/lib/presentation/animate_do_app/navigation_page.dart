import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key});

  static const name = "navigation_page";

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NotificationModel(),
      child: Scaffold(
        floatingActionButton: const _BotonFlotante(),
        appBar: AppBar(
          title: const Text('Notifications'),
        ),
        bottomNavigationBar: const _BottomNavigation(),
        // body: _BotonFlotante(),
      ),
    );
  }
}

class _BottomNavigation extends StatelessWidget {
  const _BottomNavigation();

  @override
  Widget build(BuildContext context) {
    final int notifications = Provider.of<_NotificationModel>(context).number;

    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: Colors.pink,
      items: [
        const BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.bone), label: 'Bones'),
        BottomNavigationBarItem(
            icon: Stack(
              children: [
                const FaIcon(FontAwesomeIcons.bell),
                Positioned(
                  top: 0.0,
                  right: 0,
                  // child: Icon(
                  //   Icons.brightness_1,
                  //   size: 8,
                  //   color: Colors.redAccent,
                  // ),
                  child: BounceInDown(
                    animate: notifications > 0 ? true : false,
                    from: 10,
                    child: Bounce(
                      from: 10,
                      controller: (controller) =>
                          Provider.of<_NotificationModel>(context)
                              .bounceController = controller,
                      child: Container(
                        padding: const EdgeInsets.all(1),
                        width: 12,
                        height: 12,
                        decoration: const BoxDecoration(
                            color: Colors.redAccent, shape: BoxShape.circle),
                        child: Text(
                          textAlign: TextAlign.center,
                          "$notifications",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 7,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            label: 'Notifications'),
        const BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.dog), label: 'My dog')
      ],
    );
  }
}

class _BotonFlotante extends StatelessWidget {
  const _BotonFlotante();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        final notificationModelProvider =
            Provider.of<_NotificationModel>(context, listen: false);

        notificationModelProvider.number++;
        if (notificationModelProvider.number >= 2) {
          final controller = notificationModelProvider.bounceController;

          controller.forward(from: 0.0);
        }
      },
      child: const FaIcon(FontAwesomeIcons.play),
    );
  }
}

class _NotificationModel extends ChangeNotifier {
  int _number = 0;
  late AnimationController _bounceController;

  int get number {
    return _number;
  }

  AnimationController get bounceController {
    return _bounceController;
  }

  set number(int value) {
    _number = value;
    notifyListeners();
  }

  set bounceController(AnimationController controller) {
    _bounceController = controller;
    // notifyListeners();
  }
}
