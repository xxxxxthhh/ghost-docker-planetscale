# Ghost Docker + PlanetScale

This is a Dockerfile of [Ghost](https://github.com/TryGhost) CMS with a small patch to seamlessly support [PlanetScale](https://planetscale.com/) as its database provider.

## Motivation

For some time, [PlanetScale](https://planetscale.com/) was incompatible with Ghost. Thanks to PlanetScale supporting [foreign key constraints](https://planetscale.com/blog/announcing-foreign-key-constraints-support), it's now possible for the two to work together. However, there are tiny incompatibilities left that needs to handled, which is the content of this repository.

## Warning

Foreign key constraints are currently supported by PlanetScale in beta. This means that if you want to unenroll your database from the beta, make sure to first drop your foreign key constraints, as Planetscale can not downgrade your database at this time. You can read more about it [here](https://planetscale.com/blog/announcing-foreign-key-constraints-support) and [here](https://planetscale.com/docs/concepts/foreign-key-constraints). Just something you need to consider before switching providers.

## Instructions

You can check usage and instructions at this [post](https://justrox.me/ghost-blog-planet-scale/).

## Bugs?

Open an issue or contact me at [@justfizzbuzz](https://twitter.com/justfizzbuzz).
