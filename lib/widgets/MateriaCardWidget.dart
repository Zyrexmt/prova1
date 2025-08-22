import 'package:flutter/material.dart';

class MateriaCard extends StatelessWidget {
  const MateriaCard(this.titulo,{super.key});

  final String titulo;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
        child: Card(
        color: Colors.grey[300],
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                child: Text(
                  titulo,
                  style: const TextStyle(fontSize: 18, 
                      fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 25)),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      print('Acessado!');
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.grey[300],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )
                    ),
                     child: Text('Acessar'),
                  ),
                  const SizedBox(width: 8,)
                ],
              )
              
            ],
          ),
        ),
      ),
      
    );
  }
}

// ElevatedButton(onPressed: () {
//               Navigator.of(context).pushReplacementNamed('/splash');
//             }, style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10),
//             ), backgroundColor: Colors.black,
//                foregroundColor: Colors.white
//               ), child: Text('Entrar'),
//             )

// return SizedBox(
//       width: 375,
//       height: 200,
//       child: Card(
//       color: Colors.grey[300],
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               titulo,
//               style: const TextStyle(fontSize: 18, 
//                   fontWeight: FontWeight.bold,
//               ),
//               textAlign: TextAlign.start,
//             ),
//             ElevatedButton(onPressed: () {
//               Navigator.of(context).pushReplacementNamed('/splash');
//             }, style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10),
//             ), backgroundColor: Colors.black,
//                foregroundColor: Colors.white
//               ), child: Text('Entrar'),
//             )
//           ],
//           ),
//         ),/////aaaaaaaa
//       ),
//     );
//   }
// }