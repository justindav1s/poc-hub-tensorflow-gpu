FROM docker-registry.default.svc:5000/jupyterhub-gpu/s2i-minimal-notebook:3.6

USER root

#### Default PATH ####

ENV CUDA_HOME /usr/local/cuda
ENV PATH $PATH:$CUDA_HOME

### CUDA Profile ####
#  For CUDA profiling, TensorFlow requires CUPTI.

ENV LD_LIBRARY_PATH /usr/local/cuda/lib64:/usr/local/cuda/extras/CUPTI/lib64:$LD_LIBRARY_PATH

#### Nvidia Docker ####

LABEL com.nvidia.volumes.needed="nvidia_driver"

#### Nvidia Container Runtime ###

ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES compute,utility
ENV NVIDIA_REQUIRE_CUDA "cuda>=9.0"

#### NVIDIA CUDA Runtime ####
# required to install cuda : July 2019
RUN rpm -ivh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN yum update -y
RUN yum -y groupinstall "Development Tools"
RUN yum install -y pciutils dkms kernel-devel

# https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64&target_distro=RHEL&target_version=7&target_type=rpmlocal
RUN wget https://developer.nvidia.com/compute/cuda/10.1/Prod/local_installers/cuda-repo-rhel7-10-1-local-10.1.168-418.67-1.0-1.x86_64.rpm
RUN sudo rpm -i cuda-repo-rhel7-10-1-local-10.1.168-418.67-1.0-1.x86_64.rpm
RUN sudo yum clean all
RUN sudo yum install cuda

USER 1001

RUN /opt/app-root/builder/assemble
