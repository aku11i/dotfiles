
function delta
  set delta (which delta)

  if test -z {$delta}
    echo "error: delta is not found."
    return 1
  end

  if which dark-mode >/dev/null && test (dark-mode status) = "on"
    {$delta} $argv
  else
    {$delta} --light  $argv
  end
end

