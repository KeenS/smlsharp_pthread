structure PThread = struct
    open PThreadCompat

    (*** pthread_* ***)
    (* int pthread_create(pthread_t *thread, const pthread_attr_t *attr, void *(*start_routine) (void *), void *arg); *)
    val pthread_create = _import "pthread_create" : (pthread_t ref, pthread_attr_t ref, unit ptr -> unit ptr, unit ptr) -> int
    (* void pthread_exit(void *retval); *)
    val pthread_exit = _import "pthread_exit": (unit ptr) -> ()
    (* pthread_t pthread_self(void); *)
    val pthread_self = _import "pthread_self": () -> pthread_t
    (* int pthread_equal(pthread_t t1, pthread_t t2); *)
    val pthread_equal = _import "pthread_equal": (pthread_t, pthread_t) -> int
    (* int pthread_join(pthread_t thread, void **retval); *)
    val pthread_join = _import "pthread_join": (pthread_t, unit ptr ref) -> int
    (* int pthread_detach(pthread_t thread); *)
    val pthread_detach = _import "pthread_detach": (pthread_t) -> int

    (*** pthread_attr* ***)
    (* int pthread_attr_destroy(pthread_attr_t *attr); *)
    val pthread_attr_destroy = _import "pthread_attr_destroy": (pthread_attr_t ref) -> int
    (* int pthread_attr_getdetachstate(const pthread_attr_t *attr, int *detachstate); *)
    val pthread_attr_getdetachstate = _import "pthread_attr_getdetachstate": (pthread_attr_t ref, int) -> int       
    (* int pthread_attr_getguardsize(const pthread_attr_t *attr, size_t *guardsize); *)
    val pthread_attr_getguardsize = _import "pthread_attr_getguardsize": (pthread_attr_t ref,  word ref) -> int
    (* int pthread_attr_getinheritsched(const pthread_attr_t *attr, int *inheritsched); *)
    val pthread_attr_getinheritsched = _import "pthread_attr_getinheritsched": (pthread_attr_t ref, int ref) -> int
    (* int pthread_attr_getschedparam(const pthread_attr_t *attr, struct sched_param *param); *)
    (* val pthread_attr_getschedparam = _import "pthread_attr_getschedparam": (pthread_attr_t ref, ) -> int *)
    (* int pthread_attr_getschedpolicy(const pthread_attr_t *attr, int *policy); *)
    val pthread_attr_getschedpolicy = _import "pthread_attr_getschedpolicy": (pthread_attr_t ref, int ref) -> int
    (* int pthread_attr_getscope(const pthread_attr_t *attr, int *scope); *)
    val pthread_attr_getscope = _import "pthread_attr_getscope": (pthread_attr_t ref, int ref) -> int
    (* int pthread_attr_getstack(const pthread_attr_t *attr, void **stackaddr, size_t *stacksize) *)
    val pthread_attr_getstack = _import "pthread_attr_getstack": (pthread_attr_t, unit ptr ref, word ref) -> int
    (* int pthread_attr_getstackaddr(const pthread_attr_t *attr, void **stackaddr); *)
    val pthread_attr_getstackaddr = _import "pthread_attr_getstackaddr": (pthread_attr_t, unit ptr ref) -> int
    (* int pthread_attr_getstacksize(const pthread_attr_t *attr, size_t *stacksize); *)
    val pthread_attr_getstacksize = _import "pthread_attr_getstacksize": (pthread_attr_t, word ref) -> int
    (* int pthread_attr_init(pthread_attr_t *attr); *)
    val pthread_attr_init = _import "pthread_attr_init": (pthread_attr_t ref) -> int
    (* int pthread_attr_setdetachstate(pthread_attr_t *attr, int detachstate); *)
    val pthread_attr_setdetachstate = _import "pthread_attr_setdetachstate": (pthread_attr_t ref, int) -> int
    (* int pthread_attr_setguardsize(pthread_attr_t *attr, size_t guardsize); *)
    val pthread_attr_setguardsize = _import "pthread_attr_setguardsize": (pthread_attr_t ref, word) -> int
    (* int pthread_attr_setinheritsched(pthread_attr_t *attr, int inheritsched); *)
    val pthread_attr_setinheritsched = _import "pthread_attr_setinheritsched": (pthread_attr_t ref, int) -> int
    (* int pthread_attr_setschedparam(pthread_attr_t *attr, const struct sched_param *param); *)
    (* val pthread_attr_setschedparam = _import "pthread_attr_setschedparam": (pthread_attr_t ref, ) -> int *)
    (* int pthread_attr_setschedpolicy(pthread_attr_t *attr, int policy); *)
    val pthread_attr_setschedpolicy = _import "pthread_attr_setschedpolicy": (pthread_attr_t ref, int) -> int
    (* int pthread_attr_setscope(pthread_attr_t *attr, int scope); *)
    val pthread_attr_setscope = _import "pthread_attr_setscope": (pthread_attr_t ref, int) -> int
    (* int pthread_attr_setstack(pthread_attr_t *attr, void *stackaddr, size_t stacksize); *)
    val pthread_attr_setstack = _import "pthread_attr_setstack": (pthread_attr_t ref, unit ptr, word) -> int
    (* int pthread_attr_setstackaddr(pthread_attr_t *attr, void *stackaddr); *)
    val pthread_attr_setstackaddr = _import "pthread_attr_setstackaddr": (pthread_attr_t ref, unit ptr) -> int
    (* int pthread_attr_setstacksize(pthread_attr_t *attr, size_t stacksize); *)
    val pthread_attr_setstacksize = _import "pthread_attr_setstacksize": (pthread_attr_t ref, word) -> int

    (*** pthread_mutex_* ***)
    (* int pthread_mutex_lock(pthread_mutex_t *mutex); *)
    val pthread_mutex_lock = _import "pthread_mutex_lock": (pthread_mutex_t ref) -> int
    (* int pthread_mutex_unlock(pthread_mutex_t *mutex); *)
    val pthread_mutex_unlock = _import "pthread_mutex_unlock": (pthread_mutex_t ref) -> int
    (* int pthread_mutex_init(pthread_mutex_t *mutex, const pthread_mutexattr_t *attr); *)
    val pthread_mutex_init = _import "pthread_mutex_init": (pthread_mutex_t ref, pthread_mutexattr_t ref) -> int
    (* int pthread_mutex_destroy(pthread_mutex_t *mutex); *)
    val pthread_mutex_destroy = _import "pthread_mutex_destroy": (pthread_mutex_t ref) -> int
    (* pthread_mutex_setprioceiling *)
    (* pthread_mutex_getprioceiling *)

    (*** pthread_mutexattr_* ***)
    (* int pthread_mutexattr_destroy(pthread_mutexattr_t *attr); *)
    val pthread_mutexattr_destroy = _import "pthread_mutexattr_destroy": (pthread_mutexattr_t ref) -> int
    (* int pthread_mutexattr_getprioceiling(const pthread_mutexattr_t * restrict attr, int *restrict prioceiling); *)
    val pthread_mutexattr_getprioceiling = _import "pthread_mutexattr_getprioceiling": (pthread_mutexattr_t ref, int ref) -> int
    (* int pthread_mutexattr_getprotocol(const pthread_mutexattr_t * restrict attr, int *restrict protocol); *)
    val pthread_mutexattr_getprotocol = _import "pthread_mutexattr_getprotocol": (pthread_mutexattr_t ref, int ref) -> int
    (* int pthread_mutexattr_getpshared(const pthread_mutexattr_t * restrict attr, int *restrict pshared); *)
    val pthread_mutexattr_getpshared = _import "pthread_mutexattr_getpshared": (pthread_mutexattr_t ref, int ref) -> int
    (* int pthread_mutexattr_gettype(const pthread_mutexattr_t *restrict attr, int *restrict type); *)
    val pthread_mutexattr_gettype = _import "pthread_mutexattr_gettype":(pthread_mutexattr_t ref, int ref) -> int
    (* int pthread_mutexattr_init(pthread_mutexattr_t *attr); *)
    val pthread_mutexattr_init = _import "pthread_mutexattr_init": (pthread_mutexattr_t ref) -> int
    (* int pthread_mutexattr_setprioceiling(pthread_mutexattr_t *attr, int prioceiling); *)
    val pthread_mutexattr_setprioceiling = _import "pthread_mutexattr_setprioceiling": (pthread_mutexattr_t ref, int) -> int
    (* int pthread_mutexattr_setprotocol(pthread_mutexattr_t *attr, int protocol); *)
    val pthread_mutexattr_setprotocol = _import "pthread_mutexattr_setprotocol": (pthread_mutexattr_t ref, int) -> int
    (* int pthread_mutexattr_setpshared(pthread_mutexattr_t *attr, int pshared); *)
    val pthread_mutexattr_setpshared = _import "pthread_mutexattr_setpshared": (pthread_mutexattr_t ref, int) -> int
    (* int pthread_mutexattr_settype(pthread_mutexattr_t  *attr , int type); *)
    val pthread_mutexattr_settype = _import "pthread_mutexattr_settype": (pthread_mutex_t ref, int) -> int

    (*** pthread_cond_* ***)
    (* int pthread_cond_signal(pthread_cond_t *cond); *)
    val pthread_cond_signal = _import "pthread_cond_signal": (pthread_cond_t ref) -> int
    (* int pthread_cond_broadcast(pthread_t *cond); *)
    val pthread_cond_broadcast = _import "pthread_cond_broadcast": (pthread_cond_t ref) -> int
    (* int pthread_cond_wait(pthread_cond_t *cond, pthread_mutex_t *mutex) *)
    val pthread_cond_wait = _import "pthread_cond_wait": (pthread_cond_t ref, pthread_mutex_t ref) -> int
    (* int pthread_cond_timedwait(pthread_cond_t *cond, pthread_mutex_t *mutex, const struct timespec *abstime); *)
    (* val pthread_cond_timedwait = _import "pthread_cond_timedwait": (pthread_cond_t ref, pthread_mutex_t ref, ) -> int *)
    (* timespec is defined below.
            struct timespec {
               time_t tv_sec;        /* seconds */
               long   tv_nsec;       /* nanoseconds */
           };
     *)
    (* int pthread_cond_destroy(pthread_cond_t *cond); *)
    val pthread_cond_destroy = _import "pthread_cond_destroy": (pthread_cond_t ref) -> int
    (* int pthread_cond_init(pthread_cond_t *restrict cond, const pthread_condattr_t *restrict attr);*)
    val pthread_cond_init = _import "pthread_cond_init": (pthread_cond_t ref, pthread_condattr_t ref) -> int

    (*** pthread_condattr_* ***)
    (* pthread_condattr_destroy *)
    (* pthread_condattr_getclock *)
    (* pthread_condattr_getpshared *)
    (* pthread_condattr_init *)
    (* pthread_condattr_setclock *)
    (* pthread_condattr_setpshared *)


    (* TODO: barrier *)
    (* TODO: read/write lock *)
    (* TODO: spin lock *)

    (* int pthread_once(pthread_once_t *once_control, void ( *init_routine)(void)); *)
    val pthread_once = _import "pthread_once": (pthread_once_t ref, () -> ()) -> int
    (* int pthread_key_create(pthread_key_t *key, void (*destructor)(void*)); *)
    val pthread_key_create = _import "pthread_key_create": (pthread_key_t ref, unit ptr -> ()) -> int
    (* int pthread_key_delete(pthread_key_t key); *)
    val pthread_key_delete = _import "pthread_key_delete": (pthread_key_t) -> int
    (* void *pthread_getspecific(pthread_key_t key); *)
    val pthread_getspecific = _import "pthread_getspecific": (pthread_key_t) -> unit ptr
    (* int pthread_setspecific(pthread_key_t key, const void *value); *)
    val pthread_setspecific = _import "pthread_setspecific": (pthread_key_t, unit ptr) -> int

    (*** cancel ***)
    (* int pthread_cancel(pthread_t thread); *)
    val pthread_cancel = _import "pthread_cancel": (pthread_t) -> int
    (* int pthread_setcancelstate(int state, int *oldstate); *)
    val pthread_setcancelstate = _import "pthread_setcancelstate": (int, int ref) -> int
    (* int pthread_setcanceltype(int type, int *oldtype); *)
    val pthread_setcanceltype = _import "pthread_setcanceltype": (int, int ref) -> int
    (* void pthread_testcancel(void); *)
    val pthread_testcancel = _import "pthread_testcancel": () -> ()

    (* cleanup_{push,pop} were defined as macros *)
    (* void pthread_cleanup_push(void (*routine)(void *), void *arg); *)
    (* val pthread_cleanup_push = _import "pthread_cleanup_push": (unit ptr -> (), unit ptr) -> () *)
    (* void pthread_cleanup_pop(int execute); *)
    (* val pthread_cleanup_pop = _import "pthread_cleanup_pop": (int) -> () *)

    val a = 1                   (* place holder for emacs indentation *)

end
