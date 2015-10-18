yara download:
  cmd:
    - run
    - unless: test -d /home/vagrant/yara
    - name: curl -L https://github.com/plusvic/yara/archive/v3.4.0.tar.gz -o /home/vagrant/yara.tar.gz
    - creates: /home/vagrant/yara.tar.gz
    - require:
        - pkg: curl
        - pkg: tar

yara extract:
  cmd:
    - run
    - cwd: /home/vagrant
    - name: >
          tar xvzf yara.tar.gz
    - require:
        - cmd: yara download

yara dependencies:
  cmd:
    - run
    - cwd: /home/vagrant/yara-3.4.0
    - name: >
          sudo ./bootstrap.sh &&
          sudo ./configure &&
          sudo make &&
          sudo make install
    - require:
        - cmd: yara extract

yara python:
  cmd:
    - run
    - cwd: /home/vagrant/yara-3.4.0/yara-python
    - name: >
          python setup.py build &&
          sudo python setup.py install
    - require:
        - cmd: yara dependencies
