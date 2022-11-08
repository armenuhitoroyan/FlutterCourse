import 'package:exam_at/pages/auth/login/loginpage.dart';
import 'package:exam_at/pages/auth/registration/bloc/registration_bloc.dart';
import 'package:exam_at/pages/auth/registration/registration.dart';
import 'package:exam_at/pages/homepage/homepage.dart';
import 'package:exam_at/pages/homepage/leaderboard/leaderboard_provider.dart';
import 'package:exam_at/pages/homepage/pages.dart';
import 'package:exam_at/pages/homepage/quiz/questions_provider.dart';
import 'package:exam_at/pages/homepage/quiz/questionspage.dart';

import 'package:exam_at/pages/homepage/quiz/quiz.dart';
import 'package:exam_at/pages/homepage/quiz/score.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../pages/auth/login/login.dart';
import '../pages/homepage/leaderboard/leader_board.dart';
import '../pages/homepage/leaderboard/leaderboard.dart';
import '../pages/homepage/purchases/purchases.dart';
import '../pages/homepage/purchases/purchases_provider.dart';
import '../pages/homepage/purchases/purchasespage.dart';
import '../pages/homepage/quiz/questions.dart';
import '../pages/homepage/quiz/quizpage.dart';

class AppRoutes {
  static const login = '/';
  static const homepage = '/homepage';
  static const leaderBoard = '/leaderboard';
  static const pages = '/pages';
  static const quiz = '/quiz';
  static const questions = '/questions';
  static const purchases = '/purchases';
  static const score = '/score';
  static const leaderboard = '/leaderboard';
  static const purchasesProduct = '/purchases';
  static const quizPage = '/quiz';
  static const questionsPage = '/questions';
  static const registration = '/registration';
  static const loginpage = '/login';

  static MaterialPageRoute onGenerateRoute(RouteSettings settings) {
    PageArguments? pageArguments;
    if (settings.arguments != null) {
      pageArguments = (settings.arguments as PageArguments);
    }

    var routes = <String, WidgetBuilder>{
      AppRoutes.login: (context) => LoginPage(),
      AppRoutes.pages: (context) => Pages(),
      AppRoutes.homepage: (context) => HomePage(),
      AppRoutes.leaderBoard: (context) => ChangeNotifierProvider(
            create: (context) => LeaderBoarderProvider(),
            child: LeaderBord(),
          ),

      AppRoutes.quiz: (context) => Quiz(),
      // AppRoutes.purchases: (context) => Purchases(),
      AppRoutes.purchases: (context) => ChangeNotifierProvider(
            create: (context) => PurchasesProvider(),
            child: Purchases(),
          ),
      AppRoutes.questions: (context) => ChangeNotifierProvider(
            create: (context) => QuestionsProvider(),
            child: QuestionsWidget(),
          ),
      AppRoutes.score: (context) => const Score(),

      AppRoutes.leaderboard: (context) => LeaderBordS(),
      AppRoutes.purchasesProduct: (context) => PurchasesPage(),
      AppRoutes.quizPage: (context) => QuizWidget(),
      AppRoutes.questionsPage: (context) => QuestionW(),
      AppRoutes.registration: (context) => BlocProvider(
            create: (context) => RegistrationBloc(),
            child: Registration(),
      ),
      AppRoutes.loginpage: (context) => LoginPageWidget(),
    };

    WidgetBuilder builder = routes[settings.name] ?? routes.values.first;
    return MaterialPageRoute(builder: (ctx) => builder(ctx));
  }
}

class PageArguments {
  final String? pageTitle;
  final Map<String, dynamic>? data;

  PageArguments({
    this.pageTitle,
    this.data,
  });
}
