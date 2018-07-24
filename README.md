# blind-bake
Bootstrap script for Pi Bakery
Post install configuration for use with [PiBakery](https://pibakery.org)

- Updates apt packages
- Hardens the SSH config of the Pi according to https://stribika.github.io/2015/01/04/secure-secure-shell.html (Notably ec25519 keys only, no root login)
- Changes the default user from pi according to the [.env file](.env)

# TODO
Install a provisioning system

