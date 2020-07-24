#!/bin/bash
#================
# FILE          : config.sh
#----------------
# PROJECT       : OpenSuSE KIWI Image System
# COPYRIGHT     : (c) 2013 SUSE LLC
#               :
# AUTHOR        : Robert Schweikert <rjschwei@suse.com>
#               :
# BELONGS TO    : Operating System images
#               :
# DESCRIPTION   : configuration script for SUSE based
#               : operating systems
#               :
#               :
# STATUS        : BETA
#----------------
#======================================
# Functions...
#--------------------------------------
test -f /.kconfig && . /.kconfig
test -f /.profile && . /.profile

#======================================
# Greeting...
#--------------------------------------
echo "Configure image: [$kiwi_iname]..."

#======================================
# Setup baseproduct link
#--------------------------------------
suseSetupProduct

#======================================
# Disable recommends
#--------------------------------------
echo 'install_weak_deps=False' >> /etc/dnf/dnf.conf

#======================================
# Exclude docs intallation
#--------------------------------------
echo 'tsflags=nodocs' >> /etc/dnf/dnf.conf

#======================================
# Remove locale files
#--------------------------------------
(cd /usr/share/locale && find -name '*.mo' | xargs rm)
