eval "$(starship init zsh)"
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias b-configure="cmake -G Ninja -B build \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
  -DCMAKE_OSX_ARCHITECTURES='arm64;x86_64'"
alias b='name=$(basename "$PWD"); cmake --build build-nanovg --target "$name-vst3" --target "$name-au" && open ~/Logic-Debug'
alias para="cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/Documents/PARA/ && nvim ."

# Arduino helpers
_ardport() {
  setopt local_options null_glob
  local ports=(/dev/cu.usbmodem* /dev/cu.usbserial* /dev/cu.wchusbserial*)
  echo "${ports[1]}"
}
alias ardc='arduino-cli compile --fqbn arduino:avr:uno'
ardu() { arduino-cli upload -p "$(_ardport)" --fqbn arduino:avr:uno; }
ardm() { arduino-cli monitor -p "$(_ardport)" -c baudrate=9600; }
ard() { ardc && ardu; }

y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
  yazi "$@" --cwd-file="$tmp"
  if [ -f "$tmp" ] && [ -s "$tmp" ]; then
    cd "$(cat "$tmp")"
  fi
  rm -f "$tmp"
}
export PATH="$HOME/.local/bin:$PATH"
