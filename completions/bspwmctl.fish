# fish completion for bspwmctl

# Keep in sync with THEMES in bspwmctl
set -l themes default
set -l commands install theme restore update uninstall help version

function __bspwmctl_backups
    set -l dir (set -q XDG_DATA_HOME; and echo $XDG_DATA_HOME; or echo $HOME/.local/share)/bspwmctl/backups
    test -d $dir; and path basename $dir/*/
end

complete -c bspwmctl -f

complete -c bspwmctl -n "not __fish_seen_subcommand_from $commands" -a install -d 'Install the bspwm environment'
complete -c bspwmctl -n "not __fish_seen_subcommand_from $commands" -a theme -d 'Apply or show available themes'
complete -c bspwmctl -n "not __fish_seen_subcommand_from $commands" -a restore -d 'List config backups or restore one'
complete -c bspwmctl -n "not __fish_seen_subcommand_from $commands" -a update -d 'Update bspwmctl to the latest version'
complete -c bspwmctl -n "not __fish_seen_subcommand_from $commands" -a uninstall -d 'Remove bspwmctl configs, restore your previous ones'
complete -c bspwmctl -n "not __fish_seen_subcommand_from $commands" -a help -d 'Show the help panel'
complete -c bspwmctl -n "not __fish_seen_subcommand_from $commands" -a version -d 'Show the version'
complete -c bspwmctl -n "not __fish_seen_subcommand_from $commands" -s h -l help -d 'Show help'
complete -c bspwmctl -n "not __fish_seen_subcommand_from $commands" -s v -l version -d 'Show version'

complete -c bspwmctl -n "__fish_seen_subcommand_from install" -l minimal -d 'bspwm, sxhkd, kitty, rofi (default)'
complete -c bspwmctl -n "__fish_seen_subcommand_from install" -l standard -d '+ polybar, picom, notifications, zsh...'
complete -c bspwmctl -n "__fish_seen_subcommand_from install" -l all -d '+ file manager, browser and other apps'
complete -c bspwmctl -n "__fish_seen_subcommand_from install" -l no-dep -d 'Skip package installation'
complete -c bspwmctl -n "__fish_seen_subcommand_from install" -l theme -x -a "$themes" -d 'Apply theme after installation'

complete -c bspwmctl -n "__fish_seen_subcommand_from theme" -a "$themes"
complete -c bspwmctl -n "__fish_seen_subcommand_from restore" -a "(__bspwmctl_backups)"
complete -c bspwmctl -n "__fish_seen_subcommand_from update" -l configs -d 'Also re-apply the new default configs'
complete -c bspwmctl -n "__fish_seen_subcommand_from uninstall" -s y -l yes -d "Don't ask for confirmation"
