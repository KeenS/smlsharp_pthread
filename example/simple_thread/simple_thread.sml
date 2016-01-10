open PThread


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
    val thread_ref: pthread_t ref = ref _NULL
    val arg = sml_str_new "Hello world\n"
    val s = pthread_create(thread_ref, ref (Pointer.NULL()), threadFunc, toUnitPtr arg)
    val t1 = !thread_ref
    val () = if s <> 0
             then OS.Process.exit OS.Process.success
             else ()
    val () = print "Message from main()\n";
    val resRef = ref _NULL
    val s = pthread_join(t1, resRef)
    val () = if s <> 0
             then OS.Process.exit OS.Process.success
             else ()
    (* val () = print ("Thread returned" ^ Int.toString  (!resRef) ^ "\n") *)
in
    ()
end
