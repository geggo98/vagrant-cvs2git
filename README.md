# Vagrant file for converting CVS to git

With this [Vagrant][vagrant] virtual environment, you can easily convert an existing CVS repository to a git repository. 

**Attention:** For this you will need the CVS respository as a directory (contains `.v` files). Neither a repository over the network ("p-server") nor a working copy are sufficient.

# Howto

1. Install [git][gitinstall] and [Vagrant][vagrantinstall] on your machine
2. Clone this repository into your project directory: `git clone https://github.com/geggo98/vagrant-cvs2git.git`
3. Open a shell in the project directory
4. Start Vagrant: `vagrant up`
5. Wait until Vagrant has started and provisioned the virtual machine. This might take a while
6. Vagrant has created a directory `cvs` in the project directory. Copy your CVS respository in this directory.
7. Connect with the Vagrant virtual machine: `vagrant ssh`
8. Inside the virtual machine, go to the directory "/vagrant": `cd /vagrant`. Hint: The contents of this directory inside the machine are in sync with the project directory outside the machine
9. Adapt the script "convert-cvs-to-git.sh", e.g. with `vim convert-cvs-to-git.sh` inside the machine or with any editor outside the machine (Vagrant will sync the file automatically)
10. Start the migration inside the machine: `./convert-cvs-to-git.sh`
11. Wait until the migration finishes. This will take some time.
12. When the migration was successful, you will find a new git repository in the project directory
13. Stop the virtual machine: `vagrant halt`
14. If you don't need the machine any more, discard it and reclaim the used disk space: `vagrant destroy`

# Under the hood
There are several ways to do this, e.g. using [`git cvsimport`][gitcvs] or [`cvs2git`][cvs2git]. The base technology for `git cvsimport` is not well supported anymore. So here we use the most current development version of `cvs2git`.

When you start the Vagrant box for the first time, it installs all necessary pre-requisites and then fetches, compiles and installs the most current development version of [cvs2git][cvs2git].

[vagrant]: https://www.vagrantup.com/
[cvs2git]: http://cvs2svn.tigris.org/cvs2git.html
[gitcvs]: https://git-scm.com/docs/git-cvsimport
[gitinstall]: https://git-scm.com/downloads
[vagrantinstall]: https://www.vagrantup.com/downloads.html
