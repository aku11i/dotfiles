
function delta
  set delta (which delta)

  if test -z {$delta}
    echo "error: delta is not found."
    return 1
  end

  if test "$DARK" = "false"
    {$delta} --light  $argv
  else
    {$delta} $argv
  end
end

