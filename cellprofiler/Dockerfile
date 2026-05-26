FROM ubuntu:16.04

RUN   apt-get -y update
RUN   apt-get -y upgrade

RUN   apt-get -y install   \
        build-essential    \
        cython             \
        git                \
	wget		   \
	unzip	           \
        libmysqlclient-dev \
        libhdf5-dev        \
        libxml2-dev        \
        libxslt1-dev       \
        openjdk-8-jdk      \
        python-dev         \
        python-pip         \
        python-wxgtk3.0    \
        python-vigra       \
	python-pytest	   \
        python-zmq         \
        libcanberra-gtk-module \
        packagekit-gtk3-module

WORKDIR /usr/local/src

ARG version=3.1.8
RUN wget https://github.com/CellProfiler/CellProfiler/archive/v$version.tar.gz
RUN tar xzvf v$version.tar.gz
RUN mv CellProfiler-$version CellProfiler

WORKDIR /usr/local/src/CellProfiler

RUN pip install --no-cache-dir \
        boto3==1.9.60 \
	centrosome==1.1.6 \
	docutils==0.14	\
        h5py==2.8.0 \
        inflect==2.1.0 \
        javabridge==1.0.18 \
        joblib==0.13.0 \
        mahotas==1.4.5 \
        matplotlib==2.2.3 \
        mysqlclient==1.3.13 \
        numpy==1.15.4 \
        prokaryote==2.4.1 \
        python-bioformats==1.5.2 \
        pyzmq==15.3.0 \
        raven==6.9.0 \
        requests==2.20.1 \
        scikit-image==0.14.0 \
        scikit-learn==0.20.1 \
        scipy==1.1.0 \
        six==1.11.0 \
        pillow==4.3 \
        networkx==2.2 \
	dask==0.19.1

RUN pip install --no-cache-dir --editable .


ADD https://github.com/just-containers/s6-overlay/releases/download/v1.21.2.2/s6-overlay-amd64.tar.gz /tmp/

RUN gunzip -c /tmp/s6-overlay-amd64.tar.gz | tar -xf - -C /

ENTRYPOINT ["/init", "cellprofiler"]

CMD ["--run","--run-headless", "--help"]
