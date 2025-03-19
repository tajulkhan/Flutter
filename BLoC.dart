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

// Define States
abstract class BillingState {}

class BillingInitial extends BillingState {}

class BillingUpdated extends BillingState {
  final List<Map<String, dynamic>> items;
  final double total;
  
  BillingUpdated({required this.items, required this.total});
}
