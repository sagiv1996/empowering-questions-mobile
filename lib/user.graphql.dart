import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;
import 'schema.graphql.dart';

class Variables$Mutation$upsertUser {
  factory Variables$Mutation$upsertUser({
    required String firebaseId,
    required Enum$Frequency frequency,
    required Enum$Genders gender,
    required List<Enum$Categories> categories,
  }) =>
      Variables$Mutation$upsertUser._({
        r'firebaseId': firebaseId,
        r'frequency': frequency,
        r'gender': gender,
        r'categories': categories,
      });

  Variables$Mutation$upsertUser._(this._$data);

  factory Variables$Mutation$upsertUser.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$firebaseId = data['firebaseId'];
    result$data['firebaseId'] = (l$firebaseId as String);
    final l$frequency = data['frequency'];
    result$data['frequency'] = fromJson$Enum$Frequency((l$frequency as String));
    final l$gender = data['gender'];
    result$data['gender'] = fromJson$Enum$Genders((l$gender as String));
    final l$categories = data['categories'];
    result$data['categories'] = (l$categories as List<dynamic>)
        .map((e) => fromJson$Enum$Categories((e as String)))
        .toList();
    return Variables$Mutation$upsertUser._(result$data);
  }

  Map<String, dynamic> _$data;

  String get firebaseId => (_$data['firebaseId'] as String);

  Enum$Frequency get frequency => (_$data['frequency'] as Enum$Frequency);

  Enum$Genders get gender => (_$data['gender'] as Enum$Genders);

  List<Enum$Categories> get categories =>
      (_$data['categories'] as List<Enum$Categories>);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$firebaseId = firebaseId;
    result$data['firebaseId'] = l$firebaseId;
    final l$frequency = frequency;
    result$data['frequency'] = toJson$Enum$Frequency(l$frequency);
    final l$gender = gender;
    result$data['gender'] = toJson$Enum$Genders(l$gender);
    final l$categories = categories;
    result$data['categories'] =
        l$categories.map((e) => toJson$Enum$Categories(e)).toList();
    return result$data;
  }

  CopyWith$Variables$Mutation$upsertUser<Variables$Mutation$upsertUser>
      get copyWith => CopyWith$Variables$Mutation$upsertUser(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$upsertUser) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$firebaseId = firebaseId;
    final lOther$firebaseId = other.firebaseId;
    if (l$firebaseId != lOther$firebaseId) {
      return false;
    }
    final l$frequency = frequency;
    final lOther$frequency = other.frequency;
    if (l$frequency != lOther$frequency) {
      return false;
    }
    final l$gender = gender;
    final lOther$gender = other.gender;
    if (l$gender != lOther$gender) {
      return false;
    }
    final l$categories = categories;
    final lOther$categories = other.categories;
    if (l$categories.length != lOther$categories.length) {
      return false;
    }
    for (int i = 0; i < l$categories.length; i++) {
      final l$categories$entry = l$categories[i];
      final lOther$categories$entry = lOther$categories[i];
      if (l$categories$entry != lOther$categories$entry) {
        return false;
      }
    }
    return true;
  }

  @override
  int get hashCode {
    final l$firebaseId = firebaseId;
    final l$frequency = frequency;
    final l$gender = gender;
    final l$categories = categories;
    return Object.hashAll([
      l$firebaseId,
      l$frequency,
      l$gender,
      Object.hashAll(l$categories.map((v) => v)),
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$upsertUser<TRes> {
  factory CopyWith$Variables$Mutation$upsertUser(
    Variables$Mutation$upsertUser instance,
    TRes Function(Variables$Mutation$upsertUser) then,
  ) = _CopyWithImpl$Variables$Mutation$upsertUser;

  factory CopyWith$Variables$Mutation$upsertUser.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$upsertUser;

  TRes call({
    String? firebaseId,
    Enum$Frequency? frequency,
    Enum$Genders? gender,
    List<Enum$Categories>? categories,
  });
}

class _CopyWithImpl$Variables$Mutation$upsertUser<TRes>
    implements CopyWith$Variables$Mutation$upsertUser<TRes> {
  _CopyWithImpl$Variables$Mutation$upsertUser(
    this._instance,
    this._then,
  );

  final Variables$Mutation$upsertUser _instance;

  final TRes Function(Variables$Mutation$upsertUser) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? firebaseId = _undefined,
    Object? frequency = _undefined,
    Object? gender = _undefined,
    Object? categories = _undefined,
  }) =>
      _then(Variables$Mutation$upsertUser._({
        ..._instance._$data,
        if (firebaseId != _undefined && firebaseId != null)
          'firebaseId': (firebaseId as String),
        if (frequency != _undefined && frequency != null)
          'frequency': (frequency as Enum$Frequency),
        if (gender != _undefined && gender != null)
          'gender': (gender as Enum$Genders),
        if (categories != _undefined && categories != null)
          'categories': (categories as List<Enum$Categories>),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$upsertUser<TRes>
    implements CopyWith$Variables$Mutation$upsertUser<TRes> {
  _CopyWithStubImpl$Variables$Mutation$upsertUser(this._res);

  TRes _res;

  call({
    String? firebaseId,
    Enum$Frequency? frequency,
    Enum$Genders? gender,
    List<Enum$Categories>? categories,
  }) =>
      _res;
}

class Mutation$upsertUser {
  Mutation$upsertUser({
    required this.upsertUser,
    this.$__typename = 'Mutation',
  });

  factory Mutation$upsertUser.fromJson(Map<String, dynamic> json) {
    final l$upsertUser = json['upsertUser'];
    final l$$__typename = json['__typename'];
    return Mutation$upsertUser(
      upsertUser: Mutation$upsertUser$upsertUser.fromJson(
          (l$upsertUser as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$upsertUser$upsertUser upsertUser;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$upsertUser = upsertUser;
    _resultData['upsertUser'] = l$upsertUser.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$upsertUser = upsertUser;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$upsertUser,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$upsertUser) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$upsertUser = upsertUser;
    final lOther$upsertUser = other.upsertUser;
    if (l$upsertUser != lOther$upsertUser) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$upsertUser on Mutation$upsertUser {
  CopyWith$Mutation$upsertUser<Mutation$upsertUser> get copyWith =>
      CopyWith$Mutation$upsertUser(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$upsertUser<TRes> {
  factory CopyWith$Mutation$upsertUser(
    Mutation$upsertUser instance,
    TRes Function(Mutation$upsertUser) then,
  ) = _CopyWithImpl$Mutation$upsertUser;

  factory CopyWith$Mutation$upsertUser.stub(TRes res) =
      _CopyWithStubImpl$Mutation$upsertUser;

  TRes call({
    Mutation$upsertUser$upsertUser? upsertUser,
    String? $__typename,
  });
  CopyWith$Mutation$upsertUser$upsertUser<TRes> get upsertUser;
}

class _CopyWithImpl$Mutation$upsertUser<TRes>
    implements CopyWith$Mutation$upsertUser<TRes> {
  _CopyWithImpl$Mutation$upsertUser(
    this._instance,
    this._then,
  );

  final Mutation$upsertUser _instance;

  final TRes Function(Mutation$upsertUser) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? upsertUser = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$upsertUser(
        upsertUser: upsertUser == _undefined || upsertUser == null
            ? _instance.upsertUser
            : (upsertUser as Mutation$upsertUser$upsertUser),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$upsertUser$upsertUser<TRes> get upsertUser {
    final local$upsertUser = _instance.upsertUser;
    return CopyWith$Mutation$upsertUser$upsertUser(
        local$upsertUser, (e) => call(upsertUser: e));
  }
}

class _CopyWithStubImpl$Mutation$upsertUser<TRes>
    implements CopyWith$Mutation$upsertUser<TRes> {
  _CopyWithStubImpl$Mutation$upsertUser(this._res);

  TRes _res;

  call({
    Mutation$upsertUser$upsertUser? upsertUser,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$upsertUser$upsertUser<TRes> get upsertUser =>
      CopyWith$Mutation$upsertUser$upsertUser.stub(_res);
}

const documentNodeMutationupsertUser = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'upsertUser'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'firebaseId')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'frequency')),
        type: NamedTypeNode(
          name: NameNode(value: 'Frequency'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'gender')),
        type: NamedTypeNode(
          name: NameNode(value: 'Genders'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'categories')),
        type: ListTypeNode(
          type: NamedTypeNode(
            name: NameNode(value: 'Categories'),
            isNonNull: true,
          ),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'upsertUser'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'firebaseId'),
            value: VariableNode(name: NameNode(value: 'firebaseId')),
          ),
          ArgumentNode(
            name: NameNode(value: 'frequency'),
            value: VariableNode(name: NameNode(value: 'frequency')),
          ),
          ArgumentNode(
            name: NameNode(value: 'gender'),
            value: VariableNode(name: NameNode(value: 'gender')),
          ),
          ArgumentNode(
            name: NameNode(value: 'categories'),
            value: VariableNode(name: NameNode(value: 'categories')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: '_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'firebaseId'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'gender'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'frequency'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'categories'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);
Mutation$upsertUser _parserFn$Mutation$upsertUser(Map<String, dynamic> data) =>
    Mutation$upsertUser.fromJson(data);
typedef OnMutationCompleted$Mutation$upsertUser = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$upsertUser?,
);

class Options$Mutation$upsertUser
    extends graphql.MutationOptions<Mutation$upsertUser> {
  Options$Mutation$upsertUser({
    String? operationName,
    required Variables$Mutation$upsertUser variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$upsertUser? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$upsertUser? onCompleted,
    graphql.OnMutationUpdate<Mutation$upsertUser>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null ? null : _parserFn$Mutation$upsertUser(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationupsertUser,
          parserFn: _parserFn$Mutation$upsertUser,
        );

  final OnMutationCompleted$Mutation$upsertUser? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$upsertUser
    extends graphql.WatchQueryOptions<Mutation$upsertUser> {
  WatchOptions$Mutation$upsertUser({
    String? operationName,
    required Variables$Mutation$upsertUser variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$upsertUser? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeMutationupsertUser,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$upsertUser,
        );
}

extension ClientExtension$Mutation$upsertUser on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$upsertUser>> mutate$upsertUser(
          Options$Mutation$upsertUser options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$upsertUser> watchMutation$upsertUser(
          WatchOptions$Mutation$upsertUser options) =>
      this.watchMutation(options);
}

class Mutation$upsertUser$HookResult {
  Mutation$upsertUser$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$upsertUser runMutation;

  final graphql.QueryResult<Mutation$upsertUser> result;
}

Mutation$upsertUser$HookResult useMutation$upsertUser(
    [WidgetOptions$Mutation$upsertUser? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$upsertUser());
  return Mutation$upsertUser$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$upsertUser> useWatchMutation$upsertUser(
        WatchOptions$Mutation$upsertUser options) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$upsertUser
    extends graphql.MutationOptions<Mutation$upsertUser> {
  WidgetOptions$Mutation$upsertUser({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$upsertUser? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$upsertUser? onCompleted,
    graphql.OnMutationUpdate<Mutation$upsertUser>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null ? null : _parserFn$Mutation$upsertUser(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationupsertUser,
          parserFn: _parserFn$Mutation$upsertUser,
        );

  final OnMutationCompleted$Mutation$upsertUser? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$upsertUser
    = graphql.MultiSourceResult<Mutation$upsertUser> Function(
  Variables$Mutation$upsertUser, {
  Object? optimisticResult,
  Mutation$upsertUser? typedOptimisticResult,
});
typedef Builder$Mutation$upsertUser = widgets.Widget Function(
  RunMutation$Mutation$upsertUser,
  graphql.QueryResult<Mutation$upsertUser>?,
);

class Mutation$upsertUser$Widget
    extends graphql_flutter.Mutation<Mutation$upsertUser> {
  Mutation$upsertUser$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$upsertUser? options,
    required Builder$Mutation$upsertUser builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$upsertUser(),
          builder: (
            run,
            result,
          ) =>
              builder(
            (
              variables, {
              optimisticResult,
              typedOptimisticResult,
            }) =>
                run(
              variables.toJson(),
              optimisticResult:
                  optimisticResult ?? typedOptimisticResult?.toJson(),
            ),
            result,
          ),
        );
}

class Mutation$upsertUser$upsertUser {
  Mutation$upsertUser$upsertUser({
    required this.$_id,
    required this.firebaseId,
    required this.gender,
    required this.frequency,
    required this.categories,
    this.$__typename = 'User',
  });

  factory Mutation$upsertUser$upsertUser.fromJson(Map<String, dynamic> json) {
    final l$$_id = json['_id'];
    final l$firebaseId = json['firebaseId'];
    final l$gender = json['gender'];
    final l$frequency = json['frequency'];
    final l$categories = json['categories'];
    final l$$__typename = json['__typename'];
    return Mutation$upsertUser$upsertUser(
      $_id: (l$$_id as String),
      firebaseId: (l$firebaseId as String),
      gender: fromJson$Enum$Genders((l$gender as String)),
      frequency: fromJson$Enum$Frequency((l$frequency as String)),
      categories: (l$categories as List<dynamic>)
          .map((e) => fromJson$Enum$Categories((e as String)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final String $_id;

  final String firebaseId;

  final Enum$Genders gender;

  final Enum$Frequency frequency;

  final List<Enum$Categories> categories;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$_id = $_id;
    _resultData['_id'] = l$$_id;
    final l$firebaseId = firebaseId;
    _resultData['firebaseId'] = l$firebaseId;
    final l$gender = gender;
    _resultData['gender'] = toJson$Enum$Genders(l$gender);
    final l$frequency = frequency;
    _resultData['frequency'] = toJson$Enum$Frequency(l$frequency);
    final l$categories = categories;
    _resultData['categories'] =
        l$categories.map((e) => toJson$Enum$Categories(e)).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$_id = $_id;
    final l$firebaseId = firebaseId;
    final l$gender = gender;
    final l$frequency = frequency;
    final l$categories = categories;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$$_id,
      l$firebaseId,
      l$gender,
      l$frequency,
      Object.hashAll(l$categories.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$upsertUser$upsertUser) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$_id = $_id;
    final lOther$$_id = other.$_id;
    if (l$$_id != lOther$$_id) {
      return false;
    }
    final l$firebaseId = firebaseId;
    final lOther$firebaseId = other.firebaseId;
    if (l$firebaseId != lOther$firebaseId) {
      return false;
    }
    final l$gender = gender;
    final lOther$gender = other.gender;
    if (l$gender != lOther$gender) {
      return false;
    }
    final l$frequency = frequency;
    final lOther$frequency = other.frequency;
    if (l$frequency != lOther$frequency) {
      return false;
    }
    final l$categories = categories;
    final lOther$categories = other.categories;
    if (l$categories.length != lOther$categories.length) {
      return false;
    }
    for (int i = 0; i < l$categories.length; i++) {
      final l$categories$entry = l$categories[i];
      final lOther$categories$entry = lOther$categories[i];
      if (l$categories$entry != lOther$categories$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$upsertUser$upsertUser
    on Mutation$upsertUser$upsertUser {
  CopyWith$Mutation$upsertUser$upsertUser<Mutation$upsertUser$upsertUser>
      get copyWith => CopyWith$Mutation$upsertUser$upsertUser(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$upsertUser$upsertUser<TRes> {
  factory CopyWith$Mutation$upsertUser$upsertUser(
    Mutation$upsertUser$upsertUser instance,
    TRes Function(Mutation$upsertUser$upsertUser) then,
  ) = _CopyWithImpl$Mutation$upsertUser$upsertUser;

  factory CopyWith$Mutation$upsertUser$upsertUser.stub(TRes res) =
      _CopyWithStubImpl$Mutation$upsertUser$upsertUser;

  TRes call({
    String? $_id,
    String? firebaseId,
    Enum$Genders? gender,
    Enum$Frequency? frequency,
    List<Enum$Categories>? categories,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$upsertUser$upsertUser<TRes>
    implements CopyWith$Mutation$upsertUser$upsertUser<TRes> {
  _CopyWithImpl$Mutation$upsertUser$upsertUser(
    this._instance,
    this._then,
  );

  final Mutation$upsertUser$upsertUser _instance;

  final TRes Function(Mutation$upsertUser$upsertUser) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? $_id = _undefined,
    Object? firebaseId = _undefined,
    Object? gender = _undefined,
    Object? frequency = _undefined,
    Object? categories = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$upsertUser$upsertUser(
        $_id: $_id == _undefined || $_id == null
            ? _instance.$_id
            : ($_id as String),
        firebaseId: firebaseId == _undefined || firebaseId == null
            ? _instance.firebaseId
            : (firebaseId as String),
        gender: gender == _undefined || gender == null
            ? _instance.gender
            : (gender as Enum$Genders),
        frequency: frequency == _undefined || frequency == null
            ? _instance.frequency
            : (frequency as Enum$Frequency),
        categories: categories == _undefined || categories == null
            ? _instance.categories
            : (categories as List<Enum$Categories>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$upsertUser$upsertUser<TRes>
    implements CopyWith$Mutation$upsertUser$upsertUser<TRes> {
  _CopyWithStubImpl$Mutation$upsertUser$upsertUser(this._res);

  TRes _res;

  call({
    String? $_id,
    String? firebaseId,
    Enum$Genders? gender,
    Enum$Frequency? frequency,
    List<Enum$Categories>? categories,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$getUserById {
  factory Variables$Query$getUserById({required String userId}) =>
      Variables$Query$getUserById._({
        r'userId': userId,
      });

  Variables$Query$getUserById._(this._$data);

  factory Variables$Query$getUserById.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$userId = data['userId'];
    result$data['userId'] = (l$userId as String);
    return Variables$Query$getUserById._(result$data);
  }

  Map<String, dynamic> _$data;

  String get userId => (_$data['userId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$userId = userId;
    result$data['userId'] = l$userId;
    return result$data;
  }

  CopyWith$Variables$Query$getUserById<Variables$Query$getUserById>
      get copyWith => CopyWith$Variables$Query$getUserById(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getUserById) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$userId = userId;
    final lOther$userId = other.userId;
    if (l$userId != lOther$userId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$userId = userId;
    return Object.hashAll([l$userId]);
  }
}

abstract class CopyWith$Variables$Query$getUserById<TRes> {
  factory CopyWith$Variables$Query$getUserById(
    Variables$Query$getUserById instance,
    TRes Function(Variables$Query$getUserById) then,
  ) = _CopyWithImpl$Variables$Query$getUserById;

  factory CopyWith$Variables$Query$getUserById.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getUserById;

  TRes call({String? userId});
}

class _CopyWithImpl$Variables$Query$getUserById<TRes>
    implements CopyWith$Variables$Query$getUserById<TRes> {
  _CopyWithImpl$Variables$Query$getUserById(
    this._instance,
    this._then,
  );

  final Variables$Query$getUserById _instance;

  final TRes Function(Variables$Query$getUserById) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? userId = _undefined}) =>
      _then(Variables$Query$getUserById._({
        ..._instance._$data,
        if (userId != _undefined && userId != null)
          'userId': (userId as String),
      }));
}

class _CopyWithStubImpl$Variables$Query$getUserById<TRes>
    implements CopyWith$Variables$Query$getUserById<TRes> {
  _CopyWithStubImpl$Variables$Query$getUserById(this._res);

  TRes _res;

  call({String? userId}) => _res;
}

class Query$getUserById {
  Query$getUserById({
    required this.getUserById,
    this.$__typename = 'Query',
  });

  factory Query$getUserById.fromJson(Map<String, dynamic> json) {
    final l$getUserById = json['getUserById'];
    final l$$__typename = json['__typename'];
    return Query$getUserById(
      getUserById: Query$getUserById$getUserById.fromJson(
          (l$getUserById as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$getUserById$getUserById getUserById;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$getUserById = getUserById;
    _resultData['getUserById'] = l$getUserById.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$getUserById = getUserById;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$getUserById,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getUserById) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$getUserById = getUserById;
    final lOther$getUserById = other.getUserById;
    if (l$getUserById != lOther$getUserById) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$getUserById on Query$getUserById {
  CopyWith$Query$getUserById<Query$getUserById> get copyWith =>
      CopyWith$Query$getUserById(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$getUserById<TRes> {
  factory CopyWith$Query$getUserById(
    Query$getUserById instance,
    TRes Function(Query$getUserById) then,
  ) = _CopyWithImpl$Query$getUserById;

  factory CopyWith$Query$getUserById.stub(TRes res) =
      _CopyWithStubImpl$Query$getUserById;

  TRes call({
    Query$getUserById$getUserById? getUserById,
    String? $__typename,
  });
  CopyWith$Query$getUserById$getUserById<TRes> get getUserById;
}

class _CopyWithImpl$Query$getUserById<TRes>
    implements CopyWith$Query$getUserById<TRes> {
  _CopyWithImpl$Query$getUserById(
    this._instance,
    this._then,
  );

  final Query$getUserById _instance;

  final TRes Function(Query$getUserById) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? getUserById = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getUserById(
        getUserById: getUserById == _undefined || getUserById == null
            ? _instance.getUserById
            : (getUserById as Query$getUserById$getUserById),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$getUserById$getUserById<TRes> get getUserById {
    final local$getUserById = _instance.getUserById;
    return CopyWith$Query$getUserById$getUserById(
        local$getUserById, (e) => call(getUserById: e));
  }
}

class _CopyWithStubImpl$Query$getUserById<TRes>
    implements CopyWith$Query$getUserById<TRes> {
  _CopyWithStubImpl$Query$getUserById(this._res);

  TRes _res;

  call({
    Query$getUserById$getUserById? getUserById,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$getUserById$getUserById<TRes> get getUserById =>
      CopyWith$Query$getUserById$getUserById.stub(_res);
}

const documentNodeQuerygetUserById = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getUserById'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'userId')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'getUserById'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'userId'),
            value: VariableNode(name: NameNode(value: 'userId')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'frequency'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'gender'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'categories'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);
Query$getUserById _parserFn$Query$getUserById(Map<String, dynamic> data) =>
    Query$getUserById.fromJson(data);
typedef OnQueryComplete$Query$getUserById = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$getUserById?,
);

class Options$Query$getUserById
    extends graphql.QueryOptions<Query$getUserById> {
  Options$Query$getUserById({
    String? operationName,
    required Variables$Query$getUserById variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$getUserById? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$getUserById? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          pollInterval: pollInterval,
          context: context,
          onComplete: onComplete == null
              ? null
              : (data) => onComplete(
                    data,
                    data == null ? null : _parserFn$Query$getUserById(data),
                  ),
          onError: onError,
          document: documentNodeQuerygetUserById,
          parserFn: _parserFn$Query$getUserById,
        );

  final OnQueryComplete$Query$getUserById? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$getUserById
    extends graphql.WatchQueryOptions<Query$getUserById> {
  WatchOptions$Query$getUserById({
    String? operationName,
    required Variables$Query$getUserById variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$getUserById? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeQuerygetUserById,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getUserById,
        );
}

class FetchMoreOptions$Query$getUserById extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getUserById({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getUserById variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetUserById,
        );
}

extension ClientExtension$Query$getUserById on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getUserById>> query$getUserById(
          Options$Query$getUserById options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$getUserById> watchQuery$getUserById(
          WatchOptions$Query$getUserById options) =>
      this.watchQuery(options);
  void writeQuery$getUserById({
    required Query$getUserById data,
    required Variables$Query$getUserById variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(document: documentNodeQuerygetUserById),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getUserById? readQuery$getUserById({
    required Variables$Query$getUserById variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQuerygetUserById),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$getUserById.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$getUserById> useQuery$getUserById(
        Options$Query$getUserById options) =>
    graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$getUserById> useWatchQuery$getUserById(
        WatchOptions$Query$getUserById options) =>
    graphql_flutter.useWatchQuery(options);

class Query$getUserById$Widget
    extends graphql_flutter.Query<Query$getUserById> {
  Query$getUserById$Widget({
    widgets.Key? key,
    required Options$Query$getUserById options,
    required graphql_flutter.QueryBuilder<Query$getUserById> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$getUserById$getUserById {
  Query$getUserById$getUserById({
    required this.frequency,
    required this.gender,
    required this.categories,
    this.$__typename = 'User',
  });

  factory Query$getUserById$getUserById.fromJson(Map<String, dynamic> json) {
    final l$frequency = json['frequency'];
    final l$gender = json['gender'];
    final l$categories = json['categories'];
    final l$$__typename = json['__typename'];
    return Query$getUserById$getUserById(
      frequency: fromJson$Enum$Frequency((l$frequency as String)),
      gender: fromJson$Enum$Genders((l$gender as String)),
      categories: (l$categories as List<dynamic>)
          .map((e) => fromJson$Enum$Categories((e as String)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final Enum$Frequency frequency;

  final Enum$Genders gender;

  final List<Enum$Categories> categories;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$frequency = frequency;
    _resultData['frequency'] = toJson$Enum$Frequency(l$frequency);
    final l$gender = gender;
    _resultData['gender'] = toJson$Enum$Genders(l$gender);
    final l$categories = categories;
    _resultData['categories'] =
        l$categories.map((e) => toJson$Enum$Categories(e)).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$frequency = frequency;
    final l$gender = gender;
    final l$categories = categories;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$frequency,
      l$gender,
      Object.hashAll(l$categories.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getUserById$getUserById) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$frequency = frequency;
    final lOther$frequency = other.frequency;
    if (l$frequency != lOther$frequency) {
      return false;
    }
    final l$gender = gender;
    final lOther$gender = other.gender;
    if (l$gender != lOther$gender) {
      return false;
    }
    final l$categories = categories;
    final lOther$categories = other.categories;
    if (l$categories.length != lOther$categories.length) {
      return false;
    }
    for (int i = 0; i < l$categories.length; i++) {
      final l$categories$entry = l$categories[i];
      final lOther$categories$entry = lOther$categories[i];
      if (l$categories$entry != lOther$categories$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$getUserById$getUserById
    on Query$getUserById$getUserById {
  CopyWith$Query$getUserById$getUserById<Query$getUserById$getUserById>
      get copyWith => CopyWith$Query$getUserById$getUserById(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getUserById$getUserById<TRes> {
  factory CopyWith$Query$getUserById$getUserById(
    Query$getUserById$getUserById instance,
    TRes Function(Query$getUserById$getUserById) then,
  ) = _CopyWithImpl$Query$getUserById$getUserById;

  factory CopyWith$Query$getUserById$getUserById.stub(TRes res) =
      _CopyWithStubImpl$Query$getUserById$getUserById;

  TRes call({
    Enum$Frequency? frequency,
    Enum$Genders? gender,
    List<Enum$Categories>? categories,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getUserById$getUserById<TRes>
    implements CopyWith$Query$getUserById$getUserById<TRes> {
  _CopyWithImpl$Query$getUserById$getUserById(
    this._instance,
    this._then,
  );

  final Query$getUserById$getUserById _instance;

  final TRes Function(Query$getUserById$getUserById) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? frequency = _undefined,
    Object? gender = _undefined,
    Object? categories = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getUserById$getUserById(
        frequency: frequency == _undefined || frequency == null
            ? _instance.frequency
            : (frequency as Enum$Frequency),
        gender: gender == _undefined || gender == null
            ? _instance.gender
            : (gender as Enum$Genders),
        categories: categories == _undefined || categories == null
            ? _instance.categories
            : (categories as List<Enum$Categories>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getUserById$getUserById<TRes>
    implements CopyWith$Query$getUserById$getUserById<TRes> {
  _CopyWithStubImpl$Query$getUserById$getUserById(this._res);

  TRes _res;

  call({
    Enum$Frequency? frequency,
    Enum$Genders? gender,
    List<Enum$Categories>? categories,
    String? $__typename,
  }) =>
      _res;
}
