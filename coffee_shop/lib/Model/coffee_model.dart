class CoffeeData {
  final List<Banner> banner;
  final List<Category> categories;
  final List<Popular> popular;
  final List<Item> items;

  CoffeeData({
    required this.banner,
    required this.categories,
    required this.popular,
    required this.items,
  });

  factory CoffeeData.fromJson(Map<String, dynamic> json) {
    return CoffeeData(
      banner: (json['Banner'] as List)
          .map((item) => Banner.fromJson(item))
          .toList(),
      categories: (json['Category'] as List)
          .map((item) => Category.fromJson(item))
          .toList(),
      popular: (json['Popular'] as List)
          .map((item) => Popular.fromJson(item))
          .toList(),
      items: (json['Items'] as List)
          .map((item) => Item.fromJson(item))
          .toList(),
    );
  }
}
class Banner {
  final String url;
  Banner({required this.url});
  factory Banner.fromJson(Map<String, dynamic> json) {
    return Banner(url: json['url']);
  }
}
class Category {
  final int id;
  final String title;

  Category({required this.id, required this.title});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      title: json['title'],
    );
  }
}
class Popular {
  final String description;
  final String extra;
  final List<String> picUrl;
  final double price;
  final double rating;
  final String title;

  Popular({
    required this.description,
    required this.extra,
    required this.picUrl,
    required this.price,
    required this.rating,
    required this.title,
  });

  factory Popular.fromJson(Map<String, dynamic> json) {
    return Popular(
      description: json['description'],
      extra: json['extra'],
      picUrl: List<String>.from(json['picUrl']),
      price: json['price'].toDouble(),
      rating: json['rating'].toDouble(),
      title: json['title'],
    );
  }
}

class Item {
  final String categoryId;
  final String description;
  final String extra;
  final List<String> picUrl;
  final double price;
  final double rating;
  final String title;

  Item({
    required this.categoryId,
    required this.description,
    required this.extra,
    required this.picUrl,
    required this.price,
    required this.rating,
    required this.title,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      categoryId: json['categoryId'].toString(),
      description: json['description'],
      extra: json['extra'],
      picUrl: List<String>.from(json['picUrl']),
      price: json['price'].toDouble(),
      rating: json['rating'].toDouble(),
      title: json['title'],
    );
  }
}
