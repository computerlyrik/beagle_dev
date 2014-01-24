#
# Cookbook Name:: foo2
# Recipe:: default
#
# Copyright 2014, computerlyrik
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'distcc'
include_recipe 'apt'

apt_repository "linaro-cross-build-tool" do
  uri          "http://ppa.launchpad.net/linaro-foundations/cross-build-tools/ubuntu"
  distribution node['lsb']['codename']
  components   ['main']
  keyserver    'keyserver.ubuntu.com'
  key          '099F4315'
  action       :add
  notifies     :run, "execute[apt-get update]", :immediately
end

%w{toolchain tools}.each do |repo|

  apt_repository "linaro-#{repo}" do
    uri          "http://ppa.launchpad.net/linaro-maintainers/#{repo}/ubuntu"
    distribution node['lsb']['codename']
    components   ['main']
    keyserver    'keyserver.ubuntu.com'
    key          '7BE1F97B'
    action       :add
    notifies     :run, "execute[apt-get update]", :immediately
  end

end

# DEPENDENCIES  for/and xbuilder
package "xapt" 
package "python-software-properties"
package "xbuilder"


# INSTALL ARM compatible libraries
%w{binutils-arm-linux-gnueabihf gcc-arm-linux-gnueabihf g++-arm-linux-gnueabihf}.each do |p|
  package p
end

#TODO: Make more flexible
execute "echo 'Y' | xbuild-chroot-setup precise /srv/chroots/precise-cross"

