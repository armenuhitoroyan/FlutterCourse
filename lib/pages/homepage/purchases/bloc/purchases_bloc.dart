import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../api/project_api.dart';
import '../../../../models/purchases.dart';

part 'purchases_event.dart';
part 'purchases_state.dart';

class PurchasesBloc extends Bloc<PurchasesEvent, PurchasesState> {
  PurchasesBloc() : super(PurchasesState()) {
    on<LoadPurchasesEvent>((event, emit) async {
      emit(
        state.copyWith(
          purchases: event.purchases,
          isLoading: true,
        ),
      );

      final result = await ProjectAPI().purchasesApi.getPurchasesData();
      event.purchases = result;

      emit(
        state.copyWith(
          purchases: event.purchases,
          isLoading: false,
        ),
      );
    });
  }
}
