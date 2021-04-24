import 'package:dev_quiz/core/app_colors.dart';
import 'package:dev_quiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class ChartWidget extends StatelessWidget {
  
  const ChartWidget({Key? key}): super(key: key); 
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        width: 80,
        height: 80,
        child: Stack( //Componente que permite empilhar componentes  
          children: [
            Center(
              child: Container(
                width: 80,
                height: 80,
                child: CircularProgressIndicator( 
                  strokeWidth: 10, //Define a largura do circulo
                  value: .75, 
                  backgroundColor: AppColors.chartSecondary, //Cor de fundo do circulo
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.chartPrimary), //Cor do progresso
                ),
              ),
            ),
            Center(
              child: Text("75%", style: AppTextStyles.heading,)
            )
          ],
        ),

      ),
    );
  }
}