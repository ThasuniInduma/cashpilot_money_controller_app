import 'package:cashpilot_money_controller/models/onboarding_model.dart';

class OnboardingData {
  static final List <OnboardingModel> onboardingData = [
    OnboardingModel(
      title: 'Welcome to CashPilot', 
      imagePath: 'assets/img2.png', 
      description: 'Your smart companion for tracking income, expenses, and savings all in one place.'
    ),
    OnboardingModel(
      title: 'Track Every Expense', 
      imagePath: 'assets/img1.png', 
      description: 'Easily record your daily income and expenses, categorize transactions, and stay in control of your spending.'
    ),
    OnboardingModel(
      title: 'Manage Money Better', 
      imagePath: 'assets/img3.png', 
      description: 'Visualize your spending, plan budgets, and build healthier financial habits with clear insights.'
    )
  ];
}
