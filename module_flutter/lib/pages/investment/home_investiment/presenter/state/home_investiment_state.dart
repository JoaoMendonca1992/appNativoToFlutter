abstract class HomeInvestimentState {}

class InitialHomeInvestimentState  implements HomeInvestimentState{
}

class LoadingHomeInvestimentsState implements HomeInvestimentState {
  const LoadingHomeInvestimentsState();
}

class ErrorHomeInvestimentsState implements HomeInvestimentState {
}

class SuccessHomeInvestimentsState implements HomeInvestimentState {
  const SuccessHomeInvestimentsState();
}



