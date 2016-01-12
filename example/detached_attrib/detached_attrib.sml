open PThread
val thr = ref (pthread_new())
val attr = pthread_attr_new()
val s = pthread_attr_init(attr)
val () = if s <> 0
         then raise Fail "pthread_attr_init\n"
         else ()
val s = pthread_attr_setdetachstate(attr, PTHREAD_CREATE_DETACHED)
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
