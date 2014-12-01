#!/bin/bash
channels="umeng anzhi appchina baidu gfan google_play hiapk meizu qihoo360 tencent wandoujia xiaomi single web"
#channels="web"
package(){
    for channel in $channels ; do
        echo $channel
        gradle aYZR -PchannelName=$channel
        cp youjia-app/build/com.webapps.yuns_release-2.0.0-20006.apk $apk_path/$channel-2.0.0-2006.apk
    done
}
apk_path=release
if [ -d $apk_path ];then
    rmdir $apk_path
fi
mkdir $apk_path
package
zip -r mapping.zip youjia-app/build/outputs/mapping