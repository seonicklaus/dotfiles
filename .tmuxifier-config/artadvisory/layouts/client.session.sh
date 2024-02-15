# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root "~/go/src/github.com/skynicklaus/artadvisory/artadvisory-client"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "client"; then

  # Create a new window inline within session layout definition.
  new_window "neovim"
  split_v 20
  select_pane 0
  run_cmd "nvim ."

  new_window "pnpm"
  run_cmd "pnpm run dev"
fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
