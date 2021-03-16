function mkcd --description "mkdir & cd"
  test ! -d "$argv"; and mkdir -p $argv
  cd $argv
end
