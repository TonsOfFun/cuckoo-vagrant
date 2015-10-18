pyssdeep install:
  cmd:
    - run
    - unless: test -d /home/vagrant/pyssdeep
    - name: >
        sudo svn checkout http://pyssdeep.googlecode.com/svn/trunk/ pyssdeep
        cd pyssdeep
        sudo python setup.py build
        sudo python setup.py install
    - require:
        - pkg: python
        - pkg: subversion
        
