$(document).keydown(function(event){
     //屏蔽 Alt+ 方向键 ← 
     //屏蔽 Alt+ 方向键 →
     if ((event.altKey)&&((event.keyCode==37)||(event.keyCode==39)))   
     {
            event.returnValue=false; 
            return false;
     }
     //取消屏蔽退格删除键
     if(event.keyCode==8){
           return true;  
     }
     //屏蔽F5刷新键
     if(event.keyCode==116){
    	window.location.search = "tid=" + new Date().getTime();
        return true; 
     }
    //屏蔽alt+R 
    if((event.ctrlKey) && (event.keyCode==82)){
          return false;
    }

 });
 