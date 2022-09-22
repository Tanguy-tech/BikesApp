// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:motobox/providers/bike_data.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/http_exception.dart';
import 'package:http/http.dart' as http;

// import '../models/models.dart';

class BikeDatas with ChangeNotifier {
  BikeData myBikeData = BikeData(
      id: '00',
      // bikeModel: Model(
      //   id: 'm7',
      //   brand: 'Triumph',
      //   brandLogo: Image.asset('assets/brand_logos/Triumph.png'),
      //   name: 'Scrambler 900',
      //   hp: '59',
      //   manufacturedDate: '2015',
      //   photo: Image.asset('assets/bike_models/scrambler 900.png'),
      //   infos:
      //       "Il y eu une petite mise à jour pour le Scrambler en l'an de grâce 2014. Avec des effluves de noir sur les jantes, les moyeux, le guidon et le bouchon du réservoir du maitre-cylindre arrière, la moto apprécie la philosophie du 'Back to Black'. Avec une selle revue, l'assise se veut plus détendue et le style adoubé par un logo Triumph en relief. Le moteur gagne un sabot en acier brossé anodisé et ses aillettes recoivent un coup de meuleuse pour faire respirer visuellement le métal. Si je vous dis 'Triumph' et que vous me répondez : 'Ah oui, la jeune marque anglaise qui a fait la Speed Triple et la Daytona 675 .'' ; laissez tomber... En revanche, si ce nom vous transporte dans le passé, à la terrasse des cafés brittons du milieu du siècle, dans les grands moments du Tourist Trophy, aux souvenirs de motos qui pissaient l'huile, en rade tous les 50 km et dont on tombait éperdument amoureux... Vous êtes prêt à accueillir dans votre coeur la nouvelle 900 Scrambler.",
      // ),
      costs: 860.1,
      totalKmRidden: 28685,
      riddenSincePurchased: 1141,
      riddenWithLastRefill: 164);

  // BikeData get myBikeData {
  //   return _myBikeData;
  // }

  // to prevent errors and for fetching purposes
  BikeData defaultDatas = BikeData(
      id: 'NA',
      costs: 0,
      riddenSincePurchased: 0,
      riddenWithLastRefill: 0,
      totalKmRidden: 0);

  Future<void> fetchAndSetBikeDatas() async {
    final url = Uri.parse(
        'https://motobox-eedda-default-rtdb.europe-west1.firebasedatabase.app/bike_datas.json');
    try {
      final response = await http.get(url);
      print(response.body);
      // final exctractedData = json.decode(response.body) as Map<String, dynamic>;
      // if (exctractedData == null || exctractedData.isEmpty) {
      //   _myBikeData = defaultDatas;
      // }
      // _myBikeData = exctractedData as BikeData;
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  // Future<void> updatdeBikeDatas(String id, BikeData newBD) async {
  //   final url = Uri.parse(
  //       'https://motobox-eedda-default-rtdb.europe-west1.firebasedatabase.app/bike_datas/$id.json');
  //   try {
  //     await http.patch(url,
  //         body: json.encode({
  //           'costs': newBD.costs,
  //           'totalKmRidden': newBD.totalKmRidden,
  //           'riddenSincePurchased': newBD.riddenSincePurchased,
  //           'riddenWithLastRefill': newBD.riddenWithLastRefill
  //         }));
  //     _myBikeData = newBD;
  //     notifyListeners();
  //   } catch (error) {
  //     rethrow;
  //   }
  // }

  // void updateBikeData(BikeData bd) {
  //   final updatedBikeData = BikeData(
  //       id: bd.id,
  //       bikeModel: bd.bikeModel,
  //       costs: bd.costs,
  //       totalKmRidden: bd.totalKmRidden,
  //       riddenSincePurchased: bd.riddenSincePurchased,
  //       riddenWithLastRefill: bd.riddenWithLastRefill);
  //   myBikeData = updatedBikeData;
  //   notifyListeners();
  // }
}
