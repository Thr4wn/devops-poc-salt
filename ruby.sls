
rvm-deps:
  pkg.installed:
    - pkgs:
      - bash
      - coreutils
      - gzip
      - bzip2
      - gawk
      - sed
      - curl
      - git-core
      - subversion
      - gnupg
  cmd.run:
    - user: root
    - name: /srv/salt/gpg_ruby_receive.sh

mri-deps:
  pkg.installed:
    - pkgs:
      - build-essential
      - openssl
      - libreadline6
      - libreadline6-dev
      - curl
      - git-core
      - zlib1g
      - zlib1g-dev
      - libssl-dev
      - libyaml-dev
      - libsqlite3-0
      - libsqlite3-dev
      - sqlite3 #TODO: is this really necessary for installing ruby?
      - libxml2-dev
      - libxslt1-dev
      - autoconf
      - libc6-dev
      - libncurses5-dev
      - automake
      - libtool
      - bison
      - subversion
      - ruby
      - libgmp3-dev #required for installing binaries when doing `gem install rails` later

ruby-2.3.0:
  rvm.installed:
    - default: True
    - user: root
    - require:
      - pkg: rvm-deps
      - pkg: mri-deps
  cmd.run:
    - user: root
    - name: /srv/salt/bashrc_rvm.sh

rails:
  gem.installed:
    - user: root
    - require:
      - rvm: ruby-2.3.0

# these are steps required for the app to run
app-deps:
  pkg.installed:
    - pkgs:
      - sqlite3

