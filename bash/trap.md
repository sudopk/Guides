
```bash
set -e  # Exit immediately if a command exits with a non-zero status
set -E  # The ERR trap is inherited by shell functions
set -u  # Treat unset variables as an error when substituting
set -x  # Print commands and their arguments as they are executed

function clean_up() {

}

function handle_error() {
  local ret="$?"
  if [ "$ret" -ne 0 ]; then
    echo "Fatal: \"$0\" aborting at line $LINENO, command \"$BASH_COMMAND\" returned $ret"
  fi
  
  clean_up
  
  exit "$ret"
}

trap handle_error INT TERM EXIT
```
