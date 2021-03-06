#
# Author:: Benjamin Black (<b@b3k.us>) and Sean Cribbs (<sean@basho.com>)
# Cookbook Name:: megam_riak
#
# Copyright (c) 2013 Basho Technologies, Inc.
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

name              "megam_riak"
maintainer        "Megam Systems"
maintainer_email  "thomasalrin@megam.io"
license           "Apache 2.0"
description       "Installs and configures Riak distributed data store"
version           "2.0.0"

%w{apt yum build-essential erlang git ulimit }.each do |d|
  depends d
end


depends "megam_logging"


%w{ubuntu debian centos redhat fedora}.each do |os|
  supports os
end
