(* ====END_OF_HEADER==== *)

_require "basis.smi"

structure PThreadCompat = struct
    (* detach state *)
    val PTHREAD_CREATE_JOINABLE: int
    val PTHREAD_CREATE_DETACHED: int

    (* mutex types *)
    val PTHREAD_MUTEX_NORMAL   : int
    val PTHREAD_MUTEX_RECURSIVE: int
    val PTHREAD_MUTEX_ERRORCHECK: int
    val PTHREAD_MUTEX_DEFAULT   : int

    (*
#if defined __USE_POSIX199506 || defined __USE_UNIX98
    *)
    (* mutex protocol *)
    val PTHREAD_PRIO_NONE   : int
    val PTHREAD_PRIO_INHERIT: int
    val PTHREAD_PRIO_PROTECT: int
(*
#endif
*)


    (* 
#if defined __USE_UNIX98 || defined __USE_XOPEN2K       
    *)
    (* read write lock types *)
    val PTHREAD_RWLOCK_PREFER_READER_NP              : int
    val PTHREAD_RWLOCK_PREFER_WRITER_NP              : int
    val PTHREAD_RWLOCK_PREFER_WRITER_NONRECURSIVE_NP : int
    val PTHREAD_RWLOCK_DEFAULT_NP                    : int
    (* 
#endif
    *)


    (* scheduler inheritance *)
    val PTHREAD_INHERIT_SCHED  : int
    val PTHREAD_EXPLICIT_SCHED : int

    (* scope handling *)
    val PTHREAD_SCOPE_SYSTEM  : int
    val PTHREAD_SCOPE_PROCESS : int

    (* process shared or private flag *)
    val PTHREAD_PROCESS_PRIVATE : int
    val PTHREAD_PROCESS_SHARED  : int

    (* cancellation *)
    val PTHREAD_CANCEL_ENABLE : int
    val PTHREAD_CANCEL_DISABLE : int
    val PTHREAD_CANCEL_DEFERRED : int
    val PTHREAD_CANCEL_ASYNCHRONOUS : int

    (* PTHREAD_CANCELED is defined ((void * ) -1). it is not portable to SML#... *)

    val PTHREAD_ONCE_INIT : int
    (* 
#ifdef __USE_XOPEN2K
    *)
    val PTHREAD_BARRIER_SERIAL_THREAD: int
    (* 
#endif
    *)

    (* ifdef linux *)
    type pthread_t = unit ptr
    type pthread_attr_t = word8 array
    type pthread_mutex_t = word8 array
    type pthread_mutexattr_t = word8 array
    type pthread_cond_t = word8 array
    type pthread_condattr_t = word8 array
    type pthread_key_t = word
    type pthread_once_t = int
    (* endif *)

    val pthread_new: unit -> pthread_t
    val pthread_attr_new: unit -> pthread_attr_t
    val pthread_mutex_new: unit -> pthread_mutex_t
    val pthread_mutexattr_new: unit -> pthread_mutexattr_t
    val pthread_cond_new: unit -> pthread_mutex_t
    val pthread_condattr_new: unit -> pthread_mutexattr_t
    val pthread_key_new: unit -> pthread_key_t
    val pthread_once_new: unit -> pthread_once_t

end
