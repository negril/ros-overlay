# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="roswtf is a tool for diagnosing issues with a running ROS system. Think of it as a FAQ implemented in code."
HOMEPAGE="http://ros.org/wiki/roswtf"
SRC_URI="https://github.com/ros-gbp/ros_comm-release/archive/release/lunar/roswtf/1.13.0-0.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-lunar/roslib
    ros-lunar/rosbuild
    ros-lunar/rosgraph
    ros-lunar/rosservice
    ros-lunar/roslaunch
    ros-lunar/rosnode
    dev-python/paramiko
    dev-python/rospkg
"
DEPEND="${RDEPEND}
    ros-lunar/rostest
"

SLOT="0/0"
CMAKE_BUILD_TYPE=RelWithDebInfo
ROS_PREFIX="opt/ros/lunar"

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
    source /opt/ros/lunar/setup.bash
    catkin_make_isolated --install --install-space="${D}/${ROS_PREFIX}"
    rm -f ${D}/${ROS_PREFIX}/{.catkin,_setup_util.py,env.sh,setup.bash,setup.sh}
    rm -f ${D}/${ROS_PREFIX}/{setup.zsh,.rosinstall}
}