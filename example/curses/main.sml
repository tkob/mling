open Curses

fun main () = 
let
  val mainWin = initscr ()
  val key = ref #" "
  fun setupColor () = 
    if has_colors () then (
      start_color ();
      init_pair (1, 1, 0); (* red *)
      init_pair (2, 2, 0); (* green *)
      color_set (1, MLton.Pointer.null);
      ())
    else ()
in
  noecho ();
  (* keypad (mainWin, true); *)
  setupColor ();
  color_set (1, MLton.Pointer.null);
  mvaddstr (2, 2, "Press any key ('q' to quit)...");
  refresh ();
  while !key <> #"q" do (
    key := Char.chr (getch ());
    color_set (2, MLton.Pointer.null);
    mvaddstr (4, 2, String.str (!key));
    refresh ()
  );
  delwin mainWin;
  endwin ();
  refresh ()
end
