function apl -d "Run as Apple Silicon"
  /usr/bin/arch -arm64 /opt/homebrew/bin/fish -c "$argv"
end
