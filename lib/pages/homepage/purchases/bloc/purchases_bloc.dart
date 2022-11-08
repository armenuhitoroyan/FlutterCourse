import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../api/project_api.dart';
import '../../../../models/purchases.dart';
import '../../../../styles/style_of_container.dart';

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

    on<onChangeColor>((event, emit) async {
      emit(
        state.copyWith(
          colors: event.colors,
          isLoading: true,
        ),
      );

      ColorsContainer colorsContainer = ColorsContainer();
      event.colors = colorsContainer.colors;

      emit(
        state.copyWith(
          colors: event.colors,  
          isLoading: false,
        ),
      );
    });
  }
}
