# Novix

"Novix" is the name of a small set of bash scripts that make up my Arch Linux toolkit.

Think of it like my own personal flavor of Arch. It is safe for anyone to run, however
I offer no support for this. Consider it subject to change or be destroyed at any time.

Use at your own risk!

### High Level

 - A `novix` user with privileged access to the system.
 - All the tools I use while hacking installed.
 - My own personal wrappers for many of the tools. 


### Install Local

##### 1. Check out the source code. Don't worry about where, it will figure itself out later.

```bash 
cd /usr/local/src
git clone git@github.com:krisnova/home.git
cd home
```

##### 2. Run the installer locally. It will manage the rest.

```bash 
sudo -E make install
```

Note that the installer makes a fair number of assumptions, as it will attempt to take over your entire Arch linux setup. 

 - It assumes you intend to use `yay` to manage your AUR packages.
 - It assumes you are running as privilege root user.
 - It assumes you are okay with updating **your entire** system. (You should be!)
 - It assumes you are okay with running the latest kernel.

### Install remote

We love "novix" so much we can spawn more "novix" installations from a base one. 

If you happen to be in a situation where you have a remote Arch linux server online, and you want a quick and easy way to "move in" to the server you can remote provision a novix box.

```bash
# Assuming you are logged in as "novix" locally and have root@ssh access remotely.
${HOME}/bin/novix-remote-from-here root@10.0.0.100
```



















### Well Known Locations

```bash
# Seclists
/usr/share/seclists/
```

### Bash Snippets

Create a simple loop over the lines in a file.

```bash 
while read $LINE; do
  echo $LINE # Do something with the value
done <file.txt
```
Do something a given number of times; iterate over a set of numbers.

```bash 
for i in {1..100}
do
 echo "Running $i/100" # Do something for each iteration
done
```
Set a default value of a variable such that it can be overridden at launch of script.

```bash 
VAR="${VAR:-'default-value-here'}" # Set $VAR to default value if $VAR is empty/unset
```

For loop over strings. 

```bash 
for str in a b c d e f; do
  # do something with $str
done 
```



