<p class="has-line-data" data-line-start="0" data-line-end="1">Домашнее задание к занятию “3.2. Работа в терминале, лекция 2”</p>
<p class="has-line-data" data-line-start="2" data-line-end="4">Какого типа команда cd? Попробуйте объяснить, почему она именно такого типа; опишите ход своих мыслей, если считаете что она могла бы быть другого типа.<br>
cd – “built in” команда. Переменные среды родительского процесса не могут быть изменены дочерним процессом. Если оболочка запустила /bin/cd, который изменил PWD, это повлияет только на /bin/cd и не изменит PWD оболочки.</p>
<p class="has-line-data" data-line-start="5" data-line-end="7">Какая альтернатива без pipe команде grep &lt;some_string&gt; &lt;some_file&gt; | wc -l? man grep поможет в ответе на этот вопрос. Ознакомьтесь с документом о других подобных некорректных вариантах использования pipe.<br>
grep -c &lt;some_string&gt; &lt;some_file&gt;</p>
<p class="has-line-data" data-line-start="8" data-line-end="10">Какой процесс с PID 1 является родителем для всех процессов в вашей виртуальной машине Ubuntu 20.04?<br>
ps -q 1 -o comm= systemd</p>
<p class="has-line-data" data-line-start="11" data-line-end="13">Как будет выглядеть команда, которая перенаправит вывод stderr ls на другую сессию терминала?<br>
ls 2&gt;/dev/pts/XX</p>
<p class="has-line-data" data-line-start="14" data-line-end="16">Получится ли одновременно передать команде файл на stdin и вывести ее stdout в другой файл? Приведите работающий пример.<br>
ls &lt;file0.txt &gt;file1.txt</p>
<p class="has-line-data" data-line-start="17" data-line-end="19">Получится ли вывести находясь в графическом режиме данные из PTY в какой-либо из эмуляторов TTY? Сможете ли вы наблюдать выводимые данные?<br>
cat /dev/tty &gt; /dev/pts/0</p>
<p class="has-line-data" data-line-start="20" data-line-end="22">Выполните команду bash 5&gt;&amp;1. К чему она приведет? Что будет, если вы выполните echo netology &gt; /proc/<span class="math inline">ParseError: KaTeX parse error: Expected 'EOF', got 'П' at position 8: /fd/5? П̲очему так проис…</span>/fd/5 – отправит «нетологию» в «пятый поток»</p>
<p class="has-line-data" data-line-start="23" data-line-end="25">Получится ли в качестве входного потока для pipe использовать только stderr команды, не потеряв при этом отображение stdout на pty? Напоминаем: по умолчанию через pipe передается только stdout команды слева от | на stdin команды справа. Это можно сделать, поменяв стандартные потоки местами через промежуточный новый дескриптор, который вы научились создавать в предыдущем вопросе.<br>
cat 3&gt;&amp;1 1&gt;&amp;2 2&gt;&amp;3 rm file11.txt 3&gt;&amp;2 2&gt;&amp;1 1&gt;&amp;3 | cat &gt; file.txt</p>
<p class="has-line-data" data-line-start="26" data-line-end="28">Что выведет команда cat /proc/$$/environ? Как еще можно получить аналогичный по содержанию вывод?<br>
env</p>
<p class="has-line-data" data-line-start="29" data-line-end="31">Используя man, опишите что доступно по адресам /proc//cmdline, /proc//exe.<br>
cmdline - файл, содержащий полную строку команды процесса exe - символическая ссылка на путь, по которому запущен процесс</p>
<p class="has-line-data" data-line-start="32" data-line-end="34">Узнайте, какую наиболее старшую версию набора инструкций SSE поддерживает ваш процессор с помощью /proc/cpuinfo.<br>
grep sse /proc/cpuinfo sse4_2</p>
<p class="has-line-data" data-line-start="35" data-line-end="37">При открытии нового окна терминала и vagrant ssh создается новая сессия и выделяется pty. Это можно подтвердить командой tty, которая упоминалась в лекции 3.2. Однако: vagrant@netology1:~$ ssh localhost ‘tty’ not a tty Почитайте, почему так происходит, и как изменить поведение.<br>
для ssh нет доступного терминала, нужна опция t, но у меня почему-то работает и так.</p>
<p class="has-line-data" data-line-start="38" data-line-end="40">Бывает, что есть необходимость переместить запущенный процесс из одной сессии в другую. Попробуйте сделать это, воспользовавшись reptyr. Например, так можно перенести в screen процесс, который вы запустили по ошибке в обычной SSH-сессии.<br>
Ставим утилиту - sudo apt-get install reptyr Запускаем вторую сессию терминала Открываем, например, nano Во втором терминале ps -ef | grep nano sudo reptyr -T PID</p>
<p class="has-line-data" data-line-start="41" data-line-end="43">sudo echo string &gt; /root/new_file не даст выполнить перенаправление под обычным пользователем, так как перенаправлением занимается процесс shell’а, который запущен без sudo под вашим пользователем. Для решения данной проблемы можно использовать конструкцию echo string | sudo tee /root/new_file. Узнайте что делает команда tee и почему в отличие от sudo echo команда с sudo tee будет работать.<br>
tee читает из стандартного ввода и записывает как в стандартный вывод так и в один или несколько файлов одновременно. Ошибка в первом случае будет из-за того, что sudo не выполняет перенаправление вывода, выполнится как непривилегированный пользователь. Во втором случае tee получит вывод команды echo, повысит права на sudo и запишет в файл</p>
