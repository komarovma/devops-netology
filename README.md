SERVICES
DOCUMENTS
TYPE go_memstats_gc_cpu_fraction gauge.md
PREVIEW AS 
EXPORT AS 
SAVE TO 
IMPORT FROM 
DOCUMENT NAME
TYPE go_memstats_gc_cpu_fraction gauge.md
MARKDOWNPREVIEWToggle Mode
  
<p class="has-line-data" data-line-start="0" data-line-end="1">На лекции мы познакомились с node_exporter. В демонстрации его исполняемый файл запускался в background. Этого достаточно для демо, но не для настоящей production-системы, где процессы должны находиться под внешним управлением. Используя знания из лекции по systemd, создайте самостоятельно простой unit-файл для node_exporter:</p>
<p class="has-line-data" data-line-start="2" data-line-end="5">поместите его в автозагрузку,<br>
предусмотрите возможность добавления опций к запускаемому процессу через внешний файл (посмотрите, например, на systemctl cat cron),<br>
удостоверьтесь, что с помощью systemctl процесс корректно стартует, завершается, а после перезагрузки автоматически поднимается.</p>
<p class="has-line-data" data-line-start="6" data-line-end="11">sudo wget <a href="https://github.com/prometheus/node_exporter/releases/download/v1.1.2/node_exporter-1.1.2.linux-amd64.tar.gz">https://github.com/prometheus/node_exporter/releases/download/v1.1.2/node_exporter-1.1.2.linux-amd64.tar.gz</a><br>
tar -xvf node_exporter*<br>
sudo cp node_exporter*/node_exporter /usr/local/bin<br>
sudo useradd -rs /bin/false node_exporter<br>
sudo vim /etc/systemd/system/node_exporter.service</p>
<p class="has-line-data" data-line-start="12" data-line-end="15">///<br>
[Unit]<br>
Description=Node Exporter</p>
<p class="has-line-data" data-line-start="16" data-line-end="20">[Service]<br>
User=node_exporter<br>
EnvironmentFile=/etc/node_exporter<br>
ExecStart=/usr/local/bin/node_exporter $OPTIONS</p>
<p class="has-line-data" data-line-start="21" data-line-end="24">[Install]<br>
WantedBy=multi-user.target<br>
///</p>
<p class="has-line-data" data-line-start="26" data-line-end="30">sudo vim /etc/node_exporter<br>
///<br>
OPTIONS=&quot;–collector.textfile.directory /var/lib/node_exporter/textfile_collector&quot;<br>
///</p>
<p class="has-line-data" data-line-start="31" data-line-end="34">sudo systemctl daemon-reload<br>
sudo systemctl restart node_exporter<br>
sudo systemctl status node_exporter</p>
<p class="has-line-data" data-line-start="35" data-line-end="36">После перезгрузки</p>
<p class="has-line-data" data-line-start="37" data-line-end="43">vagrant@vagrant:~$ sudo systemctl status node_exporter<br>
● node_exporter.service - Node Exporter<br>
Loaded: loaded (/etc/systemd/system/node_exporter.service; enabled; vendor preset: enabled)<br>
Active: failed (Result: exit-code) since Mon 2021-06-14 18:59:56 UTC; 2min 23s ago<br>
Process: 580 ExecStart=/usr/local/bin/node_exporter $OPTIONS (code=exited, status=1/FAILURE)<br>
Main PID: 580 (code=exited, status=1/FAILURE)</p>
<p class="has-line-data" data-line-start="44" data-line-end="54">Jun 14 18:59:56 vagrant node_exporter[580]: level=info ts=2021-06-14T18:59:56.842Z caller=node_exporter.go:113 collecto&gt;<br>
Jun 14 18:59:56 vagrant node_exporter[580]: level=info ts=2021-06-14T18:59:56.842Z caller=node_exporter.go:113 collecto&gt;<br>
Jun 14 18:59:56 vagrant node_exporter[580]: level=info ts=2021-06-14T18:59:56.842Z caller=node_exporter.go:113 collecto&gt;<br>
Jun 14 18:59:56 vagrant node_exporter[580]: level=info ts=2021-06-14T18:59:56.842Z caller=node_exporter.go:113 collecto&gt;<br>
Jun 14 18:59:56 vagrant node_exporter[580]: level=info ts=2021-06-14T18:59:56.842Z caller=node_exporter.go:113 collecto&gt;<br>
Jun 14 18:59:56 vagrant node_exporter[580]: level=info ts=2021-06-14T18:59:56.842Z caller=node_exporter.go:113 collecto&gt;<br>
Jun 14 18:59:56 vagrant node_exporter[580]: level=info ts=2021-06-14T18:59:56.842Z caller=node_exporter.go:195 msg=&quot;Lis&gt;<br>
Jun 14 18:59:56 vagrant node_exporter[580]: level=error ts=2021-06-14T18:59:56.860Z caller=node_exporter.go:198 err=&quot;li&gt;<br>
Jun 14 18:59:56 vagrant systemd[1]: node_exporter.service: Main process exited, code=exited, status=1/FAILURE<br>
Jun 14 18:59:56 vagrant systemd[1]: node_exporter.service: Failed with result ‘exit-code’.</p>
<p class="has-line-data" data-line-start="57" data-line-end="62">Ознакомьтесь с опциями node_exporter и выводом /metrics по-умолчанию. Приведите несколько опций, которые вы бы выбрали для базового мониторинга хоста по CPU, памяти, диску и сети.<br>
Добавляем для примера node_exporter --collector.cpu<br>
collector=filesystem<br>
collector=netstat<br>
collector=meminfo</p>
<p class="has-line-data" data-line-start="64" data-line-end="68">vagrant@vagrant:~$ curl <a href="http://localhost:9100/metrics">http://localhost:9100/metrics</a> |grep cpu<br>
% Total    % Received % Xferd  Average Speed   Time    Time     Time  Current<br>
Dload  Upload   Total   Spent    Left  Speed<br>
0     0    0     0    0     0      0      0 --:–:-- --:–:-- --:–:--     0# HELP go_memstats_gc_cpu_fraction The fraction of this program’s available CPU time used by the GC since the program started.</p>
<h1 class="code-line" data-line-start=68 data-line-end=69 ><a id="TYPE_go_memstats_gc_cpu_fraction_gauge_68"></a>TYPE go_memstats_gc_cpu_fraction gauge</h1>
<p class="has-line-data" data-line-start="69" data-line-end="70">go_memstats_gc_cpu_fraction 7.693596084437705e-06</p>
<h1 class="code-line" data-line-start=70 data-line-end=71 ><a id="HELP_node_cpu_guest_seconds_total_Seconds_the_cpus_spent_in_guests_VMs_for_each_mode_70"></a>HELP node_cpu_guest_seconds_total Seconds the cpus spent in guests (VMs) for each mode.</h1>
<h1 class="code-line" data-line-start=71 data-line-end=72 ><a id="TYPE_node_cpu_guest_seconds_total_counter_71"></a>TYPE node_cpu_guest_seconds_total counter</h1>
<p class="has-line-data" data-line-start="72" data-line-end="74">node_cpu_guest_seconds_total{cpu=“0”,mode=“nice”} 0<br>
node_cpu_guest_seconds_total{cpu=“0”,mode=“user”} 0</p>
<h1 class="code-line" data-line-start=74 data-line-end=75 ><a id="HELP_node_cpu_seconds_total_Seconds_the_cpus_spent_in_each_mode_74"></a>HELP node_cpu_seconds_total Seconds the cpus spent in each mode.</h1>
<h1 class="code-line" data-line-start=75 data-line-end=76 ><a id="TYPE_node_cpu_seconds_total_counter_75"></a>TYPE node_cpu_seconds_total counter</h1>
<p class="has-line-data" data-line-start="76" data-line-end="84">node_cpu_seconds_total{cpu=“0”,mode=“idle”} 1130.53<br>
node_cpu_seconds_total{cpu=“0”,mode=“iowait”} 2.67<br>
node_cpu_seconds_total{cpu=“0”,mode=“irq”} 0<br>
node_cpu_seconds_total{cpu=“0”,mode=“nice”} 0<br>
node_cpu_seconds_total{cpu=“0”,mode=“softirq”} 6.12<br>
node_cpu_seconds_total{cpu=“0”,mode=“steal”} 0<br>
node_cpu_seconds_total{cpu=“0”,mode=“system”} 15.58<br>
node_cpu_seconds_total{cpu=“0”,mode=“user”} 3.03</p>
<h1 class="code-line" data-line-start=84 data-line-end=85 ><a id="HELP_node_memory_Percpu_bytes_Memory_information_field_Percpu_bytes_84"></a>HELP node_memory_Percpu_bytes Memory information field Percpu_bytes.</h1>
<h1 class="code-line" data-line-start=85 data-line-end=86 ><a id="TYPE_node_memory_Percpu_bytes_gauge_85"></a>TYPE node_memory_Percpu_bytes gauge</h1>
<p class="has-line-data" data-line-start="86" data-line-end="87">node_memory_Percpu_bytes 552960</p>
<h1 class="code-line" data-line-start=87 data-line-end=88 ><a id="HELP_node_pressure_cpu_waiting_seconds_total_Total_time_in_seconds_that_processes_have_waited_for_CPU_time_87"></a>HELP node_pressure_cpu_waiting_seconds_total Total time in seconds that processes have waited for CPU time</h1>
<h1 class="code-line" data-line-start=88 data-line-end=89 ><a id="TYPE_node_pressure_cpu_waiting_seconds_total_counter_88"></a>TYPE node_pressure_cpu_waiting_seconds_total counter</h1>
<p class="has-line-data" data-line-start="89" data-line-end="95">node_pressure_cpu_waiting_seconds_total 15.843631<br>
node_scrape_collector_duration_seconds{collector=“cpu”} 0.00027576<br>
node_scrape_collector_duration_seconds{collector=“cpufreq”} 4.9318e-05<br>
node_scrape_collector_success{collector=“cpu”} 1<br>
node_scrape_collector_success{collector=“cpufreq”} 1<br>
100  122k    0  122k    0     0  1151k      0 --:–:-- --:–:-- --:–:-- 1151k</p>
<h1 class="code-line" data-line-start=95 data-line-end=96 ><a id="HELP_process_cpu_seconds_total_Total_user_and_system_CPU_time_spent_in_seconds_95"></a>HELP process_cpu_seconds_total Total user and system CPU time spent in seconds.</h1>
<h1 class="code-line" data-line-start=96 data-line-end=97 ><a id="TYPE_process_cpu_seconds_total_counter_96"></a>TYPE process_cpu_seconds_total counter</h1>
<p class="has-line-data" data-line-start="97" data-line-end="98">process_cpu_seconds_total 0.45</p>
<p class="has-line-data" data-line-start="99" data-line-end="100">Установите в свою виртуальную машину Netdata. Воспользуйтесь готовыми пакетами для установки (sudo apt install -y netdata). После успешной установки:</p>
<p class="has-line-data" data-line-start="101" data-line-end="105">в конфигурационном файле /etc/netdata/netdata.conf в секции [web] замените значение с localhost на bind to = 0.0.0.0,<br>
добавьте в Vagrantfile проброс порта Netdata на свой локальный компьютер и сделайте vagrant reload:<br>
config.vm.network “forwarded_port”, guest: 19999, host: 19999<br>
После успешной перезагрузки в браузере на своем ПК (не в виртуальной машине) вы должны суметь зайти на localhost:19999. Ознакомьтесь с метриками, которые по умолчанию собираются Netdata и с комментариями, которые даны к этим метрикам.</p>
<p class="has-line-data" data-line-start="106" data-line-end="122">sudo systemctl restart netdata<br>
vagrant@vagrant:~$ sudo systemctl status netdata<br>
● netdata.service - netdata - Real-time performance monitoring<br>
Loaded: loaded (/lib/systemd/system/netdata.service; enabled; vendor preset: enabled)<br>
Active: active (running) since Mon 2021-06-14 19:50:17 UTC; 3s ago<br>
Docs: man:netdata<br>
file:///usr/share/doc/netdata/html/index.html<br>
<a href="https://github.com/netdata/netdata">https://github.com/netdata/netdata</a><br>
Main PID: 2604 (netdata)<br>
Tasks: 18 (limit: 1074)<br>
Memory: 18.3M<br>
CGroup: /system.slice/netdata.service<br>
├─2604 /usr/sbin/netdata -D<br>
├─2647 bash /usr/lib/netdata/plugins.d/tc-qos-helper.sh 1<br>
├─2654 /usr/lib/netdata/plugins.d/apps.plugin 1<br>
└─2657 /usr/lib/netdata/plugins.d/nfacct.plugin 1</p>
<p class="has-line-data" data-line-start="123" data-line-end="126">Jun 14 19:50:17 vagrant systemd[1]: Started netdata - Real-time performance monitoring.<br>
Jun 14 19:50:17 vagrant netdata[2604]: SIGNAL: Not enabling reaper<br>
Jun 14 19:50:17 vagrant netdata[2604]: 2021-06-14 19:50:17: netdata INFO  : MAIN : SIGNAL: Not enabling reaper</p>
<p class="has-line-data" data-line-start="128" data-line-end="129">Можно ли по выводу dmesg понять, осознает ли ОС, что загружена не на настоящем оборудовании, а на системе виртуализации?</p>
<p class="has-line-data" data-line-start="132" data-line-end="137">vagrant@vagrant:~$ sudo dmesg |grep virt<br>
[    0.004514] CPU MTRRs all blank - virtualized system.<br>
[    0.049572] Booting paravirtualized kernel on KVM<br>
[    5.722493] systemd[1]: Detected virtualization oracle.<br>
vagrant@vagrant:~$</p>
<p class="has-line-data" data-line-start="139" data-line-end="143">Как настроен sysctl fs.nr_open на системе по-умолчанию? Узнайте, что означает этот параметр. Какой другой существующий лимит не позволит достичь такого числа (ulimit --help)?<br>
<a href="https://access.redhat.com/solutions/1479623">https://access.redhat.com/solutions/1479623</a><br>
The default value fs.nr_open is 1024*1024 = 1048576.<br>
The maximum value of fs.nr_open is limited to sysctl_nr_open_max in kernel, which is 2147483584 on x86_64.</p>
<h1 class="code-line" data-line-start=143 data-line-end=144 ><a id="ulimit_n_2147483584_143"></a>ulimit -n 2147483584</h1>
<p class="has-line-data" data-line-start="144" data-line-end="145">-bash: ulimit: open files: cannot modify limit: Operation not permitted</p>
<h1 class="code-line" data-line-start=145 data-line-end=146 ><a id="sysctl_fsnr_open_145"></a>sysctl fs.nr_open</h1>
<p class="has-line-data" data-line-start="146" data-line-end="147">fs.nr_open = 1048576</p>
<h1 class="code-line" data-line-start=147 data-line-end=148 ><a id="sysctl_w_fsnr_open2147483584_147"></a>sysctl -w fs.nr_open=2147483584</h1>
<p class="has-line-data" data-line-start="148" data-line-end="149">fs.nr_open = 2147483584</p>
<h1 class="code-line" data-line-start=149 data-line-end=150 ><a id="ulimit_n_2147483584_149"></a>ulimit -n 2147483584</h1>
<h1 class="code-line" data-line-start=150 data-line-end=151 ><a id="ulimit_n_150"></a>ulimit -n</h1>
<p class="has-line-data" data-line-start="151" data-line-end="152">2147483584</p>
<h1 class="code-line" data-line-start=152 data-line-end=153 ><a id="sysctl_w_fsnr_open2147483585_152"></a>sysctl -w fs.nr_open=2147483585</h1>
<p class="has-line-data" data-line-start="153" data-line-end="155">sysctl: setting key “fs.nr_open”: Invalid argument<br>
fs.nr_open = 2147483585</p>
<p class="has-line-data" data-line-start="157" data-line-end="158">Найдите информацию о том, что такое :(){ :|:&amp; };:. Запустите эту команду в своей виртуальной машине Vagrant с Ubuntu 20.04 (это важно, поведение в других ОС не проверялось). Некоторое время все будет “плохо”, после чего (минуты) – ОС должна стабилизироваться. Вызов dmesg расскажет, какой механизм помог автоматической стабилизации. Как настроен этот механизм по-умолчанию, и как изменить число процессов, которое можно создать в сессии?</p>
<p class="has-line-data" data-line-start="159" data-line-end="163">Эта функция fork bomb,  заменим : на функцию netolog функция порождает саму себя.<br>
netolog{<br>
netolog | netolog &amp;<br>
}; netolog</p>
<p class="has-line-data" data-line-start="164" data-line-end="166">Результат самовостановления системы по ограничению количества сесий на пользователя.<br>
[ 1595.454419] cgroup: fork rejected by pids controller in /user.slice/user-1000.slice/session-3.scope</p>
