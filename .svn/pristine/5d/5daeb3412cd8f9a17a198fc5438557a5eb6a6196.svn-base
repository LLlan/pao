var TreeData = function(nodes) {
	
	var dataSource1 = function(options, callback){
		var $data = null
		if(!("text" in options) && !("type" in options)){
			$data = nodes;//the root tree
			callback({ data: $data });
			return;
		}
		else if("type" in options && options.type == "folder") {
			if("additionalParameters" in options && "children" in options.additionalParameters)
				$data = options.additionalParameters.children || {};
			else $data = {}//no data
		}
		
		if($data != null)//this setTimeout is only for mimicking some random delay
			setTimeout(function(){callback({ data: $data });} , 1);
	}
	return dataSource1;
}