# benzene-overlay
Universebenzene's personal Gentoo overlay.

Including some old software that no longer supported by official portage.

Alternative building of astropy related packages (more improvement for the doc building and testing, though some of them only work when the `network-sandbox` FEATURE is diabled. See the USE discriptions for details. [(more information)](https://github.com/Universebenzene/benzene-overlay/tree/master/dev-python#information-for-astropy-related-packages)

Related overlay: [benzene-testlay](https://github.com/Universebenzene/benzene-testlay), with some packages testing. You can add it for interest.

This overlay is available on [Gentoo repositories](https://overlays.gentoo.org). You can add it simply through several tools (e.g.: `layman -a benzene-overlay` or `eselect repository enable benzene-overlay`).

It's recommended to mask the whole overlay and then unmask just the packages you need, in order not to get mixed up with other overlays with same packages. (e.g. for using wps-office: `echo "*/*::benzene-overlay" > /etc/portage/package.mask/benzene-overlay; echo "app-office/wps-office::benzene-overlay" >> /etc/portage/package.unmask/benzene-overlay`)

### Available packages (some dependencies are not listed here. Doc/sphinx related packages are listed in a saperate table below, in order to simplify the main table)

Package name | Available version | Additional information
------------ | :---------------: | ----------------------
app-i18n/fcitx-table-other                                                           | 0.2.4                                                         | Not included in official portage or other overlays
app-office/wps-office                                                                | 11.1.0.10976-r1; [11.1.0.11664](https://github.com/Universebenzene/benzene-overlay/blob/master/app-office/wps-office/wps-office-11.1.0.11664.ebuild) | Add CN version and more language support (encouraged by [AUR](https://aur.archlinux.org/packages/?O=0&SeB=nd&K=wps-office&outdated=&SB=n&SO=a&PP=50&do_Search=Go)). From `11.1.0.10702` you need to set locale outside to get multi-language support. **Please focus on the output after merging the package**
[app-pda/i4tools](https://www.i4.cn/pro_pc.html)                                     | 1.0.038{,-r1}; 1.0.055{,[-r1](https://github.com/Universebenzene/benzene-overlay/blob/master/app-pda/i4tools/i4tools-1.0.055-r1.ebuild)} | 爱思助手
app-text/{[de](https://www.eudic.net/v4/de/app/download),[es](https://www.eudic.net/v4/es/app/download),[fr](https://www.eudic.net/v4/fr/app/download)}helper | [12.6.7](https://github.com/Universebenzene/benzene-overlay/tree/master/app-text) | Converted from [AUR](https://aur.archlinux.org/packages/frhelper) （欧路德语/西语/法语助手）
[app-text/eudic](https://www.eudic.net/v4/en/app/download)                           | [12.6.7](https://github.com/Universebenzene/benzene-overlay/blob/master/app-text/eudic/eudic-12.6.7.ebuild)                              | Converted from [AUR](https://aur.archlinux.org/packages/eudic) （欧路词典）
[app-text/powerword](http://www.iciba.com)                                           | [1.2](https://github.com/Universebenzene/benzene-overlay/blob/master/app-text/powerword/powerword-1.2.ebuild)                            | Encouraged by [AUR](https://aur.archlinux.org/packages/powerword-bin) （金山词霸）
[app-text/ydcv](https://github.com/felixonmars/ydcv)                                 | [0.7](https://github.com/Universebenzene/benzene-overlay/blob/master/app-text/ydcv/ydcv-0.7.ebuild)                                      | Need other overlays (like [guru](https://wiki.gentoo.org/wiki/Project:GURU) or [HomeAssistantRepository](https://git.edevau.net/onkelbeh/HomeAssistantRepository)) if you enable `pkg-info` use. Some other issues [here](https://forums.gentoo.org/viewtopic-p-8352006.html) （有道词典命令行-python版）
[app-text/youdao-dict](https://cidian.youdao.com/multi.html#linuxAll)                | [6.0.0-r1](https://github.com/Universebenzene/benzene-overlay/blob/master/app-text/youdao-dict/youdao-dict-6.0.0-r1.ebuild)              | Converted from [AUR](https://aur.archlinux.org/packages/youdao-dict). In order to use this you **must use the patched QtWebkit and PyQt5 with `webkit` USE flag in this overlay INSTEAD OF THE OFFICIAL ONE** （有道词典）
dev-python/adal                                                                      | 1.2.7                                                         |
dev-python/aioftp                                                                    | 0.21.2                                                        |
dev-python/astlib                                                                    | 0.11.3                                                        |
dev-python/glymur                                                                    | 0.9.6; 0.9.8; 0.9.9                                           |
dev-python/msrest                                                                    | 0.6.21                                                        |
dev-python/msrestazure                                                               | 0.6.4                                                         |
dev-python/oldest-supported-numpy                                                    | 2022.5.28                                                     | The numpy version limitations are changed from `==` into `>=`. If you have better solution, just bring issues or pull requests.
dev-python/parfive                                                                   | 1.5.1                                                         |
dev-python/PyQt5                                                                     | 5.15.4-r1; 5.15.6                                             | Add `webkit` USE flag (dropped by official portage) to get **youdao-dict** in this overlay work
dev-python/pytest-mpl                                                                | 0.13; 0.16.0                                                  |
dev-python/pytest-socket                                                             | 0.5.0; 0.5.1                                                  |
dev-python/cmyt                                                                      | 1.0.4                                                         | yt related
dev-python/unyt                                                                      | 2.8.0                                                         | yt related
dev-qt/qtwebkit                                                                      | 5.212.0\_pre20200309-{r1,r2}                                  | Add [patch](https://github.com/Universebenzene/benzene-overlay/blob/master/dev-qt/qtwebkit/files/qtwebkit-5.212.0_pre20200309-position.patch) to get **youdao-dict** in this overlay work (the -r2 is a test for upgrade EAPI to 8, and might be a little buggy with youdao-dict.)
media-fonts/wps-office-fonts                                                         | [1.0](https://github.com/Universebenzene/benzene-overlay/blob/master/media-fonts/wps-office-fonts/wps-office-fonts-1.0.ebuild)           | WPS Linux旧版自带方正系字体
[media-gfx/gpaint](https://savannah.gnu.org/projects/gpaint)                         | [0.3.3](https://github.com/Universebenzene/benzene-overlay/blob/master/media-gfx/gpaint/gpaint-0.3.3.ebuild)                             | With patches from Debian
media-libs/gmtk                                                                      | 1.0.9                                                         | Dropped by official portage. Dependency of media-video/gnome-mplayer
[media-video/gnome-mplayer](https://sites.google.com/site/kdekorte2/gnomemplayer)    | [1.0.9-r1](https://github.com/Universebenzene/benzene-overlay/blob/master/media-video/gnome-mplayer/gnome-mplayer-1.0.9-r1.ebuild)       | Dropped by official portage
media-sound/ting-{[de](https://www.eudic.net/v4/de/app/ting),[en](https://www.eudic.net/v4/en/app/ting),[es](https://www.eudic.net/v4/es/app/ting),[fr](https://www.eudic.net/v4/fr/app/ting)}}-bin | [9.4.1](https://github.com/Universebenzene/benzene-overlay/tree/master/media-sound) | 欧路每日德语/英语/西语/法语听力
net-im/electron-qq-bin (masked)                                                      | 1.5.7; 2.1.4                                                  | Already deprecated and renamed as Icalingua (also in this overlay)
[net-im/electron-wechat-bin](https://github.com/eNkru/freechat)                      | [1.0.0](https://github.com/Universebenzene/benzene-overlay/blob/master/net-im/electron-wechat-bin/electron-wechat-bin-1.0.0.ebuild)      | Newer project of Electron-built WeChat, a.k.a. Freechat
[net-im/electronic-wechat-bin](https://github.com/kooritea/electronic-wechat)        | [2.3.1](https://github.com/Universebenzene/benzene-overlay/tree/master/net-im/electronic-wechat-bin)                                     | Converted from [AUR](https://aur.archlinux.org/packages/electronic-wechat-bin)
[net-im/icalingua++-bin](https://github.com/Icalingua-plus-plus/Icalingua-plus-plus) | [2.6.5](https://github.com/Universebenzene/benzene-overlay/blob/master/net-im/icalingua++-bin/icalingua++-bin-2.6.5.ebuild)              | Previously called Electron QQ. A branch of previous deleted repo, with limited support
[net-im/wemeet](https://source.meeting.qq.com/download-center.html)                  | 2.8.0.3; [3.8.0.2](https://github.com/Universebenzene/benzene-overlay/blob/master/net-im/wemeet/wemeet-3.8.0.2.ebuild)                   | Encouraged by [AUR](https://aur.archlinux.org/packages/wemeet-bin) （腾讯会议）
[net-libs/libaxon-bin](https://github.com/axon-oicq/axon)                            | [1.0.2](https://github.com/Universebenzene/benzene-overlay/blob/master/net-libs/libaxon-bin/libaxon-bin-1.0.2.ebuild)                    | Backend for Purple OICQ
[net-misc/baidunetdisk](https://pan.baidu.com/download)                              | 3.0.1; 3.5.0; [4.3.0](https://github.com/Universebenzene/benzene-overlay/blob/master/net-misc/baidunetdisk/baidunetdisk-4.3.0.ebuild)    | Converted from [AUR](https://aur.archlinux.org/packages/baidunetdisk-bin) (Also in [gentoo-zh](https://github.com/microcai/gentoo-zh) overlay, while upgrade will be faster here) （百度网盘）
[net-misc/baidupcs-go](https://github.com/qjfoidnh/BaiduPCS-Go)                      | 3.6.2; 3.8.1; [3.8.7](https://github.com/Universebenzene/benzene-overlay/blob/master/net-misc/baidupcs-go/baidupcs-go-3.8.7.ebuild); [(live)](https://github.com/Universebenzene/benzene-overlay/blob/master/net-misc/baidupcs-go/baidupcs-go-9999.ebuild) | Also in [gentoo-zh](https://github.com/microcai/gentoo-zh) overlay, while upgrade will be faster here. **Proxy may needed if you use the `9999` version**, as the [proxy.golang.org](https://proxy.golang.org) is banned in some regions
net-misc/baidupcs-go-bin                                                             | 3.6.2; 3.8.7 |
[net-misc/landrop](https://landrop.app)                                              | [0.4.0](https://github.com/Universebenzene/benzene-overlay/blob/master/net-misc/landrop/landrop-0.4.0.ebuild); (live)                    |
[net-misc/sunloginclient](https://sunlogin.oray.com/download)                        | [10.0.2.24779](https://github.com/Universebenzene/benzene-overlay/blob/master/net-misc/sunloginclient/sunloginclient-10.0.2.24779.ebuild); [11.0.0.36662-r1](https://github.com/Universebenzene/benzene-overlay/blob/master/net-misc/sunloginclient/sunloginclient-11.0.0.36662-r1.ebuild) | Converted from [AUR](https://aur.archlinux.org/packages/sunloginclient), but **versions ABOVE `10.0.2.24779` may have some problem with OpenRC users** (needs libsystemd). See [here](https://github.com/Universebenzene/benzene-overlay/tree/master/net-misc/sunloginclient#note-for-sunloginclient) for details and solutions（向日葵远程控制）
[net-misc/todesk](https://www.todesk.com/download.html)                              | 4.1.0-r1; [4.1.0-r3](https://github.com/Universebenzene/benzene-overlay/blob/master/net-misc/todesk/todesk-4.1.0-r3.ebuild)              | Encouraged by [AUR](https://aur.archlinux.org/packages?O=0&SeB=nd&K=todesk-&outdated=&SB=n&SO=a&PP=50&submit=Go) （ToDesk远程控制）
[net-misc/xunlei-download](https://www.xunlei.com)                                   | [1.0.0.2](https://github.com/Universebenzene/benzene-overlay/blob/master/net-misc/xunlei-download/xunlei-download-1.0.0.2.ebuild)        | Converted from [AUR](https://aur.archlinux.org/packages/xunlei-bin) （迅雷Linux）
[net-proxy/gg](https://github.com/mzz2017/gg)                                        | [0.2.3](https://github.com/Universebenzene/benzene-overlay/blob/master/net-proxy/gg/gg-0.2.3.ebuild)                                     |
[net-proxy/v2raya-bin](https://v2raya.org)                                           | 1.5.4; 1.5.6.2; [1.5.8.1](https://github.com/Universebenzene/benzene-overlay/blob/master/net-proxy/v2raya-bin/v2raya-bin-1.5.8.1.ebuild) | Converted from [AUR](https://aur.archlinux.org/packages/v2raya-bin). Needs other overlays like [gentoo-zh](https://github.com/microcai/gentoo-zh)
[sci-astronomy/aladin](https://aladin.u-strasbg.fr/aladin.gml)                       | [11.024](https://github.com/Universebenzene/benzene-overlay/blob/master/sci-astronomy/aladin/aladin-11.024.ebuild)                       |
[sci-astronomy/astrometry](https://astrometry.net)                                   | 0.78; 0.80; 0.85; [0.89](https://github.com/Universebenzene/benzene-overlay/blob/master/sci-astronomy/astrometry/astrometry-0.89.ebuild) | Add USE for switching the netpbm support
[sci-astronomy/topcat](http://www.star.bris.ac.uk/~mbt/topcat)                       | 4.8; [4.8.5](https://github.com/Universebenzene/benzene-overlay/blob/master/sci-astronomy/topcat/topcat-4.8.5.ebuild)                    |
sys-libs/libsystemd                                                                  | 250.4-r2; 250.6; 250.7; 251.2; (live)                         | A standalone package to provide `libsystemd.so` for packages depend on the lib on non-systemd system. [Still on trial](https://github.com/Universebenzene/benzene-overlay/tree/master/sys-libs/libsystemd). **IF YOU HAVE ANY IDEA TO IMPROVE THIS PACKAGE JUST BRING ISSUES OR PULL REQUESTS.**
www-plugins/adobe-flash                                                              | [32.0.0.465](https://github.com/Universebenzene/benzene-overlay/blob/master/www-plugins/adobe-flash/adobe-flash-32.0.0.465.ebuild)       | Dropped by official portage
[x11-libs/lain](https://github.com/lcpz/lain)                                        | [(live version)](https://github.com/Universebenzene/benzene-overlay/blob/master/x11-libs/lain/lain-9999-r100.ebuild)                     | 9999 for old ebuild without lua targets support (masked); 9999-r100 with the new `lua-single` eclass
[x11-plugins/purple-oicq](https://github.com/axon-oicq/purple-oicq)                  | [1.0.2](https://github.com/Universebenzene/benzene-overlay/blob/master/x11-plugins/purple-oicq/purple-oicq-1.0.2.ebuild)                 | OICQ plugin (Tencent QQ support) for Pidgin/libpurple.

Information for some of the astropy related packages are listed [here](https://github.com/Universebenzene/benzene-overlay/tree/master/dev-python#information-for-astropy-related-packages).

### Doc/sphinx related packages

<!--<details>
<summary>(Click to unfold)</summary>-->

Package name | Available version | Additional information
------------ | :---------------: | ----------------------
dev-python/jupyter-cache      | 0.5.0         |
dev-python/runnotebook        | 0.3.1; (live) |
dev-python/sphinx-astropy     | 1.6.0; 1.7.0  | See [here](https://github.com/Universebenzene/benzene-overlay/tree/master/dev-python#information-for-astropy-related-packages) for more information.
dev-python/sphinx-asdf        | 0.1.2; 0.1.3  |
dev-python/sphinx-autobuild   | 2022.3.14     |
dev-python/sphinx-book-theme  | 0.2.0         |
dev-python/sphinx-changelog   | 1.1.2         |
dev-python/sunpy-sphinx-theme | 1.2.32        |

<!--</details>-->
