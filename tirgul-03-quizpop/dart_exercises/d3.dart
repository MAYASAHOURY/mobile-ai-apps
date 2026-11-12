// D3 · מצאו ותקנו 3 באגים
class Product {
  final String name;
  final double price;

  Product({required this.name, required this.price});
}

void main() {
  // באג 1 (line 9): price הוא required ולא הועבר → מוסיפים price: 12.5
  final p = Product(name: 'קפה', price: 12.5);
  // באג 2 (line 10): String לא יכול להיות null → String? (העיר עדיין לא ידועה)
  String? city;
  // באג 3 (הקומפיילר לא רואה): $p.name מדפיס את האובייקט ואחריו ".name"
  // → צריך ${p.name}. ובשביל ה-null מוסיפים ?? 'לא ידוע'
  print('מוצר: ${p.name}, עיר: ${city ?? 'לא ידוע'}');
}

/* הפלט אחרי כל התיקונים:
מוצר: קפה, עיר: לא ידוע
*/
