Q:\Netologia\Virt>vagrant up
Bringing machine 'default' up with 'virtualbox' provider...
==> default: Box 'bento/ubuntu-20.04' could not be found. Attempting to find and install...
    default: Box Provider: virtualbox
    default: Box Version: >= 0
==> default: Loading metadata for box 'bento/ubuntu-20.04'
    default: URL: https://vagrantcloud.com/bento/ubuntu-20.04
==> default: Adding box 'bento/ubuntu-20.04' (v202012.23.0) for provider: virtualbox
    default: Downloading: https://vagrantcloud.com/bento/boxes/ubuntu-20.04/versions/202012.23.0/providers/virtualbox.box
    default:
==> default: Successfully added box 'bento/ubuntu-20.04' (v202012.23.0) for 'virtualbox'!
==> default: Importing base box 'bento/ubuntu-20.04'...
==> default: Matching MAC address for NAT networking...
==> default: Checking if box 'bento/ubuntu-20.04' version '202012.23.0' is up to date...
==> default: Setting the name of the VM: Virt_default_1621445327437_34470
Vagrant is currently configured to create VirtualBox synced folders with
the `SharedFoldersEnableSymlinksCreate` option enabled. If the Vagrant
guest is not trusted, you may want to disable this option. For more
information on this option, please refer to the VirtualBox manual:

  https://www.virtualbox.org/manual/ch04.html#sharedfolders

This option can be disabled globally with an environment variable:

  VAGRANT_DISABLE_VBOXSYMLINKCREATE=1

or on a per folder basis within the Vagrantfile:

  config.vm.synced_folder '/host/path', '/guest/path', SharedFoldersEnableSymlinksCreate: false
==> default: Clearing any previously set network interfaces...
==> default: Preparing network interfaces based on configuration...
    default: Adapter 1: nat
==> default: Forwarding ports...
    default: 22 (guest) => 2222 (host) (adapter 1)
==> default: Booting VM...
==> default: Waiting for machine to boot. This may take a few minutes...
    default: SSH address: 127.0.0.1:2222
    default: SSH username: vagrant
    default: SSH auth method: private key
    default: Warning: Connection reset. Retrying...
    default:
    default: Vagrant insecure key detected. Vagrant will automatically replace
    default: this with a newly generated keypair for better security.
    default:
    default: Inserting generated public key within guest...
    default: Removing insecure key from the guest if it's present...
    default: Key inserted! Disconnecting and reconnecting using new SSH key...
==> default: Machine booted and ready!
==> default: Checking for guest additions in VM...
==> default: Mounting shared folders...
    default: /vagrant => Q:/Netologia/Virt



Q:\Netologia\Virt>vagrant ssh
Welcome to Ubuntu 20.04.1 LTS (GNU/Linux 5.4.0-58-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  System information as of Wed 19 May 2021 05:31:02 PM UTC

  System load:  0.42              Processes:             102
  Usage of /:   2.2% of 61.31GB   Users logged in:       0
  Memory usage: 14%               IPv4 address for eth0: 10.0.2.15
  Swap usage:   0%


This system is built by the Bento project by Chef Software
More information can be found at https://github.com/chef/bento

7 Rак добавить оперативной памяти или ресурсов процессора виртуальной машине?
В конфигурационный файл
v.memory = 1024
v.cpus = 2

8 какой переменной можно задать длину журнала history, и на какой строчке manual это описывается?
HISTSIZE
    721        HISTFILE
    722               The  name of the file in which command history is saved (see HISTORY below).  The default value is ~/.bash_history.  If unset, the     722 com‐
    723               mand history is not saved when a shell exits.

что делает директива ignoreboth в bash?
Ignoredups — Не писать строку после команды дублирования строки.
Ignorespace — не писать строки, начинающиеся с одного или нескольких пробелов в истории.
Ignoreboth — Установить оба значения выше.
9 В каких сценариях использования применимы скобки {} и на какой строчке man bash это описано?
vagrant@vagrant:~$ man bash |grep ignoreboth
              of ignoreboth is shorthand for ignorespace and ignoredups.  A value of erasedups  causes  all  previous


 255        { list; }
    256               list is simply executed in the current shell environment.  list must be terminated with a newline or  semi‐
    257               colon.   This is known as a group command.  The return status is the exit status of list.  Note that unlike
    258               the metacharacters ( and ), { and } are reserved words and must occur where a reserved word is permitted to
    259               be recognized.  Since they do not cause a word break, they must be separated from list by whitespace or an‐
    260               other shell metacharacter.
	   
10 Основываясь на предыдущем вопросе, как создать однократным вызовом touch 100000 файлов? А получилось ли создать 300000?
	   
mike@HOMEDX79SR:~/devops-netology$ getconf ARG_MAX
2097152
В нашем случае число аргументов больше	   
vagrant@vagrant:~$ mkdir alot
vagrant@vagrant:~$ cd alot/
vagrant@vagrant:~/alot$ ls
vagrant@vagrant:~/alot$ touch testfile{1..100000}
-bash: /usr/bin/touch: Argument list too long
vagrant@vagrant:~/alot$ touch testfile{1..10000}
vagrant@vagrant:~/alot$ touch testfile{1..300000}
-bash: /usr/bin/touch: Argument list too long
	


	
11 В man bash поищите по /\[\[. Что делает конструкция [[ -d /tmp ]]
	   
	   [ - это расширенная версия [ - начиная с bash версии 2. Специфична для bash. В твоём случае это не имеет значения, насколько я понимаю. -d /tmp - проверка того, что /tmp - существует и является каталогом.

12 Основываясь на знаниях о просмотре текущих (например, PATH) и установке новых переменных; командах, которые мы рассматривали, добейтесь в выводе type -a bash в виртуальной машине наличия первым пунктом в списке:
mike@DESKTOP-1CBC5OA:~$ type -a bash
bash is /usr/bin/bash
bash is /bin/bash
mike@DESKTOP-1CBC5OA:~$ mkdir /tmp/new_path_directory
mike@DESKTOP-1CBC5OA:~$ sudo ln -s /bin/bash /tmp/new_path_directory/bash
[sudo] password for mike:
mike@DESKTOP-1CBC5OA:~$ PATH=/tmp/new_path_directory:/usr/local/bin:/bin:${PATH}
mike@DESKTOP-1CBC5OA:~$ export PATH
mike@DESKTOP-1CBC5OA:~$ type -a bash
bash is /tmp/new_path_directory/bash
bash is /bin/bash
bash is /usr/bin/bash
bash is /bin/bash

13 Чем отличается планирование команд с помощью batch и at?
at  and  batch read commands from standard input or a specified file which are to be executed at a later time,
       using /bin/sh.
batch   executes commands when system load levels permit; in other words, when the load  average  drops  below
  1.5, or the value specified in the invocation of atd.	   
:wq


