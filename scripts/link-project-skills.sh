#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 2 ]]; then
  printf 'Usage: %s PROJECT_ROOT SKILL_NAME [SKILL_NAME ...]\n' "$0" >&2
  exit 2
fi

repository_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
project_root="$1"
shift

if [[ ! -d "$project_root" ]]; then
  printf 'Project directory does not exist: %s\n' "$project_root" >&2
  exit 1
fi

target_dir="$project_root/.agents/skills"
mkdir -p "$target_dir"

for skill_name in "$@"; do
  skill_dir="$repository_root/skills/$skill_name"
  target_path="$target_dir/$skill_name"

  if [[ ! -f "$skill_dir/SKILL.md" ]]; then
    printf 'Unknown skill package: %s\n' "$skill_name" >&2
    exit 1
  fi

  if [[ -e "$target_path" && ! -L "$target_path" ]]; then
    printf 'Refusing to replace non-symlink path: %s\n' "$target_path" >&2
    exit 1
  fi

  ln -sfn "$skill_dir" "$target_path"
  printf '%s -> %s\n' "$target_path" "$skill_dir"
done
