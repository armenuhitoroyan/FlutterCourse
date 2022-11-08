part of 'purchases_bloc.dart';

abstract class PurchasesEvent extends Equatable {
  const PurchasesEvent();

  @override
  List<Object> get props => [];
}

class LoadPurchasesEvent extends PurchasesEvent {
  List<PurchasesModel>? purchases;
  // bool isLoading;

  LoadPurchasesEvent(
    this.purchases,
    // this.isLoading,
  );
}

class onChangeColor extends PurchasesEvent {
  List<Color>? colors;

  onChangeColor(
    this.colors,
  );
}
