import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';
import 'package:meals/models/settings.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen(
      {Key? key, required this.onSettingsChanged, required this.settings})
      : super(key: key);

  final Function(Settings) onSettingsChanged;

  final Settings settings;

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Settings? settings;
  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwitch(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return SwitchListTile.adaptive(
        title: Text(title),
        subtitle: Text(subtitle),
        value: value,
        onChanged: (value) {
          onChanged(value);
          widget.onSettingsChanged(settings!);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Configurações"),
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Configurações',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                _createSwitch(
                  'Sem glúten',
                  'Só exibe refeicoes sem gluten',
                  settings!.isGlutenFree,
                  (value) => setState(() => settings!.isGlutenFree = value),
                ),
                _createSwitch(
                  'Sem Lactose',
                  'Só exibe refeicoes sem Lactose',
                  settings!.isLactoseFree,
                  (value) => setState(() => settings!.isLactoseFree = value),
                ),
                _createSwitch(
                  'Vegana',
                  'Só exibe refeicoes Veganas',
                  settings!.isVegan,
                  (value) => setState(() => settings!.isVegan = value),
                ),
                _createSwitch(
                  'Vegetariana',
                  'Só exibe refeicoes Vegetarianas',
                  settings!.isVegetarian,
                  (value) => setState(() => settings!.isVegetarian = value),
                ),
              ],
            ))
          ],
        ));
  }
}
