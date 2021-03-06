# Copyright 2019 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6
PYTHON_COMPAT=( python{3_5,3_6} )

inherit ament-cmake

DESCRIPTION="This package provides an implementation of a 2D costmap that takes in senso[...]"
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/SteveMacenski/navigation2-release/archive/release/dashing/${PN}/0.2.6-1.tar.gz -> ${PN}-dashing-release-${PV}.tar.gz"

LICENSE="( BSD Apache-2.0 )"
KEYWORDS="~x86 ~amd64 ~arm ~arm64"
IUSE="test"
RDEPEND="
	ros-dashing/geometry_msgs
	ros-dashing/laser_geometry
	ros-dashing/map_msgs
	ros-dashing/message_filters
	ros-dashing/nav2_msgs
	ros-dashing/nav2_util
	ros-dashing/nav2_voxel_grid
	ros-dashing/nav_msgs
	ros-dashing/pluginlib
	ros-dashing/rclcpp
	ros-dashing/rclcpp_lifecycle
	ros-dashing/sensor_msgs
	ros-dashing/std_msgs
	ros-dashing/tf2
	ros-dashing/tf2_geometry_msgs
	ros-dashing/tf2_ros
	ros-dashing/tf2_sensor_msgs
	ros-dashing/visualization_msgs
	test? ( ros-dashing/ament_cmake_gtest )
	test? ( ros-dashing/ament_cmake_pytest )
	test? ( ros-dashing/ament_lint_auto )
	test? ( ros-dashing/ament_lint_common )
	test? ( ros-dashing/launch )
	test? ( ros-dashing/launch_testing )
	test? ( ros-dashing/nav2_lifecycle_manager )
	test? ( ros-dashing/nav2_map_server )
"
DEPEND="${RDEPEND}
	ros-dashing/ament_cmake
	ros-dashing/nav2_common
"

SLOT="0"
ROS_DISTRO="dashing"
ROS_PREFIX="opt/ros/${ROS_DISTRO}"
