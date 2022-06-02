// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_hs_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InfoHSDTO _$InfoHSDTOFromJson(Map<String, dynamic> json) => InfoHSDTO(
      patch: json['patch'] as String?,
      classes:
          (json['classes'] as List<dynamic>?)?.map((e) => e as String).toList(),
      sets: (json['sets'] as List<dynamic>?)?.map((e) => e as String).toList(),
      standard: (json['standard'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      wild: (json['wild'] as List<dynamic>?)?.map((e) => e as String).toList(),
      types:
          (json['types'] as List<dynamic>?)?.map((e) => e as String).toList(),
      factions: (json['factions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      qualities: (json['qualities'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      races:
          (json['races'] as List<dynamic>?)?.map((e) => e as String).toList(),
      locales: json['locales'] == null
          ? null
          : LocalesDTO.fromJson(json['locales'] as Map<String, dynamic>),
    );
