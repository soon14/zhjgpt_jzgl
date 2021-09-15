<%@ page language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/web/include/head.jsp" %>
<%@ include file="/WEB-INF/web/include/taglib.jsp" %>

<link rel="stylesheet" href="https://js.arcgis.com/3.21/esri/css/esri.css">
<script src="https://js.arcgis.com/3.21/"></script>

<style>
    html,
    body, #map {
        height: 100%;
        width: 100%;
        margin: 0;
        padding: 0;
    }
</style>


<section class="scrollable padder jcGOA-section" id="scrollable">
    <div class="left-search">
        <div class="gis-search-box clearfix">
            <div class="searchbox-container">
                <div class="searchbox-content">
                    <input id="companyName" class="searchbox-content-common" type="text" name="word" autocomplete="off"
                           maxlength="256" placeholder="请输入关键字" value="">
                </div>
            </div>
            <button id="searchBtn" class="search-button" data-title="搜索"></button>
        </div>
    </div>
    <ul class="check-change-cont">
        <h4 style="width: 100%;line-height: 40px;background: #1572e8;color:#fff;text-align: center; font-size: 15px;">[ 地图切换 ]</h4>
        <%--        <c:forEach items="${compList}" var="dic" varStatus="di">--%>
        <%--            <li id="companyTypeId_${di.count}" value="${dic.code}">${dic.value}</li>--%>
        <%--        </c:forEach>--%>
        <li id="contractTypeId_1" value="1">勘察单位</li>
        <li id="contractTypeId_2" value="2">设计单位</li>
        <li id="contractTypeId_3" value="3">施工单位</li>
        <li id="contractTypeId_4" value="4">监理单位</li>
    </ul>

    <div id="map"></div>
    <div id="info"></div>
    <input type="hidden" id="contractTypeId" value="${contractTypeId}"/>
</section>
<!-- 企业列表 -->
<div class="modal fade panel" id="list-modal" aria-hidden="false">
    <div class="modal-dialog" style="width: 1100px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" onclick="$('#list-modal').modal('hide');">×</button>
                <h4 class="modal-title">企业信息</h4>
            </div>
            <div class="modal-body">
                <section class="panel" style=" margin-top: -20px;">
                    <div class="table-wrap" id="listContent">
                        <table class="table table-striped tab_height" id="listTable"></table>
                    </div>
                    <section class="clearfix"></section>
                </section>
            </div>
        </div>
    </div>
</div>

<div id="detailDiv"></div>
<div id="childDetailDiv"></div>

<script>
    //gis-js
    var package_path = window.location.pathname.substring(0, window.location.pathname.lastIndexOf('/'));
    // console.log(package_path);
    var dojoConfig = {

        async: true,
        locale: 'zh-cn'
    }

    //获取地图服务地址
    function getArcGisAddress() {
        return "${arcGisAddress}";
    }
