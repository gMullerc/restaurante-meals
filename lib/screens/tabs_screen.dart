import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/favorite_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key, required this.favoriteMeals}) : super(key: key);

  final List<Meal> favoriteMeals;

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;
  late List<Map<String, Object>> _screen;

  @override
  void initState() {
    super.initState();
    _screen = [
      {
        'title': 'Lista De Categorias',
        'screen': CategoriesScreen(),
      },
      {
        'title': 'Meus Favoritos',
        'screen': FavoriteScreen(
          favoriteMeals: widget.favoriteMeals,
        )
      },
    ];
  }

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          _screen[_selectedScreenIndex]['title'] as String,
        )),
      ),
      drawer: MainDrawer(),
      body: _screen[_selectedScreenIndex]['screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectScreen,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).secondaryHeaderColor,
          currentIndex: _selectedScreenIndex,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              label: "Categorias",
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.star),
              label: "Favoritos",
            ),
          ]),
    );
  }
}


/* return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Center(child: Text("Vamos cozinhar")),
            bottom: TabBar(tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: 'Categorias',
              ),
              Tab(
                icon: Icon(Icons.star),
                text: 'Favoritos',
              )
            ]),
          ),
          body: TabBarView(children: [CategoriesScreen(), FavoriteScreen()]),
        ));*/ 