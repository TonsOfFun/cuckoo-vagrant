cuckoo setcap:
  cmd:
    - run
    - user: vagrant
    - name: sudo setcap cap_net_raw,cap_net_admin=eip /usr/sbin/tcpdump

cuckoo user setup:
  cmd:
    - run
    - user: vagrant
    - name: >
        sudo adduser cuckoo
        sudo usermod -G vboxusers cuckoo
    - require:
        - cmd: cuckoo setcap

cuckoo latest source code:
  cmd:
    - run
    - unless: test -d /home/vagrant/cuckoo
    - user: vagrant
    - name: >
          sudo git clone git://github.com/cuckoobox/cuckoo.git
    - require:
        - cmd: cuckoo user setup
