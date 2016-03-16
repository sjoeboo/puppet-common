# puppet_common

Most just facts I tend to want around in puppet deployments?

## facts

### `hostname_base`
contains the `hostname` of the node, with trailing digits stripped.

```
[root@puppetmaster01 facter]# facter -p |grep hostname_base
hostname_base => puppetmaster
```

### `born_on`
**RedHat/Centos** Finds out when the `basesystem` rpm was installed and turns that into a installation date. Will not work well on systems build from a golden image!
```
born_on => 2016-03-08
```
### `classes`
Finds the classes.txt file, and parses it into an array of classes on the system as of the last puppet run. `roles` and `profiles` get dropped from this list.

### `classes_all`
A copy of `classes` without `roles` or `profiles` remove, aka, *the whole shebang*

### `roles`
Takes `classes` fact and extracts classes starting with `role`

### `profiles`
Takes `classes` fact and extracts classes starting with `profile`

### `rpm_inventory`
**RedHat/CentOS** Generates a md5sum of the installed packages. Allows you to quickly compare one system to another or check that 2 systems have identical packages (names and versions) installed.
