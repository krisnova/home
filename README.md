# My Hacker and Research Workspace

An Arch Linux based workspace for penetration testing, load testing, OSINT, network scanning, and more.

### Setting Up

Checkout the repository and set the `NOVIX_WORKSPACE` environment variable which is automatically managed by running `make install`.

Run the `Makefile` for help installing the defaults.

Use the files in `bin` to do things for the workspace. Note: this is a different bin than what is provisioned with `novix`!

### Provision Novix Remote

The `novix` provision scripts are my way of quickly bootstrapping a fresh Arch Linux image with all of my magic. 

If you intend to make changes to the base install please see the following script:

``` 
$NOVIX_WORKSPACE/home/novix/bin/novix-packages
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



