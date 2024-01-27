import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wear_store_app/widgets/filter_item.dart';
import 'package:wear_store_app/widgets/main_app_bar.dart';
import 'package:wear_store_app/widgets/our_collections_container.dart';

class StoreScreen extends StatelessWidget {
  StoreScreen({super.key, this.keyBoardFocus = false});

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final bool keyBoardFocus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: MainAppBar(
        scaffoldKey: _scaffoldKey,
        title: 'Store',
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
        child: Column(
          children: [
            Stack(
              children: [
                Positioned(
                  top: 12,
                  left: 10,
                  child: SvgPicture.asset(
                    'assets/icons/search.svg',
                  ),
                ),
                TextField(
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                  canRequestFocus: keyBoardFocus,
                  cursorColor: Theme.of(context).colorScheme.onPrimaryContainer,
                  decoration: InputDecoration(
                    hintText: "Search your pair...",
                    hintStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: Theme.of(context).colorScheme.outline,
                    ),
                    focusColor:
                        Theme.of(context).colorScheme.onPrimaryContainer,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.outline,
                      ),
                    ),
                    contentPadding: const EdgeInsets.only(left: 40),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            const SizedBox(
              width: double.infinity,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    FilterItem(label: "All"),
                    SizedBox(
                      width: 10,
                    ),
                    FilterItem(label: "Nike"),
                    SizedBox(
                      width: 10,
                    ),
                    FilterItem(label: "Adidas"),
                    SizedBox(
                      width: 10,
                    ),
                    FilterItem(label: "Reebok"),
                    SizedBox(
                      width: 10,
                    ),
                    FilterItem(label: "Vans"),
                    SizedBox(
                      width: 10,
                    ),
                    FilterItem(label: "Other"),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Expanded(
              child: OurCollectionContainer(
                shrinkWrap: false,
              ),
            )
          ],
        ),
      ),
    );
  }
}
