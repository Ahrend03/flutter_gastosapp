import 'package:flutter/material.dart';
import 'package:flutter_gastosapp/models/gasto_model.dart';

class ItemGastoWidget extends StatelessWidget {
  GastoModel gasto;

  ItemGastoWidget({required this.gasto});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        leading: Image.asset(
          "assets/images/alimentos.webp",
          // gasto.,
          height: 40,
          width: 40,
        ),
        title: Text(
          gasto.title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        subtitle: Text(
          gasto.datetime,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w400,
          ),
        ),
        trailing: Text(
          "S/ ${gasto.price}",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}