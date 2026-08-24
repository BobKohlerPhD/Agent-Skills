#!/usr/bin/env bash
set -euo pipefail

repository_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
target_dir="${1:-${HOME}/.agents/skills}"

mkdir -p "$target_dir"

for skill_dir in "$repository_root"/skills/*; do
  [[ -f "$skill_dir/SKILL.md" ]] || continue

  skill_name="$(basename "$skill_dir")"
  target_path="$target_dir/$skill_name"

  if [[ -e "$target_path" && ! -L "$target_path" ]]; then
    printf 'Refusing to replace non-symlink path: %s\n' "$target_path" >&2
    exit 1
  fi

  ln -sfn "$skill_dir" "$target_path"
  printf '%s -> %s\n' "$target_path" "$skill_dir"
done
