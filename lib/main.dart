import 'dart:io';

class Product {
  String name;
  int price;

  Product(this.name, this.price);
}

class ShoppingMall {
  List<Product> products = [];
  Map<String, int> cart = {}; // 상품 이름: 개수
  int totalPrice = 0;

  ShoppingMall() {
    products = [
      Product('셔츠', 45000),
      Product('원피스', 30000),
      Product('반팔티', 35000),
      Product('반바지', 38000),
      Product('양말', 5000),
    ];
  }

  void showProducts() {
    print('\n판매 중인 상품 목록');
    for (var product in products) {
      print('${product.name} / ${product.price}원');
    }
  }

  void addToCart() {
    stdout.write('상품 이름을 입력해 주세요! : ');
    String? name = stdin.readLineSync();

    stdout.write('상품 개수를 입력해 주세요! : ');
    String? quantityInput = stdin.readLineSync();

    if (name == null || quantityInput == null) {
      print('입력값이 올바르지 않아요 !');
      return;
    }

    int? quantity = int.tryParse(quantityInput);
    if (quantity == null || quantity <= 0) {
      print('0개보다 많은 개수의 상품만 담을 수 있어요 !');
      return;
    }

    var selected = products.firstWhere(
      (p) => p.name == name,
      orElse: () => Product('', 0),
    );

    if (selected.name == '') {
      print('입력값이 올바르지 않아요 !');
      return;
    }

    // 장바구니에 추가
    cart[name] = (cart[name] ?? 0) + quantity;
    totalPrice += selected.price * quantity;
    print('장바구니에 상품이 담겼어요 !');
  }

  void showTotal() {
    if (cart.isEmpty) {
      print('장바구니에 담긴 상품이 없습니다.');
      return;
    }

    List<String> itemDescriptions = [];

    cart.forEach((name, quantity) {
      itemDescriptions.add('$name ${quantity}개');
    });

    String itemsString = itemDescriptions.join(', ');

    print('장바구니에 $itemsString 담겨있네요. 총 ${totalPrice}원 입니다!');
  }

  void clearCart() {
    if (cart.isEmpty) {
      print('이미 장바구니가 비어있습니다.');
    } else {
      cart.clear();
      totalPrice = 0;
      print('장바구니를 초기화합니다.');
    }
  }

  void showCartItems() {
    if (cart.isEmpty) {
      print('장바구니에 담긴 상품이 없습니다.');
      return;
    }

    print('\n장바구니 목록:');
    cart.forEach((name, quantity) {
      var product = products.firstWhere((p) => p.name == name);
      print('$name x $quantity = ${product.price * quantity}원');
    });
    print('총합: ${totalPrice}원');
  }
}

void main() {
  ShoppingMall mall = ShoppingMall();
  bool running = true;
  bool exitPending = false;

  while (running) {
    print(
      '\n[1] 상품 목록 보기 / [2] 장바구니에 담기 / [3] 장바구니에 담긴 상품의 총 가격 보기 / [4] 프로그램 종료',
    );
    print('[5] 종료 확인 / [6] 장바구니 초기화 / [7] 장바구니 목록 보기');
    stdout.write('원하는 기능을 선택하세요: ');
    String? input = stdin.readLineSync();

    if (exitPending) {
      if (input == '5') {
        print('이용해 주셔서 감사합니다 ~ 안녕히 가세요 !');
        running = false;
      } else {
        print('종료하지 않습니다. 계속 진행합니다.');
        exitPending = false; // 종료 상태 해제
      }
      continue;
    }

    switch (input) {
      case '1':
        mall.showProducts();
        break;
      case '2':
        mall.addToCart();
        break;
      case '3':
        mall.showTotal();
        break;
      case '4':
        print('정말 종료하시겠습니까? [5]를 입력하면 종료됩니다.');
        exitPending = true;
        break;
      case '5':
        print('이용해 주셔서 감사합니다 ~ 안녕히 가세요 !');
        running = false;
        break;
      case '6':
        mall.clearCart();
        break;
      case '7':
        mall.showCartItems();
        break;
      default:
        print('지원하지 않는 기능입니다 ! 다시 시도해 주세요 ..');
    }
  }
}
