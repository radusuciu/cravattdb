FROM cravattlab/cravattdb_base

MAINTAINER Radu Suciu <radusuciu@gmail.com>

# Create user with non-root privileges
RUN adduser --disabled-password --gecos '' cravattdb
RUN chown -R cravattdb /home/cravattdb

# Setup cimage
RUN ln -s /home/cravattdb/cimage-minimal/cimage2 /usr/local/bin
RUN ln -s /home/cravattdb/cimage-minimal/cimage_combine /usr/local/bin
ENV CIMAGE_PATH /home/cravattdb/cimage-minimal

# install some global npm packages we require
RUN npm install -g typescript@next

# Setup CravattDB
ENV PATH /home/cravattdb/cravattdb/env/bin:$PATH
USER cravattdb

WORKDIR /home/cravattdb/cravattdb
CMD [ "/bin/bash", "/home/cravattdb/cravattdb/start.sh" ]