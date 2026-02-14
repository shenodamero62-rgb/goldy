import 'package:bloc/bloc.dart';
import 'package:goldy/features/sliver/data/repo/sliver_repo.dart';
import 'package:goldy/features/sliver/persentation/cubit/sliver_states.dart';

class SliverCubit  extends Cubit<SliverStates>{
  final SliverRepo sliverRepo;

  SliverCubit( this.sliverRepo) : super(SliverInitiailState());
 Future<void>getSliver()async{
  emit(SliverLadingState());
  final res =await sliverRepo.getSliver();
  res.fold(
  (error){
    emit(SliverErrorState(errMsg: error));

  },
  (sliverModel){
emit(SliverSuccessState(sliverModels: sliverModel));
  }

  );
 }
}