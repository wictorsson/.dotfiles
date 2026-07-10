eval "$(starship init zsh)"
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias b-configure="cmake -G Ninja -B build-skia \
  -DIGRAPHICS_BACKEND=SKIA \
  -DIGRAPHICS_RENDERER=METAL \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
  -DCMAKE_OSX_ARCHITECTURES='arm64;x86_64'"
alias b='name=$(basename "$PWD"); cmake --build build-skia --target "$name-vst3" --target "$name-au" && open ~/Live-Debug'
alias para="cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/Documents/PARA/ && nvim ."

y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
  yazi "$@" --cwd-file="$tmp"
  if [ -f "$tmp" ] && [ -s "$tmp" ]; then
    cd "$(cat "$tmp")"
  fi
  rm -f "$tmp"
}
