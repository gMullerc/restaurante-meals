class Settings {
  bool isVegan;
  bool isVegetarian;
  bool isLactoseFree;
  bool isGlutenFree;

  Settings(
      {this.isGlutenFree = false,
      this.isLactoseFree = false,
      this.isVegetarian = false,
      this.isVegan = false});
}
