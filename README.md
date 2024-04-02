# libtasn1
GNU Emacs30.0.50に含まれる`java/INSTALL`にしたがって取得したlibtasn1モジュール(gnutlsの依存モジュール)のレポジトリ。

# 作成した手順
1. [Android ports for GNU Emacsのソース書庫](https://sourceforge.net/projects/android-ports-for-gnu-emacs/files/libtasn1-4.19.0-emacs.tar.gz)を取得して展開

```bash
$: wget https://sourceforge.net/projects/android-ports-for-gnu-emacs/files/libtasn1-4.19.0-emacs.tar.gz
$: tar xvfz libtasn1-4.19.0-emacs.tar.gz
```

2. gitレポジトリとして初期化し修正用ブランチ`my/master`をcheckout

```bash
$: cd libtasn1-4.19.0
$: git init
$: git checkout -b my/master
```

3. 空レポジトリにpush

```bash
$: git add -A
$: git commit -m 'nanika commit messages...'
$: gh repo create my-libtasn1-4.19.0 --public
$: git remote add mine https://github.com/JIBUN/my-libtasn1-4.19.0.git
$: git branch -M my/master
$: git push -u mine my/master
```

ここまで
ここから下は元の`README.md`の内容

# Libtasn1 README -- Introduction information

This is GNU Libtasn1, a small ASN.1 library.

The C library (libtasn1.*) is licensed under the GNU Lesser General
Public License version 2.1 or later.  See the file COPYING.LIB.

The command line tool, self tests, examples, and other auxilliary
files, are licensed under the GNU General Public License version 3.0
or later.  See the file COPYING.

## Building the library

We require several tools to build the software, including:

* [Make](https://www.gnu.org/software/make/)
* [Automake](https://www.gnu.org/software/automake/) (use 1.11.3 or later)
* [Autoconf](https://www.gnu.org/software/autoconf/)
* [Libtool](https://www.gnu.org/software/libtool/)
* [Texinfo](https://www.gnu.org/software/texinfo/)
* [help2man](http://www.gnu.org/software/help2man/)
* [Tar](https://www.gnu.org/software/tar/)
* [Gzip](https://www.gnu.org/software/gzip/)
* [bison](https://www.gnu.org/software/bison/)
* [Texlive & epsf](https://www.tug.org/texlive/) (for PDF manual)
* [GTK-DOC](https://www.gtk.org/gtk-doc/) (for API manual)
* [Git](https://git-scm.com/)
* [libabigail](https://pagure.io/libabigail/) (for abi comparison in make dist)
* [Valgrind](https://valgrind.org/) (optional)

The required software is typically distributed with your operating
system, and the instructions for installing them differ.  Here are
some hints:

Debian/Ubuntu:
```
sudo apt-get install make git autoconf automake libtool bison
sudo apt-get install texinfo help2man gtk-doc-tools valgrind abigail-tools
```

PDF manual - Debian <= stretch:
```
sudo apt-get install texlive-generic-recommended texlive texlive-extra-utils
```

PDF manual - Debian >= buster:
```
sudo apt-get install texlive-plain-generic texlive texlive-extra-utils
```

The next step is to run autoreconf, ./configure, etc:

```
$ ./bootstrap
```

Then build the project normally:

```
$ ./configure
$ make check
```

Happy hacking!


## Manual

The manual is in the `doc/` directory of the release.

You can also browse the manual online at:

 - https://www.gnu.org/software/libtasn1/manual/
 - https://gnutls.gitlab.io/libtasn1/manual/
 - https://gnutls.gitlab.io/libtasn1/manual/libtasn1.html
 - https://gnutls.gitlab.io/libtasn1/manual/libtasn1.pdf
 - https://gnutls.gitlab.io/libtasn1/reference/
 - https://gnutls.gitlab.io/libtasn1/reference/libtasn1.pdf


## Code coverage report

The coverage report is at:

 - https://gnutls.gitlab.io/libtasn1/coverage


## Issue trackers

 - [Main issue tracker](https://gitlab.com/gnutls/libtasn1/issues)
 - [oss-fuzz found issues](https://bugs.chromium.org/p/oss-fuzz/issues/list?q=libtasn1&can=2)


## Homepage

The project homepage at the gnu site is at:

https://www.gnu.org/software/libtasn1/
