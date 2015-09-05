FROM centos

MAINTAINER [Alejandro Baez](https://twitter.com/a_baez)

ENV LUA_MAJOR_VERSION 5.1
ENV LUA_MINOR_VERSION 5
ENV LUA_VERSION ${LUA_MAJOR_VERSION}.${LUA_MINOR_VERSION}

# Dependencies
RUN yum install -y make tar unzip gcc gcc-devel openssl-devel readline-devel

RUN curl -L http://www.lua.org/ftp/lua-${LUA_VERSION}.tar.gz | tar xzf -
WORKDIR /lua-$LUA_VERSION

# build lua
RUN make linux test
RUN make install

WORKDIR /

# lua env
ENV WITH_LUA /usr/local/
ENV LUA_LIB /usr/local/lib/lua
ENV LUA_INCLUDE /usr/local/include


RUN rm /lua-$LUA_VERSION -rf
