# Copyright 2019 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6
PYTHON_COMPAT=( python{3_5,3_6} )

inherit ament-cmake

DESCRIPTION="A Python GUI plugin for introspecting available ROS message types.\
  Note [...]"
HOMEPAGE="http://wiki.ros.org/rqt_msg"
SRC_URI="https://github.com/ros2-gbp/${PN}-release/archive/release/dashing/${PN}/1.0.2-1.tar.gz -> ${PN}-dashing-release-${PV}.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"
RDEPEND="
	ros-dashing/python_qt_binding
	ros-dashing/rclpy
	ros-dashing/rqt_console
	ros-dashing/rqt_gui
	ros-dashing/rqt_gui_py
	ros-dashing/rqt_py_common
	dev-python/catkin_pkg
"
DEPEND="${RDEPEND}
	ros-dashing/ament_cmake
"

SLOT="0"
ROS_DISTRO="dashing"
ROS_PREFIX="opt/ros/${ROS_DISTRO}"
