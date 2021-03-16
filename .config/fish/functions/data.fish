# Data Folder
set -g DATA_DIR $HOME/data

function data --description "mkdir & cd ~/$DATA_DIR/YYYY/MM/DD"
  set now (date "+%Y/%m/%d")
  if test ! -s "$DATA_DIR/$now"
    mkdir -p $DATA_DIR/$now
    set mkdir_status $status
    test $mkdir_status -ne 0; and return $mkdir_status
  end

  echo $DATA_DIR/$now
  cd $DATA_DIR/$now
end
