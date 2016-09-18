###Dotfiles for Ubuntu

#####Installation

```
git clone https://github.com/staranjeet/dotfiles.git ~/.dotfiles
```

Then add the following lines to your `.bashrc`

```
source ~/.dotfiles/.aliases
source ~/.dotfiles/.functions

```

or to include all at once, add

```
for file in ~/.dotfiles/.{aliases,functions}; do
    [ -r "$file" ] && source "$file"
done
unset file

```

###Includes

#####Alias

```
..                      # cd ..
vir                     # creates a python virtual env
........                # and many more

```

#####Functions


```
$ nf <filename>		    # creates a newfile and opens it with sublime
$ mk <directory> 	    # creates a new directory and cd into it
$ dwnl <youtube-url>    # downloads from youtubes and create a mp3 file for the same
```

#####Setup Machine

A script which install basic packages specific to my needs. Run the script by

```
sudo ./setup-machine.sh
```

#####Template for C++ programs

A python script which generates a C++ program template
