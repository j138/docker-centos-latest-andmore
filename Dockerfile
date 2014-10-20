FROM centos:centos6
MAINTAINER j138

# package install
RUN yum -y install yum-plugin-fastestmirror
RUN echo "include_only=.jp" >> /etc/yum/pluginconf.d/fastestmirror.conf
RUN yum update -y
RUN yum install wget -y

RUN \
  rpm --import http://rpms.famillecollet.com/RPM-GPG-KEY-remi ;\
  rpm --import http://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-6 ;\
  rpm --import http://apt.sw.be/RPM-GPG-KEY.dag.txt ;\
  rpm -ivh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm ;\
  rpm -ivh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm ;\
  rpm -ivh http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm
ADD td.repo /etc/yum.repos.d/td.repo

RUN \
  yum --enablerepo=remi,epel,treasuredata install -y \
  sudo which tar bzip2 zip unzip curl-devel git openssh-server openssh-clients syslog gcc gcc-c++ libxml2 libxml2-devel libxslt libxslt-devel readline readline-devel jemalloc jemmalloc-devel \
  httpd httpd-devel mysql-server mysql-devel phpmyadmin sqlite sqlite-devel redis td-agent \
  php php-devel php-pear php-mysql php-gd php-mbstring php-pecl-imagick php-pecl-memcache nodejs npm erlang bash-completion zsh zsh-devel htop vim file \
  python python-devel python-pip pycairo python-twisted-web python-zope-interface python-django-tagging python-rrdtool \
  mod_wsgi mod_python python-simplejson python-sqlite2 python-gunicorn

