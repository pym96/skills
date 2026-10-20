#!/usr/bin/env sh
set -eu

REPO_RAW_BASE="${RAW_BASE_URL:-https://raw.githubusercontent.com/pym96/skills/main}"

usage() {
  cat <<'EOF'
Install skills from this repo into an agent's skills directory.

Usage:
  ./install.sh <skill-name> [--dest DIR] [--force]
  ./install.sh --all [--dest DIR] [--force]

Options:
  --dest DIR   Skills directory to install into.
               Default: $CODEX_HOME/skills, or ~/.codex/skills when CODEX_HOME is unset.
  --force      Overwrite an existing installed copy.
  -h, --help   Show this help.

Examples:
  ./install.sh paper-reader
  ./install.sh --all
  ./install.sh tool-first-determinism --dest ~/.claude/skills
EOF
}

DEST_ROOT="${CODEX_HOME:-$HOME/.codex}/skills"
FORCE=0
ALL=0
SKILL_NAME=""

while [ "$#" -gt 0 ]; do
  case "$1" in
    --all)   ALL=1; shift ;;
    --dest)
      [ "$#" -lt 2 ] && { echo "error: --dest requires a directory" >&2; exit 2; }
      DEST_ROOT=$2; shift 2 ;;
    --force) FORCE=1; shift ;;
    -h|--help) usage; exit 0 ;;
    -*)
      echo "error: unknown option: $1" >&2; usage >&2; exit 2 ;;
    *)
      [ -n "$SKILL_NAME" ] && { echo "error: only one skill name allowed" >&2; exit 2; }
      SKILL_NAME=$1; shift ;;
  esac
done

case "$DEST_ROOT" in
  "~"/*) DEST_ROOT="$HOME/${DEST_ROOT#~/}" ;;
esac

SCRIPT_DIR=$(CDPATH= cd "$(dirname "$0")" 2>/dev/null && pwd || printf '.')

# Discover available skills: directories containing a SKILL.md (local),
# falling back to a hardcoded list when installing via curl | sh.
available_skills() {
  found=""
  for d in "$SCRIPT_DIR"/*/; do
    [ -f "$d/SKILL.md" ] && found="$found $(basename "$d")"
  done
  if [ -n "$found" ]; then
    echo $found
  else
    echo "paper-reader write-method-causally tool-first-determinism engineering-judgment project-market-fit regression-guard pytest-test-design evidence-gated-delivery"
  fi
}

install_one() {
  name=$1
  dest="$DEST_ROOT/$name"

  if [ -e "$dest" ] && [ "$FORCE" -ne 1 ]; then
    echo "skip: $dest already exists (use --force to overwrite)"
    return 0
  fi
  mkdir -p "$dest"

  if [ -f "$SCRIPT_DIR/$name/SKILL.md" ]; then
    cp -R "$SCRIPT_DIR/$name/." "$dest/"
  else
    files="SKILL.md"
    case "$name" in
      engineering-judgment)
        files="$files references/resume.md references/project.md references/system-design.md"
        ;;
      project-market-fit)
        files="$files references/research.md references/improvement.md"
        ;;
    esac
    for file in $files; do
      mkdir -p "$(dirname "$dest/$file")"
      if command -v curl >/dev/null 2>&1; then
        curl -fsSL "$REPO_RAW_BASE/$name/$file" -o "$dest/$file"
      elif command -v wget >/dev/null 2>&1; then
        wget -qO "$dest/$file" "$REPO_RAW_BASE/$name/$file"
      else
        echo "error: curl or wget is required for remote install." >&2
        exit 1
      fi
    done
  fi
  echo "installed: $name -> $dest"
}

if [ "$ALL" -eq 1 ]; then
  for s in $(available_skills); do
    install_one "$s"
  done
elif [ -n "$SKILL_NAME" ]; then
  install_one "$SKILL_NAME"
else
  echo "error: give a skill name or --all" >&2
  usage >&2
  exit 2
fi

echo "Restart your agent so it can discover the new skill(s)."
