part of 'purchases_bloc.dart';

class PurchasesState extends Equatable {
  List<PurchasesModel> purchases;
  final List<Color> colors;
  bool isLoading;
  // ColorsContainer colorsContainer = ColorsContainer();

  PurchasesState({
    this.purchases = const [],
    this.colors = const [], 
    this.isLoading = false,
  });

  PurchasesState copyWith({
    List<PurchasesModel>? purchases,
    List<Color>? colors,
    bool? isLoading,
  }) {
    return PurchasesState(
      purchases: purchases ?? this.purchases,
      colors: colors ?? this.colors,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object> get props => [
        purchases,
        colors,
        isLoading,
      ];
}
