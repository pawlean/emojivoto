FROM gitpod/workspace-full

## Install Kubectl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    chmod +x ./kubectl && \
    sudo mv ./kubectl /usr/local/bin/kubectl && \
    mkdir ~/.kube

## Install Telepresence
RUN sudo curl -fL https://app.getambassador.io/download/tel2oss/releases/download/v2.17.0/telepresence-linux-amd64 -o /usr/local/bin/telepresence
RUN sudo chmod a+x /usr/local/bin/telepresence

RUN export GOPATH=/path/to/go && \
    export PATH=$PATH:$GOPATH/bin

RUN sudo apt install -y protobuf-compiler

RUN sudo go get -u github.com/golang/protobuf/protoc-gen-go
RUN sudo go get google.golang.org/protobuf/reflect/protoreflect@v1.26.0
RUN sudo go get google.golang.org/protobuf/runtime/protoimpl@v1.26.0

RUN sudo npm install --global yarn
