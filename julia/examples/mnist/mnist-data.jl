# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.

function get_mnist_providers(batch_size::Int; data_name=:data, label_name=:softmax_label, flat=true)
  # download MNIST into Pkg.dir("MXNet")/data/mnist if not exist
  filenames = mx.get_mnist_ubyte()

  # data provider
  train_provider = mx.MNISTProvider(image=filenames[:train_data],
                                    label=filenames[:train_label],
                                    data_name=data_name, label_name=label_name,
                                    batch_size=batch_size, shuffle=true, flat=flat, silent=true)
  eval_provider = mx.MNISTProvider(image=filenames[:test_data],
                                   label=filenames[:test_label],
                                   data_name=data_name, label_name=label_name,
                                   batch_size=batch_size, shuffle=false, flat=flat, silent=true)

  return (train_provider, eval_provider)
end
