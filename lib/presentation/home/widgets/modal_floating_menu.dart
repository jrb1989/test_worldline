import 'package:flutter/material.dart';

import '../controllers/home_controller.dart';

void showMenuModal(BuildContext context, HomeController controller)
{
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.delete_forever),
            title: const Text('Borrar listado'),
            onTap: () {
              controller.deleteList();
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.refresh),
            title: const Text('Recargar de base de datos'),
            onTap: () {
              controller.getPois(forceLocal: true);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.cancel),
            title: const Text('Cancelar'),
            onTap: () {
              // Acción cuando se selecciona 'Cancel'
              Navigator.pop(context);
              // Agrega aquí tu código para manejar la acción
            },
          ),
        ],
      );
    },
  );
}