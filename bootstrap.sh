#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")"

git pull origin master

BACKUP_DIR="$(pwd)/backups/$(date +'%FT%H%M%S')/"
rsync --exclude-from=bootstrap.exclude \
    -avh --no-perms \
    --backup --backup-dir="$BACKUP_DIR" \
    . ~

# direnv - https://github.com/direnv/direnv/wiki/Python
if ! grep -q "show_virtual_env" ~/.bashrc; then
    cat << EOF >> ~/.bashrc

show_virtual_env() {
  if [[ -n "\$VIRTUAL_ENV" && -n "\$DIRENV_DIR" ]]; then
    echo "(env) "
  fi
}
export -f show_virtual_env
PS1='\$(show_virtual_env)'\$PS1
eval "\$(direnv hook bash)"
EOF
    echo ""
    echo "[direnv] Updated ~/.bashrc"
    echo "[direnv] To complete the setup, install direnv and "
    echo "[direnv]   sudo apt install direnv python3-venv"
fi
