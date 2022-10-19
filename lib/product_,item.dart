import 'package:flutter/material.dart';

class ProductItem with ChangeNotifier {
  int _cartCount;

  ProductItem(this._cartCount);
  String price() => "${getPrice().toString()} ₺";

  int get cardCounts => _cartCount;
  List? basket = [];

  List? products = [
    {
      "image": "https://cdn.cimri.io/image/1200x1200/arelikamarmakinelerifiyatlar_414930035.jpg",
      "title": "Çamaşır Makinesi",
      "description": "açıklama yazısı",
      "price": 117
    },
    {
      "image":
          "https://statics.vestel.com.tr/productimages/20263196_r1_1000_1000.jpg",
      "title": "Bulaşık  Makinesi",
      "description": "açıklama yazısı",
      "price": 117
    },
    {
      "image":
          "https://www.arnica.com.tr/arnica-tesla-premium-rose-toz-torbasiz-elektrik-supurgesi-2684-18-B.jpg",
      "title": "Elektrikli süpürge",
      "description": "açıklama yazısı",
      "price": 117
    },
    {
      "image":
          "https://productimages.hepsiburada.net/s/24/375/10094611071026.jpg",
      "title": "Mikser Takımı",
      "description": "açıklama yazısı",
      "price": 117
    },
  ];

  set cardCount(int value) {
    _cartCount = value;
  }

  void increase() {
    _cartCount++;
    notifyListeners();
  }

  void decrease() {
    _cartCount--;
    notifyListeners();
  }

  void addBasket(Object value) {
    basket!.add(value);

    notifyListeners();
  }

  void removeBasket(int index) {
    basket!.removeAt(index);
    notifyListeners();
  }
   int getPrice() {
    int price = 0;
    for (var i = 0; i < basket!.length; i++) {
      price += int.parse(basket![i]["price"].toString());
    }
    return price;
  }
}
