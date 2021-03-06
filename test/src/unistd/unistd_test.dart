import 'dart:ffi';
import 'dart:io';
import 'package:ffi/ffi.dart';
import 'package:dcli/dcli.dart' hide equals;
import 'package:posix/posix.dart';
import 'package:test/test.dart';

void main() {
  test('getcwd ...', () async {
    /// call the raw posix version.
    var buff = allocate<Int8>(count: 1024);
    expect(Utf8.fromUtf8(native_getcwd(buff, 1024).cast()), equals(pwd));
    free(buff);

    /// call the dart version which wraps the posix version.
    expect(getcwd(), equals(pwd));
  });

  test('getpid ...', () async {
    expect(getpid(), equals(pid));
  });

  test('getppid ...', () async {
    var parent = ProcessHelper().getParentPID(pid);
    expect(getppid(), equals(parent));
  });

  test('chown', () {
    chown('/tmp', 1000, 1000);
  });
}
