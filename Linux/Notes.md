# Linux Commands Reference Guide

## Basic Command Structure
```
Linux command= Command + options + Attributes
```

## Basic Commands

**pwd** - current working directory  
**mkdir** - created a new directory  
**type** - is used to know which type of linux command is (builtin, binary etc)  
**which** - to locate a command  
**ls** - list  
**cd** - change disk  
**cd ~** - home directory  
**cd /** - root directory  
**touch** - change the time stamp of file, if file is not there it will create it.  
**tac** - same as cat but reverse the order of given input  
**rev** - change the order of given input HORIZONTALLY  
**cat** - concatinate file or print the output of files

### File Redirection
```
>  =Over write the file
>> =append the file
```

## Echo Command
**echo** - create/modify/append a file (To append data you must use >> not just >)

**eg-**
```bash
echo "hello" > hello.txt                           = creating
echo "linux" >> hello.txt                          = appending
```

**cat** - cat hello.txt to view the file content

## File Viewing Commands
**head** - To view only first two lines from the file  
**tail** - to view last two lines  
**less** - opens file in new window and keep the main terminal clean  
**cp** - copy file  
**mv** - move file  
**rm** - remove files or directory  
(use optio -R to remove directories and it content and use -d to remove empty directories)  
**file** - detemine file type

---

## Nano Text Editor

**nano** - simple text editor that operated within a terminal. If file is not there , itll create it

### Nano Controls
**ctrl+X** - close the current file and close the editor(it'll ask to save befor closing the file)  
**ctrl+O** - wirte out= to save file

### Navigation in nano
• **Alt-G**: Go to a specific Line number  
• **Ctrl- up arrow**: Go to the start of the text  
• **Ctrl- down arrow**: Go to the end of the text  
• **Ctrl- A**: Go to the start of the line  
• **Ctrl- E**: Go to the end of the Line

### Basic editing in nano
• **Ctrl + Shift + C**: Copy to global  
• **Ctrl + Shift + V**: Paste from global  
• **CtrL-K**: Cut a line / selected  
• **AIt + ^**: Copy the line / selected  
• **Ctrl-U**: Paste  
• **Alt + U**: Undo  
• **CtrL+W**: Search for string  
• **CtrL+\**: replace a string

---

## STANDARD OUTPUT AND ERROR

Whena a program or command is excuted in the terminal, it gernrates output that can be displayed directly in the terminal window. This output is know as STANDARD OUTPUT.

we can save the stand. output and error output of any cmd to a file via- ls > a.txt (or >> to append)  
to print error output- ls -z > test.text 2> error.txt  
above command is incorrect for example.

## SORT Command
**SORT Command** = sort lines of text files  
-r to reverse sorting  
-n for number sorting  
-k sort via a key, KEYDFF gives the location and type (k6h)  
6 - column which needs to be sorted

## PIPE
**PIPE** = create pipe/ use two commands together/ output of 1st cmd is the input of 2nd command  
|  
**eg-** ls -lh | sort -k5h | tail -3 > error.txt

## GREP
**GREP** ==== print lines that match patterns  
grep is used to find words, patterns in a specific file or directory  
**syntax-** grep 'kiwi' Fruits.txt

---

## Arthematic exp

**synatx-** echo$((a+b))

## SHORTCUTS

**ctrl + A** = go to start of the line  
**ctrl + E** = go to End of the line  
**ctrl + K** = remove eveything from current to right side  
**ctrl + U** = remove eveything from current to left side  
**Alt + B** = skips word backward  
**Alt + F** = skips word forward  
**ctrl + R** = to search any pervious command(History)  
**ctrl + Y** = to undo  
**alt + D** = remove end of the word only  
**ctrl + w** = remove start of the word only

**ctrl + L** = clear the terminal  
**ctrl + D** = close the terminal  
**Ctrl +alt +T** = open the terminal  
**zoom in** = ctrl + alt + +  
**zoom out** = Ctrl + -

---

## FIND command

**syntax-** find [path..] [expression]

**-name** = this option accepts patterns that follow standard shell wildcard characters  
**\*** = matches any string of characters. including an empty string. eg( find/path -name "*.pdf")  
**?** = match any single characters  
**[]** = matches ant one of the enclosed characters eg0 matches 'a' 'b' or 'c'  
**!** - whne used as the 1st character in a pattern, it negates the pattern

```bash
find path -type d -iname =onlty list directories
find path -type f -iname =only list folders
find /path-size+100 # for file larger than 100MB
find /path -mtime -7 # for files modified in the last 7 days
find /path -mtime +7 # for files modified more than 7 days ago
find /path -mtime 7 #for exactly 7 days ago
```
for minutes use -mmin , -amin, -atime etc.
```bash
find /path -type f -name "*.txt" -and -size +1M
find /path \(-name "*.txt" -or -name "*.pdf"\)
find /path !-name "*.txt"

find /path -name "*.txt" -exec command {} ';'
```

**-exec** - is followed by the command that you want to excure  
**{}** - represents the placeholder for the found file or directories  
**';'** - marks the end of the command to be excuted

---

## Permissions and how to change em

```
l rwx rwx rwx

 eg- drwxr-xr-x ------ Desktop
    -rw-rw-r--  ------Fruit.txt
```

**-** =file  
**l** =link  
**d** = directories

**1st rwx** - owner Permissions  
**2nd rwx** - groups Permissions  
**3 rwx** = other user's Permissions

### To change permission = chmod

```
chmod _ _ _ sample file
eg- chmod u+r Sample file
```

**1st _** =whoes (whoes pemission getting change user u ,groups g ,other o)  
**2nd _** =what (grant + / remove - / = only read,write or excute)  
**3rd _** -=which(read, write, excute)

---

## su command 
**(substitue user)** = run a command with substitueuser and group including

---

## GROUPS IN Linux

**sudo adduser [username]** = to create a user  
**sudo groupadd [groupname]** - cmd to create a new group  
**sudo groupdel [groupname]** = to delete a group  
**groups / groups [user]** - this cmd is used to know current user is part of which groups

**sudo adduser [user] [group name]** - cmd to add particular user in a particular group

**getent group** = to check all groups in system

---

## Change Owner cmd (chown)

it is used to change the ownership/access of a file/folder/group

**syntax-** sudo chown :prod prod_env/  
**sudo** - admin rights  
**chown** -change owner  
**:prod** - group  
**prod_env** - folder/directory

---

## sudo
**sudo** - cmd is used for admin right or excute any cmd as a root user  
**note-** after running udo, the system doesnt ask for pwd for 15 minutes.

---

## BASHRC cmd

bashrc is a script that is run when we open terminal. If we modify the script and make changes then those changes will stay even after rstarting the terminal

---

## SESSION
session is on when terminal is opened and it is associated with a PID  
session get closed as terminal get closed  
PID for the session can be get via- echo $$

for nested session we use- bash

---

## Environment variables
every shell session hold some raw information, that info is called Environment variables  
env variables can be access via- printenv

---

## ALIAS
**ALIAS** - to create a shortcut command for a already created script of file to excute directly.

### To set as session variable-

```bash
alias sweet='cat ~/Desktop/Fruits.txt'
```

**sweet** =trrigering word/ cmd  
**~/Desktop/Fruits.txt** = path to the file/script

**note-** this will stop working once you reopen the terminal as it is set as session variable

### To set as Environment variable-

```bash
alias sweet='cat ~/Desktop/Fruits.txt'
```

write the same in .bashrc file and save it  
*********

you can also make alias via cmd without manually editing .bashrc file via-

```bash
echo "alias ll='ls -la'" >> ~/.bashrc source ~/.bashrc
```

**alias** - cmd  
**ll** -trigger words  
**ls -la** - command  
**echo "alias ll='ls -la'" >> ~/.bashrc** adds the alias definition to the ~/.bashrc file, which is executed every time a new terminal session is started.

**source ~/.bashrc** reloads the ~/.bashrc file, applying the changes immediately without needing to restart the terminal.

***** 
you can create a .bash_aliases folder in home directory and inside can write different aliases like-  
alias me= whoami

then save it and restart terminal

by this you can create multiple aliases without modifying .bashrc file

---

## BASH

Shell is a CLI that allows user to intract with OS via commands.
- It seves as a mediator between user and OS enabling users to configure files/system
- Shell also suppot scripting, allowing users to write scripts (sequence of commands) to automate tasks.
- there are several types of shell and broadly they can be catagorised in to 2 main - Unix like shell and windows Shell

### Unix-like Shells

**Bourne Shell (sh)**: The Bourne Shell was one of the earliest Unix shells and served as the basis for many subsequent shells. It provides basic functionality and is often used for scripting.

**Bash (Bourne Again SHell)**: Bash is the default shell for many Unix-like operating systems, including Linux and macOS. It extends the capabilities of the original Bourne Shell and incorporates features from other shells like the Korn Shell and the C Shell.

**Korn Shell (ksh)**: The Korn Shell was developed by David Korn as an enhancement to the Bourne Shell. It includes features from both the Bourne Shell and the C Shell, making it a powerful and user-friendly shell.

**C Shell (csh)**: The C Shell has a syntax that is somewhat C-like and was developed to provide interactive features not present in the original Bourne Shell. Its successor, tcsh, is an improved version with additional features.

**Zsh (Z Shell)**: Zsh is an extended shell that incorporates features from bash, ksh, and tcsh. It includes advanced scripting capabilities and interactive features for users.

### Windows Shells

**Command Prompt (cmd.exe)**: The Command Prompt is the traditional command-line interface for Windows. While it lacks some advanced features found in Unix-like shells, it provides a basic command-line environment.

**PowerShell**: PowerShell is a more recent and powerful shell for Windows. It is designed for automation and task scripting, with a focus on managing system components through a command-line interface.

---

## $PATH

PATH variable contains a list of directories where teh shell looks for excutable files.

**echo $PATH** - to check the PATH directories

### Add the script to a directiry in the PATH

You can add your own directory to path via -

```bash
PATH=$PATH:/home/rex/bin
```

after colon you need to mention directory path  
and copy above in .bashrc file\

---

## LINUX SCRIPTS

script is a series of commands written in a scripting language (like BASH) that can be excuted by the shell  
**BASH** - It is a both command line interpreter (shell) and a scripting language.

When you execute a script, the system typically relies on the shebang (the #!/bin/bash line at the beginning of the script) to determine the interpreter that should be used, regardless of the file extension. This allows you to name your scripts with or without a .sh (shell script) extension.

```bash
#!/bin/bash
```
**bash** - is a program that is use to excute script  
**bin** - excutable binary path

### how to excute script=

**bash myFirstScript** = This explicitly tells the Bash shell to execute the script. It's commonly used for Bash scripts.

**sh myFirstScript** = This instruct the system to use default Shell

**source myFirstScript** = this runs the script in the current shell session instead of spawning a new process. It's often used to execute scripts that modify the environment, such as setting environment variables.

**./myFirstScript** = Requires the script to be made executable If the file is found and has execute permission, the shell executes it using the appropriate interpreter specified in the shebang line.

**/home/ooo/myFirstScript** =Even though you're not explicitly providing the script file to a command like cat or echo, you're instructing the shell to execute the script at the given absolute path. The shell takes care Of locating the file and using the correct interpreter to run it.

