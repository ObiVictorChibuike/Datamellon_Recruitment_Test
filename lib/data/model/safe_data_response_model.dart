import 'dart:convert';

List<SafeDataList> safeDataListFromJson(String str) => List<SafeDataList>.from(json.decode(str).map((x) => SafeDataList.fromJson(x)));

String safeDataListToJson(List<SafeDataList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SafeDataList {
  SafeDataList({
    this.orderId,
    this.profit,
    this.city,
    this.customerName,
    this.productName,
    this.rowId,
    this.country,
    this.discount,
    this.customerId,
    this.region,
    this.quantity,
    this.segment,
    this.state,
    this.shipMode,
    this.subCategory,
    this.postalCode,
    this.shipDate,
    this.category,
    this.productId,
    this.sales,
    this.orderDate,
  });

  String? orderId;
  String? profit;
  String? city;
  String? customerName;
  String? productName;
  String? rowId;
  Country? country;
  String? discount;
  String? customerId;
  Region? region;
  String? quantity;
  Segment? segment;
  State? state;
  ShipMode? shipMode;
  SubCategory? subCategory;
  String? postalCode;
  String? shipDate;
  Category? category;
  String? productId;
  String? sales;
  String? orderDate;

  factory SafeDataList.fromJson(Map<String, dynamic> json) => SafeDataList(
    orderId: json["Order ID"],
    profit: json["Profit"],
    city: json["City"],
    customerName: json["Customer Name"],
    productName: json["Product Name"],
    rowId: json["Row ID"],
    country: countryValues.map[json["Country"]]!,
    discount: json["Discount"],
    customerId: json["Customer ID"],
    region: regionValues.map[json["Region"]]!,
    quantity: json["Quantity"],
    segment: segmentValues.map[json["Segment"]]!,
    state: stateValues.map[json["State"]]!,
    shipMode: shipModeValues.map[json["Ship Mode"]]!,
    subCategory: subCategoryValues.map[json["Sub-Category"]]!,
    postalCode: json["Postal Code"],
    shipDate: json["Ship Date"],
    category: categoryValues.map[json["Category"]]!,
    productId: json["Product ID"],
    sales: json["Sales"],
    orderDate: json["Order Date"],
  );

  Map<String, dynamic> toJson() => {
    "Order ID": orderId,
    "Profit": profit,
    "City": city,
    "Customer Name": customerName,
    "Product Name": productName,
    "Row ID": rowId,
    "Country": countryValues.reverse[country],
    "Discount": discount,
    "Customer ID": customerId,
    "Region": regionValues.reverse[region],
    "Quantity": quantity,
    "Segment": segmentValues.reverse[segment],
    "State": stateValues.reverse[state],
    "Ship Mode": shipModeValues.reverse[shipMode],
    "Sub-Category": subCategoryValues.reverse[subCategory],
    "Postal Code": postalCode,
    "Ship Date": shipDate,
    "Category": categoryValues.reverse[category],
    "Product ID": productId,
    "Sales": sales,
    "Order Date": orderDate,
  };
}

enum Category { OFFICE_SUPPLIES, FURNITURE, TECHNOLOGY }

final categoryValues = EnumValues({
  "Furniture": Category.FURNITURE,
  "Office Supplies": Category.OFFICE_SUPPLIES,
  "Technology": Category.TECHNOLOGY
});

enum Country { UNITED_STATES }

final countryValues = EnumValues({
  "United States": Country.UNITED_STATES
});

enum Region { WEST, EAST, SOUTH, CENTRAL }

final regionValues = EnumValues({
  "Central": Region.CENTRAL,
  "East": Region.EAST,
  "South": Region.SOUTH,
  "West": Region.WEST
});

enum Segment { CORPORATE, HOME_OFFICE, CONSUMER }

final segmentValues = EnumValues({
  "Consumer": Segment.CONSUMER,
  "Corporate": Segment.CORPORATE,
  "Home Office": Segment.HOME_OFFICE
});

enum ShipMode { SECOND_CLASS, STANDARD_CLASS, FIRST_CLASS, SAME_DAY }

final shipModeValues = EnumValues({
  "First Class": ShipMode.FIRST_CLASS,
  "Same Day": ShipMode.SAME_DAY,
  "Second Class": ShipMode.SECOND_CLASS,
  "Standard Class": ShipMode.STANDARD_CLASS
});

enum State { ARIZONA, CONNECTICUT, DISTRICT_OF_COLUMBIA, PENNSYLVANIA, CALIFORNIA, OHIO, GEORGIA, ILLINOIS, ARKANSAS, FLORIDA, MICHIGAN, NEW_HAMPSHIRE, VIRGINIA, NORTH_CAROLINA, NEW_JERSEY, TEXAS, WASHINGTON, MARYLAND, NEW_YORK, INDIANA, KENTUCKY, COLORADO, TENNESSEE, NEVADA, WISCONSIN, ALABAMA, UTAH, LOUISIANA, VERMONT, MISSOURI, MONTANA, OREGON, DELAWARE, OKLAHOMA, MASSACHUSETTS, NEW_MEXICO, MINNESOTA, RHODE_ISLAND, NEBRASKA, SOUTH_CAROLINA, MISSISSIPPI, IOWA, IDAHO, MAINE, KANSAS, SOUTH_DAKOTA }

final stateValues = EnumValues({
  "Alabama": State.ALABAMA,
  "Arizona": State.ARIZONA,
  "Arkansas": State.ARKANSAS,
  "California": State.CALIFORNIA,
  "Colorado": State.COLORADO,
  "Connecticut": State.CONNECTICUT,
  "Delaware": State.DELAWARE,
  "District of Columbia": State.DISTRICT_OF_COLUMBIA,
  "Florida": State.FLORIDA,
  "Georgia": State.GEORGIA,
  "Idaho": State.IDAHO,
  "Illinois": State.ILLINOIS,
  "Indiana": State.INDIANA,
  "Iowa": State.IOWA,
  "Kansas": State.KANSAS,
  "Kentucky": State.KENTUCKY,
  "Louisiana": State.LOUISIANA,
  "Maine": State.MAINE,
  "Maryland": State.MARYLAND,
  "Massachusetts": State.MASSACHUSETTS,
  "Michigan": State.MICHIGAN,
  "Minnesota": State.MINNESOTA,
  "Mississippi": State.MISSISSIPPI,
  "Missouri": State.MISSOURI,
  "Montana": State.MONTANA,
  "Nebraska": State.NEBRASKA,
  "Nevada": State.NEVADA,
  "New Hampshire": State.NEW_HAMPSHIRE,
  "New Jersey": State.NEW_JERSEY,
  "New Mexico": State.NEW_MEXICO,
  "New York": State.NEW_YORK,
  "North Carolina": State.NORTH_CAROLINA,
  "Ohio": State.OHIO,
  "Oklahoma": State.OKLAHOMA,
  "Oregon": State.OREGON,
  "Pennsylvania": State.PENNSYLVANIA,
  "Rhode Island": State.RHODE_ISLAND,
  "South Carolina": State.SOUTH_CAROLINA,
  "South Dakota": State.SOUTH_DAKOTA,
  "Tennessee": State.TENNESSEE,
  "Texas": State.TEXAS,
  "Utah": State.UTAH,
  "Vermont": State.VERMONT,
  "Virginia": State.VIRGINIA,
  "Washington": State.WASHINGTON,
  "Wisconsin": State.WISCONSIN
});

enum SubCategory { ART, STORAGE, FURNISHINGS, ACCESSORIES, ENVELOPES, PAPER, BINDERS, CHAIRS, SUPPLIES, FASTENERS, PHONES, TABLES, APPLIANCES, LABELS, BOOKCASES, MACHINES, COPIERS }

final subCategoryValues = EnumValues({
  "Accessories": SubCategory.ACCESSORIES,
  "Appliances": SubCategory.APPLIANCES,
  "Art": SubCategory.ART,
  "Binders": SubCategory.BINDERS,
  "Bookcases": SubCategory.BOOKCASES,
  "Chairs": SubCategory.CHAIRS,
  "Copiers": SubCategory.COPIERS,
  "Envelopes": SubCategory.ENVELOPES,
  "Fasteners": SubCategory.FASTENERS,
  "Furnishings": SubCategory.FURNISHINGS,
  "Labels": SubCategory.LABELS,
  "Machines": SubCategory.MACHINES,
  "Paper": SubCategory.PAPER,
  "Phones": SubCategory.PHONES,
  "Storage": SubCategory.STORAGE,
  "Supplies": SubCategory.SUPPLIES,
  "Tables": SubCategory.TABLES
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
