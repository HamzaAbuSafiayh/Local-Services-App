import 'package:finalproject/auth/login_or_register.dart';
import 'package:finalproject/pages/category_workers.dart';
import 'package:finalproject/pages/chat_page.dart';
import 'package:finalproject/pages/completion_page.dart';
import 'package:finalproject/pages/confirmation_page.dart';
import 'package:finalproject/pages/homepage.dart';
import 'package:finalproject/pages/order_details_page.dart';
import 'package:finalproject/pages/orders_page.dart';
import 'package:finalproject/pages/payment_methods_page.dart';
import 'package:finalproject/pages/tasker_profile.dart';
import 'package:finalproject/pages/tasks_page.dart';
import 'package:finalproject/routes/app_routes.dart';
import 'package:finalproject/view_models/categories_cubit/categories_cubit.dart';
import 'package:finalproject/view_models/chat_cubit/chat_cubit.dart';
import 'package:finalproject/view_models/reviews_cubit/reviews_cubit.dart';
import 'package:finalproject/view_models/workers_cubit/workers_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.paymentMethods:
        return MaterialPageRoute(
          builder: (_) => const PaymentMethodsPage(),
          settings: settings,
        );
      case AppRoutes.ordersPage:
        return MaterialPageRoute(
          builder: (_) => const OrdersPage(),
          settings: settings,
        );
      case AppRoutes.orderDetails:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) {
              final cubit = ReviewsCubit();
              return cubit;
            },
            child: const OrderDetailsPage(),
          ),
          settings: settings,
        );
      case AppRoutes.tasks:
        return MaterialPageRoute(
          builder: (_) => const TasksPage(),
          settings: settings,
        );
      case AppRoutes.chat:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) {
              final cubit = ChatCubit();
              return cubit;
            },
            child: const ChatPage(),
          ),
          settings: settings,
        );
      case AppRoutes.completion:
        return MaterialPageRoute(
          builder: (_) => const OrderCompletionPage(),
          settings: settings,
        );
      case AppRoutes.confirmation:
        return MaterialPageRoute(
          builder: (_) => const ConfirmationPage(),
          settings: settings,
        );
      case AppRoutes.workerProfile:
        return MaterialPageRoute(
          builder: (_) => const WorkerProfile(),
          settings: settings,
        );
      case AppRoutes.homeLogin:
        return MaterialPageRoute(
          builder: (_) => const LoginOrRegister(),
          settings: settings,
        );
      case AppRoutes.homePage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) {
              final cubit = CategoriesCubit();
              cubit.getCategories();
              return cubit;
            },
            child: const HomePage(),
          ),
          settings: settings,
        );
      case AppRoutes.categoryWorkers:
        final category = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) {
              final cubit = WorkersCubit();
              cubit.getWorkersByCat(category);
              return cubit;
            },
            child: const CategoryWorkers(),
          ),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Error Page!'),
            ),
          ),
        );
    }
  }
}
