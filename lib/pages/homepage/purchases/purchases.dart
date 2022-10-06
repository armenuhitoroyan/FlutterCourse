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
              : Scaffold(
                  appBar: AppBar(
                    title: const Center(
                      child: Text(
                        'Purchases',
                        style: TextStyle(
                          color: Color.fromRGBO(0,153,0, 0.8)
                        ),
                      ),
                    ),
                    iconTheme: const IconThemeData(
                    color: Color.fromRGBO(0,153,0, 0.8)
                  ), 
                  ),
                  body: ListView.builder(
                    itemCount: value.purchases?.length,
                    itemBuilder: (context, index) => Container(
                      // ignore: prefer_const_constructors
                      child: Text(
                        '${value.purchases?.first.price}',
                        // ignore: prefer_const_constructors
                        style: TextStyle(
                          color: const Color.fromRGBO(139, 2, 2, 0.8),
                        ),
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
