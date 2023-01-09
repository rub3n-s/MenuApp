import 'package:flutter/material.dart';
import 'package:tp2_amov/models/screen_arguments.dart';
import 'package:tp2_amov/views/home_page.dart';

import '../models/menu.dart';
import '../services/remote_service.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  static const String routeName = '/EditPage';

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  late final ScreenArguments _menu =
      ModalRoute.of(context)!.settings.arguments as ScreenArguments;
  late final Day _updatedDay = _menu.day;

  final _soupController = TextEditingController();
  final _meatController = TextEditingController();
  final _fishController = TextEditingController();
  final _vegetarianController = TextEditingController();
  final _desertController = TextEditingController();

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      _soupController.text = _menu.day.original.soup;
      _meatController.text = _menu.day.original.meat;
      _fishController.text = _menu.day.original.fish;
      _vegetarianController.text = _menu.day.original.vegetarian;
      _desertController.text = _menu.day.original.desert;
    });
  }

  postToJson() async {
    if (_soupController.text.isNotEmpty) {
      _updatedDay.original.soup = _soupController.text;
    } else {
      _updatedDay.original.soup = _menu.day.original.soup;
    }

    if (_meatController.text.isNotEmpty) {
      _updatedDay.original.meat = _meatController.text;
    } else {
      _updatedDay.original.meat = _menu.day.original.meat;
    }

    if (_fishController.text.isNotEmpty) {
      _updatedDay.original.fish = _fishController.text;
    } else {
      _updatedDay.original.fish = _menu.day.original.fish;
    }

    if (_vegetarianController.text.isNotEmpty) {
      _updatedDay.original.vegetarian = _vegetarianController.text;
    } else {
      _updatedDay.original.vegetarian = _menu.day.original.vegetarian;
    }

    if (_desertController.text.isNotEmpty) {
      _updatedDay.original.desert = _desertController.text;
    } else {
      _updatedDay.original.desert = _menu.day.original.desert;
    }

    // post to json
    RemoteService().setMenu(_updatedDay.original);
  }

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
                  Row(children: [
                    Expanded(
                      flex: 5,
                      child: TextField(
                          controller: _soupController,
                          decoration: const InputDecoration(
                              labelText: 'Soup: ',
                              border: OutlineInputBorder()),
                          maxLines: null),
                    ),
                    Expanded(
                      child: SizedBox(
                        width: 40,
                        height: 40,
                        child: FloatingActionButton(
                          heroTag: 'refreshSoup',
                          onPressed: () =>
                              {_soupController.text = _menu.day.original.soup},
                          tooltip: 'Refresh',
                          child: const Icon(Icons.refresh),
                        ),
                      ),
                    )
                  ]),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(children: [
                    Expanded(
                      flex: 5,
                      child: TextField(
                          controller: _meatController,
                          decoration: const InputDecoration(
                              labelText: 'Meat: ',
                              border: OutlineInputBorder()),
                          maxLines: null),
                    ),
                    Expanded(
                      child: SizedBox(
                        width: 40,
                        height: 40,
                        child: FloatingActionButton(
                          heroTag: 'refreshMeat',
                          onPressed: () =>
                              {_meatController.text = _menu.day.original.meat},
                          tooltip: 'Refresh',
                          child: const Icon(Icons.refresh),
                        ),
                      ),
                    )
                  ]),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(children: [
                    Expanded(
                      flex: 5,
                      child: TextField(
                          controller: _fishController,
                          decoration: const InputDecoration(
                              labelText: 'Fish: ',
                              border: OutlineInputBorder()),
                          maxLines: null),
                    ),
                    Expanded(
                      child: SizedBox(
                        width: 40,
                        height: 40,
                        child: FloatingActionButton(
                          heroTag: 'refreshFish',
                          onPressed: () =>
                              {_fishController.text = _menu.day.original.fish},
                          tooltip: 'Refresh',
                          child: const Icon(Icons.refresh),
                        ),
                      ),
                    )
                  ]),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(children: [
                    Expanded(
                      flex: 5,
                      child: TextField(
                          controller: _meatController,
                          decoration: const InputDecoration(
                              labelText: 'Vegetarian: ',
                              border: OutlineInputBorder()),
                          maxLines: null),
                    ),
                    Expanded(
                      child: SizedBox(
                        width: 40,
                        height: 40,
                        child: FloatingActionButton(
                          heroTag: 'refreshVeggie',
                          onPressed: () => {
                            _vegetarianController.text =
                                _menu.day.original.vegetarian
                          },
                          tooltip: 'Refresh',
                          child: const Icon(Icons.refresh),
                        ),
                      ),
                    )
                  ]),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(children: [
                    Expanded(
                      flex: 5,
                      child: TextField(
                          controller: _desertController,
                          decoration: const InputDecoration(
                              labelText: 'Desert: ',
                              border: OutlineInputBorder()),
                          maxLines: null),
                    ),
                    Expanded(
                      child: SizedBox(
                        width: 40,
                        height: 40,
                        child: FloatingActionButton(
                          heroTag: 'refreshDesert',
                          onPressed: () => {
                            _desertController.text = _menu.day.original.desert
                          },
                          tooltip: 'Refresh',
                          child: const Icon(Icons.refresh),
                        ),
                      ),
                    )
                  ]),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        postToJson();
                        Navigator.pushNamed(context, HomePage.routeName);
                        //Navigator.pop(context, true);
                      },
                      child: const Text('Confirm'))
                ],
              ),
            ),
          ),
        ));
  }
}
