import 'package:flutter_bloc/flutter_bloc.dart';

class KeranjangCubit extends Cubit<int> {
  KeranjangCubit() : super(0); // Nilai awal 0[cite: 4]

  void tambahBarang() {
    emit(state + 1); // Menambah jumlah barang[cite: 4]
  }

  void kurangiBarang() {
    if (state > 0) {
      emit(state - 1); // Nilai minimal 0[cite: 4]
    }
  }
}