import 'package:shop/base/routes.dart';
import 'package:shop/styles/login_styles.dart';
import 'package:shop/styles/style.dart';
import 'package:shop/widgets/reusable_card_widget.dart';
import 'package:flutter/material.dart';

import 'container_card_widget.dart';

class HomePageWidget extends StatelessWidget {
  const HomePageWidget({super.key});
  

  @override
  Widget build(BuildContext context) {
   return bodyHomePage(context);
  }

  Widget bodyHomePage(BuildContext context) {

    String _formPage = '';
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            
            const ContainerCardWidget(),
            

            Expanded( child: Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                    GestureDetector(
                    onTap: () {
                      // Navigator.popAndPushNamed(context, AppRoutes.home);
                      _formPage = 'Registration';
                    },
                    child: Row(
                      children: const [
                        Icon(Icons.app_registration),
                        Text('Registration', style: kBodyTextStyle,)
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigator.popAndPushNamed(context, AppRoutes.home);
                      _formPage = 'Login';
                    },
                    child: Row(
                      children: const [
                        Icon(Icons.login),
                        Text('Login', style: kBodyTextStyle,)
                      ],
                    ),
                  ),
                ],
              ),
            ),    
            ),
            SizedBox(
              height: 50.0,
              child: ElevatedButton(
                 onPressed: () {
                  if (ReusableCardWidget.isTap) {
                    if (ReusableCardWidget.page == 'products') {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.products
                      );
                    
                    } else if(ReusableCardWidget.page == 'users') {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.users
                      ); 

                    } 

                    if (Navigator.defaultRouteName == AppRoutes.home) {
                        ReusableCardWidget.isTap = false;
                    }
                       
                  } 
                  else if(_formPage == 'Login') {
                    Navigator.pushNamed(
                      context, 
                      AppRoutes.login
                    );
                  }
                  else if(_formPage == 'Registration') {
                    Navigator.pushNamed(
                      context, 
                      AppRoutes.registration
                    );
                  }
                  else {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.home
                    );
                    Navigator.pop(context);
                  }
                  },
                style: ElevatedButton.styleFrom(
                  backgroundColor: LoginStyles.cLogin,
                  fixedSize: const Size(400, 100),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
                child: const Text('Click'),
              ),
            )
          ],
        ),
    ); 
  } 
}