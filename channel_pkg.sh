#!/bin/bash
#channels="umeng anzhi appchina baidu gfan google_play hiapk meizu qihoo360 tencent wandoujia xiaomi huawei lenovo oppo single web weibo weixin tieba offline"
channels="offline"
package(){
    for channel in $channels ; do
        echo $channel
        gradle aYZR -PchannelName=$channel
        cp youjia-app/build/com.webapps.yuns_release-2.2.1-22100.apk $apk_path/$channel-2.2.1-22100.apk
    done
}
apk_path=release
if [ -d $apk_path ];then
    rm -r $apk_path
fi
mkdir $apk_path
package
zip -r mapping.zip youjia-app/build/outputs/mapping
