FROM nginx:1.26.2-alpine

# Install dependencies
RUN apk add git \
    # for C compiler
    build-base  \
    # GCC
    #gcc
    zlib-dev \
    linux-headers \
    pcre-dev \
    openssl-dev

RUN git clone https://github.com/slact/nchan.git
RUN wget https://nginx.org/download/nginx-1.26.2.tar.gz && tar -xzvf nginx-1.26.2.tar.gz
RUN cd nginx-1.26.2/ && ./configure --with-compat --add-dynamic-module=/nchan \
    && make modules \
    && cp objs/ngx_nchan_module.so /etc/nginx/modules/



#./configure --sbin-path=/usr/local/nginx/nginx --conf-path=/usr/local/nginx/nginx.conf --pid-path=/usr/local/nginx/nginx.pid --with-http_ssl_module --with-pcre=../pcre2-10.39 --with-zlib=../zlib-1.3