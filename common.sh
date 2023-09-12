log_file=/tmp/expense.log

download_and_extract(){
  echo download the $component code
  curl -s -o /tmp/$component.zip https://expense-artifacts.s3.amazonaws.com/frontend.zip >> $log_file

  echo extracting $component code
  unzip /tmp/$component.zip >> $log_file
}


stat_check() {
  if [ $? -eq 0 ]; then
    echo -e "\e[32mSUCCESS\e[0m"
  else
    echo -e "\e[31mFAILED\e[0m"
    exit 1
  fi
}