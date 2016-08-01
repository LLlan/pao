var onUI = onUI || {
	populateChatWin: function(chatUserId, chatUserName){  // 构造聊天窗口
		var msgContentDiv = document.getElementById(common.user.userid + "-" + chatUserId);
		if (msgContentDiv == null) {
            msgContentDiv = imutil.createContactChatDiv(chatUserId);
            document.getElementById('chat01').appendChild(msgContentDiv);
        }
		
		$('#' + common.user.userid + "-" + chatUserId).css('height', $(document).height() - 331);
		$('#' + common.user.userid + "-" + chatUserId).show();
		msgContentDiv.scrollTop = msgContentDiv.scrollHeight;
		
		var textContent = document.getElementById("textarea-" + chatUserId);
		if (textContent == null) {
			var textarea = document.createElement("textarea");
	        $(textarea).attr({
	            'id' : "textarea-" + chatUserId,
	            'class' : 'crm-im-textarea'
	        });
            $('.crm-im-textarea').hide();
            document.getElementById('oper_wrap_middle').appendChild(textarea);
        }
		$('.crm-im-textarea').hide();
		$("#textarea-" + chatUserId).show();
	},
	
	populateEmotionPanel: function(){  //构造表情面板
		var emotionDatas = Easemob.im.Helper.EmotionPicData;
		for (var key in emotionDatas) {
			var emotionData = emotionDatas[key];
			if(emotionData){
				$('<a>', {
					'id': '' + key,
					'class': 'emotion',
    				html: '<img src="' + emotionData + '" />'
    			}).click(im.onSelectedEmotion).appendTo('.emotion-content');
			}
		}
	},
	
	onAddEmotion: function(e){  // 添加表情
		$('.emotion-panel').toggle();
	}
	
};