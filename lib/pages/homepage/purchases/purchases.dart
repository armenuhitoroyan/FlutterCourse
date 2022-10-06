

import 'package:exam_at/pages/homepage/purchases/purchases_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Purchases extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildContent();
  }

  Widget _buildContent() {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => PurchasesProvider(),
        child: Consumer<PurchasesProvider>(
          builder: (context, value, child) => value.isLoading
              ? const Center(
                  child: CircularProgressIndicator.adaptive(),
                )
              : ListView.builder(
                  itemCount: value.purchases?.length,
                  itemBuilder: (context, index) => Container(
                    // ignore: prefer_const_constructors
                    child: Text(
                      '${value.purchases![0].runtimeType}',
                      // ignore: prefer_const_constructors
                      style: TextStyle(color: const Color.fromRGBO(139,2,2, 0.8),),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
