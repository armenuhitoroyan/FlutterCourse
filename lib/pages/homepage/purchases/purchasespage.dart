import 'package:exam_at/models/purchases.dart';
import 'package:exam_at/pages/homepage/purchases/bloc/purchases_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PurchasesPage extends StatelessWidget {
  List<PurchasesModel> purchasesList = [];

  @override
  Widget build(BuildContext context) {
    return _buildContent(context);
  }

  Widget _buildContent(BuildContext context) {
    return BlocProvider(
      create: (context) => PurchasesBloc()..add(LoadPurchasesEvent(purchasesList)),
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Purchases',
              style: TextStyle(color: Color.fromRGBO(0, 153, 0, 0.8)),
            ),
          ),
          iconTheme: const IconThemeData(color: Color.fromRGBO(0, 153, 0, 0.8)),
        ),
        body: BlocBuilder<PurchasesBloc, PurchasesState>(
          builder: (context, state) {
            List<PurchasesModel> purchasesModel = state.purchases;
            if (state.isLoading == true) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: const Color.fromRGBO(0, 153, 0, 0.8),
                    width: 5,
                  ),
                ),
                child: ListView.builder(
                  itemCount: purchasesModel.length,
                  itemBuilder: (context, index) => Container(
                    // ignore: prefer_const_constructors
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 5, bottom: 5),
                      child: Stack(children: <Widget>[
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            side: const BorderSide(
                              color: Color.fromARGB(255, 189, 187, 187),
                              //<-- SEE HERE
                            ),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(7),
                                child: SizedBox(
                                  width: purchasesModel[index].showBadge == true
                                      ? 110
                                      : 120,
                                  height:
                                      purchasesModel[index].showBadge == true
                                          ? 110
                                          : 120,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    color: const Color.fromRGBO(0, 153, 0, 0.8),
                                    child: Padding(
                                      padding: const EdgeInsets.all(7),
                                      child: Card(
                                        color: const Color.fromRGBO(
                                            0, 153, 0, 0.8),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          side: const BorderSide(
                                            color: Colors.white, //<-- SEE HERE
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(7),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                '${purchasesModel[index].playsCount}',
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18),
                                              ),
                                              const Text(
                                                'Plays',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 13),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    '${purchasesModel[index].title}',
                                    style: const TextStyle(
                                        color: Color.fromRGBO(0, 153, 0, 0.8),
                                        fontSize: 20),
                                  ),
                                  Text(
                                    purchasesModel[index].showBadge == true
                                        ? '${purchasesModel[index].subTitle}'
                                        : '${purchasesModel[index].price}\$',
                                    style: const TextStyle(
                                        color: Colors.grey, fontSize: 18),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(right: 7),
                                child: Container(
                                  child: Text(
                                    purchasesModel[index].showBadge == true
                                        ? '${purchasesModel[index].price}\$'
                                        : '',
                                    style: const TextStyle(
                                      color: Color.fromRGBO(0, 153, 0, 0.8),
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        // ignore: unrelated_type_equality_checks
                        Align(
                            alignment: Alignment.topLeft,
                            child: purchasesModel[index].showBadge == true
                                ? Image.asset('assets/group4428.png')
                                : Container())
                      ]),
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
