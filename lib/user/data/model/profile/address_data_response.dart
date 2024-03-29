import 'package:json_annotation/json_annotation.dart';
import '../../../domain/model/data/profile/address_data.dart';

part 'address_data_response.g.dart';

abstract class AddressDataResponseMapper {
  AddressData toAddressData();
}

@JsonSerializable()
class AddressDataResponse implements AddressDataResponseMapper {
  int? id;
  String? rt;
  String? rw;
  String? city;
  String? province;
  String? zipcode;
  String? adressDetail;
  String? longitude;
  String? latitude;
  AddressDataResponse({
    this.id,
    this.rt,
    this.rw,
    this.city,
    this.province,
    this.zipcode,
    this.adressDetail,
    this.longitude,
    this.latitude,
  });

  factory AddressDataResponse.fromJson(Map<String, dynamic> json) =>
      _$AddressDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AddressDataResponseToJson(this);

  @override
  AddressData toAddressData() {
    return AddressData(
      id ?? 0,
      rt ?? '',
      rw ?? '',
      city ?? '',
      province ?? '',
      zipcode ?? '',
      adressDetail ?? '',
      longitude ?? '',
      latitude ?? '',
    );
  }
}
