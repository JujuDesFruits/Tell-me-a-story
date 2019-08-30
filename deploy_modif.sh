#!/bin/bash

export DOMAIN_NAME=tell-me-a-story.onthewifi.com

lunch_playbook () {
  echo "_____________________________BEGINNING_${1}_MODIF______________________________"
  echo "_______________________________________________________________________________"
  if test "$1" = "web"
  then
    ansible-playbook playbook_${1}.yml -i SERVER
  else
    ansible-playbook playbook_${1}.yml -i SERVER --extra-vars "ansible_ssh_pass=$2 ansible_sudo_pass=$2"
  fi
  echo "_______________________________________________________________________________"
  echo "______________________________ENDING_${1}_MODIF________________________________"
}

test_ssh () {
  ssh -o "CheckHostIP=no" root@$DOMAIN_NAME hostname
}

if [$(test_ssh)=$DOMAIN_NAME];
then
  cd deployment/
  tmp=0
  while test $tmp -eq 0 ; do
    read -p "would you want to deploy the configuration for web ? [Yes/No]" answer
    if test "$answer" = "YES" || test "$answer" = "yes" || test "$answer" = "Yes" || test "$answer" = "Y" || test "$answer" = "y" ;
	  then
	    lunch_playbook web
		  tmp=$(($tmp + 1))
    elif test "$answer" = "NO" || test "$answer" = "no" || test "$answer" = "No" || test "$answer" = "N" || test "$answer" = "n" ;
	  then
		  echo "skipping playbook_web"
		  tmp=$(($tmp + 1))
	  else
		  echo "Please answer yes or no."
	  fi
  done;
  tmp=0
  while test $tmp -eq 0 ; do
    read -p "would you want to deploy the configuration for server ? [Yes/No]" answer
    if test "$answer" = "YES" || test "$answer" = "yes" || test "$answer" = "Yes" || test "$answer" = "Y" || test "$answer" = "y" ;
	  then
      read -p "A password is needed to connect to server svg" passwrd
	    lunch_playbook server $passwrd
		  tmp=$(($tmp + 1))
    elif test "$answer" = "NO" || test "$answer" = "no" || test "$answer" = "No" || test "$answer" = "N" || test "$answer" = "n" ;
	  then
		  echo "skipping playbook_server"
		  tmp=$(($tmp + 1))
	  else
		  echo "Please answer yes or no."
	  fi
  done;
  cd ..
else
  echo "connection ssh with server is impossible. please try to contact admin"
fi
