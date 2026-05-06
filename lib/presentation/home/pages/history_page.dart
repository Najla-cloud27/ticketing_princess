import 'package:flutter/material.dart';
import 'package:ticketing_princes/core/constants/colors.dart';
import 'package:ticketing_princes/core/extensions/date_time_ext.dart';
import 'package:ticketing_princes/core/extensions/extensions.dart';
import 'package:ticketing_princes/presentation/home/model/history_model.dart';
import 'package:ticketing_princes/presentation/home/widget/history_card.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    // KEY DAN VALUE
    // KEY = MEI 2026
    // VALUE => LIST<HISTORYMODEL> YAITU KUMPULAN TRANSAKSI DI BULAN TERSEBUT
    // JADI GROUPED HISTORY DI PAKAI BUAT MENGELOMPOKKAN TRANSAKSI BERDASARKAN BULAN DAN TAHUN

    Map<String, List<HistoryModel>> groupedHistory = {};

    // FOR ITU LOOPINH
    // JADI KITA MAU BUAT PERULANGAN TERHADAP SEMUA DATA YANG ADA DI HISTORIES

    for (var data in histories) {
      // INI BUAT BIKIN BULAN DAN TAHUN DARI TANGGAL YANG MELAKUKAN TRANSAKASI PADA HARI ITU DAN TANGGAL ITU
      final monthYear =
          // PAKAI DATE DIUBAH FORMAT NYA JADI MEI 2026
          '${data.dateTime.toFormattedMonth()} ${data.dateTime.year}';

      // INI BUAT NGECEK APAKAH BULAN DAN TAHUB TERSEBUT BELUM ADA?, MAKA AKAN DIBUAT DAFTAR
      // KOSONG UNTUK MENYIMPAN TRANSAKSI DI BULAN TERSEBUT
      if (!groupedHistory.containsKey(monthYear)) {
        groupedHistory[monthYear] = [];
      }

      // INI BUAT MASUKIN DATA TRANSAKSI KE DALAM KELOMPOK BULAN YANG SESUAI
      groupedHistory[monthYear]!.add(data);
      // mei 2026 = [data1, data2, data3]
      // juni 2026 = [data2, data3, data4]
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Transaction History')),
      body: ListView(
        padding: EdgeInsets.all(16),
        // looping data yang udah di flooting
        // groupedhistory entries = itu buat ambil semua data key dan value dari map
        // contoh isinya = [mei 2026 : [data1, data2, data3
        //                = data2, data3, data4],]
        children: groupedHistory.entries.map((entry) {
          // untuk ambil key dari map => mei 2026
          final monthYear = entry.key;
          // buat ambil data value dari map => [data1, data2, data3],
          // Isinya list transaksi d bulan tersebut
          final data = entry.value;

          // jadi di bagian data.foled ini buat menghitung total harga transakasi yang aa di bulan tersebut
          // fold itu buat menghitung total harga transakasi data dalam bulan tersebut
          final total = data.fold(
            0,
            (previousValue, element) => previousValue + element.price,
            //  0 itu nilai awa
            // previousvalue itu nilai sementara
            // elemen itu nilai dari 1 data transaksi
            // element.price itu harga transaksi

            //transaksi data 1 = 50.0000
            // transakasi data 2 = 100.000
            // transakasi data  = 150.0000
            // total = 300.000
          );

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      monthYear,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      total.currencyFormatRp,
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Divider(
                  thickness: 3,
                  color: AppColors.primary,
                  endIndent: context.deviceWidth - 60,
                ),
                //  itu spread motor
                // artinya ini uat nambahin semua data transakasi di bulan tersebut
                // jadi kita gapeke itu hasilnya cuma dianggap 1 list dalam list,
                // bukan kumpulan widget history
                // data itu kan isinya list transaksi
                // map fungsinya buat mengubah list transakasi jadi widget hsitory card
                // pake to.list itu buat nambahin semua widget history card ke dalam list
                ...data.map((item) => HistoryCard(itemHistory: item)).toList(),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
