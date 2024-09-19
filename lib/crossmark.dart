@JS('crossmarkSdk.default')
library crossmark_sdk;

import 'dart:developer';

import 'package:js/js.dart';
import 'package:node_interop/util.dart';

class CrossmarkSdk {
  static dynamic isInstalled() {
    return _isInstalled();
  }

  static dynamic signIn(String? hex) {
    return _signIn(hex);
  }

  static dynamic signAndSubmit(Transaction tx) async {
    return _signAndSubmit(tx);
  }

  static Future<Response> signInAndWait(String? hex) async {
    return await promiseToFuture(_signInAndWait(hex));
  }

  static Future<bool> connect() async {
    return await promiseToFuture(_connect());
  }

  static Future<Response> signAndSubmitAndWait(Transaction tx) async {
    return await promiseToFuture(_signAndSubmitAndWait(tx));
  }
}

@JS('sync.isInstalled')
external dynamic _isInstalled();

// Declare the external JavaScript function for `signInAndWait`.
@JS('sync.signIn')
external dynamic _signIn(String? hex);

// Declare the external JavaScript function for `signInAndWait`.
@JS('async.connect')
external dynamic _connect();

// Declare the external JavaScript function for `signInAndWait`.
@JS('async.signInAndWait')
external dynamic _signInAndWait(String? hex);

// Declare the external JavaScript function for `signAndSubmit`.
@JS('async.signAndSubmit')
external dynamic _signAndSubmit(Transaction request);

@JS('async.signAndSubmitAndWait')
external dynamic _signAndSubmitAndWait(Transaction request);

// The response structure for the `signInAndWait` method.
@JS()
@anonymous
class Response {
  external SignInResponseData get response;

  external factory Response({
    Response response,
  });
}

@JS()
@anonymous
class SignInResponseData {
  external SignInResponseDataObject get data;

  external factory SignInResponseData({
    SignInResponseData data,
  });
}

@JS()
@anonymous
class SignInResponseDataObject {
  external String get address;
  external String get publicKey;
  external String? get signature;
  external NetworkData get network;

  external factory SignInResponseDataObject({
    String address,
    String publicKey,
    String? signature,
    NetworkData network,
  });
}

@JS()
@anonymous
class NetworkData {
  external String get label;
  external String get protocol;
  external String get type;

  external factory NetworkData({
    String label,
    String protocol,
    String type,
  });
}

// The request and response structures for `signAndSubmit`.
@JS()
@anonymous
class Transaction {
  external factory Transaction(
      {String TransactionType,
      String Account,
      String Destination,
      String Channel,
      String Amount,
      int SettleDelay,
      String PublicKey});
}
