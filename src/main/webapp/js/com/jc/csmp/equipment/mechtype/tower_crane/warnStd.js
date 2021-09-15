var warnStdFun = {};
warnStdFun.initWarnStd = function (callback) {
    var h = "";
    h += '<h3>预警值设定置</h3>';
    h += '<table class="table table-td-striped" >';
    h += '<tbody>';
    h += '<tr>';
    h += '	<td rowspan="2" style="width:120px;">';
    h += '		<span class="required">*</span>报警/预警';
    h += '	</td>';
    h += '	<td>';
    h += '		距离（米）：';
    h += '		<input type="text" style="width:100px;" id="minDistance" name="minDistance" value="0.1"/>';
    h += '		/';
    h += '		<input type="text" style="width:100px;" id="maxDistance" name="maxDistance"  value="0.5"/>';
    h += '		高度（米）：';
    h += '		<input type="text" style="width:100px;" id="minHeigth" name="minHeigth"  value="0.1"/>';
    h += '		/';
    h += '		<input type="text" style="width:100px;" id="maxHeigth" name="maxHeigth"  value="0.5"/>';
    h += '		起重比率：';
    h += '		<input type="text" style="width:100px;" id="minWeigthRate" name="minWeigthRate"  value="0.1"/>';
    h += '		/';
    h += '		<input type="text" style="width:100px;" id="maxWeigthRate" name="maxWeigthRate"  value="0.5"/>';
    h += '	</td>';
    h += '</tr>';
    h += '<tr>';
    h += '	<td style="background-color: #FFFFFF; text-align: left;  font-weight: normal;">';
    h += '		力矩比率：';
    h += '		<input type="text" style="width:100px;"  id="minTorqueRate" name="minTorqueRate" value="0.1"/>';
    h += '		/';
    h += '		<input type="text" style="width:100px;"  id="maxTorqueRate" name="maxTorqueRate" value="0.5"/>';
    h += '		风速（米/秒）：';
    h += '		<input type="text" style="width:100px;"  id="minWindSpeed" name="minWindSpeed" value="0.1"/>';
    h += '		/';
    h += '		<input type="text" style="width:100px;"  id="maxWindSpeed" name="maxWindSpeed" value="0.5"/>';
    h += '		倾角（度）：';
    h += '		<input type="text" style="width:100px;"  id="minAngle" name="minAngle" value="0.1"/>';
    h += '		/';
    h += '		<input type="text" style="width:100px;"  id="maxAngle" name="maxAngle" value="0.5"/>';
    h += '	</td>';
    h += '</tr>';
    h += '</tbody>';
    h += '</table>';
    $("#entityFormWarnDisplayDiv").html(h);
    if (callback) {
        callback();
    }
};