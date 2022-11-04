part of 'purchases_bloc.dart';

abstract class PurchasesEvent extends Equatable {
  const PurchasesEvent();

  @override
  List<Object> get props => [];
}

class OnItemPurchases extends PurchasesEvent {
  List<PurchasesModel>? purchases;
  // bool isLoading;

  OnItemPurchases(
    this.purchases,
    // this.isLoading,
  );
}
