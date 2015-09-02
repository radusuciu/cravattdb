FROM cravattlab/cravattdb_base

MAINTAINER Radu Suciu <radusuciu@gmail.com>

# Clone repos in

# Create user with non-root privileges
RUN adduser --disabled-password --gecos '' cravattdb
RUN chown -R cravattdb /home/cravattdb

# Setup cimage
RUN ln -s /home/cravattdb/cimage-minimal/cimage2 /usr/local/bin
RUN ln -s /home/cravattdb/cimage-minimal/cimage_combine /usr/local/bin
ENV CIMAGE_PATH /home/cravattdb/cimage-minimal

# Setup CravattDB
ENV PATH /home/cravattdb/cravatt-ip2/env/bin:$PATH
USER cravattdb

WORKDIR /home/cravattdb/cravatt-ip2
ADD /start.sh /home/cravattdb/start.sh
CMD [ "/bin/bash", "/home/cravattdb/start.sh" ]