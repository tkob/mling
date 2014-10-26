#!/usr/bin/expect -f
set prompt "\n> "
set errmsg "Error"

set output [lindex $argv 0]
set sources [lrange $argv 1 end]

spawn poly
expect -- $prompt

set errorOccurred 0

foreach source $sources {
  send "use \"$source\";\r"
  expect {
    $errmsg {
      set errorOccurred 1
      break
    }
    -- $prompt {}
  }
}

if {!$errorOccurred} {
  send "PolyML.export(\"$output\", main);\r"
  expect {
    $errmsg {
      set errorOccurred 1
    }
    -- $prompt {}
  }
}

send "\004"
expect eof
exit $errorOccurred
