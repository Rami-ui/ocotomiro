import 'package:flutter/material.dart';
import 'package:ocotomiro/controllers/detail_controller.dart';
import 'package:ocotomiro/models/inventory_model.dart';
class DetailScreen extends StatelessWidget {
  final InventoryDocument document;

  const DetailScreen({Key? key, required this.document}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Document Details',style: TextStyle(fontWeight: FontWeight.bold,color:  const Color.fromARGB(187, 28, 86, 94),fontFamily: "Poppins",fontSize: 19)),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Document ID', style: _headerStyle()),
            SizedBox(height: 3),
            Text('${document.id}', style : _textStyle()),
            SizedBox(height: 30),
            Text('Date', style: _headerStyle()),
            SizedBox(height: 3),
            Text('${document.date.toLocal().toString().split(' ')[0]}', style : _textStyle()),
            SizedBox(height: 30),
            Text('Placement', style: _headerStyle()),
            SizedBox(height: 3),
            Text('${document.placement}', style: _textStyle()),
            SizedBox(height: 30),
            Text('Organization', style: _headerStyle()),
            SizedBox(height: 3),
            Text('${document.organization}', style: _textStyle()),

            SizedBox(height: 22),
            Text('Item Info', style: TextStyle(fontSize: 23,fontFamily: "Poppins",color:const Color.fromARGB(187, 28, 86, 94),fontWeight: FontWeight.bold )),
            SizedBox(height: 22),

            Text('Item Name', style: _headerStyle()),
            SizedBox(height: 3,),
            Text('${document.line.itemName}', style: _textStyle()),
            SizedBox(height: 30),

            Text('Item Code', style: _headerStyle()),
            SizedBox(height: 3,),
            Text('${document.line.itemCode}', style: _textStyle()),
            SizedBox(height: 30),
            Text('Quantity', style: _headerStyle()),
            SizedBox(height: 3),
            Text('${document.line.quantity}', style: _textStyle()),
            SizedBox(height: 30),
            Text('Made by', style: _headerStyle()),
            SizedBox(height: 3,),
            Text('${document.madeBy}', style: _textStyle()),
            Spacer(),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Add functionality here
                   DetailController(document: document).generatePdf(context);
                },
                
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(187, 28, 86, 94),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)
                  )
                ),
                child: Text('Generate PDF Document',style: 
                TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16,fontFamily: 'Poppins'),),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextStyle _headerStyle() {
    return TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black);
  }

  TextStyle _textStyle() {
    return TextStyle(fontSize: 14, color:const Color(0xBC22656e) );
  }
}
