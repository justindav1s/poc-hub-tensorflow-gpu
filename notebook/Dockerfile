FROM registry.access.redhat.com/rhel7:7.6

USER root

RUN rpm -ivh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN yum update -y
RUN yum -y groupinstall "Development Tools"
RUN yum install -y pciutils dkms kernel-devel
RUN yum install -y wget

# https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64&target_distro=RHEL&target_version=7&target_type=rpmlocal
RUN wget https://developer.nvidia.com/compute/cuda/10.1/Prod/local_installers/cuda-repo-rhel7-10-1-local-10.1.168-418.67-1.0-1.x86_64.rpm
RUN rpm -i cuda-repo-rhel7-10-1-local-10.1.168-418.67-1.0-1.x86_64.rpm
RUN yum clean all
RUN yum -y install cuda --enablerepo=rhel-7-server-e4s-optional-rpms

USER 1001

CMD ["nvidia-smi"]
