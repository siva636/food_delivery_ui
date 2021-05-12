class Category {
  Category({required this.name, required this.imageUrl});
  late String name;
  late String imageUrl;

  static List<Category> items = [
    Category(name: 'Pizza', imageUrl: '/category_pizza.png'),
    Category(name: 'Seafood', imageUrl: '/category_seafood.png'),
    Category(name: 'Drinks', imageUrl: '/category_drinks.png'),
    Category(name: 'Chines', imageUrl: '/category_chinese.jpg'),
    Category(name: 'Indian', imageUrl: '/category_indian.jpg'),
    Category(name: 'Veg', imageUrl: '/category_veg.jpg'),
  ];
}

class Popular {
  late String name;
  late String imageUrl;
  late double price;
  late List<String> ingredients;
  late String size;
  late int weight;
  late String slogan;
  late String crustOrHot;

  Popular({
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.ingredients,
    required this.size,
    required this.weight,
    required this.slogan,
    required this.crustOrHot,
  });

  static List<Popular> items = [
    Popular(
        name: 'Primavera Pizza',
        imageUrl: '/pizza1.png',
        price: 5.99,
        ingredients: [],
        size: 'Medium 14"',
        weight: 540,
        slogan: 'Top of the week',
        crustOrHot: 'Thin Crust'),
    Popular(
        name: 'Primavera Pizza2',
        imageUrl: '/pizza2.png',
        price: 3.99,
        ingredients: [],
        size: 'Medium 14"',
        weight: 400,
        slogan: 'Top of the month',
        crustOrHot: 'Thick Crust'),
    Popular(
        name: 'Primavera Pizza3',
        imageUrl: '/pizza1.png',
        price: 3.00,
        ingredients: [],
        size: 'Medium 14"',
        weight: 350,
        slogan: 'Best price',
        crustOrHot: 'Thin Crust'),
    Popular(
        name: 'Primavera Pizza',
        imageUrl: '/pizza1.png',
        price: 5.99,
        ingredients: [],
        size: 'Medium 14"',
        weight: 540,
        slogan: 'Top of the week',
        crustOrHot: 'Thin Crust'),
    Popular(
        name: 'Primavera Pizza2',
        imageUrl: '/pizza2.png',
        price: 3.99,
        ingredients: [],
        size: 'Medium 14"',
        weight: 400,
        slogan: 'Top of the month',
        crustOrHot: 'Thick Crust'),
  ];
}
