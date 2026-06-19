import 'package:get/get.dart';
import 'package:e_commerce_aap/modules/order/address_model.dart';
import 'package:e_commerce_aap/modules/order/order_model.dart';
import 'package:get_storage/get_storage.dart';

class OrderController extends GetxController {
  final box = GetStorage();

  var selecteAddress = AddressModel(
    type: "Home",
    fullAddress: "Mirwarode jam Laghari Mirpurkhas Near lack city,",
    icon: "images/home.png",
  ).obs;

  var addressList = <AddressModel>[
    AddressModel(
      type: "Home",
      fullAddress:
          "Mirwa Road, Jam Laghari, Mirpurkhas, Near Lake City, Mirpurkhas",
      icon: "images/home.png",
    ),
    AddressModel(
      type: "Office",
      fullAddress: "Gulshan-e-Iqbal Block 7, Karachi",
      icon: "images/homeadd.png",
    ),
    AddressModel(
      type: "Other",
      fullAddress: "North Nazimabad Block H, Karachi",
      icon: "images/hotel.png",
    ),
  ].obs;

  void updateAddress(String type) {
    selecteAddress.value = addressList.firstWhere(
      (address) => address.type == type,
    );
  }

  void updateAddressFromMap({
    required double lat,
    required double lng,
    required String addressText,
  }) {
    selecteAddress.value = AddressModel(
      type: "Home",
      fullAddress: addressText,
      icon: "images/home.png",
      latitude: lat,
      longitude: lng,
    );
    box.write("user_address", {
      "fullAddress": addressText,
      "lat": lat,
      "lng": lng,
    });
  }

  var selectedPaymentMethod = {
    "name": "MasterCard",
    "icon": "icon/mc.png",
    "number": "**** 7878",
  }.obs;
  var paymentMethods = [
    {"name": "MasterCard", "icon": "icon/mc.png", "number": "**** 7878"},
    {"name": "Apple", "icon": "images/apple.png", "number": "**** 5522"},
    {"name": "PayPal", "icon": "icon/paypal.png", "number": "user@gmail.com"},
    {"name": "Cash on Delivery", "icon": "images/card.png", "number": ""},
  ].obs;
  @override
  void onInit() {
    final saved = box.read("paymentMethods");
    if (saved != null && saved is Map) {
      selectedPaymentMethod.value = Map<String, String>.from(saved);
    }
    final savedAddress = box.read("user_address");
    if (savedAddress != null) {
      selecteAddress.value = AddressModel(
        type: "Home",
        fullAddress: savedAddress["fullAddress"],
        icon: "images/home.png",
        latitude: savedAddress["lat"],
        longitude: savedAddress["lng"],
      );
    }
    super.onInit();
  }

  void updatePaymentMethod(Map<String, String> newMethod) {
    selectedPaymentMethod.value = newMethod;
    box.write("paymentMethods", newMethod);
  }

  var orderItems = <OrderItemModel>[
    OrderItemModel(
      title: 'iPad Pro 2020 11", Wifi, 128GB',
      image: 'images/product 6.png',
      price: 910,
      qty: 1,
    ),
    OrderItemModel(
      title: 'iPad Pro 2020 11", Wifi, 128GB',
      image: "images/product 6.png",
      price: 590,
      qty: 1,
    ),
  ].obs;
  double shippingFee = 10.0;

  double get totalePrice {
    double total = 0.0;
    for (var item in orderItems) {
      total += item.price * item.qty;
    }
    return total;
  }

  void setOrderItems(List<Map<String, dynamic>> items) {
    orderItems.clear();
    for (var i in items) {
      orderItems.add(
        OrderItemModel(
          title: i["name"],
          image: i["image"],
          price: double.parse(i["price"].toString()),
          qty: i["qty"],
        ),
      );
    }
  }
}
