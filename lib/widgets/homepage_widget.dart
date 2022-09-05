import 'package:shop/base/routes.dart';
import 'package:shop/styles/login_styles.dart';
import 'package:shop/styles/style.dart';
import 'package:shop/widgets/reusable_card_widget.dart';
import 'package:flutter/material.dart';

import 'container_card_widget.dart';

class HomeBodyW extends StatelessWidget {
  const HomeBodyW({super.key});

  @override
  Widget build(BuildContext context) {
   return bodyHomePage(context);
  }

  Widget bodyHomePage(BuildContext context) {
    bool isC = false;
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
                 /*  Expanded(  
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: GestureDetector(  
                        // onTap: () {
                        //   Navigator.pushNamed(
                        //     context,
                        //     AppRoutes.registration,
                              
                        //   );
                        //     print('Ooooooooooooppppppppsssssssssss!');
                        // },
   
                        child: ReusableCardWidget(
                          iconData: Icons.app_registration, text: 'Registration/Login',
                        )
                      ),
                    ),
                  ), */

     GestureDetector(
        onTap: (){
          print("Container clicked");
          isC = true;
            
        },
        child: Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
            color: kActivateCardColor,
            borderRadius: BorderRadius.all(Radius.circular(15))
          ),
          height: 150,
          child: Column(
            children: const [
              Icon(Icons.app_registration),
              Text('Registrtion/Login', style: kBodyTextStyle,)
            ],
          ),
        ),
    )
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
                      return; 
                    } else if(ReusableCardWidget.page == 'users') {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.users
                      ); 
                      return; 
                    }  
                                
                  } 
                  else if(isC == true) {
                    print(isC);
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