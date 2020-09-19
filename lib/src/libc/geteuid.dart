import 'dart:ffi';

import 'libc.dart';

/// geteuid
typedef _geteuid_func = Int32 Function();
typedef _geteuid = int Function();

/// Gets the effective user id (euid)
/// The effective user id is the processes currently active uid
/// and is used when checking if the process has permission to
/// access a resource.
///
/// See: getreuid
int geteuid() {
  final geteuidPointer = Libc().lookup<_geteuid_func>('geteuid');
  final geteuid = geteuidPointer.asFunction<_geteuid>();
  var uid = geteuid();

  return uid;
}