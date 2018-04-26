<%@ Page Language="C#" AutoEventWireup="true" CodeFile="navmap.aspx.cs" Inherits="navmap" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>基于百度地图旅游景点导航</title>
    <style type="text/css">/*<![CDATA[*/
    body{margin:0;padding:0;font-family:Times New Roman, serif}
    p{margin:0;padding:0}
    #map_container{height:100%; border: 1px solid #999;height:550px;margin:5px;}
    .BMap_cpyCtrl{display: none!important;}/*隐藏百度地图版权*/
    @media print{
        #notes{display:none}
        #map_container{margin:0}
    }
    /*]]>*/</style>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=1.4">

    </script>
    <script type="text/javascript" src="http://api.map.baidu.com/library/SearchControl/1.4/src/SearchControl_min.js"></script>
    <link rel="stylesheet" href="http://api.map.baidu.com/library/SearchControl/1.4/src/SearchControl_min.css" />
    <!--<link rel="stylesheet" href="./js/min.js" />-->
    <!--<link href="http://api.map.baidu.com/library/TrafficControl/1.4/src/TrafficControl_min.css" rel="stylesheet" type="text/css" />-->
    <!--<script type="text/javascript" src="http://api.map.baidu.com/library/TrafficControl/1.4/src/TrafficControl_min.js"></script>-->
    <!--关闭导航页面-->
    <%-- <script language="javascript">
        // 这个脚本是 ie6和ie7 通用的脚本
        function custom_close() {
            if (confirm("您确定要关闭本页吗？")) {
                window.opener = null;
                window.open('', '_self');
                window.close();
            }
            else {
            }
        }
    </script> --%>
</head>

<body onload="load()">
    <div id="searchBox"></div>
    <div id="infobox">
        <form id="form1" runat="server">
        <label>您的账号:</label><asp:Label ID="UserName" runat="server" Text="Label"></asp:Label>
        <!--调用关闭函数-->
        <!--onClick="custom_close()"-->
        <asp:Button ID="Button1" runat="server" Text="退出" OnClick="Button1_Click" />
        <%-- <input type="button" value="退出" name="close" onclick="custom_close()" /> --%>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        基于百度地图---导航系统
        </form>
    </div>
    <div id="map_container"></div>
    
</body>
<script type="text/javascript">/*<![CDATA[*/
    // 创建地图对象并初始化
    var mp = new BMap.Map("map_container", {
        enableHighResolution: true //是否开启高清
    });
    var point = new BMap.Point(116.404, 39.915);
    mp.centerAndZoom(point, 14); //初始化地图
    mp.enableInertialDragging(); //开启关系拖拽
    mp.enableScrollWheelZoom();  //开启鼠标滚动缩放

    // 添加定位控件
    var geoCtrl = new BMap.GeolocationControl({
        showAddressBar: true //是否显示
        , enableAutoLocation: false //首次是否进行自动定位
        , offset: new BMap.Size(0, 25)
        //    , locationIcon     : icon //定位的icon图标
    });

    //监听定位成功事件
    geoCtrl.addEventListener("locationSuccess", function (e) {
        console.log(e);
    });

    //监听定位失败事件
    geoCtrl.addEventListener("locationError", function (e) {
        console.log(e);
    });

    // 将定位控件添加到地图
    mp.addControl(geoCtrl);

    //检索类型
    var type = "";
    type = LOCAL_SEARCH;   //周边检索
    type = TRANSIT_ROUTE; //公交检索
    type = DRIVING_ROUTE; //驾车检索

    //创建鱼骨控件
    var navCtrl = new BMap.NavigationControl({
        anchor: BMAP_ANCHOR_TOP_LEFT //设置鱼骨控件的位置
    });
    // 将鱼骨添加到地图当中
    mp.addControl(navCtrl);


    //创建检索控件
    var searchControl = new BMapLib.SearchControl({
        container: "searchBox" //存放检索控件的容器
        , map: mp          //检索的关联地图
        , type: type        //检索类型
    });

    document.getElementById("selectType").onchange = function () {
        searchControl.setType(this.value);
    };

    //添加路况控件
    var ctrl = new BMapLib.TrafficControl({
        showPanel: false //是否显示路况提示面板
    });
    mp.addControl(ctrl);
    ctrl.setAnchor(BMAP_ANCHOR_TOP_RIGHT);

    /*]]>*/
</script>
</html>