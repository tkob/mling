open Tcl

fun main () =
      let
        val interp = Tcl_CreateInterp ()
        val script = "puts hello"
      in
        Tcl_EvalEx (interp, script, String.size script, 0);
        Tcl_DeleteInterp interp
      end
