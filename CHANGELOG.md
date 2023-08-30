# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [v2.0.0]

### Breaking

Change in variable definitions, Update them as following.

- From `public_subnet`  to `public_subnets`
- From `private_subnet` to `private_subnets`
- From `private_routes` to `private_subnet_routes`
- From `public_routes`  to `public_subnet_routes`

### Features

- Default route to Internet gateway in public Subnets.
- Optional Configurable custom routes in public subnets.
- Optional EC2 Instance Connect Endpoint in the first private subnet.

### Added

- Example for VPC with bootstrap routing.
- Update Docs
## [v1.0.0]

### Added

- Added Initial version of module.
- Documention
- Example for a Simple VPC

## Features

- AWS VPC infrastrucutre provisioning.
- Dynamic Public and Private Subnets provisioning.
- Optional Bootstrap routing
- Optional internet Gateway creation with a default route in public subnets.