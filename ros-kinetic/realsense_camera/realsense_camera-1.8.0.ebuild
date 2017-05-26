# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="RealSense Camera package allowing access to Intel 3D cameras and advanced modules"
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/intel-ros/realsense-release/archive/release/kinetic/realsense_camera/1.8.0-0.tar.gz"

LICENSE="BSD 3-clause. See license attached"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-kinetic/dynamic_reconfigure
    ros-kinetic/librealsense
    ros-kinetic/message_runtime
    ros-kinetic/roscpp
    ros-kinetic/cv_bridge
    ros-kinetic/camera_info_manager
    ros-kinetic/std_msgs
    ros-kinetic/image_transport
    ros-kinetic/sensor_msgs
    ros-kinetic/tf
    ros-kinetic/rostest
    ros-kinetic/rgbd_launch
    ros-kinetic/message_generation
    ros-kinetic/nodelet
    ros-kinetic/pcl_ros
    dev-libs/boost
"
DEPEND="${RDEPEND}
    ros-kinetic/roslint
"

SLOT="0/0"
CMAKE_BUILD_TYPE=RelWithDebInfo
ROS_PREFIX="opt/ros/kinetic"

src_unpack() {
    wget -O ${P}.tar.gz ${SRC_URI}
    tar -xf ${P}.tar.gz
    rm -f ${P}.tar.gz
    mv *${P}* ${P}
}

src_configure() {
    mkdir ${WORKDIR}/src
    cp -R ${WORKDIR}/${P} ${WORKDIR}/src/${P}
}

src_compile() {
    echo ""
}

src_install() {
    cd ../../work
    source /opt/ros/kinetic/setup.bash
    catkin_make_isolated --install --install-space="${D}/${ROS_PREFIX}"
    rm -f ${D}/${ROS_PREFIX}/{.catkin,_setup_util.py,env.sh,setup.bash,setup.sh}
    rm -f ${D}/${ROS_PREFIX}/{setup.zsh,.rosinstall}
}