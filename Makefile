default: fast

all: bin/buildout
	bin/buildout

fast: bin/buildout
	bin/buildout -N

clean:
	rm -f bin/* .installed.cfg 

pristine: clean
	rm -rf var


### helper targets ###

bin/buildout: bin/python2.6
	@wget http://svn.zope.org/repos/main/zc.buildout/trunk/bootstrap/bootstrap.py
	@bin/python2.6 bootstrap.py
	@rm bootstrap.*

bin/python2.6:
	@virtualenv --clear -p python2.6 --no-site-packages --distribute .
	@bin/easy_install Paste==1.7.4
	@bin/easy_install PasteDeploy==1.3.3
	@bin/easy_install PasteScript==1.7.3

