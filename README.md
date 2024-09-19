# crossmark-dart

[![Dart](https://img.shields.io/badge/Dart-%230175C2.svg?style=for-the-badge&logo=Dart&logoColor=white)](https://dart.dev)
[![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)](https://flutter.dev)

crossmark-dart is a Dart package that provides bindings to the [`Crossmark`](https://crossmark.io/) browser wallet, allowing developers to interact with Crossmark in Dart applications.

## Features

This package is a work in progress and does not yet fully replicate the functionality of Crossmark. However, it offers key features such as:

- Checking if the Crossmark wallet is installed
- Signing in with the wallet
- Signing and submitting transactions
- Connecting to the wallet asynchronously

## Installation

To use the `crossmark-dart` package, include it in your `pubspec.yaml`:

```yaml
dependencies:
  crossmark:
    git: https://github.com/Dhali-org/crossmark.dart.git
```

Next, include the Crossmark SDK script in your HTML:

```html
<script type="module" src="https://unpkg.com/@crossmarkio/sdk@0.4.1-b.1"></script>
```

## Usage

Here are some examples of how to use the bindings provided by `crossmark-dart`.

### Checking if the Wallet is Installed

```dart
import 'package:crossmark/crossmark.dart';

void main() {
  bool isInstalled = CrossmarkSdk.isInstalled();
  if (isInstalled) {
    print('Crossmark wallet is installed.');
  } else {
    print('Crossmark wallet is not installed.');
  }
}
```

### Signing In

```dart
import 'package:crossmark/crossmark.dart';

void main() async {
  final response = await CrossmarkSdk.signInAndWait('hex_string');
  print('Signed in with address: ${response.response.data.address}');
}
```

### Connecting to the Wallet

```dart
import 'package:crossmark/crossmark.dart';

void main() async {
  bool connected = await CrossmarkSdk.connect();
  if (connected) {
    print('Connected to Crossmark wallet.');
  } else {
    print('Failed to connect to Crossmark wallet.');
  }
}
```

### Signing and Submitting a Transaction

```dart
import 'package:crossmark/crossmark.dart';

void main() async {
  Transaction transaction = Transaction(
    TransactionType: 'Payment',
    Account: 'account_string',
    Destination: 'destination_string',
    Amount: '100',
  );

  final response = await CrossmarkSdk.signAndSubmitAndWait(transaction);
  print('Transaction submitted with address: ${response.response.data.address}');
}
```

## Contributing

Contributions to crossmark-dart are welcome! To contribute, please fork the repository and submit a pull request. Before submitting a pull request, please make sure that your code follows the [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style).

## License

crossmark-dart is licensed under the BSD-3-Clause License. See the LICENSE file for more information.
