#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
#修改默认IP
sed -i 's/192.168.6.1/192.168.2.1/g' package/base-files/files/bin/config_generate   # 定制默认IP
#sed -i "s/DISTRIB_DESCRIPTION=.*/DISTRIB_DESCRIPTION='OpenWrt By hkk666 ($(date +%Y-%m-%d %H:%M)) '/g" package/base-files/files/etc/openwrt_release
# 移除重复软件包
#rm -rf feeds/luci/themes/luci-theme-argon

# 修改 argon 为默认主题,可根据你喜欢的修改成其他的（不选择那些会自动改变为默认主题的主题才有效果）
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Themes
git clone --depth 1 -b 18.06 https://github.com/jerrykuku/luci-theme-argon package/luci-theme-argon
git clone --depth 1 https://github.com/jerrykuku/luci-app-argon-config package/luci-app-argon-config

# 设置密码为空（安装固件时无需密码登陆，然后自己修改想要的密码）
#sed -i 's@.*CYXluq4wUazHjmCDBCqXF*@#&@g' package/lean/default-settings/files/zzz-default-settings

# 添加额外软件包
# git clone --depth 1 https://github.com/kongfl888/luci-app-adguardhome package/luci-app-adguardhome
# git clone --depth 1 https://github.com/Jason6111/luci-app-netdata package/luci-app-netdata
# git clone --depth 1 -b lede https://github.com/pymumu/luci-app-smartdns package/luci-app-smartdns

# 科学上网插件
 svn co https://github.com/kiddin9/openwrt-bypass/trunk/luci-app-bypass package/luci-app-bypass
 svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash package/luci-app-openclash
 svn co https://github.com/xiaorouji/openwrt-passwall/branches/luci/luci-app-passwall package/luci-app-passwall
 svn co https://github.com/fw876/helloworld/trunk/luci-app-ssr-plus package/luci-app-ssr-plus

# 科学上网插件依赖
 svn co https://github.com/xiaorouji/openwrt-passwall/trunk/brook package/brook
 svn co https://github.com/xiaorouji/openwrt-passwall/trunk/chinadns-ng package/chinadns-ng
 svn co https://github.com/xiaorouji/openwrt-passwall/trunk/dns2socks package/dns2socks
 svn co https://github.com/xiaorouji/openwrt-passwall/trunk/dns2tcp package/dns2tcp
 svn co https://github.com/xiaorouji/openwrt-passwall/trunk/hysteria package/hysteria
 svn co https://github.com/xiaorouji/openwrt-passwall/trunk/ipt2socks package/ipt2socks
 svn co https://github.com/xiaorouji/openwrt-passwall/trunk/microsocks package/microsocks
 svn co https://github.com/xiaorouji/openwrt-passwall/trunk/naiveproxy package/naiveproxy
 svn co https://github.com/xiaorouji/openwrt-passwall/trunk/pdnsd-alt package/pdnsd-alt
 svn co https://github.com/xiaorouji/openwrt-passwall/trunk/sagernet-core package/sagernet-core
 svn co https://github.com/xiaorouji/openwrt-passwall/trunk/ssocks package/ssocks
 svn co https://github.com/xiaorouji/openwrt-passwall/trunk/tcping package/tcping
 svn co https://github.com/xiaorouji/openwrt-passwall/trunk/trojan-go package/trojan-go
 svn co https://github.com/xiaorouji/openwrt-passwall/trunk/trojan-plus package/trojan-plus
 svn co https://github.com/xiaorouji/openwrt-passwall/trunk/v2ray-geodata package/v2ray-geodata
# svn co https://github.com/fw876/helloworld/trunk/simple-obfs package/simple-obfs
# svn co https://github.com/fw876/helloworld/trunk/v2ray-core package/v2ray-core
# svn co https://github.com/fw876/helloworld/trunk/v2ray-plugin package/v2ray-plugin
# svn co https://github.com/fw876/helloworld/trunk/shadowsocks-rust package/shadowsocks-rust
# svn co https://github.com/fw876/helloworld/trunk/shadowsocksr-libev package/shadowsocksr-libev
# svn co https://github.com/fw876/helloworld/trunk/xray-core package/xray-core
# svn co https://github.com/fw876/helloworld/trunk/xray-plugin package/xray-plugin
# svn co https://github.com/fw876/helloworld/trunk/lua-neturl package/lua-neturl
# svn co https://github.com/fw876/helloworld/trunk/trojan package/trojan
