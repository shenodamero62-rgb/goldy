import 'package:goldy/features/sliver/data/models/sliver_models.dart';

abstract class SliverStates {}

class SliverInitiailState extends SliverStates{}


class SliverErrorState extends SliverStates{
  final String errMsg;
  SliverErrorState({required this.errMsg});


}

class SliverSuccessState extends SliverStates{
  final SliverModels sliverModels ;
  SliverSuccessState({required this.sliverModels});

}
class SliverLadingState extends SliverStates{}