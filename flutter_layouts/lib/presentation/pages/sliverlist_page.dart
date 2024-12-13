import 'package:flutter/material.dart';

class SliverlistPage extends StatelessWidget {
  const SliverlistPage({super.key});

  static const name = "sliverlist_page";

  @override
  Widget build(BuildContext context) {
    // return _ListTasks();
    // return _Title();
    return Stack(
      children: [
        _MainScroll(),
        const Positioned(bottom: -10, right: 0, child: _ButtonNewList()),
      ],
    );
  }
}

class _ButtonNewList extends StatelessWidget {
  const _ButtonNewList();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ButtonTheme(
      minWidth: size.width * .9,
      height: 100,
      child: ElevatedButton(
        style: const ButtonStyle(
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(50)))),
            backgroundColor: WidgetStatePropertyAll(Color(0xffed6762)),
            padding: WidgetStatePropertyAll(EdgeInsets.all(20))),
        onPressed: () {},
        child: const Text(
          'Create New List',
          style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 3),
        ),
      ),
    );
  }
}

class _ListTaskItem extends StatelessWidget {
  final String title;
  final Color color;

  const _ListTaskItem({
    required this.title,
    this.color = Colors.orange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(30),
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30),
      ),
      margin: const EdgeInsets.all(10),
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: const Text(
            "New",
            style: TextStyle(color: Color(0xff532128), fontSize: 50),
          ),
        ),
        Stack(
          children: [
            const SizedBox(
              width: 100,
            ),
            Positioned(
              bottom: 8,
              child: Container(
                width: 130,
                height: 8,
                color: const Color(0xfff7cdd5),
              ),
            ),
            Container(
              child: const Text(
                'List',
                style: TextStyle(
                    color: Color(0xffD93a39),
                    fontSize: 50,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class _MainScroll extends StatelessWidget {
  final items = [
    const _ListTaskItem(title: 'Orange', color: Color(0xffF08F66)),
    const _ListTaskItem(title: 'Family', color: Color(0xffF2A38A)),
    const _ListTaskItem(title: 'Subscriptions', color: Color(0xffF7CDD5)),
    const _ListTaskItem(title: 'Books', color: Color(0xffFCEBAF)),
    const _ListTaskItem(title: 'Orange', color: Color(0xffF08F66)),
    const _ListTaskItem(title: 'Family', color: Color(0xffF2A38A)),
    const _ListTaskItem(title: 'Subscriptions', color: Color(0xffF7CDD5)),
    const _ListTaskItem(title: 'Books', color: Color(0xffFCEBAF)),
    const _ListTaskItem(title: 'Subscriptions', color: Color(0xffF7CDD5)),
    const _ListTaskItem(title: 'Books', color: Color(0xffFCEBAF)),
    const _ListTaskItem(title: 'Orange', color: Color(0xffF08F66)),
    const _ListTaskItem(title: 'Family', color: Color(0xffF2A38A)),
    const _ListTaskItem(title: 'Subscriptions', color: Color(0xffF7CDD5)),
    const _ListTaskItem(title: 'Books', color: Color(0xffFCEBAF)),
    const _ListTaskItem(title: 'Subscriptions', color: Color(0xffF7CDD5)),
    const _ListTaskItem(title: 'Books', color: Color(0xffFCEBAF)),
    const _ListTaskItem(title: 'Orange', color: Color(0xffF08F66)),
    const _ListTaskItem(title: 'Family', color: Color(0xffF2A38A)),
    const _ListTaskItem(title: 'Subscriptions', color: Color(0xffF7CDD5)),
    const _ListTaskItem(title: 'Books', color: Color(0xffFCEBAF)),
  ];

  _MainScroll();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // SliverAppBar(
        //   floating: true,
        //   elevation: 0,
        //   title: _Title(),
        // ),
        SliverPersistentHeader(
            floating: true,
            delegate: _SliverCustomHeaderDelegate(
                child: Container(
                  alignment: Alignment.centerLeft,
                  color: Colors.white,
                  child: const _Title(),
                ),
                minHeight: 200,
                maxHeight: 250)),

        SliverList(
            delegate: SliverChildListDelegate([
          ...items,
          const SizedBox(
            height: 100,
          )
        ]))
      ],
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverCustomHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox(
      child: child,
    );
  }

  // @override
  // double get maxExtent => minHeight > maxHeight ? minHeight : maxHeight;
  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxExtent ||
        minHeight != oldDelegate.minExtent;
  }
}
