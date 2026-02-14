import 'package:goldy/features/gold/data/models/gold_models.dart';

abstract class GoldStates {}

class GoldInitiailState extends GoldStates{}


class GoldErrorState extends GoldStates{
  final String errMsg;
  GoldErrorState({required this.errMsg});


}

class GoldSuccessState extends GoldStates{
  final GoldModels goldModels ;
  GoldSuccessState({required this.goldModels});

}
class GoldLadingState extends GoldStates{}