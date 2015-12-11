#!/bin/bash
## 说明:offline=线下 web=网站 xycm=校园传媒 zjls=指尖零食 umeng=友盟 zskb=掌上课表 anzhi=安智市场 appchina=应用汇 baidu=百度的应用市场 gfan=机锋 meizu=魅族 qihoo360=360手机助手
##     tencent=腾讯 wandoujia=豌豆荚 xiaomi=小米 huawei=华为 lenovo=联想 oppo=oppo应用商店 weibo=新浪微博 weixin=微信 tieba=百度贴吧 zyzs=众用助手 xytd=校园团队
#channels="offline web xycm zjls umeng zskb anzhi appchina baidu gfan meizu qihoo360 tencent wandoujia xiaomi huawei lenovo oppo weibo weixin tieba zyzs xytd1 xytd2 xytd3 xytd4 xytd5 xytd6 xytd7 xytd8 xytd9 xytd10"
#channels="offline web umeng zskb anzhi appchina baidu gfan google_play hiapk meizu qihoo360 tencent wandoujia xiaomi huawei lenovo oppo single weibo weixin tieba express appshare"
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
