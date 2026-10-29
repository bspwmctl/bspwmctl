# bash completion for bspwmctl

_bspwmctl() {
  local cur prev cmd
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"
  cmd="${COMP_WORDS[1]:-}"

  # Keep in sync with THEMES in bspwmctl
  local themes="default"
  local backups="${XDG_DATA_HOME:-$HOME/.local/share}/bspwmctl/backups"

  if [[ $COMP_CWORD -eq 1 ]]; then
    mapfile -t COMPREPLY < <(compgen -W "install theme restore update uninstall help version --help --version" -- "$cur")
    return
  fi

  case "$cmd" in
    install)
      if [[ "$prev" == --theme ]]; then
        mapfile -t COMPREPLY < <(compgen -W "$themes" -- "$cur")
      else
        mapfile -t COMPREPLY < <(compgen -W "--minimal --standard --all --no-dep --theme" -- "$cur")
      fi
      ;;
    theme)
      if [[ $COMP_CWORD -eq 2 ]]; then
        mapfile -t COMPREPLY < <(compgen -W "$themes" -- "$cur")
      fi
      ;;
    restore)
      if [[ $COMP_CWORD -eq 2 && -d "$backups" ]]; then
        mapfile -t COMPREPLY < <(compgen -W "$(ls -1 "$backups")" -- "$cur")
      fi
      ;;
    update)
      mapfile -t COMPREPLY < <(compgen -W "--configs" -- "$cur")
      ;;
    uninstall)
      mapfile -t COMPREPLY < <(compgen -W "--yes -y" -- "$cur")
      ;;
  esac
}

complete -F _bspwmctl bspwmctl
