import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;
import 'schema.graphql.dart';

class Variables$Query$findRandom {
  factory Variables$Query$findRandom({
    required List<Enum$Categories> categories,
    required Enum$Genders gender,
  }) =>
      Variables$Query$findRandom._({
        r'categories': categories,
        r'gender': gender,
      });

  Variables$Query$findRandom._(this._$data);

  factory Variables$Query$findRandom.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$categories = data['categories'];
    result$data['categories'] = (l$categories as List<dynamic>)
        .map((e) => fromJson$Enum$Categories((e as String)))
        .toList();
    final l$gender = data['gender'];
    result$data['gender'] = fromJson$Enum$Genders((l$gender as String));
    return Variables$Query$findRandom._(result$data);
  }

  Map<String, dynamic> _$data;

  List<Enum$Categories> get categories =>
      (_$data['categories'] as List<Enum$Categories>);

  Enum$Genders get gender => (_$data['gender'] as Enum$Genders);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$categories = categories;
    result$data['categories'] =
        l$categories.map((e) => toJson$Enum$Categories(e)).toList();
    final l$gender = gender;
    result$data['gender'] = toJson$Enum$Genders(l$gender);
    return result$data;
  }

  CopyWith$Variables$Query$findRandom<Variables$Query$findRandom>
      get copyWith => CopyWith$Variables$Query$findRandom(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$findRandom) ||
        runtimeType != other.runtimeType) {
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
    final l$gender = gender;
    final lOther$gender = other.gender;
    if (l$gender != lOther$gender) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$categories = categories;
    final l$gender = gender;
    return Object.hashAll([
      Object.hashAll(l$categories.map((v) => v)),
      l$gender,
    ]);
  }
}

abstract class CopyWith$Variables$Query$findRandom<TRes> {
  factory CopyWith$Variables$Query$findRandom(
    Variables$Query$findRandom instance,
    TRes Function(Variables$Query$findRandom) then,
  ) = _CopyWithImpl$Variables$Query$findRandom;

  factory CopyWith$Variables$Query$findRandom.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$findRandom;

  TRes call({
    List<Enum$Categories>? categories,
    Enum$Genders? gender,
  });
}

class _CopyWithImpl$Variables$Query$findRandom<TRes>
    implements CopyWith$Variables$Query$findRandom<TRes> {
  _CopyWithImpl$Variables$Query$findRandom(
    this._instance,
    this._then,
  );

  final Variables$Query$findRandom _instance;

  final TRes Function(Variables$Query$findRandom) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? categories = _undefined,
    Object? gender = _undefined,
  }) =>
      _then(Variables$Query$findRandom._({
        ..._instance._$data,
        if (categories != _undefined && categories != null)
          'categories': (categories as List<Enum$Categories>),
        if (gender != _undefined && gender != null)
          'gender': (gender as Enum$Genders),
      }));
}

class _CopyWithStubImpl$Variables$Query$findRandom<TRes>
    implements CopyWith$Variables$Query$findRandom<TRes> {
  _CopyWithStubImpl$Variables$Query$findRandom(this._res);

  TRes _res;

  call({
    List<Enum$Categories>? categories,
    Enum$Genders? gender,
  }) =>
      _res;
}

class Query$findRandom {
  Query$findRandom({
    required this.findRandom,
    this.$__typename = 'Query',
  });

