My personal dotfiles for Ubuntu

1. Alias
-------- 
	
```shell
$ ..		# cd ..
$ e 		# exit
$ vir		# vituralenv --no-site-packages pyenv
$ svenv 	# source pyenv/bin/activate
$ d 		# deactivate in case of virtualenv

# django
$ run		# python manage.py runserver
$ mig		# python manage.py migrate
$ col		# python manage.py collectstatic --noinput
$ mkmig		# python manage.py makemigrations
$ djsh		# python manage.py shell
$ mkmigd	# python manage.py makemigrations --dry-run
```

2. Functions
------------

```shell
$ nf <filename>		# creates a newfile and opens it with sublime
$ mk <directory> 	# creates a new directory and cd into it
$ hme 				# a help function to display all aliases and shortcuts 

# django 
$ cuser 			# creates a superuser <admin> with password <admin>

# git
$ ga 			# git add
$ gc 			# git commit -m <your message>
$ gst 			# git status
$ gpo 			# git push origin <your branch>	 * supports AUTOCOMPLETE
$ gpu 			# git pull origin <your branch>
$ gbr 			# git branch
$ gco 			# git checkout <your branch>	* supports AUTOCOMPLETE
$ gcn 			# git checkout -b <your branch>
$ gr 			# git remote -v
$ gl 			# git log
$ gd 			# git diff
$ gds 			# git diff --staged

```