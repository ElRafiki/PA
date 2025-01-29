// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class BudgetPlanerPage extends StatefulWidget {
  const BudgetPlanerPage({super.key});

  @override
  _BudgetPlanerPageState createState() => _BudgetPlanerPageState();
}

class _BudgetPlanerPageState extends State<BudgetPlanerPage> {
  // Variablen für Transaktionen und Gesamtbilanz
  double _gesamtBilanz = 0.0;
  final List<Map<String, dynamic>> _transaktionen = [];
  final _betragController = TextEditingController();
  final _beschreibungController = TextEditingController();

  void _addTransaction(bool isEinnahme) {
    setState(() {
      double betrag = double.tryParse(_betragController.text) ?? 0.0;
      if (!isEinnahme) betrag *= -1;

      _transaktionen.add({
        'betrag': betrag,
        'beschreibung': _beschreibungController.text,
        'datum': DateTime.now(),
      });

      _gesamtBilanz += betrag;
      _betragController.clear();
      _beschreibungController.clear();
      Navigator.pop(context);
    });
  }

  void _showAddDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Neue Transaktion'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _betragController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Betrag (€)'),
            ),
            TextField(
              controller: _beschreibungController,
              decoration: InputDecoration(labelText: 'Beschreibung'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => _addTransaction(true),
            child: Text('Einnahme'),
          ),
          TextButton(
            onPressed: () => _addTransaction(false),
            child: Text('Ausgabe'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Budget Planer',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Bilanz: ${_gesamtBilanz.toStringAsFixed(2)}€',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: _gesamtBilanz >= 0 ? Colors.green : Colors.red,
                ),
              ),
            ],
          ),
        ),
        centerTitle: true,
        toolbarHeight: 80, // Increased height for better spacing
      ),
      body: ListView.builder(
        itemCount: _transaktionen.length,
        itemBuilder: (context, index) {
          final transaktion = _transaktionen[index];
          return ListTile(
            leading: Icon(
              transaktion['betrag'] >= 0
                  ? Icons.arrow_upward
                  : Icons.arrow_downward,
              color: transaktion['betrag'] >= 0 ? Colors.green : Colors.red,
            ),
            title: Text(transaktion['beschreibung']),
            trailing: Text(
              '${transaktion['betrag'].toStringAsFixed(2)}€',
              style: TextStyle(
                color: transaktion['betrag'] >= 0 ? Colors.green : Colors.red,
              ),
            ),
            subtitle: Text(
              '${transaktion['datum'].day}.${transaktion['datum'].month}.${transaktion['datum'].year}',
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddDialog,
        child: Icon(Icons.add),
      ),
    );
  }

  @override
  void dispose() {
    _betragController.dispose();
    _beschreibungController.dispose();
    super.dispose();
  }
}
