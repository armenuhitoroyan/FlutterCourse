part of 'purchases_bloc.dart';

class PurchasesState extends Equatable {
  List<PurchasesModel> purchases;
  bool isLoading;

  PurchasesState({
    this.purchases = const [],
    this.isLoading = false,
  });

  PurchasesState copyWith({
    List<PurchasesModel>? purchases,
    bool? isLoading,
  }) {
    return PurchasesState(
      purchases: purchases ?? this.purchases,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object> get props => [
    purchases,
    isLoading,
  ];
}
