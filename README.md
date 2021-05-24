<p class="has-line-data" data-line-start="0" data-line-end="19">Q:\Netologia\Virt&gt;vagrant up<br>
Bringing machine ‘default’ up with ‘virtualbox’ provider…<br>
==&gt; default: Box ‘bento/ubuntu-20.04’ could not be found. Attempting to find and install…<br>
default: Box Provider: virtualbox<br>
default: Box Version: &gt;= 0<br>
==&gt; default: Loading metadata for box ‘bento/ubuntu-20.04’<br>
default: URL: <a href="https://vagrantcloud.com/bento/ubuntu-20.04">https://vagrantcloud.com/bento/ubuntu-20.04</a><br>
==&gt; default: Adding box ‘bento/ubuntu-20.04’ (v202012.23.0) for provider: virtualbox<br>
default: Downloading: <a href="https://vagrantcloud.com/bento/boxes/ubuntu-20.04/versions/202012.23.0/providers/virtualbox.box">https://vagrantcloud.com/bento/boxes/ubuntu-20.04/versions/202012.23.0/providers/virtualbox.box</a><br>
default:<br>
==&gt; default: Successfully added box ‘bento/ubuntu-20.04’ (v202012.23.0) for ‘virtualbox’!<br>
==&gt; default: Importing base box ‘bento/ubuntu-20.04’…<br>
==&gt; default: Matching MAC address for NAT networking…<br>
==&gt; default: Checking if box ‘bento/ubuntu-20.04’ version ‘202012.23.0’ is up to date…<br>
==&gt; default: Setting the name of the VM: Virt_default_1621445327437_34470<br>
Vagrant is currently configured to create VirtualBox synced folders with<br>
the <code>SharedFoldersEnableSymlinksCreate</code> option enabled. If the Vagrant<br>
guest is not trusted, you may want to disable this option. For more<br>
information on this option, please refer to the VirtualBox manual:</p>
<p class="has-line-data" data-line-start="20" data-line-end="21"><a href="https://www.virtualbox.org/manual/ch04.html#sharedfolders">https://www.virtualbox.org/manual/ch04.html#sharedfolders</a></p>
<p class="has-line-data" data-line-start="22" data-line-end="23">This option can be disabled globally with an environment variable:</p>
<p class="has-line-data" data-line-start="24" data-line-end="25">VAGRANT_DISABLE_VBOXSYMLINKCREATE=1</p>
<p class="has-line-data" data-line-start="26" data-line-end="27">or on a per folder basis within the Vagrantfile:</p>
<p class="has-line-data" data-line-start="28" data-line-end="51">config.vm.synced_folder ‘/host/path’, ‘/guest/path’, SharedFoldersEnableSymlinksCreate: false<br>
==&gt; default: Clearing any previously set network interfaces…<br>
==&gt; default: Preparing network interfaces based on configuration…<br>
default: Adapter 1: nat<br>
==&gt; default: Forwarding ports…<br>
default: 22 (guest) =&gt; 2222 (host) (adapter 1)<br>
==&gt; default: Booting VM…<br>
==&gt; default: Waiting for machine to boot. This may take a few minutes…<br>
default: SSH address: 127.0.0.1:2222<br>
default: SSH username: vagrant<br>
default: SSH auth method: private key<br>
default: Warning: Connection reset. Retrying…<br>
default:<br>
default: Vagrant insecure key detected. Vagrant will automatically replace<br>
default: this with a newly generated keypair for better security.<br>
default:<br>
default: Inserting generated public key within guest…<br>
default: Removing insecure key from the guest if it’s present…<br>
default: Key inserted! Disconnecting and reconnecting using new SSH key…<br>
==&gt; default: Machine booted and ready!<br>
==&gt; default: Checking for guest additions in VM…<br>
==&gt; default: Mounting shared folders…<br>
default: /vagrant =&gt; Q:/Netologia/Virt</p>
<p class="has-line-data" data-line-start="54" data-line-end="56">Q:\Netologia\Virt&gt;vagrant ssh<br>
Welcome to Ubuntu 20.04.1 LTS (GNU/Linux 5.4.0-58-generic x86_64)</p>
<ul>
<li class="has-line-data" data-line-start="57" data-line-end="58">Documentation:  <a href="https://help.ubuntu.com">https://help.ubuntu.com</a></li>
<li class="has-line-data" data-line-start="58" data-line-end="59">Management:     <a href="https://landscape.canonical.com">https://landscape.canonical.com</a></li>
<li class="has-line-data" data-line-start="59" data-line-end="61">Support:        <a href="https://ubuntu.com/advantage">https://ubuntu.com/advantage</a></li>
</ul>
<p class="has-line-data" data-line-start="61" data-line-end="62">System information as of Wed 19 May 2021 05:31:02 PM UTC</p>
<p class="has-line-data" data-line-start="63" data-line-end="67">System load:  0.42              Processes:             102<br>
Usage of /:   2.2% of 61.31GB   Users logged in:       0<br>
Memory usage: 14%               IPv4 address for eth0: 10.0.2.15<br>
Swap usage:   0%</p>
<p class="has-line-data" data-line-start="69" data-line-end="71">This system is built by the Bento project by Chef Software<br>
More information can be found at <a href="https://github.com/chef/bento">https://github.com/chef/bento</a></p>
<p class="has-line-data" data-line-start="72" data-line-end="76">7 Rак добавить оперативной памяти или ресурсов процессора виртуальной машине?<br>
В конфигурационный файл<br>
v.memory = 1024<br>
v.cpus = 2</p>
<p class="has-line-data" data-line-start="77" data-line-end="82">8 какой переменной можно задать длину журнала history, и на какой строчке manual это описывается?<br>
HISTSIZE<br>
721        HISTFILE<br>
722               The  name of the file in which command history is saved (see HISTORY below).  The default value is ~/.bash_history.  If unset, the     722 com‐<br>
723               mand history is not saved when a shell exits.</p>
<p class="has-line-data" data-line-start="83" data-line-end="90">что делает директива ignoreboth в bash?<br>
Ignoredups — Не писать строку после команды дублирования строки.<br>
Ignorespace — не писать строки, начинающиеся с одного или нескольких пробелов в истории.<br>
Ignoreboth — Установить оба значения выше.<br>
9 В каких сценариях использования применимы скобки {} и на какой строчке man bash это описано?<br>
vagrant@vagrant:~$ man bash |grep ignoreboth<br>
of ignoreboth is shorthand for ignorespace and ignoredups.  A value of erasedups  causes  all  previous</p>
<p class="has-line-data" data-line-start="92" data-line-end="98">255        { list; }<br>
256               list is simply executed in the current shell environment.  list must be terminated with a newline or  semi‐<br>
257               colon.   This is known as a group command.  The return status is the exit status of list.  Note that unlike<br>
258               the metacharacters ( and ), { and } are reserved words and must occur where a reserved word is permitted to<br>
259               be recognized.  Since they do not cause a word break, they must be separated from list by whitespace or an‐<br>
260               other shell metacharacter.</p>
<p class="has-line-data" data-line-start="99" data-line-end="100">10 Основываясь на предыдущем вопросе, как создать однократным вызовом touch 100000 файлов? А получилось ли создать 300000?</p>
<p class="has-line-data" data-line-start="101" data-line-end="112">mike@HOMEDX79SR:~/devops-netology$ getconf ARG_MAX<br>
2097152<br>
В нашем случае число аргументов больше<br>
vagrant@vagrant:~$ mkdir alot<br>
vagrant@vagrant:~$ cd alot/<br>
vagrant@vagrant:~/alot$ ls<br>
vagrant@vagrant:~/alot$ touch testfile{1…100000}<br>
-bash: /usr/bin/touch: Argument list too long<br>
vagrant@vagrant:~/alot$ touch testfile{1…10000}<br>
vagrant@vagrant:~/alot$ touch testfile{1…300000}<br>
-bash: /usr/bin/touch: Argument list too long</p>
<p class="has-line-data" data-line-start="116" data-line-end="117">11 В man bash поищите по /[[. Что делает конструкция [[ -d /tmp ]]</p>
<pre><code>   [ - это расширенная версия [ - начиная с bash версии 2. Специфична для bash. В твоём случае это не имеет значения, насколько я понимаю. -d /tmp - проверка того, что /tmp - существует и является каталогом.
</code></pre>
<p class="has-line-data" data-line-start="120" data-line-end="134">12 Основываясь на знаниях о просмотре текущих (например, PATH) и установке новых переменных; командах, которые мы рассматривали, добейтесь в выводе type -a bash в виртуальной машине наличия первым пунктом в списке:<br>
mike@DESKTOP-1CBC5OA:~$ type -a bash<br>
bash is /usr/bin/bash<br>
bash is /bin/bash<br>
mike@DESKTOP-1CBC5OA:~$ mkdir /tmp/new_path_directory<br>
mike@DESKTOP-1CBC5OA:~$ sudo ln -s /bin/bash /tmp/new_path_directory/bash<br>
[sudo] password for mike:<br>
mike@DESKTOP-1CBC5OA:~$ PATH=/tmp/new_path_directory:/usr/local/bin:/bin:${PATH}<br>
mike@DESKTOP-1CBC5OA:~$ export PATH<br>
mike@DESKTOP-1CBC5OA:~$ type -a bash<br>
bash is /tmp/new_path_directory/bash<br>
bash is /bin/bash<br>
bash is /usr/bin/bash<br>
bash is /bin/bash</p>
<p class="has-line-data" data-line-start="135" data-line-end="140">13 Чем отличается планирование команд с помощью batch и at?<br>
at  and  batch read commands from standard input or a specified file which are to be executed at a later time,<br>
using /bin/sh.<br>
batch   executes commands when system load levels permit; in other words, when the load  average  drops  below<br>
1.5, or the value specified in the invocation of atd.</p>
