import 'package:flutter/material.dart';
import 'package:tp2_amov/models/screen_arguments.dart';

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
  //late final Day _menu = ModalRoute.of(context)!.settings.arguments as Day;
  late final Day _updatedDay = _menu.day;

  updateSoup(String value) {
    if (value.isNotEmpty) {
      _updatedDay.original.soup = value;
    } else {
      _updatedDay.original.soup = _menu.day.original.soup;
    }
  }

  updateMeat(String value) {
    if (value.isNotEmpty) {
      _updatedDay.original.meat = value;
    } else {
      _updatedDay.original.meat = _menu.day.original.meat;
    }
  }

  updateFish(String value) {
    if (value.isNotEmpty) {
      _updatedDay.original.fish = value;
    } else {
      _updatedDay.original.fish = _menu.day.original.fish;
    }
  }

  updateVegetarian(String value) {
    if (value.isNotEmpty) {
      _updatedDay.original.vegetarian = value;
    } else {
      _updatedDay.original.vegetarian = _menu.day.original.vegetarian;
    }
  }

  updateDesert(String value) {
    if (value.isNotEmpty) {
      _updatedDay.original.desert = value;
    } else {
      _updatedDay.original.desert = _menu.day.original.desert;
    }
  }

  postToJson() async {
    // get the current menu
    /*Menu? tmp = await RemoteService().getMenu();

    debugPrint('Updating Day: ${_updatedDay.original.weekDay}');

    switch (_updatedDay.original.weekDay) {
      case "MONDAY":
        tmp!.monday = _updatedDay;
        break;
      case "TUESDAY":
        tmp!.tuesday = _updatedDay;
        break;
      case "WEDNESDAY":
        tmp!.wednesday = _updatedDay;
        break;
      case "THURSDAY":
        tmp!.thursday = _updatedDay;
        break;
      case "FRIDAY":
        tmp!.friday = _updatedDay;
        break;
    } */

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
                  SizedBox(
                    width: double.infinity,
                    child: TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Soup: ', border: OutlineInputBorder()),
                        initialValue: _menu.day.original.soup,
                        onChanged: (value) => updateSoup(value),
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
                        initialValue: _menu.day.original.meat,
                        onChanged: (value) => updateMeat(value),
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
                        initialValue: _menu.day.original.fish,
                        onChanged: (value) => updateFish(value),
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
                        initialValue: _menu.day.original.vegetarian,
                        onChanged: (value) => updateVegetarian(value),
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
                        initialValue: _menu.day.original.desert,
                        onChanged: (value) => updateDesert(value),
                        maxLines: null),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        postToJson();
                        Navigator.pop(context, true);
                      },
                      child: const Text('Confirm'))
                ],
              ),
            ),
          ),
        ));
  }
}
