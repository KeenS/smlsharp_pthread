open PThread

fun exit reason = (
    print (reason ^ "\n");
    OS.Process.exit OS.Process.failure
)

val glob = ref 0
val mtx = ref (pthread_mutex_new ())

fun threadFunc _ = let
    val loops = 10000
    fun loop 0 = Pointer.NULL ()
      | loop n = let
          val s = pthread_mutex_lock(mtx)
          val () = if s <> 0
                   then exit ("pthread_mutex_lock: " ^ (Int.toString s))
                   else ()
          val () = glob := (!glob) + 1
          val s = pthread_mutex_unlock(mtx)
          val () = if s <> 0
                   then exit "pthread_mutex_unlock"
                   else ()
      in
          loop (n - 1)
      end
in
    loop loops
end

fun main () = let
    val mtxattr = ref (pthread_mutexattr_new ())
    val s = pthread_mutexattr_init(mtxattr)
    val () = if s <> 0
             then exit "pthread_mutexattr_init"
             else ()
    val s = pthread_mutex_init(mtx, mtxattr)
    val () = if s <> 0
             then exit "pthread_mutex_init"
             else ()
    val s = pthread_mutexattr_destroy(mtxattr)
    val () = if s <> 0
             then exit "pthread_mutexattr_destroy"
             else ()

    val t1 = ref (pthread_new ())
    val t2 = ref (pthread_new ())
    val tattr = ref (pthread_attr_new ())
    val s = pthread_attr_init(tattr)
    val () = if s <> 0
             then exit "pthread_attr_init"
             else ()
    val s = pthread_create(t1, tattr, threadFunc, (Pointer.NULL()))
    val () = if s <> 0
             then exit "pthread_create t1"
             else ()
    val s = pthread_create(t2, tattr, threadFunc, (Pointer.NULL()))
    val () = if s <> 0
             then exit "pthread_create t2"
             else ()
    val s = pthread_attr_destroy(tattr)
    val () = if s <> 0
             then exit "pthread_attr_destroy"
             else ()

    val s = pthread_join(!t1, ref (Pointer.NULL ()))
    val () = if s <> 0
             then exit "pthread_join t1"
             else ()
    val s = pthread_join(!t2, ref (Pointer.NULL ()))
    val () = if s <> 0
             then exit "pthread_join t2"
             else ()
in
    print ("glob = " ^ (Int.toString (!glob)) ^ "\n")
end

val () = main ()
