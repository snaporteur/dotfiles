#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET="$HOME"

if ! command -v stow &>/dev/null; then
    echo "GNU Stow n'est pas installé (sudo pacman -S stow)." >&2
    exit 1
fi

packages=()
for dir in "$DOTFILES_DIR"/*/; do
    packages+=("$(basename "$dir")")
done

if [ "${#packages[@]}" -eq 0 ]; then
    echo "Aucun package trouvé dans $DOTFILES_DIR" >&2
    exit 1
fi

echo "Target: $TARGET"
echo "Packages: ${packages[*]}"

cd "$DOTFILES_DIR"
stow -v -t "$TARGET" "${packages[@]}"
