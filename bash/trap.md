
```bash
set -e
set -u

function clean_up() {

}

function handle_error() {
  ret="$?"
  if [ "$ret" -ne 0 ]; then
    echo "Fatal error: script $0 aborting at line $LINENO, command \"$BASH_COMMAND\" returned $ret"
  fi
  
  clean_up
  
  exit "$ret"
}

trap handle_error INT TERM EXIT
```
