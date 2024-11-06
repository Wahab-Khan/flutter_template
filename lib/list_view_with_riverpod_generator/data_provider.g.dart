// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getDataRepoHash() => r'019f3f5ac3ab805eeb531e1106f2675fa517ba82';

/// See also [getDataRepo].
@ProviderFor(getDataRepo)
final getDataRepoProvider = AutoDisposeProvider<DataReposotory>.internal(
  getDataRepo,
  name: r'getDataRepoProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getDataRepoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetDataRepoRef = AutoDisposeProviderRef<DataReposotory>;
String _$getAllDataHash() => r'4bab9b57285100e27ad0ac13fe106608bd99cce8';

/// See also [getAllData].
@ProviderFor(getAllData)
final getAllDataProvider = AutoDisposeFutureProvider<List<PostsModel>>.internal(
  getAllData,
  name: r'getAllDataProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getAllDataHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetAllDataRef = AutoDisposeFutureProviderRef<List<PostsModel>>;
String _$getPostAtHash() => r'215f575e94d3be2dda4197a0dfb2bd8223934e7c';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [getPostAt].
@ProviderFor(getPostAt)
const getPostAtProvider = GetPostAtFamily();

/// See also [getPostAt].
class GetPostAtFamily extends Family<AsyncValue<PostsModel>> {
  /// See also [getPostAt].
  const GetPostAtFamily();

  /// See also [getPostAt].
  GetPostAtProvider call({
    required int postId,
  }) {
    return GetPostAtProvider(
      postId: postId,
    );
  }

  @override
  GetPostAtProvider getProviderOverride(
    covariant GetPostAtProvider provider,
  ) {
    return call(
      postId: provider.postId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getPostAtProvider';
}

/// See also [getPostAt].
class GetPostAtProvider extends AutoDisposeFutureProvider<PostsModel> {
  /// See also [getPostAt].
  GetPostAtProvider({
    required int postId,
  }) : this._internal(
          (ref) => getPostAt(
            ref as GetPostAtRef,
            postId: postId,
          ),
          from: getPostAtProvider,
          name: r'getPostAtProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getPostAtHash,
          dependencies: GetPostAtFamily._dependencies,
          allTransitiveDependencies: GetPostAtFamily._allTransitiveDependencies,
          postId: postId,
        );

  GetPostAtProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.postId,
  }) : super.internal();

  final int postId;

  @override
  Override overrideWith(
    FutureOr<PostsModel> Function(GetPostAtRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetPostAtProvider._internal(
        (ref) => create(ref as GetPostAtRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        postId: postId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<PostsModel> createElement() {
    return _GetPostAtProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetPostAtProvider && other.postId == postId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, postId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetPostAtRef on AutoDisposeFutureProviderRef<PostsModel> {
  /// The parameter `postId` of this provider.
  int get postId;
}

class _GetPostAtProviderElement
    extends AutoDisposeFutureProviderElement<PostsModel> with GetPostAtRef {
  _GetPostAtProviderElement(super.provider);

  @override
  int get postId => (origin as GetPostAtProvider).postId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
