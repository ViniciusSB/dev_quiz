import 'package:dev_quiz/challenge/challenge_page.dart';
import 'package:dev_quiz/core/app_colors.dart';
import 'package:dev_quiz/home/home_controller.dart';
import 'package:dev_quiz/home/home_state.dart';
import 'package:dev_quiz/home/widgets/appbar/app_bar_widget.dart';
import 'package:dev_quiz/home/widgets/level_button/level_button_widget.dart';
import 'package:dev_quiz/home/widgets/quiz_card/quiz_card_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    super.initState();
    controller.getUser();
    controller.getQuizzes();
    //Sempre que houver uma alteração, ela será captada pelo ValueNotifier e o setState atualizará a página
    controller.stateNotifier.addListener(() {
      setState((){});
    });
  }

  @override
  Widget build(BuildContext context) {
    
    if (controller.state == HomeState.sucess) {
      return Scaffold(
        appBar: AppBarWidget(
          user: controller.user!,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LevelButtonWidget(
                    label: "Fácil",
                  ),
                  LevelButtonWidget(
                    label: "Médio",
                  ),
                  LevelButtonWidget(
                    label: "Difícil",
                  ),
                  LevelButtonWidget(
                    label: "Perito",
                  ),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Expanded(
                //Componente que permite criar varios itens em uma mesma coluna, de modo rolavel e a gerencia de espaçamento entre eles
                child: GridView.count(
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  crossAxisCount: 2,
                  //Transforma a lista quizzes do controlador em uma lista do tipo QuizCardWidget
                  children: controller.quizzes!
                      .map(
                        (e) => QuizCardWidget(
                          title: e.title,
                          completed:
                              "${e.questionAnswered}/${e.questions.length}",
                          percent: e.questionAnswered / e.questions.length,
                          onTap: (){
                            //Navegacao entre paginas 
                            Navigator.push(
                              context, 
                              MaterialPageRoute(
                                builder: (context) => ChallengePage(questions: e.questions,)));
                          },
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
         ),
      );
    } else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
          ),
        ),
      );
    }
  }
}
