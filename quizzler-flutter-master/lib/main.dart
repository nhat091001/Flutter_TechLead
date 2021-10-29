import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();
void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getCorrectAnswer();

    setState(() {
      // VIỆC CẦN LÀM: Bước 4 - Sử dụng IF / ELSE để kiểm tra xem chúng ta đã đến cuối bài kiểm tra chưa.
      // Nếu vậy, // Trên dòng tiếp theo, bạn cũng có thể sử dụng if (quizBrain.isFinishing ()) {}, nó thực hiện tương tự.

      if (quizBrain.isFinishing() == true) {
        // VIỆC CẦN LÀM Bước 4 Phần A - hiển thị cảnh báo bằng rFlutter_alert,
        // // Đây là mã cho cảnh báo cơ bản từ tài liệu cho rFlutter Alert:
        //// Cảnh báo (context: context, title: "RFLUTTER", desc: "Flutter is awesome."). Show ();
        ///// Được sửa đổi cho mục đích của chúng tôi:
        Alert(
          context: context,
          title: 'Hoàn thành',
          desc: 'Đã đến giới hạn',
        ).show();

        // VIỆC CẦN LÀM Bước 4 Phần C - đặt lại câu hỏi Số,
        quizBrain.reset();

        // VIỆC CẦN LÀM Bước 4 Phần C - đặt lại câu hỏi Số,
        scoreKeeper = [];
      }
      // VIỆC CẦN LÀM: Bước 6 - Nếu chúng ta chưa đến cuối, ELSE thực hiện các bước kiểm tra câu trả lời bên dưới 👇
      else {
        if (userPickedAnswer == correctAnswer) {
          scoreKeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          scoreKeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        quizBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //The user picked true.
                checkAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked true.
                checkAnswer(false);
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
