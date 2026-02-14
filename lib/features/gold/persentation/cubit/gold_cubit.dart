import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:goldy/features/gold/data/models/gold_models.dart';
import 'package:goldy/features/gold/data/repo/gold_repo.dart';
import 'package:goldy/features/gold/persentation/cubit/gold_states.dart';

class GoldCubit  extends Cubit<GoldStates>{
  final GoldRepo goldRepo;

  GoldCubit( this.goldRepo) : super(GoldInitiailState());
 Future<void>getGold()async{
  emit(GoldLadingState());
  final res =await goldRepo.getGold();
  res.fold(
  (error){
    emit(GoldErrorState(errMsg: error));

  },
  (goldModel){
emit(GoldSuccessState(goldModels: goldModel));
  }

  );
 }
}