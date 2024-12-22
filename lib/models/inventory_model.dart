/// Models for the Inventory Document Task

/// Represents an inventory document.
class InventoryDocument {
  final String id;
  final DateTime date;
  final String placement;
  final String organization;
  final String madeBy;
  final InventoryDocumentLine line;

  InventoryDocument({
    required this.id,
    required this.date,
    required this.placement,
    required this.organization,
    required this.madeBy,
    required this.line,
  });

  /// Factory method to create an instance from JSON.
  factory InventoryDocument.fromJson(Map<String, dynamic> json) {
    return InventoryDocument(
      id: json['id'],
      date: DateTime.parse(json['timestamp']),
      placement: json['placement'],
      organization: json['organization'], 
      madeBy: json['madeBy'], 
      line: InventoryDocumentLine.fromJson(json['line']),
    );
  }

  /// Convert an instance to JSON.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'timestamp': date.toIso8601String(),
      'placement': placement,
      'organization': organization, 
      'madeBy': madeBy, 
      'line': line.toJson(),
    };
  }
}

/// Represents a line item in an inventory document
class InventoryDocumentLine {
  final String itemCode;
  final String itemName; 
  final String itemDescription; 
  final int quantity;

  InventoryDocumentLine({
    required this.itemCode,
    required this.itemName,
    required this.itemDescription,
    required this.quantity,
  });

  /// Factory method to create an instance from JSON.
  factory InventoryDocumentLine.fromJson(Map<String, dynamic> json) {
    return InventoryDocumentLine(
      itemCode: json['itemCode'],
      itemName: json['itemName'],
      itemDescription: json['itemDescription'],
      quantity: json['quantity'],
    );
  }

  /// Convert an instance to JSON.
  Map<String, dynamic> toJson() {
    return {
      'itemCode': itemCode,
      'itemName': itemName,
      'itemDescription': itemDescription,
      'quantity': quantity,
    };
  }
}