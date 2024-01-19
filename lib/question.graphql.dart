import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Query$findRandomQuestionsByUserId {
  factory Variables$Query$findRandomQuestionsByUserId(
          {required String userId}) =>
      Variables$Query$findRandomQuestionsByUserId._({
        r'userId': userId,
      });

  Variables$Query$findRandomQuestionsByUserId._(this._$data);

  factory Variables$Query$findRandomQuestionsByUserId.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$userId = data['userId'];
    result$data['userId'] = (l$userId as String);
    return Variables$Query$findRandomQuestionsByUserId._(result$data);
  }

  Map<String, dynamic> _$data;

  String get userId => (_$data['userId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$userId = userId;
    result$data['userId'] = l$userId;
    return result$data;
  }

  CopyWith$Variables$Query$findRandomQuestionsByUserId<
          Variables$Query$findRandomQuestionsByUserId>
      get copyWith => CopyWith$Variables$Query$findRandomQuestionsByUserId(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$findRandomQuestionsByUserId) ||
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

abstract class CopyWith$Variables$Query$findRandomQuestionsByUserId<TRes> {
  factory CopyWith$Variables$Query$findRandomQuestionsByUserId(
    Variables$Query$findRandomQuestionsByUserId instance,
    TRes Function(Variables$Query$findRandomQuestionsByUserId) then,
  ) = _CopyWithImpl$Variables$Query$findRandomQuestionsByUserId;

  factory CopyWith$Variables$Query$findRandomQuestionsByUserId.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$findRandomQuestionsByUserId;

  TRes call({String? userId});
}

class _CopyWithImpl$Variables$Query$findRandomQuestionsByUserId<TRes>
    implements CopyWith$Variables$Query$findRandomQuestionsByUserId<TRes> {
  _CopyWithImpl$Variables$Query$findRandomQuestionsByUserId(
    this._instance,
    this._then,
  );

  final Variables$Query$findRandomQuestionsByUserId _instance;

  final TRes Function(Variables$Query$findRandomQuestionsByUserId) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? userId = _undefined}) =>
      _then(Variables$Query$findRandomQuestionsByUserId._({
        ..._instance._$data,
        if (userId != _undefined && userId != null)
          'userId': (userId as String),
      }));
}

class _CopyWithStubImpl$Variables$Query$findRandomQuestionsByUserId<TRes>
    implements CopyWith$Variables$Query$findRandomQuestionsByUserId<TRes> {
  _CopyWithStubImpl$Variables$Query$findRandomQuestionsByUserId(this._res);

  TRes _res;

  call({String? userId}) => _res;
}

class Query$findRandomQuestionsByUserId {
  Query$findRandomQuestionsByUserId({
    required this.findRandomQuestionsByUserId,
    this.$__typename = 'Query',
  });

