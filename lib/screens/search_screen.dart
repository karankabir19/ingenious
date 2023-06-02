// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ingenious_minds_lab_app/model/country_data_model.dart';

import 'details_screen.dart';

class SearchScreen extends StatefulWidget {
  final List<CountryData> data;
  const SearchScreen({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final searchController = TextEditingController();

  List<CountryData> searchResults = [];

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    searchController.dispose();
  }

  void searchCountry(String query) {
    setState(
      () {
        searchResults = widget.data
            .where((state) =>
                state.state.toLowerCase().contains(query.toLowerCase()))
            .toList();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search State',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: searchController,
              onChanged: (value) {
                searchCountry(value);
              },
              decoration: const InputDecoration(
                labelText: 'Search State',
                prefixIcon: Icon(
                  Icons.search,
                ),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: searchResults.isEmpty
                  ? const Center(
                      child: Text(
                        'No data found',
                      ),
                    )
                  : ListView.separated(
                      itemCount: searchResults.length,
                      itemBuilder: (context, index) {
                        final country = searchResults[index];
                        return GestureDetector(
                          onTap: () {
                            Get.to(
                              () => DetailsScreen(
                                data: searchResults[index],
                              ),
                            );
                          },
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
                        );
                      },
                      separatorBuilder: (ctx, i) => const SizedBox(
                        height: 10,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
