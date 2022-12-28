import 'package:flutter/material.dart';

import '../models/menu.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  static const String routeName = '/EditPage';

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
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
                  ElevatedButton(onPressed: () {}, child: const Text('Confirm'))
                ],
              ),
            ),
          ),
        ));
  }
}
