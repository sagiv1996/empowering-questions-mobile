import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;
import 'schema.graphql.dart';

class Variables$Mutation$createUser {
  factory Variables$Mutation$createUser({
    required String firebaseId,
    required Enum$Frequency frequency,
    required Enum$Genders gender,
    required List<Enum$Categories> categories,
  }) =>
      Variables$Mutation$createUser._({
        r'firebaseId': firebaseId,
        r'frequency': frequency,
        r'gender': gender,
        r'categories': categories,
      });

  Variables$Mutation$createUser._(this._$data);

  factory Variables$Mutation$createUser.fromJson(Map<String, dynamic> data) {
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
    return Variables$Mutation$createUser._(result$data);
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

  CopyWith$Variables$Mutation$createUser<Variables$Mutation$createUser>
      get copyWith => CopyWith$Variables$Mutation$createUser(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$createUser) ||
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

abstract class CopyWith$Variables$Mutation$createUser<TRes> {
  factory CopyWith$Variables$Mutation$createUser(
    Variables$Mutation$createUser instance,
    TRes Function(Variables$Mutation$createUser) then,
  ) = _CopyWithImpl$Variables$Mutation$createUser;

  factory CopyWith$Variables$Mutation$createUser.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$createUser;

  TRes call({
    String? firebaseId,
    Enum$Frequency? frequency,
    Enum$Genders? gender,
    List<Enum$Categories>? categories,
  });
}

class _CopyWithImpl$Variables$Mutation$createUser<TRes>
    implements CopyWith$Variables$Mutation$createUser<TRes> {
  _CopyWithImpl$Variables$Mutation$createUser(
    this._instance,
    this._then,
  );

  final Variables$Mutation$createUser _instance;

  final TRes Function(Variables$Mutation$createUser) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? firebaseId = _undefined,
    Object? frequency = _undefined,
    Object? gender = _undefined,
    Object? categories = _undefined,
  }) =>
      _then(Variables$Mutation$createUser._({
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

class _CopyWithStubImpl$Variables$Mutation$createUser<TRes>
    implements CopyWith$Variables$Mutation$createUser<TRes> {
  _CopyWithStubImpl$Variables$Mutation$createUser(this._res);

  TRes _res;

  call({
    String? firebaseId,
    Enum$Frequency? frequency,
    Enum$Genders? gender,
    List<Enum$Categories>? categories,
  }) =>
      _res;
}

class Mutation$createUser {
  Mutation$createUser({
    required this.createUser,
    this.$__typename = 'Mutation',
  });

  factory Mutation$createUser.fromJson(Map<String, dynamic> json) {
    final l$createUser = json['createUser'];
    final l$$__typename = json['__typename'];
    return Mutation$createUser(
      createUser: Mutation$createUser$createUser.fromJson(
          (l$createUser as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$createUser$createUser createUser;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$createUser = createUser;
    _resultData['createUser'] = l$createUser.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$createUser = createUser;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$createUser,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$createUser) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$createUser = createUser;
    final lOther$createUser = other.createUser;
    if (l$createUser != lOther$createUser) {
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

extension UtilityExtension$Mutation$createUser on Mutation$createUser {
  CopyWith$Mutation$createUser<Mutation$createUser> get copyWith =>
      CopyWith$Mutation$createUser(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$createUser<TRes> {
  factory CopyWith$Mutation$createUser(
    Mutation$createUser instance,
    TRes Function(Mutation$createUser) then,
  ) = _CopyWithImpl$Mutation$createUser;

  factory CopyWith$Mutation$createUser.stub(TRes res) =
      _CopyWithStubImpl$Mutation$createUser;

  TRes call({
    Mutation$createUser$createUser? createUser,
    String? $__typename,
  });
  CopyWith$Mutation$createUser$createUser<TRes> get createUser;
}

class _CopyWithImpl$Mutation$createUser<TRes>
    implements CopyWith$Mutation$createUser<TRes> {
  _CopyWithImpl$Mutation$createUser(
    this._instance,
    this._then,
  );

  final Mutation$createUser _instance;

  final TRes Function(Mutation$createUser) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? createUser = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$createUser(
        createUser: createUser == _undefined || createUser == null
            ? _instance.createUser
            : (createUser as Mutation$createUser$createUser),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$createUser$createUser<TRes> get createUser {
    final local$createUser = _instance.createUser;
    return CopyWith$Mutation$createUser$createUser(
        local$createUser, (e) => call(createUser: e));
  }
}

class _CopyWithStubImpl$Mutation$createUser<TRes>
    implements CopyWith$Mutation$createUser<TRes> {
  _CopyWithStubImpl$Mutation$createUser(this._res);

  TRes _res;

  call({
    Mutation$createUser$createUser? createUser,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$createUser$createUser<TRes> get createUser =>
      CopyWith$Mutation$createUser$createUser.stub(_res);
}

const documentNodeMutationcreateUser = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'createUser'),
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
        name: NameNode(value: 'createUser'),
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
Mutation$createUser _parserFn$Mutation$createUser(Map<String, dynamic> data) =>
    Mutation$createUser.fromJson(data);
typedef OnMutationCompleted$Mutation$createUser = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$createUser?,
);

class Options$Mutation$createUser
    extends graphql.MutationOptions<Mutation$createUser> {
  Options$Mutation$createUser({
    String? operationName,
    required Variables$Mutation$createUser variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$createUser? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$createUser? onCompleted,
    graphql.OnMutationUpdate<Mutation$createUser>? update,
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
                    data == null ? null : _parserFn$Mutation$createUser(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationcreateUser,
          parserFn: _parserFn$Mutation$createUser,
        );

  final OnMutationCompleted$Mutation$createUser? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$createUser
    extends graphql.WatchQueryOptions<Mutation$createUser> {
  WatchOptions$Mutation$createUser({
    String? operationName,
    required Variables$Mutation$createUser variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$createUser? typedOptimisticResult,
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
          document: documentNodeMutationcreateUser,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$createUser,
        );
}

extension ClientExtension$Mutation$createUser on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$createUser>> mutate$createUser(
          Options$Mutation$createUser options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$createUser> watchMutation$createUser(
          WatchOptions$Mutation$createUser options) =>
      this.watchMutation(options);
}

class Mutation$createUser$HookResult {
  Mutation$createUser$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$createUser runMutation;

  final graphql.QueryResult<Mutation$createUser> result;
}

Mutation$createUser$HookResult useMutation$createUser(
    [WidgetOptions$Mutation$createUser? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$createUser());
  return Mutation$createUser$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$createUser> useWatchMutation$createUser(
        WatchOptions$Mutation$createUser options) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$createUser
    extends graphql.MutationOptions<Mutation$createUser> {
  WidgetOptions$Mutation$createUser({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$createUser? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$createUser? onCompleted,
    graphql.OnMutationUpdate<Mutation$createUser>? update,
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
                    data == null ? null : _parserFn$Mutation$createUser(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationcreateUser,
          parserFn: _parserFn$Mutation$createUser,
        );

  final OnMutationCompleted$Mutation$createUser? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$createUser
    = graphql.MultiSourceResult<Mutation$createUser> Function(
  Variables$Mutation$createUser, {
  Object? optimisticResult,
  Mutation$createUser? typedOptimisticResult,
});
typedef Builder$Mutation$createUser = widgets.Widget Function(
  RunMutation$Mutation$createUser,
  graphql.QueryResult<Mutation$createUser>?,
);

class Mutation$createUser$Widget
    extends graphql_flutter.Mutation<Mutation$createUser> {
  Mutation$createUser$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$createUser? options,
    required Builder$Mutation$createUser builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$createUser(),
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

class Mutation$createUser$createUser {
  Mutation$createUser$createUser({
    required this.firebaseId,
    required this.gender,
    required this.frequency,
    required this.categories,
    this.$__typename = 'UserType',
  });

  factory Mutation$createUser$createUser.fromJson(Map<String, dynamic> json) {
    final l$firebaseId = json['firebaseId'];
    final l$gender = json['gender'];
    final l$frequency = json['frequency'];
    final l$categories = json['categories'];
    final l$$__typename = json['__typename'];
    return Mutation$createUser$createUser(
      firebaseId: (l$firebaseId as String),
      gender: fromJson$Enum$Genders((l$gender as String)),
      frequency: fromJson$Enum$Frequency((l$frequency as String)),
      categories: (l$categories as List<dynamic>)
          .map((e) => fromJson$Enum$Categories((e as String)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final String firebaseId;

  final Enum$Genders gender;

  final Enum$Frequency frequency;

  final List<Enum$Categories> categories;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
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
    final l$firebaseId = firebaseId;
    final l$gender = gender;
    final l$frequency = frequency;
    final l$categories = categories;
    final l$$__typename = $__typename;
    return Object.hashAll([
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
    if (!(other is Mutation$createUser$createUser) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Mutation$createUser$createUser
    on Mutation$createUser$createUser {
  CopyWith$Mutation$createUser$createUser<Mutation$createUser$createUser>
      get copyWith => CopyWith$Mutation$createUser$createUser(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$createUser$createUser<TRes> {
  factory CopyWith$Mutation$createUser$createUser(
    Mutation$createUser$createUser instance,
    TRes Function(Mutation$createUser$createUser) then,
  ) = _CopyWithImpl$Mutation$createUser$createUser;

  factory CopyWith$Mutation$createUser$createUser.stub(TRes res) =
      _CopyWithStubImpl$Mutation$createUser$createUser;

  TRes call({
    String? firebaseId,
    Enum$Genders? gender,
    Enum$Frequency? frequency,
    List<Enum$Categories>? categories,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$createUser$createUser<TRes>
    implements CopyWith$Mutation$createUser$createUser<TRes> {
  _CopyWithImpl$Mutation$createUser$createUser(
    this._instance,
    this._then,
  );

  final Mutation$createUser$createUser _instance;

  final TRes Function(Mutation$createUser$createUser) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? firebaseId = _undefined,
    Object? gender = _undefined,
    Object? frequency = _undefined,
    Object? categories = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$createUser$createUser(
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

class _CopyWithStubImpl$Mutation$createUser$createUser<TRes>
    implements CopyWith$Mutation$createUser$createUser<TRes> {
  _CopyWithStubImpl$Mutation$createUser$createUser(this._res);

  TRes _res;

  call({
    String? firebaseId,
    Enum$Genders? gender,
    Enum$Frequency? frequency,
    List<Enum$Categories>? categories,
    String? $__typename,
  }) =>
      _res;
}
