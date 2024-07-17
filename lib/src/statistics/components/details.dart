library;

import 'image_urls.dart';

/// [SDetails] is a bunch of classes that are used to represent the details of a match.
///
/// There are three classes that are used to represent the details of a match.
/// [_DetailBase] is the base used for the 3 classes since they share the same attributes.
///
/// [SMapClass] is used to represent the details of a map of the match.
/// [SUGCGameVariant] is used to represent the details of the gamemode of the match.
/// [SPlaylist] is used to represent the details of the playlist of the match.

class SDetails {
  SMapClass map;
  SUGCGameVariant ugcGameVariant;
  SPlaylist playlist;

  SDetails({
    required this.map,
    required this.ugcGameVariant,
    required this.playlist,
  });

  factory SDetails.fromJson(Map<String, dynamic> json) => SDetails(
        map: SMapClass.fromJson(json['map']),
        ugcGameVariant: SUGCGameVariant.fromJson(json['ugcgamevariant']),
        playlist: SPlaylist.fromJson(json['playlist']),
      );

  Map<String, dynamic> toJson() => {
        'map': map.toJson(),
        'ugcgamevariant': ugcGameVariant.toJson(),
        'playlist': playlist.toJson(),
      };

  @override
  String toString() =>
      'map: $map, ugcgamevariant: $ugcGameVariant, playlist: $playlist';
}

abstract class _DetailBase {
  String id;
  String version;
  String name;
  ImageUrls imageUrls;

  _DetailBase({
    required this.id,
    required this.version,
    required this.name,
    required this.imageUrls,
  });

  @override
  String toString() =>
      'id: $id, version: $version, name: $name, image_urls: $imageUrls';
}

class SMapClass extends _DetailBase {
  String levelID;
  String ownerType;

  SMapClass({
    required super.id,
    required super.version,
    required super.name,
    required super.imageUrls,
    required this.levelID,
    required this.ownerType,
  });

  factory SMapClass.fromJson(Map<String, dynamic> json) => SMapClass(
        id: json['id'],
        version: json['version'],
        name: json['name'],
        imageUrls: ImageUrls.fromJson(json['image_urls']),
        levelID: json['properties']['level_id'],
        ownerType: json['properties']['owner_type'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'version': version,
        'name': name,
        'image_urls': imageUrls.toJson(),
        'properties': {
          'level_id': levelID,
          'owner_type': ownerType,
        },
      };

  @override
  String toString() =>
      '${super.toString()}, level_id: $levelID, owner_type: $ownerType';
}

class SUGCGameVariant extends _DetailBase {
  int categoryID;
  String engineVariantID;
  String ownerType;

  SUGCGameVariant({
    required super.id,
    required super.version,
    required super.name,
    required super.imageUrls,
    required this.categoryID,
    required this.engineVariantID,
    required this.ownerType,
  });

  factory SUGCGameVariant.fromJson(Map<String, dynamic> json) =>
      SUGCGameVariant(
        id: json['id'],
        version: json['version'],
        name: json['name'],
        imageUrls: ImageUrls.fromJson(json['image_urls']),
        categoryID: json['properties']['category_id'],
        engineVariantID: json['properties']['engine_variant_id'],
        ownerType: json['properties']['owner_type'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'version': version,
        'name': name,
        'image_urls': imageUrls.toJson(),
        'properties': {
          'category_id': categoryID,
          'engine_variant_id': engineVariantID,
          'owner_type': ownerType,
        },
      };

  @override
  String toString() =>
      '${super.toString()}, category_id: $categoryID, engine_variant_id: $engineVariantID, owner_type: $ownerType';
}

class SPlaylist extends _DetailBase {
  bool active;
  bool featured;
  bool ranked;

  String queue;
  String input;
  String experience;

  SPlaylist({
    required super.id,
    required super.version,
    required super.name,
    required super.imageUrls,
    required this.active,
    required this.featured,
    required this.ranked,
    required this.queue,
    required this.input,
    required this.experience,
  });

  factory SPlaylist.fromJson(Map<String, dynamic> json) => SPlaylist(
        id: json['id'],
        version: json['version'],
        name: json['name'],
        imageUrls: ImageUrls.fromJson(json['image_urls']),
        active: json['attributes']['active'],
        featured: json['attributes']['featured'],
        ranked: json['attributes']['ranked'],
        queue: json['properties']['queue'],
        input: json['properties']['input'],
        experience: json['properties']['experience'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'version': version,
        'name': name,
        'image_urls': imageUrls.toJson(),
        'attributes': {
          'active': active,
          'featured': featured,
          'ranked': ranked,
        },
        'properties': {
          'queue': queue,
          'input': input,
          'experience': experience,
        },
      };

  @override
  String toString() =>
      '${super.toString()}, active: $active, featured: $featured, ranked: $ranked, queue: $queue, input: $input, experience: $experience';
}
