var uploadifyFj = function(obj){
	var sessionId = $('#jsessionId').val();
	var contextPath = obj.contextPath;
	var attachmentSaveUrl = obj.attachmentSaveUrl;
	var attachmentPreUrl = obj.attachmentPreUrl;
	var attachmentDeleteUrl = obj.attachmentDeleteUrl;
	
	var buttonText = obj.buttonText;
	var multi = obj.multi; // 是否批量上传
	var sourcePath obj.sourcePath;
	var url = obj.url;
	var callback = obj.callback;
	var rurl = 'http://' + url + '/sirius-convert/convert/upload' + ';jsessionid=' + sessionId + "?sourcePath=" + sourcePath;
	var swf = contextPath + '/script/uploadify3.2/uploadify.swf';
	
	var fileTypeDesc = obj.fileTypeDesc;
	var fileTypeExts = obj.fileTypeExts; // 允许上传的后缀名
	var fileSizeLimit = obj.fileSizeLimit; // 允许上传文件的最大值
	var queueSizeLimit = obj.queueSizeLimit; // 单次上传数量
	
	if (!fileTypeDesc) {fileTypeDesc = '支持的格式：doc,docx,ppt,pptx,xls,xlsx,pdf';}
	if (!fileTypeExts) {fileTypeExts = '.doc;*.docx;*.ppt;*.pptx;*.xls;*.xlsx;*.pdf';}
	if (!fileSizeLimit) {fileSizeLimit = '2000MB';}
	if (!queueSizeLimit) {queueSizeLimit = 10;}
	if (!buttonText) {buttonText = '上传附件';}
	if (!multi || multi == 'true') {multi = true;} else if (multi == 'false') {multi = false;}
	
	$('#file_upload').uploadify({
		// 开启调试
		'buttonText':buttonText,
		'swf' : swf,
		'uploader' : rurl,
		'multi' : false,
		'fileObjName':'Filedata',
		'width':'120',
		'height':'34',
		'method':'get',
		'fileTypeDesc':fileTypeDesc,
		'fileTypeExts':fileTypeExts,
		'fileSizeLimit':fileSizeLimit,
		'queueSizeLimit' : queueSizeLimit,
		'onSelectError':function(file, errorCode, errorMsg){
			switch(errorCode) {
				case -100:
					alert("上传的文件数量已经超出系统限制的"+$('#file_upload').uploadify('settings','queueSizeLimit')+"个文件！");
					break;
				case -110:
					alert("文件 ["+file.name+"] 大小超出系统限制的"+$('#file_upload').uploadify('settings','fileSizeLimit')+"大小！");
					break;
				case -120:
					alert("文件 ["+file.name+"] 大小异常！");
					break;
				case -130:
					alert("文件 ["+file.name+"] 类型不正确！");
					break;
			}
		},
		// 检测FLASH失败调用
		'onFallback':function(){
			alert("您未安装FLASH控件，无法上传图片！请安装FLASH控件后再试。");
		},
		// 上传到服务器，服务器返回相应信息到data里
		'onUploadSuccess':function(file, data, response){
			var jsonResult = eval('(' + data + ')');
			var sourceName = jsonResult[0]['sourceName'];
			var sourcePath = jsonResult[0]['sourcePath'];
			var convertPath = jsonResult[0]['convertPath'];
			var mediaType = jsonResult[0]['mediaType'];
			
			if (!convertPath) {
				convertPath = "";
			}
			
			$.ajax({
				url : attachmentSaveUrl,
				dataType : 'json',
				type : 'post',
				data:{
					sourceName:sourceName,
					sourcePath:sourcePath,
					convertPath:convertPath,
					mediaType:mediaType
				},
				success : function(data) {
					if(data.retCode == '1'){
						var attrachmentId = data.attrachmentId;
						var $html = '<p style="width:560px"><span class="fj-name">' + sourceName + '</span>' +
									'<input type="hidden" name="attrachmentIds" value="' + attrachmentId + '"></input>';
						if ('doc' == mediaType || 'docx' == mediaType ||'ppt' == mediaType ||'pptx' == mediaType || 'xlsx' == mediaType || 'xls' == mediaType || 'pdf' == mediaType) {
							$html = $html + '<a target="_blank" href="' + attachmentPreUrl + '&convertPath=' + data.convertPath + '&isTemp=0" style="color:blue">&nbsp;预览</a>';
						}
						$html = $html + '<a onclick=\'deleteFj("' + attrachmentId + '",$(this),' + attachmentDeleteUrl + ');\' style="color:blue" href="javascript:void(0);">&nbsp;删除</a></p>';
					    $('#fjtd').append($html);
					    
					    if (callback) {
					    	callback.call();
					    }
					}
				}
			});
		},
		'removeCompleted' :true,
		'cancelImg':true,
		'auto' : true,
		'onQueueComplete' : function(queueData){
			$('#file_upload-queue').empty();
		},
		'onError' : function(event, queueId, fileObj, errorObj) {
			alert("file upload error!");
		}
	});
}

function downloadFj(saveName, fileName, fjDownloadUrl){
	$("#downloadHideIframe").attr('src', 'http://' + fjDownloadUrl + saveName + '?n=' + encodeURI(fileName));
}

function commonDeleteFj(id , $this, attachmentDeleteUrl, callback){
	if(!confirm('确定要删除附件吗?')){
		return false;
	}
	if (id) {
		$.ajax({
			url : attachmentDeleteUrl,
			dataType : 'json',
			type : 'post',
			data:{
				attrachmentId:id
			},
			success : function(data) {
				if(data.retCode == '1'){
					if (callback) {
						callback.call();
					}
				}
			}
		});
	}
}