  factory Query$findRandomQuestionsByUserId.fromJson(
      Map<String, dynamic> json) {
    final l$findRandomQuestionsByUserId = json['findRandomQuestionsByUserId'];
    final l$$__typename = json['__typename'];
    return Query$findRandomQuestionsByUserId(
      findRandomQuestionsByUserId:
          (l$findRandomQuestionsByUserId as List<dynamic>)
              .map((e) =>
                  Query$findRandomQuestionsByUserId$findRandomQuestionsByUserId
                      .fromJson((e as Map<String, dynamic>)))
              .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$findRandomQuestionsByUserId$findRandomQuestionsByUserId>
      findRandomQuestionsByUserId;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$findRandomQuestionsByUserId = findRandomQuestionsByUserId;
    _resultData['findRandomQuestionsByUserId'] =
        l$findRandomQuestionsByUserId.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$findRandomQuestionsByUserId = findRandomQuestionsByUserId;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$findRandomQuestionsByUserId.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$findRandomQuestionsByUserId) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$findRandomQuestionsByUserId = findRandomQuestionsByUserId;
    final lOther$findRandomQuestionsByUserId =
        other.findRandomQuestionsByUserId;
    if (l$findRandomQuestionsByUserId.length !=
        lOther$findRandomQuestionsByUserId.length) {
      return false;
    }
    for (int i = 0; i < l$findRandomQuestionsByUserId.length; i++) {
      final l$findRandomQuestionsByUserId$entry =
          l$findRandomQuestionsByUserId[i];
      final lOther$findRandomQuestionsByUserId$entry =
          lOther$findRandomQuestionsByUserId[i];
      if (l$findRandomQuestionsByUserId$entry !=
          lOther$findRandomQuestionsByUserId$entry) {
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

extension UtilityExtension$Query$findRandomQuestionsByUserId
    on Query$findRandomQuestionsByUserId {
  CopyWith$Query$findRandomQuestionsByUserId<Query$findRandomQuestionsByUserId>
      get copyWith => CopyWith$Query$findRandomQuestionsByUserId(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$findRandomQuestionsByUserId<TRes> {
  factory CopyWith$Query$findRandomQuestionsByUserId(
    Query$findRandomQuestionsByUserId instance,
    TRes Function(Query$findRandomQuestionsByUserId) then,
  ) = _CopyWithImpl$Query$findRandomQuestionsByUserId;

  factory CopyWith$Query$findRandomQuestionsByUserId.stub(TRes res) =
      _CopyWithStubImpl$Query$findRandomQuestionsByUserId;

  TRes call({
    List<Query$findRandomQuestionsByUserId$findRandomQuestionsByUserId>?
        findRandomQuestionsByUserId,
    String? $__typename,
  });
  TRes findRandomQuestionsByUserId(
      Iterable<Query$findRandomQuestionsByUserId$findRandomQuestionsByUserId> Function(
              Iterable<
                  CopyWith$Query$findRandomQuestionsByUserId$findRandomQuestionsByUserId<
                      Query$findRandomQuestionsByUserId$findRandomQuestionsByUserId>>)
          _fn);
}

class _CopyWithImpl$Query$findRandomQuestionsByUserId<TRes>
    implements CopyWith$Query$findRandomQuestionsByUserId<TRes> {
  _CopyWithImpl$Query$findRandomQuestionsByUserId(
    this._instance,
    this._then,
  );

  final Query$findRandomQuestionsByUserId _instance;

  final TRes Function(Query$findRandomQuestionsByUserId) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? findRandomQuestionsByUserId = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$findRandomQuestionsByUserId(
        findRandomQuestionsByUserId: findRandomQuestionsByUserId ==
                    _undefined ||
                findRandomQuestionsByUserId == null
            ? _instance.findRandomQuestionsByUserId
            : (findRandomQuestionsByUserId as List<
                Query$findRandomQuestionsByUserId$findRandomQuestionsByUserId>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes findRandomQuestionsByUserId(
          Iterable<Query$findRandomQuestionsByUserId$findRandomQuestionsByUserId> Function(
                  Iterable<
                      CopyWith$Query$findRandomQuestionsByUserId$findRandomQuestionsByUserId<
                          Query$findRandomQuestionsByUserId$findRandomQuestionsByUserId>>)
              _fn) =>
      call(
          findRandomQuestionsByUserId: _fn(_instance.findRandomQuestionsByUserId
              .map((e) =>
                  CopyWith$Query$findRandomQuestionsByUserId$findRandomQuestionsByUserId(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$findRandomQuestionsByUserId<TRes>
    implements CopyWith$Query$findRandomQuestionsByUserId<TRes> {
  _CopyWithStubImpl$Query$findRandomQuestionsByUserId(this._res);

  TRes _res;

  call({
    List<Query$findRandomQuestionsByUserId$findRandomQuestionsByUserId>?
        findRandomQuestionsByUserId,
    String? $__typename,
  }) =>
      _res;

  findRandomQuestionsByUserId(_fn) => _res;
}

const documentNodeQueryfindRandomQuestionsByUserId = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'findRandomQuestionsByUserId'),
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
        name: NameNode(value: 'findRandomQuestionsByUserId'),
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
            name: NameNode(value: '_id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
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
Query$findRandomQuestionsByUserId _parserFn$Query$findRandomQuestionsByUserId(
        Map<String, dynamic> data) =>
    Query$findRandomQuestionsByUserId.fromJson(data);
typedef OnQueryComplete$Query$findRandomQuestionsByUserId = FutureOr<void>
    Function(
  Map<String, dynamic>?,
  Query$findRandomQuestionsByUserId?,
);

class Options$Query$findRandomQuestionsByUserId
    extends graphql.QueryOptions<Query$findRandomQuestionsByUserId> {
  Options$Query$findRandomQuestionsByUserId({
    String? operationName,
    required Variables$Query$findRandomQuestionsByUserId variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$findRandomQuestionsByUserId? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$findRandomQuestionsByUserId? onComplete,
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
                    data == null
                        ? null
                        : _parserFn$Query$findRandomQuestionsByUserId(data),
                  ),
          onError: onError,
          document: documentNodeQueryfindRandomQuestionsByUserId,
          parserFn: _parserFn$Query$findRandomQuestionsByUserId,
        );

  final OnQueryComplete$Query$findRandomQuestionsByUserId? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$findRandomQuestionsByUserId
    extends graphql.WatchQueryOptions<Query$findRandomQuestionsByUserId> {
  WatchOptions$Query$findRandomQuestionsByUserId({
    String? operationName,
    required Variables$Query$findRandomQuestionsByUserId variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$findRandomQuestionsByUserId? typedOptimisticResult,
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
          document: documentNodeQueryfindRandomQuestionsByUserId,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$findRandomQuestionsByUserId,
        );
}

class FetchMoreOptions$Query$findRandomQuestionsByUserId
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$findRandomQuestionsByUserId({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$findRandomQuestionsByUserId variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryfindRandomQuestionsByUserId,
        );
}

extension ClientExtension$Query$findRandomQuestionsByUserId
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$findRandomQuestionsByUserId>>
      query$findRandomQuestionsByUserId(
              Options$Query$findRandomQuestionsByUserId options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$findRandomQuestionsByUserId>
      watchQuery$findRandomQuestionsByUserId(
              WatchOptions$Query$findRandomQuestionsByUserId options) =>
          this.watchQuery(options);
  void writeQuery$findRandomQuestionsByUserId({
    required Query$findRandomQuestionsByUserId data,
    required Variables$Query$findRandomQuestionsByUserId variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryfindRandomQuestionsByUserId),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$findRandomQuestionsByUserId? readQuery$findRandomQuestionsByUserId({
    required Variables$Query$findRandomQuestionsByUserId variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQueryfindRandomQuestionsByUserId),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$findRandomQuestionsByUserId.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$findRandomQuestionsByUserId>
    useQuery$findRandomQuestionsByUserId(
            Options$Query$findRandomQuestionsByUserId options) =>
        graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$findRandomQuestionsByUserId>
    useWatchQuery$findRandomQuestionsByUserId(
            WatchOptions$Query$findRandomQuestionsByUserId options) =>
        graphql_flutter.useWatchQuery(options);

class Query$findRandomQuestionsByUserId$Widget
    extends graphql_flutter.Query<Query$findRandomQuestionsByUserId> {
  Query$findRandomQuestionsByUserId$Widget({
    widgets.Key? key,
    required Options$Query$findRandomQuestionsByUserId options,
    required graphql_flutter.QueryBuilder<Query$findRandomQuestionsByUserId>
        builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$findRandomQuestionsByUserId$findRandomQuestionsByUserId {
  Query$findRandomQuestionsByUserId$findRandomQuestionsByUserId({
    required this.$_id,
    required this.string,
    this.$__typename = 'QuestionType',
  });

  factory Query$findRandomQuestionsByUserId$findRandomQuestionsByUserId.fromJson(
      Map<String, dynamic> json) {
    final l$$_id = json['_id'];
    final l$string = json['string'];
    final l$$__typename = json['__typename'];
    return Query$findRandomQuestionsByUserId$findRandomQuestionsByUserId(
      $_id: (l$$_id as String),
      string: (l$string as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String $_id;

  final String string;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$_id = $_id;
    _resultData['_id'] = l$$_id;
    final l$string = string;
    _resultData['string'] = l$string;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$_id = $_id;
    final l$string = string;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$$_id,
      l$string,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$findRandomQuestionsByUserId$findRandomQuestionsByUserId) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$_id = $_id;
    final lOther$$_id = other.$_id;
    if (l$$_id != lOther$$_id) {
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

extension UtilityExtension$Query$findRandomQuestionsByUserId$findRandomQuestionsByUserId
    on Query$findRandomQuestionsByUserId$findRandomQuestionsByUserId {
  CopyWith$Query$findRandomQuestionsByUserId$findRandomQuestionsByUserId<
          Query$findRandomQuestionsByUserId$findRandomQuestionsByUserId>
      get copyWith =>
          CopyWith$Query$findRandomQuestionsByUserId$findRandomQuestionsByUserId(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$findRandomQuestionsByUserId$findRandomQuestionsByUserId<
    TRes> {
  factory CopyWith$Query$findRandomQuestionsByUserId$findRandomQuestionsByUserId(
    Query$findRandomQuestionsByUserId$findRandomQuestionsByUserId instance,
    TRes Function(Query$findRandomQuestionsByUserId$findRandomQuestionsByUserId)
        then,
  ) = _CopyWithImpl$Query$findRandomQuestionsByUserId$findRandomQuestionsByUserId;

  factory CopyWith$Query$findRandomQuestionsByUserId$findRandomQuestionsByUserId.stub(
          TRes res) =
      _CopyWithStubImpl$Query$findRandomQuestionsByUserId$findRandomQuestionsByUserId;

  TRes call({
    String? $_id,
    String? string,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$findRandomQuestionsByUserId$findRandomQuestionsByUserId<
        TRes>
    implements
        CopyWith$Query$findRandomQuestionsByUserId$findRandomQuestionsByUserId<
            TRes> {
  _CopyWithImpl$Query$findRandomQuestionsByUserId$findRandomQuestionsByUserId(
    this._instance,
    this._then,
  );

  final Query$findRandomQuestionsByUserId$findRandomQuestionsByUserId _instance;

  final TRes Function(
      Query$findRandomQuestionsByUserId$findRandomQuestionsByUserId) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? $_id = _undefined,
    Object? string = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$findRandomQuestionsByUserId$findRandomQuestionsByUserId(
        $_id: $_id == _undefined || $_id == null
            ? _instance.$_id
            : ($_id as String),
        string: string == _undefined || string == null
            ? _instance.string
            : (string as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$findRandomQuestionsByUserId$findRandomQuestionsByUserId<
        TRes>
    implements
        CopyWith$Query$findRandomQuestionsByUserId$findRandomQuestionsByUserId<
            TRes> {
  _CopyWithStubImpl$Query$findRandomQuestionsByUserId$findRandomQuestionsByUserId(
      this._res);

  TRes _res;

  call({
    String? $_id,
    String? string,
    String? $__typename,
  }) =>
      _res;
}
