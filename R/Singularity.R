Bootstrap: docker
FROM: r-base:4.2.0

%setup

%files

%labels
  R_Version 4.2.0

%environment
  R_BASE_VERSION=4.2.0
  LC_ALL=en_US.UTF-8
  LANG=en_US.UTF-8

%post

%apprun R
  exec R "${@}"

%apprun Rscript
  exec Rscript "${@}"

%runscript
  exec R "${@}"

%test
  exec R --version
