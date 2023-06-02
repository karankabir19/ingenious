import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ingenious_minds_lab_app/screens/search_screen.dart';

import '../controller/country_data_controller.dart';
import 'details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final data = Get.put(CountryDataController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data.getCountryData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Country Details'),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(
                () => SearchScreen(
                  data: data.countryData.toList(),
                ),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Obx(
        () {
          return data.loading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Scrollbar(
                  child: ListView.separated(
                    itemCount: data.countryData.length,
                    itemBuilder: (ctx, i) {
                      final country = data.countryData[i];
                      return GestureDetector(
                        onTap: () {
                          Get.to(
                            () => DetailsScreen(data: country),
                            transition: Transition.downToUp,
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(country.name),
                                    Text('${country.city}, ${country.state}')
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(country.icao),
                                  Text(country.country),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (ctx, i) => const SizedBox(height: 5),
                  ),
                );
        },
      ),
    );
  }
}
