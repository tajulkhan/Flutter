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

//Create the BLoC Logic
import 'package:flutter_bloc/flutter_bloc.dart';

class BillingBloc extends Bloc<BillingEvent, BillingState> {
  List<Map<String, dynamic>> items = [];
  double total = 0.0;

  BillingBloc() : super(BillingInitial()) {
    on<AddItem>((event, emit) {
      items.add({"item": event.item, "price": event.price});
      total += event.price;
      emit(BillingUpdated(items: List.from(items), total: total));
    });

    on<RemoveItem>((event, emit) {
      items.removeWhere((element) => element["item"] == event.item);
      total = items.fold(0.0, (sum, item) => sum + item["price"]);
      emit(BillingUpdated(items: List.from(items), total: total));
    });

    on<ClearBill>((event, emit) {
      items.clear();
      total = 0.0;
      emit(BillingUpdated(items: [], total: 0.0));
    });
  }
}

//Use BLoC in UI

BlocBuilder<BillingBloc, BillingState>(
  builder: (context, state) {
    if (state is BillingUpdated) {
      return Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: state.items.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(state.items[index]["item"]),
                subtitle: Text("\$${state.items[index]["price"]}"),
              );
            },
          ),
          Text("Total: \$${state.total}", style: TextStyle(fontSize: 20)),
        ],
      );
    }
    return Text("No items added");
  },
);
