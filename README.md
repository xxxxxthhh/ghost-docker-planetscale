# Ghost Docker + PlanetScale

This is a Dockerfile of [Ghost](https://github.com/TryGhost) CMS with a small patch to seamlessly support [PlanetScale](https://planetscale.com/) as its database provider.

## Motivation

For some time, [PlanetScale](https://planetscale.com/) was incompatible with Ghost. Thanks to PlanetScale supporting [foreign key constraints](https://planetscale.com/blog/announcing-foreign-key-constraints-support), it's now possible for the two to work together. However, there are tiny incompatibilities left that needs to be handled, which is the content of this repository.

## Warning

Foreign key constraints are currently supported by PlanetScale in beta. This means that if you want to unenroll your database from the beta, make sure to first drop your foreign key constraints, as Planetscale can not downgrade your database at this time. You can read more about it [here](https://planetscale.com/blog/announcing-foreign-key-constraints-support) and [here](https://planetscale.com/docs/concepts/foreign-key-constraints). Just something you need to consider before switching providers.

## Usage and Setup

You can check usage and instructions at this [post](https://justrox.me/ghost-blog-planet-scale/).

## Database

PlanetScale does not allow insecure connections, as such ghost must use SSL/TLS. From this [discussion](https://forum.ghost.org/t/self-hosting-ghost-with-docker-and-planetscale/36206/5), the solution is to use:

```
database__connection__ssl: '[{"rejectUnauthorized":true}]'
```

## Reference

This dockerfile is built from [ghost's official docker image](https://hub.docker.com/_/ghost/). You can check additional reference and configuraitons there.

## Notes on themes and adapters

Docker's filesystem alone is ephemeral which is why any changes to the filesystem are not persisted between deploys. This is why, this example uses Cloudinary for storage. The above limitation also affects the way themes work with Ghost, we use the bin/themes.sh and other related scripts to copy over the themes and adapters every time you deploy. That way, the theme and adapters are always present.

To add a theme or other, first add the package as a dependency to the package.json file and then add it to the list of themes in the bin/themes.sh file.

Do NOT add a theme directly using the Ghost UI, it will look like it worked but will break whenever you deploy your app again.

## Bugs?

Open an issue or contact me at [@justfizzbuzz](https://twitter.com/justfizzbuzz).

## Credits

This repo heavily adopts https://github.com/railwayapp-templates/ghost and https://github.com/alphasecio/ghost-on-railway's implementation.
