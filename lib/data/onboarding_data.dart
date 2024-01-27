import '../models/onboarding_info.dart';
class OnboardingData{

  List<OnboardingInfo> items = [
    OnboardingInfo(
        title: "Welcome to QuizWiz",
        description: " Dive into the world of knowledge, fun, and challenges with our diverse range of quizzes.",
        image: "assets/images/onboarding1.gif"),

    OnboardingInfo(
        title: "Select Your difficulty",
        description: "Ready for the challenge? QuizWiz offers quizzes in three exciting difficulty levels",
        image: "assets/images/onboarding2.gif"),

    OnboardingInfo(
        title: "Follow Your Interest",
        description: "Tell us what topics spark your curiosity! Choose your favorite categories from a wide array of options - science, history, sports, entertainment, and more.",
        image: "assets/images/onboarding3.gif"),

  ];
}