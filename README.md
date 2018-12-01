# router
一、language:Swift

二、paltform: iOS

三、实现路由的主要方法
=========================================================

    Router.openController(className: "RouteFirstController", params: ["nickName":"alexluan","address":"shanghai"])
=========================================================

    Router.openController(moduleId: 10002, params: ["nickName":"alexluan","address":"yunan"])
=========================================================

    let routeUrl = "routeprotocol://routerproject:10002?nickName=alexluan&address=anhui"
    Router.openUrl(url: routeUrl)
=========================================================

    let routeUrl = "http://www.baidu.com"
    Router.openUrl(url: routeUrl)
=========================================================

四、L: 用于 界面的 路由(Route) 跳转, 在跳转时候，必须遵循跳转协议，和 module 分离
    在使用时 let supportDomains = ["RouterProject"] 可以先将 "RouterProject" 修改为的的工程名称。
    在工程中，”RouterProject“ = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String 

五、有缺点的地方，希望大家不吝啬的提出，共同成长，谢谢！！！！！！！！

六、希望感觉有用的小伙伴，给以给个星啊，谢谢

