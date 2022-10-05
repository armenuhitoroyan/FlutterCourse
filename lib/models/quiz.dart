class QuizModel {
  List<Questions>? questions;

  QuizModel({this.questions});

  QuizModel.fromJson(Map<String, dynamic> json) {
    if (json['questions'] != null) {
      questions = <Questions>[];
      json['questions'].forEach((v) {
        questions!.add(new Questions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.questions != null) {
      data['questions'] = this.questions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Questions {
  String? questionId;
  String? questionText;
  int? questionSeconds;
  String? questionImageUrl;
  List<Answers>? answers;

  Questions(
      {this.questionId,
      this.questionText,
      this.questionSeconds,
      this.questionImageUrl,
      this.answers});

  Questions.fromJson(Map<String, dynamic> json) {
    questionId = json['question_id'];
    questionText = json['question_text'];
    questionSeconds = json['question_seconds'];
    questionImageUrl = json['question_image_url'];
    if (json['answers'] != null) {
      answers = <Answers>[];
      json['answers'].forEach((v) {
        answers!.add(new Answers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['question_id'] = this.questionId;
    data['question_text'] = this.questionText;
    data['question_seconds'] = this.questionSeconds;
    data['question_image_url'] = this.questionImageUrl;
    if (this.answers != null) {
      data['answers'] = this.answers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Answers {
  String? answerText;
  String? answerId;
  bool? correctAnswer;

  Answers({this.answerText, this.answerId, this.correctAnswer});

  Answers.fromJson(Map<String, dynamic> json) {
    answerText = json['answer_text'];
    answerId = json['answer_id'];
    correctAnswer = json['correct_answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['answer_text'] = this.answerText;
    data['answer_id'] = this.answerId;
    data['correct_answer'] = this.correctAnswer;
    return data;
  }
}