  factory Query$findRandom.fromJson(Map<String, dynamic> json) {
    final l$findRandom = json['findRandom'];
    final l$$__typename = json['__typename'];
    return Query$findRandom(
      findRandom: (l$findRandom as List<dynamic>)
          .map((e) =>
              Query$findRandom$findRandom.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$findRandom$findRandom> findRandom;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$findRandom = findRandom;
    _resultData['findRandom'] = l$findRandom.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$findRandom = findRandom;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$findRandom.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$findRandom) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$findRandom = findRandom;
    final lOther$findRandom = other.findRandom;
    if (l$findRandom.length != lOther$findRandom.length) {
      return false;
    }
    for (int i = 0; i < l$findRandom.length; i++) {
      final l$findRandom$entry = l$findRandom[i];
      final lOther$findRandom$entry = lOther$findRandom[i];
      if (l$findRandom$entry != lOther$findRandom$entry) {
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

extension UtilityExtension$Query$findRandom on Query$findRandom {
  CopyWith$Query$findRandom<Query$findRandom> get copyWith =>
      CopyWith$Query$findRandom(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$findRandom<TRes> {
  factory CopyWith$Query$findRandom(
    Query$findRandom instance,
    TRes Function(Query$findRandom) then,
  ) = _CopyWithImpl$Query$findRandom;

  factory CopyWith$Query$findRandom.stub(TRes res) =
      _CopyWithStubImpl$Query$findRandom;

  TRes call({
    List<Query$findRandom$findRandom>? findRandom,
    String? $__typename,
  });
  TRes findRandom(
      Iterable<Query$findRandom$findRandom> Function(
              Iterable<
                  CopyWith$Query$findRandom$findRandom<
                      Query$findRandom$findRandom>>)
          _fn);
}

class _CopyWithImpl$Query$findRandom<TRes>
    implements CopyWith$Query$findRandom<TRes> {
  _CopyWithImpl$Query$findRandom(
    this._instance,
    this._then,
  );

  final Query$findRandom _instance;

  final TRes Function(Query$findRandom) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? findRandom = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$findRandom(
        findRandom: findRandom == _undefined || findRandom == null
            ? _instance.findRandom
            : (findRandom as List<Query$findRandom$findRandom>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes findRandom(
          Iterable<Query$findRandom$findRandom> Function(
                  Iterable<
                      CopyWith$Query$findRandom$findRandom<
                          Query$findRandom$findRandom>>)
              _fn) =>
      call(
          findRandom: _fn(_instance.findRandom
              .map((e) => CopyWith$Query$findRandom$findRandom(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$findRandom<TRes>
    implements CopyWith$Query$findRandom<TRes> {
  _CopyWithStubImpl$Query$findRandom(this._res);

  TRes _res;

  call({
    List<Query$findRandom$findRandom>? findRandom,
    String? $__typename,
  }) =>
      _res;

  findRandom(_fn) => _res;
}

const documentNodeQueryfindRandom = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'findRandom'),
    variableDefinitions: [
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
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'gender')),
        type: NamedTypeNode(
          name: NameNode(value: 'Genders'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'findRandom'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'category'),
            value: VariableNode(name: NameNode(value: 'categories')),
          ),
          ArgumentNode(
            name: NameNode(value: 'gender'),
            value: VariableNode(name: NameNode(value: 'gender')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'string'),
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
Query$findRandom _parserFn$Query$findRandom(Map<String, dynamic> data) =>
    Query$findRandom.fromJson(data);
typedef OnQueryComplete$Query$findRandom = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$findRandom?,
);

class Options$Query$findRandom extends graphql.QueryOptions<Query$findRandom> {
  Options$Query$findRandom({
    String? operationName,
    required Variables$Query$findRandom variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$findRandom? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$findRandom? onComplete,
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
                    data == null ? null : _parserFn$Query$findRandom(data),
                  ),
          onError: onError,
          document: documentNodeQueryfindRandom,
          parserFn: _parserFn$Query$findRandom,
        );

  final OnQueryComplete$Query$findRandom? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$findRandom
    extends graphql.WatchQueryOptions<Query$findRandom> {
  WatchOptions$Query$findRandom({
    String? operationName,
    required Variables$Query$findRandom variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$findRandom? typedOptimisticResult,
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
          document: documentNodeQueryfindRandom,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$findRandom,
        );
}

class FetchMoreOptions$Query$findRandom extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$findRandom({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$findRandom variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryfindRandom,
        );
}

extension ClientExtension$Query$findRandom on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$findRandom>> query$findRandom(
          Options$Query$findRandom options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$findRandom> watchQuery$findRandom(
          WatchOptions$Query$findRandom options) =>
      this.watchQuery(options);
  void writeQuery$findRandom({
    required Query$findRandom data,
    required Variables$Query$findRandom variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(document: documentNodeQueryfindRandom),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$findRandom? readQuery$findRandom({
    required Variables$Query$findRandom variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryfindRandom),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$findRandom.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$findRandom> useQuery$findRandom(
        Options$Query$findRandom options) =>
    graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$findRandom> useWatchQuery$findRandom(
        WatchOptions$Query$findRandom options) =>
    graphql_flutter.useWatchQuery(options);

class Query$findRandom$Widget extends graphql_flutter.Query<Query$findRandom> {
  Query$findRandom$Widget({
    widgets.Key? key,
    required Options$Query$findRandom options,
    required graphql_flutter.QueryBuilder<Query$findRandom> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$findRandom$findRandom {
  Query$findRandom$findRandom({
    required this.string,
    this.$__typename = 'QuestionType',
  });

  factory Query$findRandom$findRandom.fromJson(Map<String, dynamic> json) {
    final l$string = json['string'];
    final l$$__typename = json['__typename'];
    return Query$findRandom$findRandom(
      string: (l$string as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String string;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$string = string;
    _resultData['string'] = l$string;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$string = string;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$string,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$findRandom$findRandom) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$string = string;
    final lOther$string = other.string;
    if (l$string != lOther$string) {
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

extension UtilityExtension$Query$findRandom$findRandom
    on Query$findRandom$findRandom {
  CopyWith$Query$findRandom$findRandom<Query$findRandom$findRandom>
      get copyWith => CopyWith$Query$findRandom$findRandom(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$findRandom$findRandom<TRes> {
  factory CopyWith$Query$findRandom$findRandom(
    Query$findRandom$findRandom instance,
    TRes Function(Query$findRandom$findRandom) then,
  ) = _CopyWithImpl$Query$findRandom$findRandom;

  factory CopyWith$Query$findRandom$findRandom.stub(TRes res) =
      _CopyWithStubImpl$Query$findRandom$findRandom;

  TRes call({
    String? string,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$findRandom$findRandom<TRes>
    implements CopyWith$Query$findRandom$findRandom<TRes> {
  _CopyWithImpl$Query$findRandom$findRandom(
    this._instance,
    this._then,
  );

  final Query$findRandom$findRandom _instance;

  final TRes Function(Query$findRandom$findRandom) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? string = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$findRandom$findRandom(
        string: string == _undefined || string == null
            ? _instance.string
            : (string as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$findRandom$findRandom<TRes>
    implements CopyWith$Query$findRandom$findRandom<TRes> {
  _CopyWithStubImpl$Query$findRandom$findRandom(this._res);

  TRes _res;

  call({
    String? string,
    String? $__typename,
  }) =>
      _res;
}
