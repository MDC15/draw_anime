class IntroModel {
  final bool shouldNavigateToHome;
  final double animationProgress;

  const IntroModel({
    this.shouldNavigateToHome = false,
    this.animationProgress = 0.0,
  });

  IntroModel copyWith({
    bool? shouldNavigateToHome,
    double? animationProgress,
  }) {
    return IntroModel(
      shouldNavigateToHome: shouldNavigateToHome ?? this.shouldNavigateToHome,
      animationProgress: animationProgress ?? this.animationProgress,
    );
  }
}
