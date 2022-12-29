import 'package:flutter/material.dart';
import 'package:tp2_amov/services/remote_service.dart';
import 'package:tp2_amov/views/edit_page.dart';
import '../models/menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String routeName = '/HomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Menu? menu;
  List<Day>? _menuList;

  @override
  void initState() {
    super.initState();
    getData();
  }

  bool _fetchingData = false;
  getData() async {
    try {
      setState(() => _fetchingData = true);
      menu = await RemoteService().getMenu();
      if (menu != null) {
        setState(() {
          createMenuList();
        });
      }
    } catch (ex) {
      debugPrint('Something went wrong: $ex');
    } finally {
      setState(() => _fetchingData = false);
    }
  }

  createMenuList() {
    _menuList = [
      menu!.monday,
      menu!.tuesday,
      menu!.thursday,
      menu!.wednesday,
      menu!.friday
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Menu', style: TextStyle(color: Colors.white)),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (_fetchingData) const CircularProgressIndicator(),
          if (!_fetchingData && _menuList != null && _menuList!.isNotEmpty)
            Expanded(
              child: ListView.separated(
                  itemCount: _menuList!.length,
                  separatorBuilder: (_, __) => const Divider(thickness: 2.0),
                  itemBuilder: (BuildContext context, int index) => InkWell(
                        onTap: () => Navigator.pushNamed(
                            context, EditPage.routeName,
                            arguments: _menuList![index]),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text(_menuList![index].original.weekDay,
                                    style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold)),
                              ),
                              //====================== SOUP ======================
                              Container(
                                padding: const EdgeInsets.all(15),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                        height: 50,
                                        width: 50,
                                        child: Image.network(
                                            'http://10.0.2.2:8080/images/soup.png')),
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Soup',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(_menuList![index].original.soup)
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              //====================== MEAT ======================
                              Container(
                                padding: const EdgeInsets.all(15),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                        height: 50,
                                        width: 50,
                                        child: Image.network(
                                            'http://10.0.2.2:8080/images/meat.png')),
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Meat',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(_menuList![index].original.meat)
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              //====================== FISH ======================
                              Container(
                                padding: const EdgeInsets.all(15),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                        height: 50,
                                        width: 50,
                                        child: Image.network(
                                            'http://10.0.2.2:8080/images/fish.png')),
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Fish',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(_menuList![index].original.fish)
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              //====================== VEGETARIAN ======================
                              Container(
                                padding: const EdgeInsets.all(15),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                        height: 50,
                                        width: 50,
                                        child: Image.network(
                                            'http://10.0.2.2:8080/images/vegetarian.png')),
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Vegetarian',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(_menuList![index]
                                              .original
                                              .vegetarian)
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              //====================== DESERT ======================
                              Container(
                                padding: const EdgeInsets.all(15),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                        height: 50,
                                        width: 50,
                                        child: Image.network(
                                            'http://10.0.2.2:8080/images/desert.png')),
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Desert',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                              _menuList![index].original.desert)
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ]),
                      )),
            )
        ],
      )),
    );
  }
}
