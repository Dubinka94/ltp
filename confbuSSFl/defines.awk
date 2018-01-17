BEGIN {
D["PACKAGE_NAME"]=" \"ltp\""
D["PACKAGE_TARNAME"]=" \"ltp\""
D["PACKAGE_VERSION"]=" \"LTP_VERSION\""
D["PACKAGE_STRING"]=" \"ltp LTP_VERSION\""
D["PACKAGE_BUGREPORT"]=" \"ltp@lists.linux.it\""
D["PACKAGE_URL"]=" \"\""
D["PACKAGE"]=" \"ltp\""
D["VERSION"]=" \"LTP_VERSION\""
D["STDC_HEADERS"]=" 1"
D["HAVE_SYS_TYPES_H"]=" 1"
D["HAVE_SYS_STAT_H"]=" 1"
D["HAVE_STDLIB_H"]=" 1"
D["HAVE_STRING_H"]=" 1"
D["HAVE_MEMORY_H"]=" 1"
D["HAVE_STRINGS_H"]=" 1"
D["HAVE_INTTYPES_H"]=" 1"
D["HAVE_STDINT_H"]=" 1"
D["HAVE_UNISTD_H"]=" 1"
D["HAVE_IFADDRS_H"]=" 1"
D["HAVE_PTHREAD_H"]=" 1"
D["HAVE_SYS_SHM_H"]=" 1"
D["HAVE_SYS_XATTR_H"]=" 1"
D["HAVE_MKDTEMP"]=" 1"
D["HAVE_DECL_PTRACE_GETSIGINFO"]=" 0"
D["HAVE_DECL_PTRACE_O_TRACEVFORKDONE"]=" 0"
D["HAVE_DECL_PTRACE_SETOPTIONS"]=" 0"
D["HAVE_FORK"]=" 1"
D["HAVE_DAEMON"]=" 1"
D["HAVE_VFORK"]=" 1"
D["HAVE_STRUCT_SIGACTION_SA_SIGACTION"]=" 1"
D["HAVE_QUOTAV1"]=" 1"
D["HAVE_UTIMENSAT"]=" 1"
D["HAVE_DECL_CLOCK_MONOTONIC_RAW"]=" 1"
D["HAVE_DECL_CLOCK_REALTIME_COARSE"]=" 0"
D["HAVE_DECL_CLOCK_MONOTONIC_COARSE"]=" 0"
D["HAVE_DECL_MADV_MERGEABLE"]=" 0"
D["HAVE_SYS_ACL_H"]=" 1"
D["HAVE_MKDIRAT"]=" 1"
D["HAVE_FCHOWNAT"]=" 1"
D["HAVE_FSTATAT"]=" 1"
D["HAVE_READLINKAT"]=" 1"
D["HAVE_OPENAT"]=" 1"
D["HAVE_RENAMEAT"]=" 1"
D["HAVE_STRUCT_IOVEC"]=" 1"
D["HAVE_DECL_IFLA_NET_NS_PID"]=" 0"
D["HAVE_SYNC_ADD_AND_FETCH"]=" 1"
D["HAVE_ATOMIC_MEMORY_MODEL"]=" 1"
  for (key in D) D_is_set[key] = 1
  FS = ""
}
/^[\t ]*#[\t ]*(define|undef)[\t ]+[_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ][_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789]*([\t (]|$)/ {
  line = $ 0
  split(line, arg, " ")
  if (arg[1] == "#") {
    defundef = arg[2]
    mac1 = arg[3]
  } else {
    defundef = substr(arg[1], 2)
    mac1 = arg[2]
  }
  split(mac1, mac2, "(") #)
  macro = mac2[1]
  prefix = substr(line, 1, index(line, defundef) - 1)
  if (D_is_set[macro]) {
    # Preserve the white space surrounding the "#".
    print prefix "define", macro P[macro] D[macro]
    next
  } else {
    # Replace #undef with comments.  This is necessary, for example,
    # in the case of _POSIX_SOURCE, which is predefined and required
    # on some systems where configure will not decide to define it.
    if (defundef == "undef") {
      print "/*", prefix defundef, macro, "*/"
      next
    }
  }
}
{ print }
