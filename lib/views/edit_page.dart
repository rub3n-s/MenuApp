import 'package:flutter/material.dart';

import '../models/menu.dart';
import '../services/remote_service.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  static const String routeName = '/EditPage';

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final TextEditingController _soupController = TextEditingController();
  final TextEditingController _meatController = TextEditingController();
  final TextEditingController _fishController = TextEditingController();
  final TextEditingController _vegeterianController = TextEditingController();
  final TextEditingController _desertController = TextEditingController();

  late final Day _menu = ModalRoute.of(context)!.settings.arguments as Day;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: const Text('Menu', style: TextStyle(color: Colors.white)),
        ),
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(15),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: TextFormField(
                        controller: _soupController,
                        decoration: const InputDecoration(
                            labelText: 'Soup: ', border: OutlineInputBorder()),
                        initialValue: _menu.original.soup,
                        maxLines: null),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  // Meat
                  SizedBox(
                    width: double.infinity,
                    child: TextFormField(
                        controller: _meatController,
                        decoration: const InputDecoration(
                          labelText: 'Meat: ',
                          border: OutlineInputBorder(),
                        ),
                        initialValue: _menu.original.meat,
                        maxLines: null),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  // Fish
                  SizedBox(
                    width: double.infinity,
                    child: TextFormField(
                        controller: _fishController,
                        decoration: const InputDecoration(
                          labelText: 'Fish: ',
                          border: OutlineInputBorder(),
                        ),
                        initialValue: _menu.original.fish,
                        maxLines: null),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  // Vegetarian
                  SizedBox(
                    width: double.infinity,
                    child: TextFormField(
                        controller: _vegeterianController,
                        decoration: const InputDecoration(
                          labelText: 'Vegetarian: ',
                          border: OutlineInputBorder(),
                        ),
                        initialValue: _menu.original.vegetarian,
                        maxLines: null),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  // Desert
                  SizedBox(
                    width: double.infinity,
                    child: TextFormField(
                        controller: _desertController,
                        decoration: const InputDecoration(
                          labelText: 'Desert: ',
                          border: OutlineInputBorder(),
                        ),
                        initialValue: _menu.original.desert,
                        maxLines: null),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        var data = {
                          "img": _menu.original.img,
                          "weekDay": _menu.original.weekDay,
                          "soup": _soupController.text,
                          "fish": _fishController.text,
                          "meat": _meatController.text,
                          "vegetarian": _vegeterianController.text,
                          "desert": _desertController.text
                        };

                        RemoteService().updateMenu(data);
                        Navigator.pop(context);
                      },
                      child: const Text('Confirm'))
                ],
              ),
            ),
          ),
        ));
  }
}
