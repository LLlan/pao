var common = common || {
	sendingMessage:false, // 标志是否正在发送消息
	currPage: 1,
	totalPage : 1,
	searchKey : '',
	uploadFileName : '',
	hxAppKey: 'njyczn#ycznzhsq001',
	conn: null,  // 环信连接对象
	user: {  // 当前用户对象
		userid: '',//${user.userId}
		username: '',  //${user.hxUsername}
		password: '',//${user.hxPassword}
		nickname: '',//
		header: '',//${头像}
	},
	
	chatingUser: {  // 当前聊天用户对象, 如果是群组，该值表示群组对象
		userid: '', 
		type: '',  // chat/groupchat, 单用户聊天/群组聊天
		header: ''
	},
	
	populateRoster: function(isFirst, nextPage ,isAppend){  //构造联系人列表
		if (!nextPage) {
			nextPage = 1;
		}
		
		var data = {"current" : nextPage};
		if ('0' == isFirst) {
			var key = $.trim($('#search_input').val());
			
			if (common.searchKey != key) {
				nextPage = 1;
			}
			data = {"current" : nextPage, "easeUsername": key};
			common.searchKey = key;
		}
		
		if (!isAppend) {
			$('#friends_content').empty();
		}
		$('.zai-loading').show();
		
		$.ajax({
            type: "POST",
            url: gContextPath + "/vebusiness/ebusiness/crmChat/getCustomer",
            data: data,
            dataType: "json",
            success: function(response){
				var code = response.code;
				$('.zai-loading').hide();
				if ("0" == code) {
					$('#friends_content').html('<span class="no-result">加载客户失败！</span>');
					return;
				}
				var contactData = response.data;
				if (contactData) {
					common.currPage = contactData.current;
					common.totalPage = contactData.pageTotal;
					
					var records = contactData.records;
					$('.zai-loading').hide();
					if (records && records.length > 0) {
						var friendRosters = [];
						for (var i=0; i<records.length; i++){
							var record = records[i];
							if(record){
								var header = record.iconPath;
								if (header != null && header != '') {
									header = gContextPath + '/vapp/fileHandler/staticImageFileHandler?groupId=' + header;
								} else {
									header = gContextPath + '/assets/avatars/user.jpg';
								}
								var roster = {
									userid: record.easeUsername,
									name:   record.easeUsername,
									header: header
								}
								friendRosters.push(roster);
							}
						}
						
						// 构造好友界面
						$('#friends_content').append(function(){
							var $html = '';
							for(var i=0; i<friendRosters.length; i++){
								var roster = friendRosters[i];
								
								var chatId = common.user.userid + "-" + roster['name'];
								if ($('#hidden_chat_content #' + chatId).length > 0) {
									var $chatIdHtml = $('<div id="' + chatId + '"class="chat01_content" classname="chat01_content" style="display:none;height:0px;">' + $('#hidden_chat_content #' + chatId).html() + '</div>');
									$('#main-container #rightcontact #chat01').append($chatIdHtml);
								}
								
								$html += '<div id="friendRosters_' + roster['name'] + '" class="list-item" data-id="' + roster['name'] + '"' +
										 ' data-url="' + roster['header'] + '"' +
								         ' data-name="' + roster['name'] + '" data-type="chat"><a href="#" class="list-item-avatar">' +
								         '<img width="32" height="32" src="' + roster['header'] + '"></a>' + 
								         '<span class="list-item-name">' + roster['name'] + '</span><div class="clear"></div></div>';
							}
							$('#hidden_chat_content').empty();
							
							if (common.currPage < common.totalPage) {
								$html = $html + "<div style='text-align:center'><span class='loading-more-ros'>加载更多</span></div>";
							}
							
							$('.loading-more-ros').remove();
							return $html;
						}).children('.list-item');
						
						
						if(!isFirst && friendRosters.length > 0) {
							var firstFriend = friendRosters[0];
							var chatUserId = firstFriend['name'];
							onUI.populateChatWin(chatUserId);
							$('#friends .list-item:first').addClass('list-item-select');
							
							common.chatingUser = {
				    			userid: chatUserId,
				    			username: chatUserId,
				    			type: 'chat',
				    			header: gContextPath + '/assets/avatars/user.jpg'
				    		};
							
							$('.chat01_content').hide();
				            $('#' + common.user.userid + "-" + chatUserId).show();
				            $('#talkTo').html('正在与 ' + chatUserId + ' 聊天');
						}
					} else {
						if ('0' == isFirst) {
							$('#friends_content').html('<span class="no-result">没有符合条件的客户！</span>');
						} else {
							$('#friends_content').html('<span class="no-result">没有客户！</span>');
						}
					}
				}
			
             }
         });
	}
};