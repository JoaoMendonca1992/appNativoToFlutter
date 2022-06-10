abstract class QuestionsState {}

class InitialQuestionState  implements QuestionsState{

}

class NextQuestionState  implements QuestionsState{

}
class LoadingQuestionsState implements QuestionsState {
  const LoadingQuestionsState();
}

class ErrorQuestionsState implements QuestionsState {

}

class SuccessQuestionsState implements QuestionsState {
  const SuccessQuestionsState();
}

class ProfileBoldInvertimentState implements QuestionsState {
}

class ProfileConservativeInvertimentState implements QuestionsState {
}

class ProfileModerateInvertimentState implements QuestionsState {
}

