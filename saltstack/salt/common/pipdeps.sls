pip dependencies:
  cmd:
    - run
    - name: >
        sudo pip install cybox &&
        sudo pip install pydeep &&
        sudo pip install jinja2 &&
        sudo pip install pymongo &&
        sudo pip install bottle &&
        sudo pip install pefile &&
        sudo pip install maec==4.0.1.0 &&
        sudo pip install django &&
        sudo pip install chardet &&
    - require:
        - pkg: python-pip
