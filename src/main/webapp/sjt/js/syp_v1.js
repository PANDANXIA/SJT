SHENGYIPLUSVERSION = '1.0.1'
String.prototype.trim = function() {
  return this.replace(/(^\s*)|(\s*$)/g,'');
}

/*
  - 链接栈逻辑：后进先出、不可重复、重复时移除其间项、一键清空
      - 后进先出，不解释
      - 不可重复，不存在则入栈
      - 重复时，若是结尾项则刷新页面（栈不动），若是中间项则移除结尾项至已存在项位置
      - 一健清空，关闭主题页面

  - 链接分两大类，在线链接（http[s]://）、离线链接（offline://）
      - 在线链接（http[s]://），不解释
      - 离线链接（offline://）
          - 格式：offline://离线网站名称@离线页面
          - 离线网站位置：Shared/离线网站文件夹
          - 实例：offline://HD@list.html
          - 一键清空：offline:////
 */

/*
 * Android <=> JS 交互接口
 */
window.SYPWithinAndroid = {
  version: function() {
    return 'android ' + SHENGYIPLUSVERSION;
  },
  /*
   * javascript 异常时通知原生代码，或提交服务器，或 popup 提示用户
   */
  jsException: function(e) {
    if(window.AndroidJSBridge && typeof(window.AndroidJSBridge.jsException) === "function") {
      window.AndroidJSBridge.jsException(e);
    }
  },
  /*
   * 该中间件版本过低时，APP 会给出提示
   */
  checkVersion: function() {
    if(window.AndroidJSBridge && typeof(window.AndroidJSBridge.checkVersion) === "function") {
      window.AndroidJSBridge.checkVersion(SHENGYIPLUSVERSION);
    }
  },
  /*
   * 浏览器『返回』
   */
  goBack: function() {
    if(window.AndroidJSBridge && typeof(window.AndroidJSBridge.goBackBehavior) === "function") {
      window.AndroidJSBridge.goBack();
    } else {
      alert("Error 未定义接口(Android): goBack");
    }
  },
  /*
   * 链接跳转
   * 实例：
   *     offline://index.html
   *     offline://syp@index.html
   *     http://host.com/index.html
   *
   * bannerName : 标题栏使用原生代码开发，该参数显示为标题
   * link       : 主体为浏览器，加载该链接
   * objectId   : 业务对象ID (项目内部使用，其他可传 -1)
   */
  pageLink: function(bannerName, link, objectId) {
    link = link.trim();
    var match = link.match(/^offline:\/\/(.*?)@(.*?)$/);
    if(match && match.length === 3) {
        window.AndroidJSBridge.pageLinkWithinModule(bannerName, match[1], match[2]);
    } else {
      if(window.AndroidJSBridge && typeof(window.AndroidJSBridge.pageLink) === "function") {
        window.AndroidJSBridge.pageLink(bannerName, link, objectId);
      } else {
        alert("Error 未定义接口(Android): pageLink");
      }
    }
  },
  /*
   * 项目内部模块页面跳转（离线页面）
   *
   * 实例：offline://syp@index.html
   *
   * bannerName : 标题栏使用原生代码开发，该参数显示为标题
   * module     : 模块文件夹名称
   * pageName   : 模块内离线页面名称
   */
  pageLinkWithinModule: function(bannerName, module, pageName) {
    if(window.AndroidJSBridge && typeof(window.AndroidJSBridge.pageLinkWithinModule) === "function") {
      window.AndroidJSBridge.pageLinkWithinModule(bannerName, module, pageName);
    } else {
      alert("Error 未定义接口(Android): pageLink");
    }
  },
  /*
   * 原生弹出框
   *
   * 网页内部的 `alert` 弹出框，标题为网页所在文件夹名称，用户体验不佳。
   *
   * title  : 标题名称（暂未使用，可传空）
   * message: 弹出框内容
   */
  showAlert: function(title, message) {
    if(window.AndroidJSBridge && typeof(window.AndroidJSBridge.showAlert) === "function") {
      window.AndroidJSBridge.showAlert(title, message);
    } else {
      alert("Error 未定义接口(Android): showAlert");
    }
  },
  /*
   * 原生弹出框，点击『确定』后跳转至其他链接
   *
   * 使用原生弹出框但继续使用网页内部的跳转方式时，跳转操作不会等弹出框的业务操作
   *
   * title       : 标题名称（暂未使用，可传空）
   * message     : 弹出框内容
   * redirectUrl : 待跳转的链接
   */
  showAlertAndRedirect: function(title, message, redirectUrl) {
    if(window.AndroidJSBridge && typeof(window.AndroidJSBridge.showAlertAndRedirectV1) === "function") {
      window.AndroidJSBridge.showAlertAndRedirectV1(title, message, redirectUrl, 'no');
    } else {
      alert("Error 未定义接口(Android): showAlertAndRedirect");
    }
  },
  /*
   * 原生弹出框，点击『确定』后跳转至其他链接，清空链接栈
   *
   * 有些业务流程不可以返回历史链接，比如『新建』，所以跳转至该链接时，清空栈，点击标题栏中的『返回』则关闭浏览器
   *
   * title       : 标题名称（暂未使用，可传空）
   * message     : 弹出框内容
   * redirectUrl : 待跳转的链接
   */
  showAlertAndRedirectWithCleanStack: function(title, message, redirectUrl) {
    if(window.AndroidJSBridge && typeof(window.AndroidJSBridge.showAlertAndRedirectV1) === "function") {
      window.AndroidJSBridge.showAlertAndRedirectV1(title, message, redirectUrl, 'yes');
    } else {
      alert("Error 未定义接口(Android): showAlertAndRedirect");
    }
  },
    cleanUrlStack: function(redirectUrl) {
    if(window.AndroidJSBridge && typeof(window.AndroidJSBridge.cleanUrlStack) === "function") {
      window.AndroidJSBridge.cleanUrlStack(redirectUrl);
    } else {
      alert("Error 未定义接口(Android): cleanUrlStack");
    }
  },
  /*===保存返回和选择页面====*/
  saveParam : function(save,local) {
    if(window.AndroidJSBridge && typeof(window.AndroidJSBridge.saveParam) === "function") {
      window.AndroidJSBridge.saveParam(save,local );
    } else {
      alert("Error 未定义接口(Android): saveParam ");
    }
  },

  /*
   * 控制原生标题栏的隐藏及显示
   *
   * 有些业务操作在弹出页面中已有标题栏，此时可以通过该函数控制原生标题栏的隐藏及显示
   *
   * state: 显示或隐藏（show/hidden）
   */
  toggleShowBanner: function(state) {
    if(window.AndroidJSBridge && typeof(window.AndroidJSBridge.toggleShowBanner) === "function") {
      window.AndroidJSBridge.toggleShowBanner(state);
    } else {
      alert("Error 未定义接口(Android):  toggleShowBanner");
    }
  },
  /*
   * 首页底部页签显示 badge 数字
   *
   * type: 类型（仅支持: total）
   * num : badge 数字
   */
  appBadgeNum: function(type, num) {
    if(window.AndroidJSBridge && typeof(window.AndroidJSBridge.appBadgeNum) === "function") {
      window.AndroidJSBridge.appBadgeNum(type, num);
    } else {
      alert("Error 未定义接口(Android): appBadgeNum");
    }
  },
  /*
   * 控制标题栏中标题内容
   *
   * title: 标题内容
   */
  setBannerTitle: function(title) {
    if(window.AndroidJSBridge && typeof(window.AndroidJSBridge.setBannerTitle) === "function") {
      window.AndroidJSBridge.setBannerTitle(title);
    } else {
      alert("Error 未定义接口(Android): setBannerTitle");
    }
  },
  /*
   * 添加左上角的菜单项
   *
   * menu_items: 菜单项内容（数组）
   *
   * [{
   *   title: '销售录入历史',
   *   link: 'offline://sale.input.historical.html'
   *  }];
   */
  addSubjectMenuItems: function(menuItems) {
    if(window.AndroidJSBridge && typeof(window.AndroidJSBridge.addSubjectMenuItems) === "function") {
      window.AndroidJSBridge.addSubjectMenuItems(JSON.stringify(menu_items));
    } else {
      alert("Error 未定义接口:  addSubjectMenuItems");
    }
  }
};

