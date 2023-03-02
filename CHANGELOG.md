# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]
- Feat: add efs access point(s)
- feat: Add access point support
- feat: Add replication support
- feat: Add backup policy support

## [1.1.2] - 2023-03-02
### Description
- fix: limitation of only providing/specifying a single security group. Prior to this fix, the module could only supply one security group. With this improvement, external security groups may be utilized without reliance on the module's internal security group. Furthermore, this new functionality also allows for the usage of both internal and external security groups simultaneously.

## [1.1.1] - 2023-01-25
### Description
- fix: Avoid creating multiple vpcs by adding supporting resources
- feat: Add updated repository and workflow files

## [1.1.0] - 2022-06-24
### Description
- Feature: Efs security group and rules
- Feature: multiple mount points
- Refactored Examples (complete and minimum)
- Added Standard template files
- fix: checkov failed scans
- Added: VPC creation to example

## [1.0.1] - 2022-04-28
### Description
- fix: Example source link

## [1.0.0] - 2022-03-07
### Description
- Feature: EFS file system
- fix: Version lock
- Added: Efs module example

[Unreleased]: https://github.com/boldlink/terraform-aws-efs/compare/1.1.2...HEAD

[1.1.2]: https://github.com/boldlink/terraform-aws-efs/releases/tag/1.1.2
[1.1.1]: https://github.com/boldlink/terraform-aws-efs/releases/tag/1.1.1
[1.1.0]: https://github.com/boldlink/terraform-aws-efs/releases/tag/1.1.0
[1.0.1]: https://github.com/boldlink/terraform-aws-efs/releases/tag/1.0.1
[1.0.0]: https://github.com/boldlink/terraform-aws-efs/releases/tag/1.0.0
