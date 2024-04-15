import 'package:empowering_questions_mobile/provider/interfaces/base_provider_interface.dart';
import 'package:flutter/material.dart';

class BaseProvider extends ChangeNotifier implements BaseProviderInterface {
  bool _isLoading = false;
  bool _hasError = false;

  @override
  bool get isLoading => _isLoading;

  @override
  bool get hasError => _hasError;

  @override
  void setHasError(bool hasError) {
    _hasError = hasError;
  }

  @override
  void setIsLoading(bool isLoading) {
    _isLoading = isLoading;
  }
}
