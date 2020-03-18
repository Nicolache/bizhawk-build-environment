# https://github.com/TASVideos/BizHawk
FROM fedora:31
ADD BizHawk-2.4.tar.gz /opt
COPY which /usr/bin
COPY Cg-3.1_April2012_x86_64.rpm /opt
COPY openal-soft-1.19.1-3.fc31.x86_64.rpm /opt
RUN dnf -y install nuget.x86_64 ; \
  rpm --import "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF" ; \
  curl https://download.mono-project.com/repo/centos8-stable.repo | tee /etc/yum.repos.d/mono-centos8-stable.repo ; \
  rpm --import https://packages.microsoft.com/keys/microsoft.asc ; \
# https://docs.microsoft.com/ru-ru/dotnet/core/install/linux-package-manager-fedora31
#  wget -q -O /etc/yum.repos.d/microsoft-prod.repo https://packages.microsoft.com/config/fedora/31/prod.repo ; \
  curl https://packages.microsoft.com/config/fedora/31/prod.repo | tee /etc/yum.repos.d/microsoft-prod.repo ; \
  dnf -y update ; \
  dnf -y install msbuild ; \
  dnf -y install mono-complete.x86_64 ; \
  dnf -y install mono-basic.x86_64 ; \
  dnf -y install wine.x86_64 ; \
  dnf -y install dotnet-runtime-3.1 ; \
  dnf -y install glibc.x86_64 ; \
  rpm -i /opt/openal-soft-1.19.1-3.fc31.x86_64.rpm ; \
  rpm -i /opt/Cg-3.1_April2012_x86_64.rpm ; \
  dnf -y install dotnet-sdk-3.1
