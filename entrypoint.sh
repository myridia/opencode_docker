#!/bin/bash

# Run your opencode command
# Replace this with the actual command/script you want to execute first.
# For example, if 'opencode' is a command you installed:
/root/.opencode/bin/opencode # Or just 'opencode' if it's in PATH

# The "$@" will capture any arguments passed to the container (like 'bash')
# and execute them. If 'bash' is passed, it will run bash.
exec "$@"
