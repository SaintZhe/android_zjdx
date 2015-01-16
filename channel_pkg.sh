#!/bin/bash
#channels="umeng anzhi appchina baidu gfan google_play hiapk meizu qihoo360 tencent wandoujia xiaomi huawei lenovo oppo single web weibo weixin tieba offline"
channels="offline"
apk_path=release # dir which apk dist and mapping.zip dist
module_name=youjia-app # app module name
pre_package(){
    if [ -d $apk_path ];then
        rm -r $apk_path
    fi
    mkdir $apk_path
}
package(){
    for channel in $channels ; do
        echo $channel
        gradle aYZR -PchannelName=$channel
        apk=`ls -t -1 $module_name/build/ | grep 'apk$' | head -1`
        cp $module_name/build/$apk $apk_path/$channel-$apk
    done
}

post_package(){
    zip -r $apk_path/mapping.zip $module_name/build/outputs/mapping
}
pre_package
package
post_package
