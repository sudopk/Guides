
```bash
set -e  # Exit immediately if a command exits with a non-zero status
set -E  # The ERR trap is inherited by shell functions
set -u  # Treat unset variables as an error when substituting
set -x  # Print commands and their arguments as they are executed
# The return value of a pipeline is the status of the last command to exit with a
# non-zero status, or zero if no command exited with a non-zero status
set -o pipefail

function clean_up() {
  :
}

function trap_handle() {
  local ret="$?"
  if [ "$ret" -ne 0 ]; then
    echo "Fatal: \"$0\" aborting at line $LINENO, command \"$BASH_COMMAND\" returned $ret"
  fi
  
  clean_up
  
  exit "$ret"
}

trap trap_handle INT TERM EXIT

readonly script_dir="$(readlink -f "$(dirname "$0")")"
readonly script_name="$(basename "$0")"
```
