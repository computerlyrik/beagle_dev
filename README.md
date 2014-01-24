beagle_dev
==========

Setting up a virtual machine for beagle development using Vagrant. Also sets up distcc for distributed compiling.

Requirements
------------

```vagrant``` - install with your package manager
vagrant berkshelf plugin - ```vagrant plugin install vagrant-berkshelf```

Howto run
---------

```cd beagle_vm```

Create and start VM ```vagrant up```
Log into your vagrant VM ```vagrant ssh```

Use [Linaro Documentation] for further setup and tell me the commands via issues tracking system!

Known Bugs
----------
The last command in the chef cookbook
```xbuild-chroot-setup precise /srv/chroots/precise-cross```
will fail! Nedds further work!

[Linaro Documentation]: https://wiki.linaro.org/Platform/DevPlatform/CrossCompile/UsingMultiArch
