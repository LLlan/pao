var ue;
$(function(){
	window.UEDITOR_HOME_URL = "/plugin/ue/"
	UE.Editor.prototype._bkGetActionUrl = UE.Editor.prototype.getActionUrl;
	UE.Editor.prototype.getActionUrl = function(action) {
		if (action == 'uploadimage' || action == 'uploadscrawl' || action == 'uploadimage') {
			return HID_BASE_PATH + "/ueController/uploadImage";
		} else if (action == 'uploadvideo') {
			return null;
		} else {
			return this._bkGetActionUrl.call(this, action);
		}
	}
	if($("#ueditor").length > 0) {
		ue = UE.getEditor('ueditor', {
			initialFrameWidth: 800,
			initialFrameHeight: 400
		});
		$("#ueditor").attr("style", "height:500px");
		$("#ueditor").attr("style", "width:90%");
	}
})