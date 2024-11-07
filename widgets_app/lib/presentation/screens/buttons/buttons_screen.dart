import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const String name = "buttons_screen";

  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Screens'),
      ),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pop();
        },
        child: const Icon(Icons.arrow_back_ios_new_rounded),
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 20),
        child: Wrap(
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {}, child: const Text('Elevated button')),
            const ElevatedButton(
                onPressed: null, child: Text('Elevated disabled button')),
            ElevatedButton.icon(
                icon: const Icon(Icons.access_alarm_rounded),
                onPressed: () {},
                label: const Text('Elevated button with icon')),
            FilledButton(onPressed: () {}, child: const Text("Filled button")),
            FilledButton.icon(
              onPressed: () {},
              label: const Text("Filled Button with Icon"),
              icon: const Icon(Icons.abc),
            ),
            OutlinedButton(
                onPressed: () {}, child: const Text("Outlined button")),
            OutlinedButton.icon(
                icon: const Icon(Icons.access_alarm_outlined),
                onPressed: () {},
                label: const Text(
                  'Outlined button with icon',
                )),
            TextButton(onPressed: () {}, child: const Text('Text button')),
            TextButton.icon(
                icon: const Icon(Icons.zoom_out_outlined),
                onPressed: () {},
                label: const Text('Text button with icon')),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.access_alarm_sharp)),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.ac_unit_rounded,
              ),
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(colors.primary)),
            ),
            const CustomButtons()
          ],
        ),
      ),
    );
  }
}

class CustomButtons extends StatelessWidget {
  const CustomButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Custom button',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
