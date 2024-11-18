import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  const UiControlsScreen({super.key});

  static const name = "ui_controls_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("UI Controls"),
      ),
      body: _UIControlsView(),
    );
  }
}

class _UIControlsView extends StatefulWidget {
  const _UIControlsView();

  @override
  State<_UIControlsView> createState() => _UIControlsViewState();
}

enum Trasnportation { car, plane, boat, submarine }

class _UIControlsViewState extends State<_UIControlsView> {
  bool isDeveloper = true;
  Trasnportation selectedTransportation = Trasnportation.car;
  bool wantsBreakFast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          value: isDeveloper,
          onChanged: (value) {
            // isDeveloper = !value;
            isDeveloper = value;
            setState(() {});
          },
          title: const Text("Developer mode"),
          subtitle: const Text('controles adicionales'),
        ),
        ExpansionTile(
          title: const Text("Vehiculo de transporte"),
          subtitle: Text("$selectedTransportation"),
          children: [
            RadioListTile(
                title: const Text("By Car"),
                subtitle: const Text("viajar por carro"),
                value: Trasnportation.car,
                groupValue: selectedTransportation,
                onChanged: (value) => setState(() {
                      selectedTransportation = Trasnportation.car;
                    })),
            RadioListTile(
                title: const Text("By Boat"),
                subtitle: const Text("viajar por Barco"),
                value: Trasnportation.boat,
                groupValue: selectedTransportation,
                onChanged: (value) => setState(() {
                      selectedTransportation = Trasnportation.boat;
                    })),
            RadioListTile(
                title: const Text("By Plane"),
                subtitle: const Text("viajar por Avion"),
                value: Trasnportation.plane,
                groupValue: selectedTransportation,
                onChanged: (value) => setState(() {
                      selectedTransportation = Trasnportation.plane;
                    })),
            RadioListTile(
                title: const Text("By Submarine"),
                subtitle: const Text("viajar por Submarino"),
                value: Trasnportation.submarine,
                groupValue: selectedTransportation,
                onChanged: (value) => setState(() {
                      selectedTransportation = Trasnportation.submarine;
                    })),
          ],
        ),
        CheckboxListTile(
            title: const Text("¿Desayuno?"),
            value: wantsBreakFast,
            onChanged: (value) {
              setState(() {
                wantsBreakFast = !wantsBreakFast;
              });
            }),
        CheckboxListTile(
            title: const Text("Comida?"),
            value: wantsLunch,
            onChanged: (value) {
              setState(() {
                wantsLunch = !wantsLunch;
              });
            }),
        CheckboxListTile(
            title: const Text("¿Cena?"),
            value: wantsDinner,
            onChanged: (value) {
              setState(() {
                wantsDinner = !wantsDinner;
              });
            }),
      ],
    );
  }
}
