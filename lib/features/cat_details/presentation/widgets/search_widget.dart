import 'package:e_commerce/features/product_details/data/data_sources/pro_dto.dart';
import 'package:e_commerce/features/product_details/presentation/manager/cubit.dart';
import 'package:e_commerce/features/product_details/presentation/manager/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class SearchWidget extends StatelessWidget {
  String query;

  SearchWidget({required this.query, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProdCubit, ProDetStates>(
      bloc: ProdCubit(RemotePro()),
      builder: (context, state) => const Column(
        children: [

        ],
      ),
    );
  }
}
