open PThread
val thr = ref (Pointer.NULL ())
val attr = ref (Pointer.NULL () )
val s = pthread_attr_init(attr)
val () = if s <> 0
         then raise Fail "pthread_attr_init\n"
         else ()
val s = pthread_attr_setdetachstate(attr,
                                   (* PTHREAD_CREATE_DETACHED *)
                                    1 (* this is true at least under linux *)
                                   )
val () = if s <> 0
         then raise Fail "pthread_attr_setdetachstate\n"
         else ()
val s = pthread_create(thr, attr, fn _ => (print "detached_thread\n"; Pointer.NULL ()), Pointer.NULL())
val () = if s <> 0
         then raise Fail "pthread_create\n"
         else ()
val s = pthread_attr_destroy(attr)
val () = if s <> 0
         then print "pthread_attr_destroy\n"
         else ()
