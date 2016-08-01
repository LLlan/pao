var imutil = imutil || {
	//收到陌生人消息时创建陌生人列表
    createMomogrouplistUL : function createMomogrouplistUL(who, message) {
    	 var $html = '<div id="friendRosters_' + who + '" class="list-item" data-id="' + who + 
         '" data-name="' + who + '" data-type="chat"><a href="#" class="list-item-avatar">' +
         '<img width="32" height="32" src="' + gContextPath + '/assets/avatars/user.jpg"></a>' + 
         '<span class="list-item-name">' + who + '</span></div>';
    	 
    	 //新增的联系信息放在第一个！
    	 $('#friends .list-item').first().before($html);
    },
    
    getLoacalTimeString : function getLoacalTimeString() {
    	var datetime = new Date();
        var year = datetime.getFullYear();
        var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;
        var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();
        var hour = datetime.getHours()< 10 ? "0" + datetime.getHours() : datetime.getHours();
        var minute = datetime.getMinutes()< 10 ? "0" + datetime.getMinutes() : datetime.getMinutes();
        var second = datetime.getSeconds()< 10 ? "0" + datetime.getSeconds() : datetime.getSeconds();
        return year + "-" + month + "-" + date + " " + hour + ":" + minute + ":"+second;
    },
	
	appendMessage: function(who, contact, message, chattype) {
		localStorage.setItem('chatHistory_time', new Date().getTime());
        var contactDivId = contact;
        var curUserId = common.user.userid;
        
        var contactLi = document.getElementById("friendRosters_" + contact);
        if (contactLi == null) {
        	imutil.createMomogrouplistUL(who, message);
        	contactLi = document.getElementById("friendRosters_" + contact);
        }
        
        // 消息体 {isemotion:true;body:[{type:txt,msg:ssss}{type:emotion,msg:imgdata}]}
        var localMsg = null;
        if (typeof message == 'string') {
            localMsg = Easemob.im.Helper.parseTextMessage(message);
            localMsg = localMsg.body;
        } else {
            localMsg = message.data;
        }
        
        var timeStr = imutil.getLoacalTimeString();
        var headstr = [ "<p class='message-time'>" + timeStr + "</p>",
                        "<img style='float:left;width:32px;height:32px' src='" + common.chatingUser.header + "'/>" ];
        
        if (common.user.userid == who) {
        	var header2 = "";
            if (common.user.header != null && common.user.header != '') {
            	header2 = gContextPath + '/vapp/fileHandler/staticImageFileHandler?groupId=' + common.user.header;
     		} else {
     			header2 = gContextPath + '/assets/avatars/user.jpg';
     		}
             
        	headstr = [ "<p class='message-time'>" + timeStr + "</p>",
                        "<img style='float:right;width:32px;height:32px' src='" + header2 + "'/>" ];
        }
        
        var header = $(headstr.join(''));
        var lineDiv = document.createElement("div");
        for (var i = 0; i < header.length; i++) {
            var ele = header[i];
            lineDiv.appendChild(ele);
        }
        var messageContent = localMsg;
        var contentDiv = document.createElement("div");
        for (var i = 0; i < messageContent.length; i++) {
            var msg = messageContent[i];
            var type = msg.type;
            var data = msg.data;
            
            if (type == "emotion") {
                var eletext = "<p3><img style='width:26px;height:26px' src='" + data + "'/></p3>";
                var ele = $(eletext);
                for (var j = 0; j < ele.length; j++) {
                	contentDiv.appendChild(ele[j]);
                }
            } else if (type == "pic" || type == 'audio' || type == 'video') {
            	$html = '';
            	if(type == 'pic'){
					$html += '<a target="_blank" href="' + msg.filepath + '"><img class="message-picture" src="' + msg.filepath + '"></a>';
				} else{
					$html += '<div class="one-audio-wrap">' +
								'<audio controls="controls" src="' + msg.filepath + '"></audio>' +
								'<button class="play-audio">播放</button>' +
							 '</div>';
				}
            	var elem = $($html);
            	for (var j = 0; j < elem.length; j++) {
                 	contentDiv.appendChild(elem[j]);
                }
            } else {
            	//文本
                var eletext = "<p3>" + data + "</p3>";
                var ele = $(eletext);
                
                if (common.user.userid == who) {
                	ele[0].setAttribute("style", "float:right");
                }
                
                ele[0].setAttribute("class", "chat-content-p3");
                ele[0].setAttribute("className", "chat-content-p3");
                
                if (curUserId == who) {
                    ele[0].style.backgroundColor = "#438eb9";
                    ele[0].style.color = "#fff";
                    ele[0].setAttribute("class", "chat-content-p3 is-self");
                }
                
                for (var j = 0; j < ele.length; j++) {
                	contentDiv.appendChild(ele[j]);
                }
            }
        }
        
        contentDiv.setAttribute("class", "message-content-left");
        if (common.user.userid == who) {
        	contentDiv.setAttribute("class", "message-content-right");
        }
       
        lineDiv.appendChild(contentDiv);
        
        var cleardiv = "<div class='clear'></div>";
        var cleard = $(cleardiv);
        for (var j = 0; j < cleard.length; j++) {
        	lineDiv.appendChild(cleard[j]);
        }
        
        if (common.chatingUser.userid == null && chattype == null) {
        	imutil.setCurrentContact(contact);
            if (time < 1) {
                $('#accordion3').click();
                time++;
            }
        }
        
        if (common.chatingUser.userid && common.chatingUser.userid.indexOf(contact) < 0) {
            contactLi.style.backgroundColor = "green";
            var badgespan = $(contactLi).children(".badge");
            if (badgespan && badgespan.length > 0) {
                var count = badgespan.text();
                var myNum = new Number(count);
                myNum++;
                badgespan.text(myNum);
            } else {
                $(contactLi).append('<span class="badge">1</span>');
            }
            
        } else {
        	$('.chat01_content').hide();
            $('#' + common.user.userid + "-" + contactDivId).show();
        }
        
        if (common.user.userid == who) {
            lineDiv.style.textAlign = "right";
        } else {
            lineDiv.style.textAlign = "left";
        }
        
        var msgContentDiv = document.getElementById(common.user.userid + "-" + contactDivId);
        var create = false;
        if (msgContentDiv == null) {
            msgContentDiv = imutil.createContactChatDiv(contactDivId);
            create = true;
        }
        
        msgContentDiv.appendChild(lineDiv);
        
        if (create) {
            document.getElementById('chat01').appendChild(msgContentDiv);
        }
        
        if(type == 'audio' && msg.audioShim) {
            setTimeout(function(){playAudioShim(d.find('.'+t), data.currentSrc, t);
            }, 0);
        }
        
        msgContentDiv.scrollTop = msgContentDiv.scrollHeight;
        return lineDiv;
    },
    
    //如果当前没有某一个联系人的聊天窗口div就新建一个
    createContactChatDiv : function(chatUserId) {
        var msgContentDivId = common.user.userid + "-" + chatUserId;
        var newContent = document.createElement("div");
        $(newContent).attr({
            "id" : msgContentDivId,
            "class" : "chat01_content",
            "className" : "chat01_content",
            "style" : "display:none"
        });
        return newContent;
    },
    
    //设置当前显示的聊天窗口div，如果有联系人则默认选中联系人中的第一个联系人，如没有联系人则当前div为null-nouser
    setCurrentContact : function(defaultUserId) {
        showContactChatDiv(defaultUserId);
        if (curChatUserId != null) {
            hiddenContactChatDiv(curChatUserId);
        } else {
            $('#null-nouser').css({
                "display" : "none"
            });
        }
        common.chatingUser.userid = defaultUserId;
        common.chatingUser.type = 'chat';
    },
    
	resetChatingUI: function(){  // 重置聊天界面
		$('#textarea-' + common.chatingUser.userid).val('');
	    $('.emotion-panel').hide();
		setTimeout(function(){
			common.sendingMessage = false;
	    }, 1000);
		
		common.uploadFileName = '';
		$('#uploadFileName').html('');
	},
	
	messageType: {
		'Text': [],
		'pic': ['.png', '.jpg', '.jpeg', '.bpm', '.gif'],
		'audio': ['.mp3'],
		'File': ['.doc', '.docx', '.pdf']
	},
	
	resolveMessageType: function(suffix){ // 根据后缀获取message类型
		if(suffix){
			for(var type in imutil.messageType){
    			var suffixs = imutil.messageType[type];
    			if(suffixs && suffixs.length > 0){
    				for(var i=0; i<suffixs.length; i++){
    					var _suffix = suffixs[i];
    					if(_suffix && suffix == _suffix){
    						return type;
    					}
    				}
    			}
    		}
		}
	}

};