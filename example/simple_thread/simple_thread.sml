open PThread
fun exit reason = (
    print (reason ^ "\n");
    OS.Process.exit OS.Process.failure
)


val fromUnitPtr = SMLSharp_Builtin.Pointer.fromUnitPtr
val toUnitPtr = SMLSharp_Builtin.Pointer.toUnitPtr
(* durty hack *)
val sml_str_new = _import "sml_str_new": (string) -> char ptr

fun threadFunc (arg:unit ptr): unit ptr = let
    val cp: char ptr = fromUnitPtr arg
    val s = Pointer.importString cp
    val () = print s
    (* val ret =ref _NULL *)
    (* val () = ret := (String.size s) *)
in
    (* ret *)
    _NULL
end

val () = let
    val tattr = pthread_attr_new()
    val s = pthread_attr_init(tattr)
    val () = if s <> 0
             then exit "pthread_attr_init"
             else ()
    val thread_ref = ref (pthread_new())
    val arg = sml_str_new "Hello world\n"
    val s = pthread_create(thread_ref, tattr, threadFunc, toUnitPtr arg)
    val t1 = !thread_ref
    val () = if s <> 0
             then exit "thread creation failed"
             else ()
    val s = pthread_attr_destroy(tattr)
    val () = if s <> 0
             then exit "pthread_attr_destroy"
             else ()
    val () = print "Message from main()\n";
    val resRef = ref (Pointer.NULL ())
    val s = pthread_join(t1, resRef)
    val () = if s <> 0
             then exit "thread creation failed"
             else ()
    (* val () = print ("Thread returned" ^ Int.toString  (!resRef) ^ "\n") *)
in
    ()
end
