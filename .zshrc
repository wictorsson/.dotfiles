eval "$(starship init zsh)"
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias Backflipper="cd ~/Programming/iPlug2/Examples/Backflipper"
alias b-configure="cmake -G Ninja -B build-skia \
  -DIGRAPHICS_BACKEND=SKIA \
  -DIGRAPHICS_RENDERER=METAL \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_OSX_ARCHITECTURES='arm64;x86_64'"
alias b="cmake --build build-skia --target Backflipper-vst3 --target Backflipper-au && open ~/Live-Debug"
alias para="cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/Documents/PARA/ && nvim ."

y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
  yazi "$@" --cwd-file="$tmp"
  if [ -f "$tmp" ] && [ -s "$tmp" ]; then
    cd "$(cat "$tmp")"
  fi
  rm -f "$tmp"
}
