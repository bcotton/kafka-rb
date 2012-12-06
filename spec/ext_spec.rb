# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
# 
#    http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
require File.dirname(__FILE__) + '/spec_helper'

describe Object do
  before { Kafka::Ext.instance_variable_set :@snappy, nil }

  describe "#ensure_snappy!" do
    before { Kafka::Ext.instance_variable_set :@snappy, nil }

    subject { ensure_snappy! { 42 } }
    
    context "when snappy is available" do
      before { Object.stub! :const_defined? => true }
      it { should == 42 }
    end
    
    context "when snappy is not available" do
      before { Object.stub! :const_defined? => false }
      
      it "raises an error" do
        expect { ensure_snappy! { 42 } }.to raise_error
      end
    end
  end
end