**NOTE-** If you need to run script without providing path eveytime, then Add the script to a directory in the PATH

---

## CRON JOBS
Cron jobs are scheduled tasks in Unix/Linux systems that run automatically at specified times or intervals using the cron daemon.

In linux every user has a cron file that contains the tasks that needs to be excuted a certain time  
to view that file- **crontab -e**

**e** - to edit

### Cron synatx-

```
***** command_to_be_executed
1 * Minute (0 - 59)
2 * Hour (O - 23)
3 * Day Of month (1 - 31)
4 * Month (1 - 12)
5 * Day of week (O - 6, where Sunday is O and Saturday is 6)
```

### special characters

• **Asterisk (*)**: Matches any value for the respective time unit. (every)  
• **Comma (,)**: Specifies a list of values.  
• **Hyphen (-)** Specifies a range of values.  
• **Slash (/)**: Specifies a step value for the range. For example, */5 in the minute field means every 5 minutes.

---

## History command
use to see all commands run in the History

**!!** - to run last cmd

**history 10** = to see last 10 commands

**history -d 45** = to clear part line in history  
**history -c** =to clear all history  
**history | head**  
**history | tail**  
**echo $HISTSIZE** = store command history  
**echo $HISTFILESIZE** = files size where history get saved

---

## Process Management