/*
 * iOS <=> JS 交互接口
 */
window.SYPWithinIOS = {
  version: function() {
    return 'ios ' + SHENGYIPLUSVERSION;
  },
  connectWebViewJavascriptBridge: function(callback) {
    if(window.WebViewJavascriptBridge) {
      callback(WebViewJavascriptBridge)
    }
    else {
      document.addEventListener('WebViewJavascriptBridgeReady', function() {
        callback(WebViewJavascriptBridge)
      }, false)
    }
  },
  jsException: function(e) {
    SYPWithinIOS.connectWebViewJavascriptBridge(function(bridge){
      bridge.callHandler('jsException', {ex: e}, function(response) {});
    })
  },
  checkVersion: function() {
    SYPWithinIOS.connectWebViewJavascriptBridge(function(bridge){
      bridge.callHandler('checkVersion', {version: SHENGYIPLUSVERSION}, function(response) {});
    })
  },
  goBack: function() {
    SYPWithinIOS.connectWebViewJavascriptBridge(function(bridge){
      bridge.callHandler('goBack', {}, function(response) {});
    })
  },
  pageLink: function(bannerName, link, objectId) {
    SYPWithinIOS.connectWebViewJavascriptBridge(function(bridge){
      bridge.callHandler('pageLink', {'bannerName': bannerName, 'link': link, 'objectID': objectId}, function(response) {});
    })
  },
  pageLinkWithinModule: function(bannerName, link, objectId) {
    SYPWithinIOS.connectWebViewJavascriptBridge(function(bridge){
      bridge.callHandler('pageLinkWithinModule', {'bannerName': bannerName, 'link': link, 'objectID': objectId}, function(response) {});
    })
  },
  showAlert: function(title, message) {
    SYPWithinIOS.connectWebViewJavascriptBridge(function(bridge){
      bridge.callHandler('showAlert', {'title': title, 'content': message}, function(response) {});
    })
  },
  showAlertAndRedirect: function(title, message, redirectUrl) {
    SYPWithinIOS.connectWebViewJavascriptBridge(function(bridge){
      bridge.callHandler('showAlertAndRedirect', {'title': title, 'content': message, 'redirectUrl': redirectUrl, 'cleanStack': 'no'}, function(response) {});
    })
  },
  showAlertAndRedirectWithCleanStack: function(title, message, redirectUrl) {
    SYPWithinIOS.connectWebViewJavascriptBridge(function(bridge){
      bridge.callHandler('showAlertAndRedirect', {'title': title, 'content': message, 'redirectUrl': redirectUrl, 'cleanStack': 'yes'}, function(response) {});
    })
  },
cleanUrlStack: function(redirectUrl) {
    SYPWithinIOS.connectWebViewJavascriptBridge(function(bridge){
      bridge.callHandler('cleanUrlStack', {'redirectUrl': redirectUrl}, function(response) {});
    })
  },
  /*===保存返回和选择返回===*/
  saveParam :function(save,local) {
    SYPWithinIOS.connectWebViewJavascriptBridge(function(bridge){
      bridge.callHandler('saveParam', {'save ': save,'local': local }, function(response) {});
    })
  },

  toggleShowBanner: function(state) {
    SYPWithinIOS.connectWebViewJavascriptBridge(function(bridge){
      bridge.callHandler('toggleShowBanner', {'state': state}, function(response) {});
    })
  },
  appBadgeNum: function(type, num) {
    SYPWithinIOS.connectWebViewJavascriptBridge(function(bridge){
      bridge.callHandler('appBadgeNum', {'type': type, 'num': num}, function(response) {});
    })
  },
  setBannerTitle: function(title) {
    SYPWithinIOS.connectWebViewJavascriptBridge(function(bridge){
      bridge.callHandler('setBannerTitle', {'title': title}, function(response) {});
    })
  },
  addSubjectMenuItems: function(menuItems) {
    SYPWithinIOS.connectWebViewJavascriptBridge(function(bridge){
      bridge.callHandler('addSubjectMenuItems', {'menu_items': menuItems}, function(response) {});
    })
  }
};