</script>
<script>
    //gis-js
    var map;//全局map
    require([
            "${sysPath}/TDTLib/lib/TDTMapLayer.js",
            "esri/map",
            "esri/dijit/Scalebar",
            "esri/symbols/SimpleMarkerSymbol", "esri/symbols/SimpleLineSymbol","esri/symbols/PictureMarkerSymbol","esri/geometry/Point","esri/layers/GraphicsLayer",
            "esri/symbols/PictureFillSymbol", "esri/symbols/CartographicLineSymbol", "esri/SpatialReference","esri/InfoTemplate",
            "esri/graphic",
            "esri/layers/ArcGISDynamicMapServiceLayer","esri/symbols/TextSymbol","esri/symbols/Font","esri/Color",
            "dojo/domReady!"
        ], function (TDTMapLayer, Map,Scalebar,SimpleMarkerSymbol, SimpleLineSymbol,PictureMarkerSymbol,Point,GraphicsLayer,
                     PictureFillSymbol, CartographicLineSymbol, SpatialReference,InfoTemplate,
                     Graphic,ArcGISDynmicMapServiceLayer,TextSymbol,Font,Color) {

            $("#contractTypeId_1").addClass("check-change-active");//默认选中第一个li
            $.ajax({
                url: getRootPath() + "/supervise/gis/projectCompByType.action", type: "GET",
                async: false,
                data: {"contractType" : "1"},
                dataType: "json",
                success: function (resData) {
                    graphicLoadCallback(resData);
                }
            });

            //合同类型
            $(".check-change-cont").find('li').each(function(index){
                var i = index + 1;
                $("#contractTypeId_"+i).click(function(){
                    var contractTypeVal = $("#contractTypeId_"+i).attr("value");
                    var data = {};
                    //选中传值
                    data["contractType"] = contractTypeVal;
                    projectCompByType(data);
                });
            });

            //企业名称
            $("#searchBtn").click(function(){
                var data = {};
                data["companyName"] = $("#companyName").val();
                projectCompByType(data);
            });

            //根据分类查询项目坐标
            function projectCompByType(data) {
                arcgisClear();//清空坐标
                $.ajax({
                    url: getRootPath() + "/supervise/gis/projectCompByType.action", type: "GET",
                    async: false,
                    data : data,
                    dataType : "json",
                    success : function(data) {
                        graphicLoadCallback(data);
                    }
                });
            };

            function graphicLoadCallback(dataList) {
                var position = [125.7160000, 44.0300000];
                //初始化地图取第一个坐标
                // if (dataList && dataList.length > 0) {
                //     for (var i = 0; i < dataList.length; i++) {
                //         item = dataList[i];
                //         if (item.latitude && item.latitude!="" && item.longitude && item.longitude!="" ) {
                //             position[0] = item.longitude;
                //             position[1] = item.latitude;
                //         }
                //     }
                //
                // }
                map = new Map('map', {
                    logo: false,
                    center: position,
                    zoom: 10
                });
                /**
                 * TDTMapLayer 中包含四个参数，分别为
                 * 1.mapType：该值的默认值为vec,代表矢量图层，可供选择的值有vec|img|ter，分别代表矢量、影像、地形
                 * 2.mapCoordinate：该值的默认值为w,代表投影坐标，可供选择的值有c|w分比为：地理坐标，投影坐标
                 * 3.isAnnoLayer：默认值为"",可供选择的值为"ss"|"ano",分别代表非注记图层，注记图层
                 * 4.mapAnnotation：默认值为cva,不同注记类型的默认值分别为cva,cia,cta,代表矢量中文注记图层，不同底图的矢量注记可选项有：
                 *   vec(矢量):cva(中文)、eva(英文)、mva(蒙古文)、wva(维吾尔文)
                 *   img(影像):cia(中文)、eia(英文)、mia(蒙古文)、wia(维吾尔文)
                 *   ter(地形图):cta(中文)、eta(英文)、mta(蒙古文)、wta(维吾尔文)
                 */
                    //1.加载矢量图层（默认投影web墨卡托）
                let verLayer = new TDTMapLayer();
                //2.加载矢量注记图层
                let verAnnoLayer = new TDTMapLayer("ano");
                //3.加载影像图层
                let imgLayer = new TDTMapLayer("img", "c");
                //4.加载影像注记图层
                let imgAnnoLayer = new TDTMapLayer("img", "c", "ano");

                var _Dynamiclayer = new ArcGISDynmicMapServiceLayer(getArcGisAddress());
                _Dynamiclayer.setOpacity("60%");
                map.addLayer(verLayer);
                map.addLayer(verAnnoLayer);
                map.addLayer(_Dynamiclayer);

                //点击事件
                map.graphics.on("click",function(e){
                    var g = e.graphic;
                    var nowCompanyId = g.attributes.companyId;
                    if(nowCompanyId){
                        clickProjectTarget(nowCompanyId);
                    }else{
                        msgBox.tip({content: "暂无关联企业信息"});
                        e.stopPropagation();
                    }

                });
                var item;
                for (var i = 0; i < dataList.length; i++) {
                    item = dataList[i];
                    if (item.latitude && item.latitude!="" && item.longitude && item.longitude!="" ) {
                        var newPoint = new Point(item.longitude, item.latitude, new SpatialReference({wkid: 4326}));
                        var companyId = item.companyId;
                        var imageName = "company.png";
                        if(!companyId){
                            imageName = "lou7.png";
                        }
                        var picSymbol = new PictureMarkerSymbol("${sysPath}/TDTLib/images/"+imageName, 25, 30);
                        picSymbol.setOffset(0, 30);
                        var picGraphic = new Graphic(newPoint, picSymbol);
                        picGraphic.setAttributes( {"companyId":item.companyId});
                        // var infoTemplate = new InfoTemplate();
                        // infoTemplate.setTitle(item.companyName);
                        // infoTemplate.setContent(item.companyName);
                        // picGraphic.setInfoTemplate(infoTemplate);
                        map.graphics.add(picGraphic);

                        var graphicsLayer = new GraphicsLayer();
                        var font = new Font("12pt");
                        font.setFamily("Arial");
                        font.setWeight(Font.WEIGHT_BOLD);
                        font.setDecoration("none");
                        font.setStyle(Font.STYLE_NORMAL);
                        var textSym = new TextSymbol();
                        textSym.setAlign(TextSymbol.ALIGN_RIGHT);
                        textSym.setColor(new Color("#602EFF"));
                        textSym.setFont(font);
                        //textSym.setText(item.projectname);
                        textSym.setHaloColor(new Color([255, 255, 255, 1]));  //
                        textSym.setHaloSize(1);  //

                        //添加为每个文字graphic添加位置、文字内容
                        var graphicText = new Graphic(newPoint, textSym);
                        //将graphic加入图层
                        graphicsLayer.add(graphicText);
                        //map添加graphiclayer图层
                        map.addLayer(graphicsLayer);
                    }
                }
                dojo.connect(map, "onExtentChange", showExtent);
                var scalebar = new Scalebar({
                    map: map,
                    attachTo: "bottom-left",
                    scalebarUnit: "dual"
                });

                function showExtent(extent) {
                    var s = "";
                    s = "XMin: " + extent.xmin + "&nbsp;"
                        + "YMin: " + extent.ymin + "&nbsp;"
                        + "XMax: " + extent.xmax + "&nbsp;"
                        + "YMax: " + extent.ymax;                    //showExtent函数的最后一行显示在页面上添加完成字符串的“info”DIV坐标
                    dojo.byId("info").innerHTML = s;
                };
            }
        }
    );

    //查询项目坐标
    function queryProjectJwd(isFinish, highBuild, investment) {
        var projectJwd = "[]";
        $.ajax({
            url: getRootPath() + "/supervise/gis/projectGisList.action", type: "GET",
            async: false,
            data: {
                "isFinish": isFinish,
                "highBuild": highBuild,
                "investment": investment
            },
            dataType: "json",
            success: function (data) {
                console.log(data);
                projectJwd = data;
            }
        });
        return projectJwd;
    };

    //查看企业详细信息
    function clickProjectTarget(id) {
        $("#detailDiv").html("");//先将div置空
        $("#detailDiv").load(getRootPath() + "/supervise/gis/loadDetail.action?viewType=queryView&dlhDataId=" + id + "&dlh_data_src_=" + companyListPanel.resource + "&time=" + new Date().getTime(), null, function () {
            modalShow('企业详细信息');
        });
    }

    //清空坐标点
    function arcgisClear(){
        map.destroy();
    }
