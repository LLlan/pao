var onHandle = onHandle || {
	handleConnOpen: function(){  //连接打开时回调处理
		//从连接中获取到当前的登录人注册帐号名
		//im.user.username = im.conn.context.userId;
		
	    //构造联系人列表
		common.populateRoster();
	    //设置用户上线状态，必须调用
	    common.conn.setPresence();
	},
	
	handleConnClosed: function(){  //连接关闭时回调处理
		
	},
	
	handleOnError: function(e) {  //异常情况下的处理方法
		console.log(e);
		$.messager.alert(e.msg, function(){});
    },
    
    handleReceiveMessage: function(message, messageType){  //处理接收的消息
		// 发送人
		var from = message.from;
		if(from && from != common.user.username){
			if(common.chatingUser && common.chatingUser.userid != from){
				// 添加会话，消息提醒
				onUI.populateChatWin(from, from);
			}
		}
		
		var messageContent = message;//文本消息体
		if (messageType && messageType == 'txt') {
			messageContent = message.data;
		}
		
		imutil.appendMessage(from, from, messageContent);
	},
	
	handleReceiveFileMessage: function(easemobMessage){  //处理接收文件的消息
	    var retryTimes = 0;
	    var options = $.extend(easemobMessage, {
	    	onFileDownloadComplete: function(response, xhr){
	    		var objectURL = Easemob.im.Helper.parseDownloadResponse.call(this, response);
			    if (objectURL) {
			    	// 根据文件名获取文件后缀
			    	 var point = easemobMessage.filename.lastIndexOf(".");  
			    	 var suffix = easemobMessage.filename.substr(point);  
			    	var messageType = imutil.resolveMessageType(suffix) || 'File';
					$.extend(easemobMessage, {data: [{type: messageType, filepath: objectURL, filename: easemobMessage.filename}]});
					onHandle.handleReceiveMessage(easemobMessage);
				}
	        },
	        onFileDownloadError: function(e){
	        	// 下载失败时只重新下载一次
	            if(retryTimes < 1){
	             	retryTimes++;
	                options.accessToken = options_c;
	                Easemob.im.Helper.download(options);
	            } else{
	            	retryTimes = 0;
	            }
	        }
	    });
        Easemob.im.Helper.download(options);
	},
	
	onSendTextMessage: function(e){  // 发送按钮事件
		var mto = common.chatingUser && common.chatingUser.userid;
	    if(!mto){
	    	return;
	    }
		// 获取输入框数据
		var textMsg = $("#textarea-" + common.chatingUser.userid).val();
	    if(!textMsg){
	    	$.messager.alert('发送内容不能为空！请输入内容！', function(){});
	    	return;
	    }
	    onHandle.sendTextMessage(textMsg);
	},
	
	sendTextMessage: function(txtMessage){  // 发送文本聊天消息
		if(common.sendingMessage){
			return;
		}
		common.sendingMessage = true;
		
		var options = {
            to : common.chatingUser.username,
            msg : txtMessage,
            type : "chat"
        };
		
	    common.conn.sendTextMessage(options);
	    imutil.appendMessage(common.user.userid, common.chatingUser.username, txtMessage);
	    imutil.resetChatingUI();
	},
	
	onSelectedEmotion: function(){  // 选中表情
		// 获取选择中表情
		var emotion = $(this).attr('id');
	    if(emotion){
	    	var value = $('.chat-textarea', '#chat-window-' + im.chatingUser.userid).val();
	    	$('.chat-textarea', '#chat-window-' + im.chatingUser.userid).val(value + '' + emotion);
	    }
	},
	
    selectedUserToChating: function($clickObj){  // 选择用户进行聊天
    	//当前聊天用户
    	var chatUserId = $clickObj.attr('data-id');
    	var chatUserName = $clickObj.attr('data-name');
    	var chatUserType = $clickObj.attr('data-type');
    	var chatUserUrl = $clickObj.attr('data-url');
    	if(chatUserId && chatUserName){
    		$clickObj.addClass('list-item-select').siblings().removeClass('list-item-select');
    		common.chatingUser = {
    			userid: chatUserId,
    			username: chatUserName,
    			type: chatUserType || 'user',
    			header: chatUserUrl
    		};
    		onUI.populateChatWin(chatUserId, chatUserName);
    		$('.chat01_content').hide();
            $('#' + common.user.userid + "-" + chatUserId).show();
            $('#talkTo').html('正在与 ' + chatUserName + ' 聊天');
    		
            $('#friends .list-item').removeAttr("style");
            $clickObj.css('background-color', '#D0CECE');
            $clickObj.find('.badge').remove();
    	}
    },
    
    overChating: function(){  // 结束聊天
    	// 当前聊天窗口
    	$('#chat-window-' + common.chatingUser.userid).hide();
    	onHandle.resetChatingUI();
    	common.chatingUser = {};
	},
	
	populateEmotionPanel: function(){  //构造表情面板
		// Easemob.im.Helper.EmotionPicData设置表情的json数组
		var emotionDatas = Easemob.im.Helper.EmotionPicData;
		for (var key in emotionDatas) {
			var emotionData = emotionDatas[key];
			if(emotionData){
				$('<a>', {
					'id': '' + key,
					'class': 'emotion',
    				html: '<img src="' + emotionData + '" />'
    			}).click(onHandle.onSelectedEmotion).appendTo('.emotion-content');
			}
		}
	},
	
	onSelectedEmotion: function(){  // 选中表情
		// 获取选择中表情
		var emotion = $(this).attr('id');
	    if(emotion){
	    	var value = $("#textarea-" + common.chatingUser.userid).val();
	    	$("#textarea-" + common.chatingUser.userid).val(value + '' + emotion);
	    }
	    $('.emotion-panel').hide();
	},
	
	onAddEmotion: function(e){  // 添加表情
		$('.emotion-panel').toggle();
	},
	
	onSendFileMessage: function(fileType){  // 发送文件
		var mto = common.chatingUser && common.chatingUser.userid;
	    if(!mto){
	    	return;
	    }
	    var fileMessage = {
	    	to: mto,
	    	type: common.chatingUser.type || 'chat'
	    };
	    onHandle.sendFileMessage(fileMessage, fileType);
	},
	
	sendFileMessage: function(fileMessage, fileType){ // 发送文件消息
		if(common.sendingMessage){
			$.messager.alert("上传任务正在执行，稍后再试！", function(){});
			return;
		}
		common.sendingMessage = true;
		
		$('.zai-uploading').show();
	    
	    // 添加发送人
	    $.extend(fileMessage, {
	    	from: common.user.username,
	    	ext: {
	    	    timestamp: new Date().getTime()
	        }
	    });

	    var fileInputId = null;
	    if ('pic' == fileType) {
	    	fileInputId = "chatPicInput";
	    } else if ('audio' == fileType) {
	    	fileInputId = "chatAudioInput";
	    }
	    var fileInput = $('#' + fileInputId);
	    
		if (fileInput && fileInput.length > 0 && fileInput[0].files) {
		    var file = fileInput[0].files[0];
		    if(file){
		    	var objectURL = Utils.$objectURL(file);
		    	var filename = file.name;
		    	if(objectURL && filename){
		    		common.uploadFileName = filename;
		    		$('#uploadFileName').html(filename);
		    		
		    	    // 获取消息类型
		    		var point = filename.lastIndexOf(".");  
			    	var suffix = filename.substr(point);  
	        	    var messageType = imutil.resolveMessageType(suffix) || 'File';
	        	    if('pic' == messageType || 'audio' == messageType || 'File' == messageType){
	        	    	$.extend(fileMessage, {
		        	    	    data: [{
							    type: messageType, 
							    filepath: objectURL, 
							    filename: filename || ''
						    }],
			    		    fileInputId : fileInputId,
		    		    	onFileUploadError : function(error) {
		    		    		common.sendingMessage = false;
		    		    		$('.zai-uploading').hide();
		    		    		
		    		    		$.messager.alert('上传出错！', function(){});
		    		    		
		    		    		$.extend(fileMessage, {sent: false});
		    		    		imutil.appendMessage(common.user.userid, common.chatingUser.username, fileMessage);
		   					    imutil.resetChatingUI();
	   						},
	   						onFileUploadComplete : function(data) {
	   							common.sendingMessage = false;
	   							$('.zai-uploading').hide();
	   							
	   					        $.extend(fileMessage, {sent: true});
		   					    imutil.appendMessage(common.user.userid, common.chatingUser.username, fileMessage);
		   					    imutil.resetChatingUI();
	   						}
	        	    	});
	        	    	
	        	    	if('pic' == messageType){
		    		    	common.conn.sendPicture(fileMessage);
		    		    } else if('audio' == messageType){
		    		    	common.conn.sendAudio(fileMessage);
		    		    } else{
		    		    	common.conn.sendFile(fileMessage);
		    		    }
	        	    }
		    	}
		    }
		}
	}
    
};