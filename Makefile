default: usage

usage:
	@echo "'make devel' or 'make production'"

devel: bin/buildout
	bin/buildout -v -c development.cfg

production: bin/buildout
	bin/buildout -N -c production.cfg

clean:
	rm -f bin/* .installed.cfg 

pristine: clean
	rm -rf var


### development targets ###

pull: update
update: 
	@echo "=================== $@ ======================="
	git pull
	bin/develop update 'ploneawards.*'

status: fetch localstatus

localstatus:
	@echo "=================== $@ ======================="
	@for p in ploneawards.policy ploneawards.theme ploneawards.contenttypes ; \
		do ( echo '---'; echo -n "$$p... " && cd src/$$p && git status; ); \
	done
	@echo '---'
	@echo -n "buildout... "
	@git status

rebase:
	@echo "=================== $@ ======================="
	@for p in ploneawards.policy ploneawards.theme ploneawards.contenttypes ; \
		do ( \
			echo '---'; \
			echo -n "$$p... "; \
			cd src/$$p && git fetch; \
			b=`git branch|grep '^\*'|cut -f2 -d' '`; \
			git $@ origin/$$b; \
		); \
	done
	@echo -n "buildout... "
	b=`git branch|grep '^\*'|cut -f2 -d' '`; \
	git $@ origin/$$b

push:
	@echo "=================== $@ ======================="
	@for p in ploneawards.policy ploneawards.theme ploneawards.contenttypes ; \
		do ( echo '---'; echo -n "$$p... " && cd src/$$p && git push && git push --tags ); \
	done
	@echo '---'
	@echo -n 'buildout... '
	@git push
	@git push --tags

# branches
ls: 
	@echo "=================== $@ ======================="
	@for p in ploneawards.policy ploneawards.theme ploneawards.contenttypes ; \
		do ( echo '---'; echo "$$p... " && cd src/$$p && git branch -a -v; ); \
	done
	@echo '---'
	@echo -n 'buildout... '
	@git branch -a -v

# read remote
fetch: 
	@echo "=================== $@ ======================="
	@for p in ploneawards.policy ploneawards.theme ploneawards.contenttypes ; \
		do ( echo '---'; echo "$$p... " && cd src/$$p && git $@; ); \
	done
	@echo '---'
	@echo -n 'buildout... '
	@git $@
	@echo

### helper targets ###


bin/buildout: bin/python2.7
	@wget http://downloads.buildout.org/1/bootstrap.py
	@bin/python2.7 bootstrap.py -c development.cfg
	@rm bootstrap.*

bin/python2.7:
	@virtualenv --clear -p python2.7 --no-setuptools .
