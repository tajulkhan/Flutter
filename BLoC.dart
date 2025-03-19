// Define Events
abstract class BillingEvent {}

class AddItem extends BillingEvent {
  final String item;
  final double price;
  AddItem({required this.item, required this.price});
}

class RemoveItem extends BillingEvent {
  final String item;
  RemoveItem({required this.item});
}

class ClearBill extends BillingEvent {}
