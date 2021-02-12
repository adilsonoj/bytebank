import 'package:bytebank/screen/conta/dashboard_transferency.dart';
import 'package:bytebank/screen/dashboard/card.dart';
import 'package:bytebank/screen/dashboard/contact_list.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("images/bytebank_logo.png"),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                DashboardCard(
                  'Contacts',
                  Icons.people,
                  onClick: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ContactList(),
                    ));
                  },
                ),
                DashboardCard(
                  'Transfer',
                  Icons.monetization_on,
                  onClick: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DashboardTransferencia(),
                    ));
                  },
                ),
                DashboardCard(
                  'Transfer',
                  Icons.monetization_on,
                  onClick: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DashboardTransferencia(),
                    ));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