</script>

<script src='${sysPath}/js/com/jc/supervise/gis/company/gisCompany.js'></script>
<%@ include file="/WEB-INF/web/include/foot.jsp" %>
<script>
    $(window).ready(function () {
        $(".check-change-cont>li").click(function () {
            $(".check-change-cont>li").removeClass('check-change-active')
            $(this).addClass("check-change-active");
        })
    })
</script>
<script>
    var resourceDetailModal = {};

    resourceDetailModal.detail = function (option) {
        debugger
        $.ajax({
            url: getRootPath() + "/supervise/resource/detail.action",
            type: "GET", data: {dataId: option.dataId, sign: option.sign}, dataType: "json",
            success: function (data) {
                var content = "";
                if (data != null) {
                    for (var i = 0; i < data.length; i++) {
                        var row = data[i];
                        if (row.formShow == '0') continue;
                        content += "<tr>";
                        content += "<td style='width: 150px; text-align: right;'>" + row.title + "</td>";
                        content += "<td style='text-align: left;'>" + (row.value == null ? "" : row.value) + "</td>";
                        content += "</tr>";
                    }
                }
                if (option.callback == undefined) {
                    $('#resourceDetailTable').html(content);
                    $('#resource-detail-modal').modal('show');
                } else {
                    option.callback(content);
                }
            }
        });
    };
</script>
