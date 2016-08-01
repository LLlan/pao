(function($){
	'use strict';
	
	var restapi = function(){
		return {
			interfaces: [],
			initial: function(callback){
				var that = this;
				$.get(contextPath + '/js/restapi/interfaces.json', null, function(interfaces){
					if(interfaces && interfaces.length>0){
						that.interfaces = interfaces;
						if(callback){
							callback.apply(that);
						}
					}
				});
			},
			populateMenus: function(){
				if(this.interfaces && this.interfaces.length>0){
				    var $html = '';
				    for(var i=0; i<this.interfaces.length; i++){
					    var intf = this.interfaces[i];
						$html += this._populateMenu(intf);
					}
					if($html){
						$('.restapi-list').append($html);
					}
					
					// 当前请求页面
					var current_url = window.location.href;
					if(current_url && current_url.indexOf('/sd/') != -1){
						current_url = current_url.substring(current_url.indexOf('/sd/'), current_url.length);
						if(current_url){
							// 设置菜单active
							$('a[href="' + current_url + '"]').parents('li').addClass('active');
						}
					}
				}
			},
			_populateMenu: function(intf){
				var $html = '<li>';
			    if(intf){
					if(!intf['url'] && intf['children'] && intf['children'].length>0){
						$html += '<a href="#" class="dropdown-toggle">' + (intf['icon'] ? '<i class="' + intf['icon'] + '"></i>' : '') + '<span class="menu-text">' + intf['title'] + '</span>' + '<b class="arrow fa fa-angle-down"></b>' + '</a>';
						$html += '<ul class="submenu">';
						var children = intf['children'];
					    for(var i=0; i<intf['children'].length; i++){
					    	var child = intf['children'][i];
					    	if(!child){
					    		continue;
					    	}
					    	$html += this._populateMenu(child);
					    }
					    $html += '</ul>';
					} else{
						$html += '<a href="' + contextPath + '/' + intf['url'] + '">' + (intf['icon'] ? '<i class="' + intf['icon'] + '"></i>' : '') + intf['title'] + '</a><b class="arrow"></b>';
					}
			    }
			    $html += '</li>';
			    return $html;
			},
			populateTestApis: function(){
				var that = this;
				var interfaces = this.interfaces;
				if(interfaces && interfaces.length>0){
				    var moudles = [ {'no': 'common', 'title': '公用模块'} ];
				    var moudle_apis = { 'common': [] };
				    for(var i=0; i<interfaces.length; i++){
					    var intf = interfaces[i];
					    if(intf && intf['no']){
					    	if(!intf['cmd'] && intf['children'] && intf['children'].length>0){
					    		moudles.push(intf);
					    		moudle_apis[intf['no']] = [];
					    		// 组装模块下的api
					    		var children = intf.children;
					    		for(var j=0; j<children.length; j++){
					    			var subIntf = children[j];
					    			if(subIntf && subIntf['cmd']){
					    				moudle_apis[intf['no']].push(subIntf);
					    				continue;
					    			}
					    		}
					    	} else{
					    		moudle_apis['common'].push(intf);
					    	}
					    }
					}
					if(moudles && moudles.length>0){
						var moudle_list = '';
						for(var i=0; i<moudles.length; i++){
							var moudle = moudles[i];
							if(!moudle || !moudle['no'] || !moudle['title']){
								continue;
							}
							moudle_list += '<option value="' + moudle['no'] + '">' + moudle['title'] + '</option>';
						}
						if(moudle_list){
							$('#moudle_list').append(moudle_list);
							// 绑定事件
							$('#moudle_list').change(function(){
								var select_moudle = $(this).val();
								if(select_moudle && moudle_apis[select_moudle]){
									var apis = moudle_apis[select_moudle];
									var $html = '<option value="">----请选择-----</option>';
									for(var i=0; i<apis.length; i++){
										var api = apis[i];
										if(!api || !api['cmd'] || !api['title']){
											continue;
										}
										$html += '<option value="' + api['cmd'] + '">' + api['title'] + '</option>';
									}
									if($html){
										$('#interface_list').empty().append($html);
										$('#interface_list').change(function(){
											var cmd = $(this).val();
											that._interfaceInitial(cmd);
										});
									}
								}
							});
						}
					}
				}
			},
			_interfaceInitial: function(cmd){
				if(cmd){
					try{
						eval(cmd).apply(this);
					} catch(e){
						console.log(e);
					};
				}
			},
			initialRequest: function(req){
				if(req && req['url'] && req['body']){
					$('#api_url').html(contextPath + '/' + req['url']);
					// json格式化
					var json = restapi._formatJson(req['body']);
					if(json){
						$('#intf_in').val(json);
						$('#intf_out').empty();
					}
				}
			},
			executeApi: function(){
				var apiUrl = $('#api_url').html();
				var intf = $('select[name="interface"]').val();
				if(!intf || !apiUrl){
					alert('请选择需要测试的接口!');
					return false;
				}
				var reqBody = $('#intf_in').val();
				if(!reqBody){
					alert('测试接口需要请求参数!');
					return false;
				}
				restapi._executeApi({
					url: apiUrl,
					body: reqBody
				});
				return false;
			},
			_executeApi: function(req){
				var that = this;
				if(req && req['url'] && req['body']){
					var beginExecTime = (new Date()).getTime();
					$.ajax({
						type: 'POST',
						url: req['url'],
						async: false,
						data: req['body'] || {},
						dataType: 'json',
						contentType: "application/json",
						timeout: 60000,
						success: function(res) {
							that._dealApiResult(res);
						},
						error: function(res) {
							that._dealApiError(res);
						}
					});
				}
			},
			_dealApiResult: function(res) {
				if(res){
					var json = restapi._formatJson(JSON.stringify(res));
					if(json){
						$('#intf_out').empty()
						
						var processedJson = $('#processedJson');
	                    if (processedJson.length == 0) {
	                    	processedJson = $('<pre>', {
	                            id: 'processedJson'
	                        }).appendTo($('#intf_out'));
	                    }
	                    processedJson.attr({'class': 'prettyprint Lang-json linenums'});
	                    processedJson.html('' + json);
	                    // 美化代码展示
	                    prettyPrint();
					}
				}
			},
			_dealApiError: function(res){
				if(res){
					var json = restapi._formatJson(JSON.stringify(res));
					if(json){
						$('#intf_out').empty()
						var processedJson = $('#processedJson');
	                    if (processedJson.length == 0) {
	                    	processedJson = $('<pre>', {
	                            id: 'processedJson'
	                        }).appendTo($('#intf_out'));
	                    }
	                    processedJson.attr({'class': 'prettyprint Lang-json linenums'});
	                    processedJson.html('' + json);
	                    // 美化代码展示
	                    prettyPrint();
					}
				}
			},
			_formatJson: function(str){  // json格式化
				var json = '';
				if(str){
					json = js_beautify(unpacker_filter(str), {
						indent_size : 4,
						indent_char : ' ',
						preserve_newlines : true,
						brace_style : 'collapse',
						keep_array_indentation : false,
						space_after_anon_function : false
					});
				}
				return json;
			}
		};
	}();
	
	window.restapi = restapi;
})(jQuery);