🔹 **View running processes:**  
**ps aux** =List all processes.

**top or htop** =Interactive live process viewer.

**pstree** =Tree view of processes.

🔹 **Kill or manage processes:**  
**kill PID** =Gracefully stop a process (get PID from ps).

**kill -9 PID** =Force kill (use only if kill fails).

**pkill processname** ====Kill by process name (e.g., pkill nginx).

**nice, renice** ====Set priority of a process (CPU scheduling).

---

## Useful Linux Networking Commands

🔹 **1. Check Network Connectivity**  
**ping google.com**  
Checks if the host is reachable; uses ICMP packets.

**curl ifconfig.me or curl ipinfo.io**  
Get your external (public) IP address.

**wget http://example.com**  
Download a webpage via HTTP. Good for testing server reachability.

🔹 **2. View/Manage Network Interfaces**

**ip a or ip addr**  
Shows all IP addresses of network interfaces.

**ip link**  
Shows interfaces and their status (up/down).

**ifconfig (deprecated, but still seen in older systems)**  
Legacy way to view IP addresses.

**ip r or ip route**  
Shows the routing table (default gateway, routes).

---

## Package Management

🔹 **Common apt commands:**

```bash
sudo apt update            # Refresh package lists
sudo apt upgrade           # Upgrade all upgradable packages
sudo apt install nginx     # Install a package
sudo apt remove nginx      # Remove a package
sudo apt purge nginx       # Remove package + config files
sudo apt autoremove        # Clean up unused dependencies
```

🔹 **Check installed packages:**
```bash
dpkg -l | grep nginx       # List specific installed package
```