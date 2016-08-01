
/**
 * URL地址跳转
 * @param url 相对路径 
 */
function action(url) {
	$.customMask();
	var l = HID_BASE_PATH;
	if(url.indexOf("/") == 0) {
		l += url;
	} else {
		l+= "/" + url;
	}
	top.location.href = l;
}

/**
 * URL地址跳转
 * @param url 绝对路径
 */
function action2(url) {
	$.customMask();
	top.location.href = url;
}

/**
 * json格式化
 * @param str
 * @returns {String}
 */
function formatJson(str){
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