/*
 * PC <=> JS 交互接口
 */
window.SYP = {
  version: function() {
    return 'default ' + SHENGYIPLUSVERSION;
  },
  checkVersion: function() {
    console.log('default ' + SHENGYIPLUSVERSION);
  },
  jsException: function(e) {
    console.log(typeof(e));
    console.log(e);
  },
  goBack: function() {
    window.history.back();
  },
  pageLink: function(bannerName, link, objectId) {
    window.location.href = link;
  },
  showAlert: function(title, message) {
    alert(message);
  },
  showAlertAndRedirect: function(title, message, redirectUrl) {
    window.location.href = redirectUrl.split('@')[1];
  },
  showAlertAndRedirectWithCleanStack: function(title, message, redirectUrl) {
    alert(message);
    window.SYP.pageLink(redirectUrl.split('@')[1]);
  },
cleanUrlStack: function(redirectUrl) {
    window.SYP.pageLink(redirectUrl.split('@')[1]);
  },
  toggleShowBanner: function(state) {
    console.log({'toggleShowBanner state': state});
  },
   saveParam: function(save,local) {
    console.log({'save': save, 'local': local});
  },
  appBadgeNum: function(type, num) {
    console.log({'type': type, 'num': num});
  },
  setBannerTitle: function(title) {
    $(document).attr("title", title);
  },
  addSubjectMenuItems: function(menuItems) {
    console.log({'menu_items': menuItems});
  }
};

var userAgent = navigator.userAgent,
    isAndroid = userAgent.indexOf('Android') > -1 || userAgent.indexOf('Adr') > -1,
    isiOS = !!userAgent.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/);
if(isiOS) {
  window.SYP = window.SYPWithinIOS;
} else if(isAndroid) {
  window.SYP = window.SYPWithinAndroid;
}

console.log(window.SYP.version());
window.SYP.checkVersion();
window.onerror = function(e) {
  window.SYP.jsException(e);
}

function goto_url(url) {
  if(url !== undefined && url !== null && url.trim().length) {
    window.SYP.pageLinkV1(url, 'offline://hd_cre@' + url.trim(), 0);
  } else {
    alert('该链接不支持跳转: ' + url);
  }
}

$(function() {
  window.SYP.setBannerTitle($(document).attr("title"));
});
