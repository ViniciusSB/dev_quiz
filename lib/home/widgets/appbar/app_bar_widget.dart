import 'package:dev_quiz/core/app_gradients.dart';
import 'package:dev_quiz/core/app_text_styles.dart';
import 'package:dev_quiz/home/widgets/score_card/score_card_widget.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends PreferredSize {
  AppBarWidget() : super(
    preferredSize: Size.fromHeight(250),
    child: Container(
      height: 250,
      child: Stack(
        children: [
          Container(
            height: 161,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: double.maxFinite,
            decoration: BoxDecoration(gradient: AppGradients.linear),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich( //Componente que permite criar varios textos
                  TextSpan(
                    text: "Olá, ", style: AppTextStyles.title, 
                    children: [
                      TextSpan(
                        text: "Vinícius",
                        style: AppTextStyles.titleBold
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 58,
                  height: 58,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(image: NetworkImage("https://2.bp.blogspot.com/-_IbhxGFfO2U/V_6T36fWJuI/AAAAAAAAtu4/qa9cOFTje8I8jXl1b19Rgq8CUTj3jXceACLcB/s1600/2222222222.jpg"))
                  )
                )
              ],
            ),
          ),
          Align( 
            alignment: Alignment(0.0, 1.0), //Aplica um alinhamento no ScoreCardWidget
            child: ScoreCardWidget()
            )
        ],
      ),
    )
  );
  
}